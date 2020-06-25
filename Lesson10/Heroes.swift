//
//  Heroes.swift
//  Lesson10
//
//  Created by MacBook Pro on 22.06.2020.
//  Copyright © 2020 Artem K. All rights reserved.
//

enum Heroes: String, CaseIterable {
    case deadpool = "Deadpool"
    case darthVader = "Darth Vader"
    case hancock = "Hancock"
}

struct Hero: Decodable {
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let images: Images
}

struct Powerstats: Decodable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let power: Int
}

struct Appearance: Decodable {
    let gender: String
    let race: String
}

struct Biography: Decodable {
    let fullName: String
    let alterEgos: String
    let placeOfBirth: String
    
}

struct Images: Decodable {
    let xs: String
    let sm: String
    
}

