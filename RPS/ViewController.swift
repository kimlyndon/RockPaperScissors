//
//  ViewController.swift
//  RPS
//
//  Created by Kim Lyndon on 3/14/18.
//  Copyright © 2018 Kim Lyndon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    resetBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func resetBoard() {
      computerLabel.text = "🤖"
      statusLabel.text = "Rock,Paper,Scissors?"
      rockButton.isHidden = false
      rockButton.isEnabled = true
      paperButton.isHidden = false
      paperButton.isEnabled = true
      scissorsButton.isHidden = false
      scissorsButton.isEnabled = true
      playAgainButton.isHidden = true
        
    }
    func play(_ playerTurn: Sign) {
       rockButton.isEnabled = false
       paperButton.isEnabled = false
       scissorsButton.isEnabled = false
       
        let opponent = randomSign()
        computerLabel.text = opponent.emoji
        let gameResult = playerTurn.takeTurn(_opponent: opponent)
        switch gameResult {
        case .draw:
            statusLabel.text = "It's a draw."
        case .lose:
            statusLabel.text = "Sorry! You lose!"
        case .win:
            statusLabel.text = "You win!!"
        case .start:
            statusLabel.text = "Rock, Paper, Scissors?"
        }
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }
    @IBAction func RockIcon(_ sender: Any) {
      play(Sign.rock)
    }
    
    @IBAction func PaperIcon(_ sender: Any) {
      play(Sign.paper)
    }
    
    @IBAction func ScissorsIcon(_ sender: Any) {
      play(Sign.scissors)
    }
    
    @IBAction func PlayAgainButton(_ sender: Any) {
    resetBoard()
    }
    
}

