//
//  ViewController.swift
//  Tap Me
//
//  Created by Janell Lantana on 8/4/16.
//  Copyright © 2016 Janell Lantana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    var count = 0
    
    var seconds = 0
    var timer = NSTimer()
    
    
    @IBAction func buttonPressed() {
        count+=1
       scoreLabel.text = "Score \n\(count)"
        NSLog("Button Pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupGame()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupGame() {
        seconds = 30
        count = 0
        
        timeLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.subtractTime), userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        seconds -= 1
        timeLabel.text = "Time: \(seconds)"
        
        if(seconds == 0) {
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up!", message: "You scored \(count) points", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
                action in self.setupGame()}))
            presentViewController(alert, animated: true, completion: nil)
        }
    }

}

