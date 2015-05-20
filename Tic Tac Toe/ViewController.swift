//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Lala Vaishno De on 5/19/15.
//  Copyright (c) 2015 Lala Vaishno De. All rights reserved.
//

import UIKit

var board:[[Int]] = [[0,0,0], [0,0,0], [0,0,0]]

class ViewController: UIViewController {

    //1 = noughts, 2 = crosses
    var activePlayer = 1
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var gameActive:Bool = true
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        board = [[0,0,0], [0,0,0], [0,0,0]]
        activePlayer = 1
        gameActive = true
        turnLabel.hidden = false
        turnLabel.text = "Player 1 turn:"
        
        //clearing the buttons
        var button:UIButton
        var nums:Int
        //note: tags of all elements except these 9 buttons changed to 10
        for(nums = 0; nums < 9; nums++) {
            button = view.viewWithTag(nums)! as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
    }
    
    
    func checkResult() {
        
        var i:Int;
        if(gameActive == true) {
            for(i = 0; i < 3; i++) {
                if(((board[i][0] == board[i][1]) && (board[i][0] == board[i][2])) && (board[i][0] != 0)) {
                    //row winner
                    gameActive = false
                    break;
                }
                else if(((board[0][i] == board[1][i]) && (board[0][i] == board[2][i])) && (board[0][i] != 0)) {
                    //column winner
                    gameActive = false
                    break;
                }
                else if(i == 0) {
                    if(((board[i][i] == board[i+1][i+1]) && (board[i][i] == board[i+2][i+2])) && (board[i][i] != 0)) {
                        gameActive = false
                        break;
                    }
                    else if(((board[0][2] == board[1][1]) && (board[0][2] == board[2][0])) && (board[0][2] != 0)) {
                            gameActive = false
                            break;
                    }
                }
            }
        }
        
        if gameActive == false {
            
            turnLabel.hidden = true
            
            if activePlayer == 1 {
                gameOverLabel.text = "Player 2 has WON!"
                println("Player2 has won")
            }
            else {
                gameOverLabel.text = "Player 1 has WON"
                println("Player1 has won")
            }
            
            gameOverLabel.hidden = false
            playAgainButton.hidden = false
            

            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
            })
            
        }
        
    
        
    }
    
    
    //using generic caller and func for all buttons
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameActive == true {
            var row = sender.tag / 3
            var col = sender.tag % 3
        
            if(board[row][col] != 0) {
                //something already exists in this position
            
            }
            else  {
                var image = UIImage();
            
                if activePlayer == 1 {
                    board[row][col] = 1
                    image = UIImage(named: "nought.png")!
                    activePlayer = 2
                }
                else {
                    board[row][col] = 2
                    image = UIImage(named: "cross.png")!
                    activePlayer = 1
                }
            
                sender.setImage(image, forState: .Normal)
                turnLabel.text = "Player \(activePlayer) turn:"
                checkResult()
            
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

