//
//  RecentItemsCVC.swift
//  MultiCollectionViewExample
//
//  Created by BerkH on 16.10.2023.
//

import UIKit

class RecentItemsCVC: UICollectionViewCell {
    
    let imgRecentItems: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    let lblRestaurentName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgRateStar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = UIColor.orange
        return imageView
    }()
    
    let lblRestaurentRate: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let lblTotalRate: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray4
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let lblCuisine: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray4
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
//        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
    }
    
    func addViews(){
        addSubview(imgRecentItems)
        addSubview(lblRestaurentName)
        addSubview(imgRateStar)
        addSubview(lblRestaurentRate)
        addSubview(lblTotalRate)
        addSubview(lblCuisine)
        
        imgRecentItems.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgRecentItems.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgRecentItems.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgRecentItems.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        lblRestaurentName.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        lblRestaurentName.leadingAnchor.constraint(equalTo: imgRecentItems.trailingAnchor, constant: 16).isActive = true
        lblRestaurentName.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        lblCuisine.topAnchor.constraint(equalTo: lblRestaurentName.bottomAnchor, constant: 10).isActive = true
        lblCuisine.leadingAnchor.constraint(equalTo: imgRecentItems.trailingAnchor, constant: 16).isActive = true
        
        imgRateStar.topAnchor.constraint(equalTo: lblCuisine.bottomAnchor, constant: 10).isActive = true
        imgRateStar.leadingAnchor.constraint(equalTo: imgRecentItems.trailingAnchor, constant: 16).isActive = true
        imgRateStar.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imgRateStar.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        lblRestaurentRate.topAnchor.constraint(equalTo: lblCuisine.bottomAnchor, constant: 10).isActive = true
        lblRestaurentRate.leadingAnchor.constraint(equalTo: imgRateStar.trailingAnchor, constant: 10).isActive = true
        
        lblTotalRate.topAnchor.constraint(equalTo: lblCuisine.bottomAnchor, constant: 10).isActive = true
        lblTotalRate.leadingAnchor.constraint(equalTo: lblRestaurentRate.trailingAnchor, constant: 10).isActive = true
    }
    
    func configureUI() {
        backgroundColor = .white
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 10
    }
}
