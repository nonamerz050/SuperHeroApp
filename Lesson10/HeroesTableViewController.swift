//
//  HeroTableViewController.swift
//  Lesson10
//
//  Created by MacBook Pro on 23.06.2020.
//  Copyright © 2020 Artem K. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {

    let heroNames = Heroes.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let heroName = heroNames[indexPath.row]
        cell.textLabel?.text = heroName.rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userAction = heroNames[indexPath.row]
        
        switch userAction {
        case .deadpool:
            performSegue(withIdentifier: "Deadpool", sender: nil)
        case .darthVader:
            performSegue(withIdentifier: "DarthVader", sender: nil)
        case .hancock:
            performSegue(withIdentifier: "Hancock", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contentVC = segue.destination as! HeroDetailsViewController
        
        switch segue.identifier {
        case "Deadpool":
            contentVC.selection = "Deadpool"
            contentVC.fetchDataDeadpool()
        case "DarthVader":
            contentVC.selection = "DarthVader"
            contentVC.fetchDataDarthVader()
        case "Hancock":
            contentVC.selection = "Hancock"
            contentVC.fetchDataHancock()
        default: break
        }
    }
    
    
}
