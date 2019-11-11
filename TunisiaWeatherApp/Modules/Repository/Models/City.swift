//
//  City.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/9/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers class City:Object,Decodable{
    dynamic var name: String = ""
    dynamic var population: Int = 0
    dynamic var cityId:Int = 0
    
    enum CodingKeys:String,CodingKey{
    case id
    case name
    case population
    }
        
    required init() {
        super.init()
     }
    convenience required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init()
        self.cityId = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.population = try container.decode(Int.self, forKey: .population)

    }
    
    required init(value: Any, schema: RLMSchema){
           fatalError("init(value:schema:) has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema){
        fatalError("init(realm:schema:) has not been implemented")
        
    }

}
