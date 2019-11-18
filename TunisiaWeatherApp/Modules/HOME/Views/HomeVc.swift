//
//  ViewController.swift
//  TunisiaWeatherApp
//
//  Created by walid sassi on 11/8/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import UIKit

class HomeVc: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var departementCollectionView: UICollectionView!
    lazy var viewModel : HomeViewModel = {
        return HomeViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initViews()
        initVM()
        
    }
    func initViews(){
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        weatherTableView.register(UINib(nibName: "WeatherCityCell", bundle: nil), forCellReuseIdentifier: "weatherCityCell")
        departementCollectionView.register(UINib(nibName: "CityCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cityCollectionView")
        departementCollectionView.isPagingEnabled = false

    }
    
    func initVM(){
        // Naive Data Binding
        viewModel.showAlertClosure = {
            DispatchQueue.main.async {
                self.showAlert(self.viewModel.alertMessage ?? "")
            }
        }
        viewModel.updateLoadingStatus = {
            DispatchQueue.main.async {
                switch self.viewModel.status{
                case .completed:
                    self.activityIndicator.stopAnimating()
                    self.weatherTableView.isHidden = false
                    self.activityIndicator.isHidden = true
                    self.weatherTableView.reloadData()
                    return
                case .loading:
                    self.activityIndicator.startAnimating()
                    self.weatherTableView.isHidden = true
                    self.activityIndicator.isHidden = false
                case .error:
                    self.activityIndicator.stopAnimating()
                    self.weatherTableView.isHidden = true
                    self.activityIndicator.isHidden = true
                    return
                case .none:
                    return
                }
                
            }
        }
        viewModel.fetchData(cityName: "Bizerte")
        
    }
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}
extension HomeVc:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCityCell", for: indexPath) as! WeatherCityCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.model?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 90
    }
}
extension HomeVc:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cityNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
          .dequeueReusableCell(withReuseIdentifier: "cityCollectionView", for: indexPath) as! CityCollectionCell
        // Configure the cell
        cell.cityNameLabel.text = viewModel.cityNames[indexPath.row]
        return cell
    }
    
}
extension HomeVc:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let collectionWidth = collectionView.bounds.size.width
        return CGSize(width: collectionWidth / 2, height: collectionWidth/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return  0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
}

    
    



