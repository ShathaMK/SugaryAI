//
//  ProductModel.swift
//  SugaryAI
//
//  Created by Shatha Almukhaild on 10/09/1446 AH.
//

import SwiftData
import SwiftUI
struct Item: Identifiable {
    var id = UUID()
//    var name: String
//    var companyName: String
//    var protien: Double
//    var carbohydrates: Double
//    var fat: Double
//    var calories: Double
//    var glaycemicLoad: Double
    var productImage: UIImage?
    init(id: UUID = UUID(), productImage: UIImage? = nil) {
        self.id = id
        self.productImage = productImage
    }

    
}
