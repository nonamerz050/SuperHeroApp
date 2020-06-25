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
    
/*    var image: String {
        switch self {
        case .deadpool: return "https://itc.ua/wp-content/uploads/2016/02/deadpool-movie-poster-2016-770x546.jpg"
        
        case .darthVader: return "https://images.benefitspro.com/contrib/content/uploads/sites/412/2019/01/DartVader.jpg"
        case .hancock: return "https://www.denofgeek.com/wp-content/uploads/2018/07/hancock_main.jpg?fit=960%2C767"
        }
    }
 */
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

