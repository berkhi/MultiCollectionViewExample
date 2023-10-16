//
//  WorldDishesCVC.swift
//  MultiCollectionViewExample
//
//  Created by BerkH on 15.10.2023.
//

import UIKit

class WorldDishesCVC: UICollectionViewCell {
    
    let imgWorldDish: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    let lblWorldDishName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
       configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
    }
    
    func addViews(){
        addSubview(imgWorldDish)
        addSubview(lblWorldDishName)
        
        imgWorldDish.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgWorldDish.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgWorldDish.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgWorldDish.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        lblWorldDishName.topAnchor.constraint(equalTo: imgWorldDish.bottomAnchor, constant: 10).isActive = true
        lblWorldDishName.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lblWorldDishName.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lblWorldDishName.textAlignment = .center
        
    }
    
    func configureUI() {
        backgroundColor = .white
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 10
    }
}
