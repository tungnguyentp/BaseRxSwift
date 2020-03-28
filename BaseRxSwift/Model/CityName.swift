//
//  CityName.swift
//  BaseRxSwift
//
//  Created by IMAC on 3/28/20.
//  Copyright © 2020 IMAC. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct BaseRespone: Codable {
    let status: Int?
    let message: String?
    let data: CityNameRespone?

}

// MARK: - WelcomeData
struct CityNameRespone: Codable {
    let datas: [CityName]?
    let nextPage: Int?

    enum CodingKeys: String, CodingKey {
        case datas
        case nextPage = "next_page"
    }
}

// MARK: - DataElement
struct CityName: Codable {
    let id, locationCode: Int?
    let locationNameVi, locationNameEn: String?
    let userActive: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case locationCode = "location_code"
        case locationNameVi = "location_name_vi"
        case locationNameEn = "location_name_en"
        case userActive = "user_active"
    }
}


