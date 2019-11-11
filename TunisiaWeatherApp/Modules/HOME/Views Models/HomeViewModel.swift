//
//  HomeViewModel.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/9/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation


public class HomeViewModel {
    var cityRepoAPI:CityRepository?
    var cityRepoCache:CityRepository?
    var model:OpenWeatherModel?{
        didSet{
            self.ReloadTableViewClosure?()
        }
    }
    var status:dataStatus?{
        didSet{
            self.updateLoadingStatus?()
       }
    }
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    //define Call backs Closures
    var ReloadTableViewClosure:(()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    //dependency Injection
    init(cityRepoAPI:CityRepository = WebWeatherAPIRepository(),cityRepoCache:CityRepository = LocalWeatherRepository()){
        self.cityRepoAPI = cityRepoAPI
        self.cityRepoCache = cityRepoCache
    }
    
    func fetchData(cityName:String){
        // First change the status, this will call the updateLoadingStatus
        status = .loading
        cityRepoAPI?.get(cityName: cityName, onComplete: { (success, error, model) in
            guard error else {
                self.alertMessage = "Erreur de récupération"
                return}
            guard success else {return}
            self.model = model
            self.cityRepoCache?.saveData!(model)
        })
    }
    
    
    
}
