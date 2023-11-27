//
//  CountryDataService.swift
//  Countries
//
//  Created by Pulkit Dhirana on 26/11/23.
//

import Foundation
import Combine

class CountryDataService {
    
    @Published var allCountriesData: CountryModel?
    
    var countrySubscription: AnyCancellable?
    
    init() {
        getCountriesData()
    }
    
    private func getCountriesData() {
        
        guard let url = URL(string: "https://countriesnow.space/api/v0.1/countries") else {
            return
        }
        
        countrySubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: CountryModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: {[weak self] (returnedCountryData) in
                self?.allCountriesData = returnedCountryData
                self?.countrySubscription?.cancel()
            }
        
    }
    
}
