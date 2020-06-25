//
//  HeroDetailsViewController.swift
//  Lesson10
//
//  Created by MacBook Pro on 22.06.2020.
//  Copyright © 2020 Artem K. All rights reserved.
//

import UIKit

class HeroDetailsViewController: UIViewController {
    
    var hero: Hero!
    var selection: String!
    
    private let deadpoolJsonUrl = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/213.json"
    private let darthVaderJsonUrl = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/208.json"
    private let hancockJsonUrl = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/308.json"
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroDetailLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
//     Пробовал двумя способами подгрузить картинку в деталях, но в обоих случаях она возвращает nil, никак не пойму почему так
//        setupHeroImageView()
//        fetchImage()
    }
    
    private func setupHeroImageView() {

        DispatchQueue.global().async {
            let stringUrl = self.hero.images.sm
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.heroImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    
    private func setupHeroLabel() {
        heroNameLabel.text = hero.name
        heroDetailLabel.text = """
        Powerstats:
        
        Intelligence: \(hero.powerstats.intelligence)
        Strength: \(hero.powerstats.strength)
        Speed: \(hero.powerstats.speed)
        Power: \(hero.powerstats.power)
        
        Apperance:
        
        Gender: \(hero.appearance.gender)
        Race: \(hero.appearance.race)
        
        Biography:
        
        FullName: \(hero.biography.fullName)
        
        AlterEgos: \(hero.biography.alterEgos)
        PlaceOfBirth: \(hero.biography.placeOfBirth)
        """
    }
    
    func fetchDataDeadpool() {
        guard let url = URL(string: deadpoolJsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            if let response = response { print(response) }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                self.hero = try decoder.decode(Hero.self, from: data)
                DispatchQueue.main.async {
                    self.transitionSelection()
                }
            } catch  let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    func fetchDataDarthVader() {
        guard let url = URL(string: darthVaderJsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            if let response = response { print(response) }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                self.hero = try decoder.decode(Hero.self, from: data)
                DispatchQueue.main.async {
                    self.transitionSelection()
                }
            } catch  let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func fetchDataHancock() {
        guard let url = URL(string: hancockJsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            if let response = response { print(response) }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                self.hero = try decoder.decode(Hero.self, from: data)
                DispatchQueue.main.async {
                    self.transitionSelection()
                }
            } catch  let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    /*
    func fetchImage() {
        let stringURL = hero.images.sm
        guard let imageURL = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error { print(error); return }
            if let response = response { print(response) }
            
            if let  data = data, let image = UIImage(data: data) {
                self.activityIndicator.stopAnimating()
                self.heroImageView.image = image
            }
        }.resume()
    }
 */
}


extension HeroDetailsViewController {

    private func transitionSelection() {
       
        switch selection {
        case "Deadpool": setupHeroLabel()
        case "DarthVader": setupHeroLabel()
        case "Hancock": setupHeroLabel()
        default: break
        }
    }
}


