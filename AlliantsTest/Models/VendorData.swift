//
//  VendorData.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import Foundation

import Foundation

struct VendorData: Decodable {
    let id: Int
    let heroImage: HeroImage
    let displayName, name, description: String
    let openingHours: OpeningHours?
    //    let timezone:
}

// MARK: - OpeningHours
struct OpeningHours: Decodable {
    let id: Int
    let monday, tuesday, wednesday, thursday, friday, saturday, sunday: [Day]
}

// MARK: - Day
struct Day: Decodable {
    let id: Int
    let opensAt, closesAt: String?
    let closesLate: Bool
}

// MARK: - HeroImage
struct HeroImage: Decodable {
    let id: Int
    let size: Double
    let url: String?
}
