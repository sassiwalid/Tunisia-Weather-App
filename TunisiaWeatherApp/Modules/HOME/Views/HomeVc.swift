//
//  ViewController.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/8/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import UIKit

class HomeVc: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var departementCollectionView: UICollectionView!
    lazy var viewModel : HomeViewModel = {
        return HomeViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchData(cityName: "Bizerte")
    }


}


