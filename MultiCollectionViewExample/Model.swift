//
//  Model.swift
//  MultiCollectionViewExample
//
//  Created by BerkH on 15.10.2023.
//

import Foundation

struct WorldDishes: Codable{
    let image: String
    let name: String
}

struct PopularRestaurents: Codable{
    let image: String
    let restaurentName: String
    let rate: Float
    let totalRate: Int
    let cuisineName: String
}

struct DeliveryLocation: Codable{
    let currentLocation: String
    let homeLocation: String
}
