//
//  TopView.swift
//  ClimaDesign
//
//  Created by Damir Aliyev on 03.08.2022.
//

import Foundation
import UIKit

class TopView: UIView{
    let buttonWidth = CGFloat(32)
    var topAnchorConstraint = NSLayoutConstraint()
    var landScapeTopAnchor = NSLayoutConstraint()
    
    let locationButton = makeSFButton(systemName: "location.north.circle.fill")
    let searchBar = makeSearchBar(placeholderText: "City name")
    let searchButton  = makeSFButton(systemName: "magnifyingglass")
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(locationButton)
        addSubview(searchBar)
        addSubview(searchButton)
        
        topAnchorConstraint = locationButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        landScapeTopAnchor = locationButton.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        adjustConstraints()
        locationButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant:buttonWidth).isActive = true
        
        searchButton.centerYAnchor.constraint(equalTo: locationButton.centerYAnchor).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true

        searchBar.centerYAnchor.constraint(equalTo: locationButton.centerYAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor, constant: 8).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    }
    func adjustConstraints(){
        if UIDevice.current.orientation.isPortrait{
            topAnchorConstraint.isActive = true
            landScapeTopAnchor.isActive = false
        }else{
            topAnchorConstraint.isActive = false
            landScapeTopAnchor.isActive = true
        }
    }
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 50)
    }
    
}
