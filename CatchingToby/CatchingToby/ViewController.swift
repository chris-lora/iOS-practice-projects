//
//  ViewController.swift
//  CatchingToby
//
//  Created by Christopher Lora on 12/19/21.
//

import UIKit

class ViewController: UIViewController {

    //global variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var tobyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    //views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var toby1: UIImageView!
    @IBOutlet weak var toby2: UIImageView!
    @IBOutlet weak var toby3: UIImageView!
    @IBOutlet weak var toby4: UIImageView!
    @IBOutlet weak var toby5: UIImageView!
    @IBOutlet weak var toby6: UIImageView!
    @IBOutlet weak var toby7: UIImageView!
    @IBOutlet weak var toby8: UIImageView!
    @IBOutlet weak var toby9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        //high score check
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        //images
        toby1.isUserInteractionEnabled = true
        toby2.isUserInteractionEnabled = true
        toby3.isUserInteractionEnabled = true
        toby4.isUserInteractionEnabled = true
        toby5.isUserInteractionEnabled = true
        toby6.isUserInteractionEnabled = true
        toby7.isUserInteractionEnabled = true
        toby8.isUserInteractionEnabled = true
        toby9.isUserInteractionEnabled = true

        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        toby1.addGestureRecognizer(recognizer1)
        toby2.addGestureRecognizer(recognizer2)
        toby3.addGestureRecognizer(recognizer3)
        toby4.addGestureRecognizer(recognizer4)
        toby5.addGestureRecognizer(recognizer5)
        toby6.addGestureRecognizer(recognizer6)
        toby7.addGestureRecognizer(recognizer7)
        toby8.addGestureRecognizer(recognizer8)
        toby9.addGestureRecognizer(recognizer9)
        
        tobyArray = [toby1, toby2, toby3, toby4, toby5, toby6, toby7, toby8, toby9]
        
        //timers
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideToby), userInfo: nil, repeats: true)
        
        hideToby()
    }

    @objc func hideToby() {
        
        for toby in tobyArray {
            toby.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(tobyArray.count - 1)))
        tobyArray[random].isHidden = false
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for toby in tobyArray {
                toby.isHidden = true
            }
            
            //high score
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            //alert
            let alert = UIAlertController(title: "Time's Up", message: "Want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let playAgainButton = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //play again func
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = Stirng(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                selfhideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideToby), userInfo: nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(playAgainButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}
