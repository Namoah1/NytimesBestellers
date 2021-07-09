//
//  Bestseller.swift
//  NytimesBestellers
//
//  Created by Nana Adwoa Odeibea Amoah on 7/9/21.
//

import Foundation

class Bestseller: Codable {
    var author = ""
    var price = ""
    var title = ""
    
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case price
    }
}
