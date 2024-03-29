//
//  ProductFromBasket.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Foundation

struct ProductFromBasket: Codable {
    // MARK: - Properties
    let productID: Int
    let productName: String
    let price: Int
    let quantity: Int
    // MARK: - Keys
    enum CodingKeys: String, CodingKey {
        case productID = "id_product"
        case productName = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}
