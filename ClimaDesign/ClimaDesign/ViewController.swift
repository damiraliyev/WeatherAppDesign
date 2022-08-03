//
//  ViewController.swift
//  ClimaDesign
//
//  Created by Damir Aliyev on 03.08.2022.
//

import UIKit


class ViewController: UIViewController {
    var topAnchorConstraint = NSLayoutConstraint()
    var landScapeTopAnchor = NSLayoutConstraint()
    var cityNameTrailingConstraint = NSLayoutConstraint()
    var cityNameMarginTrailingConstraint = NSLayoutConstraint()
    let topBar = TopView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func rotated(){
        topBar.adjustConstraints()
        if UIDevice.current.orientation.isPortrait{
            cityNameTrailingConstraint.isActive = true
            cityNameMarginTrailingConstraint.isActive = false
        }else{
            cityNameTrailingConstraint.isActive = false
            cityNameMarginTrailingConstraint.isActive = true

        }
    }
    
    func setupViews(){
        
        let backgroundImage = makeBackgroundImage()
        let topStackView = makeStackView(orientation: .vertical)
        let weatherImage = makeImageView(systemName: "sun.max")
        let degree = makeBoldLabel(withText: "27.5℃")
        let cityName = makeLabel(withText: "San Francisco", fontSize: 40)
        
        topStackView.addArrangedSubview(topBar)
        view.addSubview(backgroundImage)
        view.addSubview(topStackView)
        view.addSubview(weatherImage)
        view.addSubview(degree)
        view.addSubview(cityName)
        
        //City name setup
        cityName.topAnchor.constraint(equalTo: degree.bottomAnchor,constant: 32).isActive = true
        cityNameTrailingConstraint = cityName.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        cityNameMarginTrailingConstraint = cityName.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
         //DEGREE STATUS
        degree.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 32).isActive = true
        degree.centerXAnchor.constraint(equalTo: weatherImage.centerXAnchor).isActive = true
        //WEATHER IMAGE SETUP
        weatherImage.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 32).isActive = true
        weatherImage.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        //TOPBAR CUSTOM VIEW SETUP
        topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        //BACKGROUND SETUP
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

