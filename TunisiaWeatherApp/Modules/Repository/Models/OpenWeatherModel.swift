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
    dynamic var message: Double = 0
    dynamic var id : String = ""
    enum CodingKeys:String,CodingKey{
    case city
    case list
    case message

    }
    required init() {
        super.init()
    }
    static override func primaryKey() -> String? {
        return "id"
    }
    
    convenience required init(from decoder: Decoder) throws{
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.init()
    myCity = try container.decode(City.self,forKey: .city)
    let weatherList = try container.decode([Weather].self, forKey: .list)
    list.append(objectsIn: weatherList)
    message = try container.decode(Double.self, forKey: .message)
    id = String(message)

    }
    required init(value: Any, schema: RLMSchema){
         fatalError("init(value:schema:) has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema){
     fatalError("init(realm:schema:) has not been implemented")
    }
}
