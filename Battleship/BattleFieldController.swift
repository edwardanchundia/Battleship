//
//  FirstViewController.swift
//  Battleship
//
//  Created by Jason Gresh on 9/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class BattleFieldController: UIViewController {
    
    enum Target {
        case Hit
        case Miss
    }
    
    var shipPosition = [String: Target]()
    
    let row = 10
    let column = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Battle Ship"
        setupGrideButton(row: row, by: column)
        
    }
    
    func setupGrideButton(row: Int, by column:Int) {
        for rowItem in 0..<row {
            for colItem in 0..<column {
                createButtonOn(row: rowItem, col: colItem)
            }
        }
        setBattleShipPosition()
    }
    
    func setBattleShipPosition() {
        // randomly set the ship position
        
        
        let positions = Int.arc4
        for position in positions {
            shipPosition[position] = .Hit
        }
    }
    
    func createButtonOn(row: Int, col: Int) {
        let xValue = (col * 35) + 10 // something
        let yValue = (row * 35) + 80   // something
        let frame = CGRect(x: xValue, y: yValue, width: 32, height: 32)
        let button = UIButton(frame: frame)
        let title = "\(row),\(col)"
        button.setTitle(title, for: .normal)
        shipPosition[title] = .Miss
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func handleButtonTapped(button: UIButton) {
        guard let title = button.currentTitle else { return }
        if shipPosition[title] == .Hit {
            button.backgroundColor = .red
        } else {
            button.backgroundColor = .gray
        }
    }
    
}

