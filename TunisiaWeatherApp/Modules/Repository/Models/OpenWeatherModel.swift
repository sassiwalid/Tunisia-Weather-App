//
//  OpenWeatherModel.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/10/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers class OpenWeatherModel:Object,Decodable{
    dynamic var myCity : City? = City()
    var list = RealmSwift.List<Weather>()

    enum CodingKeys:String,CodingKey{
    case city
    case list

    }
    required init() {
        super.init()
    }
    
    convenience required init(from decoder: Decoder) throws{
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.init()
    myCity = try container.decode(City.self,forKey: .city)
    let weatherList = try container.decode([Weather].self, forKey: .list)
    list.append(objectsIn: weatherList)

    }
    required init(value: Any, schema: RLMSchema){
        
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema){
     
    }
}
