//
//  ContentView.swift
//  Countries
//
//  Created by Pulkit Dhirana on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var vm: CountryDataSubscriberModel
    
    @State private var selection: String?
    
    private var emptyData: [CountryList] = [CountryList]()
    
    var body: some View{
        NavigationStack {
            DropDownView(hint: "Select a Country", options: vm.allCountriesData?.data ?? emptyData, selection: $selection)

            .navigationTitle("Countries Data")
        }
    }
}

//#Preview {
//    ContentView()
//}

extension ContentView {
    
    
    private var allCountriesData: some View {
        
        List {
            ForEach(vm.allCountriesData?.data ?? emptyData, id: \.iso3) { val in
                Text(val.country)
                    .onTapGesture {
                        print("Humney Kiya")
                    }
            }
        }
        
    }
}
