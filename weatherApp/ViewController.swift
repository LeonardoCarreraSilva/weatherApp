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
    
//    private lazy var humidityLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = UIColor(named: "contrastColor")
//        label.font = .systemFont(ofSize: 12, weight: .semibold)
//        label.text = "Umidade"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private lazy var humidityValueLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = UIColor(named: "contrastColor")
//        label.font = .systemFont(ofSize: 12, weight: .semibold)
//        label.text = "1000mm"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private lazy var humidifyStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
//        stackView.axis = .horizontal
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//    
//    
//    private lazy var windLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = UIColor(named: "contrastColor")
//        label.font = .systemFont(ofSize: 12, weight: .semibold)
//        label.text = "Vento"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private lazy var windValueLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = UIColor(named: "contrastColor")
//        label.font = .systemFont(ofSize: 12, weight: .semibold)
//        label.text = "10Km/h"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private lazy var windStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
//        stackView.axis = .horizontal
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//    
//    private lazy var statsStackView: UIView = {
//        let stackView = UIStackView(arrangedSubviews: [humidifyStackView, windStackView])
//        stackView.axis = .vertical
//        stackView.spacing = 3
//        stackView.backgroundColor = UIColor(named: "softGray")
//        stackView.layer.cornerRadius = 10
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    private typealias lineStatsView = (statsName:String, statsValue:String)
    
    private lazy var humidifyLine: lineStatsView = ("Umidade", "1000mm")
    private lazy var windLine: lineStatsView = ("Vento", "10KM/h")
    
    private func custonStatsview(statisList: [lineStatsView]) -> UIView{
        var stackViewLine = UIStackView()
        var listStackViewLines: [UIStackView] = []
        
        statisList.forEach(){line in
            let labelName = UILabel()
            labelName.textColor = UIColor(named: "contrastColor")
            labelName.font = .systemFont(ofSize: 12, weight: .semibold)
            labelName.text = line.statsName
            labelName.translatesAutoresizingMaskIntoConstraints = false
            
            let labelValue = UILabel()
            labelValue.textColor = UIColor(named: "contrastColor")
            labelValue.font = .systemFont(ofSize: 12, weight: .semibold)
            labelValue.text = line.statsValue
            labelValue.translatesAutoresizingMaskIntoConstraints = false
            
            stackViewLine = UIStackView(arrangedSubviews: [labelName, labelValue])
            stackViewLine.axis = .horizontal
            stackViewLine.translatesAutoresizingMaskIntoConstraints = false
            listStackViewLines.append(stackViewLine)
        }
            
            
        
        
        
        let stackView = UIStackView(arrangedSubviews: listStackViewLines)
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = UIColor(named: "softGray")
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private lazy var statsStackView = custonStatsview(statisList: [humidifyLine, windLine])
   
    private func setupView(){
        view.backgroundColor = .red
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsStackView)
        
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
        
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        
    }

}
