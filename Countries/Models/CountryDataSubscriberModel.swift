//
//  CountryDataSubscriberModel.swift
//  Countries
//
//  Created by Pulkit Dhirana on 26/11/23.
//

import Foundation
import Combine

class CountryDataSubscriberModel: ObservableObject {
    
    @Published var allCountriesData: CountryModel?
    
    private let dataService = CountryDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCountriesData
            .sink {[weak self] (returnedData) in
                self?.allCountriesData = returnedData
            }
            .store(in: &cancellables)
    }

}
