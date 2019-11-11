//
//  LocalWeatherRepository.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/10/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import RealmSwift
class LocalWeatherRepository:CityRepository{
    func get(cityName: String, onComplete: @escaping (Bool, Bool, OpenWeatherModel) -> ()) {
        
    }
    func saveData(_ openWeatherModel:OpenWeatherModel){
        let realm = try! Realm()
            try! realm.write {
                realm.add(openWeatherModel, update: .all)
            }
        
    }
    
    
}
