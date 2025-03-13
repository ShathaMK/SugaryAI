//
//  Model.swift
//  SugaryAI
//
//  Created by Raghad Mohammed Almarri on 10/09/1446 AH.
//

import Foundation

struct SettingsOption: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let actionType: SettingsAction
}

enum SettingsAction {
    case contactUs
    case rateUs
    case shareApp
}
