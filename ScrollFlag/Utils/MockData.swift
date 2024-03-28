//
//  MockData.swift
//  ScrollFlag
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import Foundation

class CountriesData {
    
    var countries: [FlagItem] = []
    
    static var shared = CountriesData()
    
    init() {
        self.countries = [
            FlagItem(id: 0, imageName: "Estonia"),
            FlagItem(id: 1, imageName: "France"),
            FlagItem(id: 2, imageName: "Germany"),
            FlagItem(id: 3, imageName: "Ireland"),
            FlagItem(id: 4, imageName: "Italy"),
            FlagItem(id: 5, imageName: "Nigeria"),
            FlagItem(id: 6, imageName: "Poland"),
            FlagItem(id: 7, imageName: "Russia"),
            FlagItem(id: 8, imageName: "Spain"),
            FlagItem(id: 9, imageName: "UK"),
            FlagItem(id: 10, imageName: "US"),
        ]
    }
    
}
