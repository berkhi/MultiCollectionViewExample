//
//  MostPopularCVC.swift
//  MultiCollectionViewExample
//
//  Created by BerkH on 16.10.2023.
//

import UIKit

class MostPopularCVC: UICollectionViewCell {
    
    let imgPopularRestaurent: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    let lblPopularRestaurentName: UILabel = {
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
        addSubview(imgPopularRestaurent)
        addSubview(lblPopularRestaurentName)
        addSubview(imgRateStar)
        addSubview(lblRestaurentRate)
        addSubview(lblTotalRate)
        addSubview(lblCuisine)
        
        imgPopularRestaurent.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgPopularRestaurent.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgPopularRestaurent.widthAnchor.constraint(equalToConstant: 260).isActive = true
        imgPopularRestaurent.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imgPopularRestaurent.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        lblPopularRestaurentName.topAnchor.constraint(equalTo: imgPopularRestaurent.bottomAnchor, constant: 20).isActive = true
        lblPopularRestaurentName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        lblPopularRestaurentName.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lblPopularRestaurentName.textAlignment = .left
        
        imgRateStar.topAnchor.constraint(equalTo: lblPopularRestaurentName.bottomAnchor, constant: 10).isActive = true
        imgRateStar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        imgRateStar.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imgRateStar.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        lblRestaurentRate.topAnchor.constraint(equalTo: lblPopularRestaurentName.bottomAnchor, constant: 10).isActive = true
        lblRestaurentRate.leadingAnchor.constraint(equalTo: imgRateStar.trailingAnchor, constant: 10).isActive = true
        
        lblCuisine.topAnchor.constraint(equalTo: lblPopularRestaurentName.bottomAnchor, constant: 10).isActive = true
        lblCuisine.leadingAnchor.constraint(equalTo: lblRestaurentRate.trailingAnchor, constant: 10).isActive = true
        lblCuisine.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func configureUI() {
        backgroundColor = .white
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 10
    }
}
