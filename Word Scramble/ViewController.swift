//
//  ViewController.swift
//  Word Scramble
//
//  Created by Rael Kenny on 5/16/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            
            if let startWords = try? String(contentsOfFile: startWordsPath) {
                
                allWords = startWords.components(separatedBy: "\n")
            
            } else {
             
                allWords = ["silkworm"]
                
            }
        }
        
        startGame()
    }
    
    func startGame() {
        
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

