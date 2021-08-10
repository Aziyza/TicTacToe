//
//  ViewController.swift
//  tic_tac_game
//
//  Created by Mac on 11/7/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var xlabel: UILabel!
    @IBOutlet weak var olabel: UILabel!
    @IBOutlet weak var turn: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    var winningStates = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]
    
    var xSteps:Array <Int> = []
    var oSteps:Array <Int> = []
    var isX = true
    var xWinCount = 0
    var oWinCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    @IBAction func xoPressed(_ sender: UIButton) {
        if isX {
            sender.setTitle("❄️", for: .normal)
            xSteps.append(sender.tag)
        }
        else {
             sender.setTitle("☁️", for: .normal)
            oSteps.append(sender.tag)
        }
        sender.isEnabled = false
        isX = !isX
        checkTurn()
        checkWinner()
    }
    
    func checkWinner() {
       for i in winningStates {
           if Set(xSteps).isSuperset(of: Set(i)) {
               xWinCount += 1
               xlabel.text = "Wins: " + String(xWinCount)
               turn.text = "❄️ Won!!!🎊🎊🎊"
               for b in buttons {
                   b.isEnabled = false
               }
               for a in i {
                   buttons[a].backgroundColor = #colorLiteral(red: 0.8906752467, green: 0.964520514, blue: 0.9658252597, alpha: 1)
               }
               break
           }
           if Set(oSteps).isSuperset(of: Set(i)) {
               oWinCount += 1
               olabel.text = "Wins: " + String(oWinCount)
               turn.text = "☁️ Won!!!🎊🎊🎊"
               for b in buttons {
                   b.isEnabled = false
               }
               for a in i {
                   buttons[a].backgroundColor = #colorLiteral(red: 0.8906752467, green: 0.964520514, blue: 0.9658252597, alpha: 1)
               }
               break
           }
       }
    }
    func checkTurn() {
        if isX {
            turn.text = "❄️ turn"
        } else {
            turn.text = "☁️ turn"
        }
    }
    func reset() {
        xWinCount = 0
        oWinCount = 0
        xlabel.text = "Wins: 0"
        olabel.text = "Wins: 0"
        checkTurn()
        xSteps.removeAll()
        oSteps.removeAll()
        for i in 0...8 {
            buttons[i].tag = i
            buttons[i].setTitle("", for: .normal)
            buttons[i].isEnabled = true
            buttons[i].backgroundColor = #colorLiteral(red: 0.930637598, green: 0.8360921741, blue: 0.9548096061, alpha: 1)
        }
    }
    func newGame() {
        checkTurn()
        xSteps.removeAll()
        oSteps.removeAll()
        for i in 0...8 {
            buttons[i].tag = i
            buttons[i].setTitle("", for: .normal)
            buttons[i].isEnabled = true
            buttons[i].backgroundColor = #colorLiteral(red: 0.930637598, green: 0.8360921741, blue: 0.9548096061, alpha: 1)
        }
    }

    @IBAction func newGame(_ sender: UIButton) {
        newGame()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        reset()
    }
    
}
