//
//  CustomDropDown.swift
//  MultiCollectionViewExample
//
//  Created by BerkH on 17.10.2023.
//

import UIKit

class CustomDropDownView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Location  ▼"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let options: [String] = ["Current Location", "Home"]
    
    lazy var optionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        addSubview(titleLabel)
        addSubview(optionsTableView)

        optionsTableView.isHidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dropDownTapped))
        titleLabel.addGestureRecognizer(tapGesture)
        titleLabel.isUserInteractionEnabled = true
    }
    @objc private func dropDownTapped() {
        optionsTableView.isHidden = !optionsTableView.isHidden
    }
}

extension CustomDropDownView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = options[indexPath.row]
        // Handle the selected option as needed
    }
}

