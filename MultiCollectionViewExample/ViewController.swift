//
//  ViewController.swift
//  MultiCollectionViewExample
//
//  Created by BerkH on 15.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Good Mornin Akila!"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let deliveringOptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let lblDelivery: UILabel = {
        let label = UILabel()
        label.text = "Delivering to"
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblDropdown: UILabel = {
        let label = UILabel()
        label.text = "Current Location  ▼"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let txtSearch: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search food"
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.clipsToBounds = true
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false

        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        paddingView.addSubview(imageView)
        textField.leftView = paddingView
        textField.leftViewMode = .always

        return textField
    }()
    
    let popularRestaurantsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let lblPopularRestaurants: UILabel = {
        let label = UILabel()
        label.text = "Popular Restaurents"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let lblPopularRestViewAll: UILabel = {
        let label = UILabel()
        label.text = "View All"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let mostPopularStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let lblMostPopular: UILabel = {
        let label = UILabel()
        label.text = "Most Popular"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let lblMostPopularViewAll: UILabel = {
        let label = UILabel()
        label.text = "View All"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let recentItemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let lblRecentItems: UILabel = {
        let label = UILabel()
        label.text = "Recent Items"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let lblRecentItemsViewAll: UILabel = {
        let label = UILabel()
        label.text = "View All"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let worldDishesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(WorldDishesCVC.self, forCellWithReuseIdentifier: "worldDishesCell")
        return collectionView
    }()
    
    let popularRestaurentsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PopularRestaurentsCVC.self, forCellWithReuseIdentifier: "popularRestaurentsCell")
        return collectionView
    }()
    
    let mostPopularRestaurentsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MostPopularCVC.self, forCellWithReuseIdentifier: "mostpopularRestaurentsCell")
        return collectionView
    }()
    
    let recentItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RecentItemsCVC.self, forCellWithReuseIdentifier: "recentItemsCell")
        return collectionView
    }()
    
    let pickerData: [DeliveryLocation] = [
        DeliveryLocation(currentLocation: "Current Location", homeLocation: "Home")
    ]
    
    var worldDishes: [WorldDishes] = [
        WorldDishes(image: "srilankan", name: "Sri Lankan"),
        WorldDishes(image: "italian", name: "Italian"),
        WorldDishes(image: "mexican", name: "Mexican"),
        WorldDishes(image: "indian", name: "Indian"),
        WorldDishes(image: "korean", name: "Korean"),
        WorldDishes(image: "brazilian", name: "Brazilian"),
        WorldDishes(image: "srilankan", name: "Sri Lankan"),
        WorldDishes(image: "italian", name: "Italian"),
        WorldDishes(image: "mexican", name: "Mexican"),
        WorldDishes(image: "indian", name: "Indian"),
        WorldDishes(image: "korean", name: "Korean"),
        WorldDishes(image: "brazilian", name: "Brazilian"),
    ]
    
    var popularRestaurents: [PopularRestaurents] = [
        PopularRestaurents(image: "western", restaurentName: "Minute by tuk tuk", rate: 4.9, totalRate: 128, cuisineName: "Western Food"),
        PopularRestaurents(image: "western", restaurentName: "Cafe de Noir", rate: 4.9, totalRate: 128, cuisineName: "Srilankan Food"),
        PopularRestaurents(image: "italian", restaurentName: "Bakes by Tella", rate: 4.9, totalRate: 128, cuisineName: "Italian Food"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        let shoppingCartButton = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(shoppingCartTapped))
        shoppingCartButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = shoppingCartButton
        
        lblDropdown.isUserInteractionEnabled = true
        lblDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dropDownLabelTapped)))
        
        self.view.backgroundColor = UIColor.white
        
        worldDishesCollectionView.delegate = self
        worldDishesCollectionView.dataSource = self
        worldDishesCollectionView.isScrollEnabled = true
        worldDishesCollectionView.showsHorizontalScrollIndicator = false
        worldDishesCollectionView.layer.borderWidth = 1.0
        worldDishesCollectionView.layer.borderColor = UIColor.gray.cgColor
        
        popularRestaurentsCollectionView.delegate = self
        popularRestaurentsCollectionView.dataSource = self
        popularRestaurentsCollectionView.isScrollEnabled = false
        popularRestaurentsCollectionView.showsVerticalScrollIndicator = false
        popularRestaurentsCollectionView.layer.borderWidth = 1.0
        popularRestaurentsCollectionView.layer.borderColor = UIColor.orange.cgColor
        
        mostPopularRestaurentsCollectionView.delegate = self
        mostPopularRestaurentsCollectionView.dataSource = self
        mostPopularRestaurentsCollectionView.isScrollEnabled = true
        mostPopularRestaurentsCollectionView.showsVerticalScrollIndicator = false
        mostPopularRestaurentsCollectionView.layer.borderWidth = 1.0
        mostPopularRestaurentsCollectionView.layer.borderColor = UIColor.green.cgColor
        
        recentItemsCollectionView.delegate = self
        recentItemsCollectionView.dataSource = self
        recentItemsCollectionView.isScrollEnabled = true
        recentItemsCollectionView.showsVerticalScrollIndicator = false
        recentItemsCollectionView.layer.borderWidth = 1.0
        recentItemsCollectionView.layer.borderColor = UIColor.red.cgColor
        
        deliveringOptionsStackView.addArrangedSubview(lblDelivery)
        deliveringOptionsStackView.addArrangedSubview(lblDropdown)
        
        popularRestaurantsStackView.addArrangedSubview(lblPopularRestaurants)
        popularRestaurantsStackView.addArrangedSubview(lblPopularRestViewAll)
        
        mostPopularStackView.addArrangedSubview(lblMostPopular)
        mostPopularStackView.addArrangedSubview(lblMostPopularViewAll)
        
        recentItemsStackView.addArrangedSubview(lblRecentItems)
        recentItemsStackView.addArrangedSubview(lblRecentItemsViewAll)
        
        view.addSubview(scrollView)
        scrollView.addSubview(deliveringOptionsStackView)
        scrollView.addSubview(txtSearch)
        scrollView.addSubview(popularRestaurantsStackView)
        scrollView.addSubview(mostPopularStackView)
        scrollView.addSubview(recentItemsStackView)
        scrollView.addSubview(worldDishesCollectionView)
        scrollView.addSubview(popularRestaurentsCollectionView)
        scrollView.addSubview(mostPopularRestaurentsCollectionView)
        scrollView.addSubview(recentItemsCollectionView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            deliveringOptionsStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            deliveringOptionsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            deliveringOptionsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            txtSearch.topAnchor.constraint(equalTo: deliveringOptionsStackView.bottomAnchor, constant: 26),
            txtSearch.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            txtSearch.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            txtSearch.heightAnchor.constraint(equalToConstant: 50),

            
            worldDishesCollectionView.topAnchor.constraint(equalTo: txtSearch.bottomAnchor, constant: 16),
            worldDishesCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            worldDishesCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            worldDishesCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            worldDishesCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            popularRestaurantsStackView.topAnchor.constraint(equalTo: worldDishesCollectionView.bottomAnchor, constant: 30),
            popularRestaurantsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            popularRestaurantsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            popularRestaurentsCollectionView.topAnchor.constraint(equalTo: popularRestaurantsStackView.bottomAnchor, constant: 30),
            popularRestaurentsCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            popularRestaurentsCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            popularRestaurentsCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            popularRestaurentsCollectionView.heightAnchor.constraint(equalToConstant: 890),
            
            mostPopularStackView.topAnchor.constraint(equalTo: popularRestaurentsCollectionView.bottomAnchor, constant: 30),
            mostPopularStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            mostPopularStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            mostPopularRestaurentsCollectionView.topAnchor.constraint(equalTo: mostPopularStackView.bottomAnchor, constant: 16),
            mostPopularRestaurentsCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mostPopularRestaurentsCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mostPopularRestaurentsCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            mostPopularRestaurentsCollectionView.heightAnchor.constraint(equalToConstant: 230),
            
            recentItemsStackView.topAnchor.constraint(equalTo: mostPopularRestaurentsCollectionView.bottomAnchor, constant: 30),
            recentItemsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            recentItemsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            recentItemsCollectionView.topAnchor.constraint(equalTo: recentItemsStackView.bottomAnchor, constant: 16),
            recentItemsCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            recentItemsCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            recentItemsCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            recentItemsCollectionView.heightAnchor.constraint(equalToConstant: 350),
            recentItemsCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    @objc func shoppingCartTapped() {
        // Shopping cart action
    }
    
    @objc func dropDownLabelTapped() {

    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == worldDishesCollectionView {
            return worldDishes.count
        } else if collectionView == popularRestaurentsCollectionView {
            return popularRestaurents.count
        } else if collectionView == mostPopularRestaurentsCollectionView {
            return popularRestaurents.count
        } else {
            return popularRestaurents.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == worldDishesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "worldDishesCell", for: indexPath) as? WorldDishesCVC else {
                fatalError("Hücre oluşturulamadı")
            }
            let dish = worldDishes[indexPath.item]
            cell.lblWorldDishName.text = dish.name
            cell.imgWorldDish.image = UIImage(named: dish.image)
            return cell
        } else if collectionView == popularRestaurentsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularRestaurentsCell", for: indexPath) as? PopularRestaurentsCVC else {
                fatalError("Hücre oluşturulamadı")
            }
            let restaurent = popularRestaurents[indexPath.item]
            cell.imgRestaurent.image = UIImage(named: restaurent.image)
            cell.lblRestaurentName.text = restaurent.restaurentName
            cell.lblRestaurentRate.text = "\(restaurent.rate)"
            cell.lblTotalRate.text = "(\(restaurent.totalRate) ratings) Cafe"
            cell.lblCuisine.text = restaurent.cuisineName
            return cell
        } else if collectionView == mostPopularRestaurentsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mostpopularRestaurentsCell", for: indexPath) as? MostPopularCVC else {
                fatalError("Hücre oluşturulamadı")
            }
            let restaurent = popularRestaurents[indexPath.item]
            cell.imgPopularRestaurent.image = UIImage(named: restaurent.image)
            cell.lblPopularRestaurentName.text = restaurent.restaurentName
            cell.lblRestaurentRate.text = "\(restaurent.rate)"
            cell.lblCuisine.text = restaurent.cuisineName
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentItemsCell", for: indexPath) as? RecentItemsCVC else {
                fatalError("Hücre oluşturulamadı")
            }
            let restaurent = popularRestaurents[indexPath.item]
            cell.imgRecentItems.image = UIImage(named: restaurent.image)
            cell.lblRestaurentName.text = restaurent.restaurentName
            cell.lblRestaurentRate.text = "\(restaurent.rate)"
            cell.lblTotalRate.text = "(\(restaurent.totalRate) ratings) Cafe"
            cell.lblCuisine.text = restaurent.cuisineName
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == worldDishesCollectionView {
            return CGSize(width: 100, height: 130)
        } else if collectionView == popularRestaurentsCollectionView {
            let width = collectionView.frame.width
            let height: CGFloat = 280
            return CGSize(width: width, height: height)
        } else if collectionView == mostPopularRestaurentsCollectionView  {
            return CGSize(width: 260, height: 220)
        } else if collectionView == recentItemsCollectionView{
            let width = collectionView.frame.width - 32
            let height: CGFloat = 100
            return CGSize(width: width, height: height)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == worldDishesCollectionView {
            return 16
        } else if collectionView == popularRestaurentsCollectionView {
            return 16
        } else if collectionView == mostPopularRestaurentsCollectionView  {
            return 16
        } else if collectionView == recentItemsCollectionView{
            return 16
        }
        return 0
    }
}

