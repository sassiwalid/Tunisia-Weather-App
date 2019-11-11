//
//  City.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/9/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import RealmSwift

public class City:Object{
    dynamic var cityName: String?
    dynamic var cityPopulation: Int?
    dynamic var cityLongitude:Double?
    dynamic var cityLatitude:Double?
    dynamic var list:[Weather]?

}
