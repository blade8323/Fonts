//
//  FavouriteList.swift
//  Fonts
//
//  Created by Admin on 17.07.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

class FavouriteList {
    static let sharedFavouriteList = FavouriteList()
    private(set) var favorites: [String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favorites = storedFavourites != nil ? storedFavourites! : []
    }
    
    func addFavourite(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavourites()
        }
    }
    
    func removefavourite(fontName: String) {
        if let index = favorites.firstIndex(of: fontName) {
            favorites.remove(at: index)
            saveFavourites()
        }
    }
    
    private func saveFavourites() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favourites")
        defaults.synchronize()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavourites()
    }
}
