//
//  CitiesPage.swift
//  Countries
//
//  Created by Pulkit Dhirana on 26/11/23.
//

import SwiftUI

struct CitiesPage: View {
    
    @State var countryName: String
    @State var cities: [String]
    var body: some View {
        VStack {
            HStack {
                Text(countryName)
                    .font(.title)
                    .bold()
                    .frame(width: UIScreen.main.bounds.width*0.89, alignment: .leading)
                    .padding(.horizontal, 12)
                    .background(.background)
            }
                
            List {
                Section(header: Text("Cities Names")) {
                    ForEach(cities, id: \.self) { city in
                        Text(city)
                            .padding(.horizontal, 8)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

//#Preview {
//    CitiesPage()
//}
