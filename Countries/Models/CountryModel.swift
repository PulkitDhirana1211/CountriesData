//
//  CountryModel.swift
//  Countries
//
//  Created by Pulkit Dhirana on 26/11/23.
//

import Foundation
// MARK: - CountryModel
struct CountryModel: Codable {
    let error: Bool
    let msg: String
    let data: [CountryList]
}

// MARK: - Datum
struct CountryList: Identifiable, Hashable, Codable {
    let id: String?
    let iso2, iso3: String
    let country: String
    let cities: [String]
}
