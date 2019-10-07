//
//  ViewController.swift
//  WarCardGame
//
//  Created by Christopher Ching on 2019-02-21.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scoreplayer = 0
    var scorecpu = 0

    @IBOutlet weak var leftCard: UIImageView!
    @IBOutlet weak var rightCard: UIImageView!
    
    @IBOutlet weak var scorePlayer: UILabel!
    
    @IBOutlet weak var scoreCpu: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func dealButton(_ sender: Any) {
        let leftnumber = Int.random(in:2...14)
        let rightnumber = Int.random(in: 2...14)
        
        leftCard.image = UIImage(named: "card\(leftnumber)")
            
        rightCard.image = UIImage(named: "card\(rightnumber)")
        
        if scorecpu <= 15 && scoreplayer <= 15 {
            if leftnumber > rightnumber {
                scoreplayer+=1
                scorePlayer.text = String(scoreplayer)
            }
            else if leftnumber < rightnumber {
                scorecpu+=1
                scoreCpu.text = String (scorecpu)
            }
            else
            {
                scorecpu+=1
                scoreplayer+=1
                scorePlayer.text = String(scoreplayer)
                scoreCpu.text = String (scorecpu)
            
            }
        }
        else if scorecpu == 15{
        
        let alert = UIAlertController(title: "Congratulation!", message: "CPU Win.", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
            scorecpu=0
            scoreplayer=0
            scorePlayer.text = String(scoreplayer)
            scoreCpu.text = String (scorecpu)
        }else if scoreplayer == 15{
            let alert = UIAlertController(title: "Congratulation!", message: "Player Win.", preferredStyle: UIAlertController.Style.alert)

            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            scorecpu=0
            scoreplayer=0
            scorePlayer.text = String(scoreplayer)
            scoreCpu.text = String (scorecpu)
            
        }else {
            let alert = UIAlertController(title: "Draw!", message: "Both players scored the same points.", preferredStyle: UIAlertController.Style.alert)

            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            scorecpu=0
            scoreplayer=0
            scorePlayer.text = String(scoreplayer)
            scoreCpu.text = String (scorecpu)
        }
    }
    
    
}

