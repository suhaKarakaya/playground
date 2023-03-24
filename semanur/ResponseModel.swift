//
//  ResponseModel.swift
//  semanur
//
//  Created by Süha Karakaya on 21.03.2023.
//

import Foundation

// MARK: - Country
struct Country: Codable {
    
    let Aksam, Ogle, Sabah, Ikindi, Yatsi, Gunes: String?
    
}

struct ProfileBaseResponse: Codable {
    let header: String?
    let image: String?
    let idHrEmployee: Int?
    let content, type: String?
    var isOpen: Bool
    let idPosition: Int?
    let firmGroupName: String?
}

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let header: String
    let image: String?
    let idHrEmployee: Int
    let content, type: String
    let isOpen: Bool
    let idPosition: Int?
    let firmGroupName: String?
}

typealias Welcome = [WelcomeElement]
