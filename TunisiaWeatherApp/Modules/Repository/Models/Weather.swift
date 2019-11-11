//
//  Weather.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/9/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
@objcMembers class Weather:Object,Decodable{
    dynamic var sunrise:Int = 0
    dynamic var sunset:Int = 0
    dynamic var pressure:Int = 0
    dynamic var humidity:Int = 0
    dynamic var windSpeed:Double = 0.0
    dynamic var clouds:Int = 0
    enum CodingKeys:String,CodingKey{
    case sunrise
    case sunset
    case pressure
    case humidity
    case speed
    case clouds
    }
    required init() {
        super.init()
    }

    convenience required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init()
        self.sunrise = try container.decode(Int.self, forKey: .sunrise)
        self.sunset = try container.decode(Int.self, forKey: .sunset)
        self.pressure = try container.decode(Int.self,forKey:.pressure)
        self.humidity = try container.decode(Int.self,forKey:.humidity)
        self.windSpeed = try container.decode(Double.self,forKey:.speed)
        self.clouds = try container.decode(Int.self,forKey:.clouds)
    }
    required init(value: Any, schema: RLMSchema){
        
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema){
     
    }
}
