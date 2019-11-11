//
//  WebWeatherAPIRepository.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/9/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import UIKit

class WebWeatherAPIRepository:CityRepository {
    func get(cityName: String, onComplete: @escaping (Bool, Bool, OpenWeatherModel) -> ()) {
        //First define headers
        var urlComponents = URLComponents(string:Constants.baseURLAPI )!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: cityName),URLQueryItem(name: "appid", value: Constants.appId),URLQueryItem(name: "cnt", value: "7")]
        let request = URLRequest(url: urlComponents.url!)
        let task = URLSession.shared.dataTask(with: request){data,response,error in
            guard let result = data
            else{
            return
            }
            let openWeatherModel = try? JSONDecoder().decode(OpenWeatherModel.self, from: result)
            onComplete(true,false,openWeatherModel!)
        }
        task.resume()
        
    }
    
    
    
}
