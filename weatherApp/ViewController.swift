//
//  ViewController.swift
//  weatherApp
//
//  Created by Leonardo Carrera da Silva on 16/12/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView(frame: .zero)
        
        view.image = UIImage(named: "background")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = "São Paulo"
        label.textColor = UIColor(named: "primaryColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .systemFont(ofSize: 70, weight: .bold)
        label.textAlignment = .left
        label.text = "25°C"
        label.textColor = UIColor(named: "primaryColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setupView(){
        view.backgroundColor = .red
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
    }

    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169),
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15)
            
        ])
    }

}

