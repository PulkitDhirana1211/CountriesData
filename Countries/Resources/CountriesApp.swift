//
//  CountriesApp.swift
//  Countries
//
//  Created by Pulkit Dhirana on 26/11/23.
//

import SwiftUI

@main
struct CountriesApp: App {
    
    @StateObject var vm = CountryDataSubscriberModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(vm)
        }
    }
}
