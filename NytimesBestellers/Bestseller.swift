//
//  Bestseller.swift
//  NytimesBestellers
//
//  Created by Nana Adwoa Odeibea Amoah on 7/9/21.
//

import Foundation

class Bestseller: Codable {
    var value = ""
//    var price = ""
//    var title = ""
    
    enum CodingKeys: String, CodingKey {
        case value
//        case title
//        case price
    }
}
