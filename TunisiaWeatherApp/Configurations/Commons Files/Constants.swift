//
//  Constants.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/9/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation


struct Constants {
static let baseURLAPI = "https://api.openweathermap.org/data/2.5/forecast/daily"
static let appId = "7861e4359f70ee319865c215da704b1e"
}
enum dataStatus {
    case empty
    case loading
    case completed
    case error
}
