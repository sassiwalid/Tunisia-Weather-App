//
//  CityRepository.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/9/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation

@objc protocol CityRepository {
    func get( cityName:String,onComplete:@escaping (_ Success:Bool,_ error:Bool,_ city:OpenWeatherModel)->() )
    @objc optional func saveData(_ openWeatherModel:OpenWeatherModel)
}
