//
//  Factory.swift
//  ClimaDesign
//
//  Created by Damir Aliyev on 03.08.2022.
//

import Foundation
import UIKit

func makeSearchBar(placeholderText: String) -> UITextField{
    let searchBar = UITextField()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.placeholder = placeholderText
    searchBar.textAlignment = .left
    searchBar.borderStyle = .roundedRect
    searchBar.backgroundColor = .systemFill
    return searchBar
}

func makeSFButton(systemName: String) -> UIButton{
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(UIImage(systemName: systemName), for: .normal)
    button.tintColor = .label
    return button
}

func makeBackgroundImage() -> UIImageView{
    let imageV = UIImageView()
    imageV.translatesAutoresizingMaskIntoConstraints = false
    imageV.image = UIImage(named:"light_background")
    imageV.contentMode = .scaleAspectFill
    
    return imageV
}

func makeStackView(orientation axis: NSLayoutConstraint.Axis) -> UIStackView{
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
   
    return stackView
}

func makeImageView(systemName: String) -> UIImageView{
    let imageV = UIImageView()
    imageV.translatesAutoresizingMaskIntoConstraints = false
    imageV.image = UIImage(systemName: systemName)
    imageV.tintColor = .label
    return imageV
}


func makeBoldLabel(withText text: String) -> UILabel{
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = UIFont.boldSystemFont(ofSize: 45)
    
    return label
}


func makeLabel(withText text: String, fontSize: Int) -> UILabel{
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    label.numberOfLines = 0
    
    return label
}
