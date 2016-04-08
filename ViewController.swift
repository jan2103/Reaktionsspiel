//
//  ViewController.swift
//  Reaktion
//
//  Created by Jan Verlage on 08.04.16| KW 14.
//  Copyright © 2016 Jan Verlage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ÜberschriftLabel: UILabel!
    @IBOutlet weak var Bild: UIImageView!
    @IBOutlet weak var ReaktionButton: UIButton!
    @IBOutlet weak var WiederholenButton: UIButton!
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var ZeitLabel: UILabel!
  
     var timer = NSTimer()
    var Zeitstop = NSTimer()
    var Zeit = 0.000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Bild.image = UIImage(named: "Bild1.png")
        ÜberschriftLabel.layer.borderWidth = 1.5
        ZeitLabel.layer.borderWidth = 1.5
       
       
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Restart(sender: AnyObject) {
        self.viewDidLoad()
        Zeit = 0.000
        ZeitLabel.text = NSString .localizedStringWithFormat("Reaktionszeit: %.3fs", Zeit) as String

        
    }

    @IBAction func Start(sender: AnyObject) {
        Zeit = 0.000
        let randomNumber = Double(arc4random_uniform(7) + 2)
        self.timer = NSTimer.scheduledTimerWithTimeInterval(randomNumber, target: self, selector: #selector(ViewController.ChangeBild), userInfo: nil, repeats: false)
      
        
       
        
     }
    @IBAction func Reacted(sender: AnyObject) {
        Zeitstop.invalidate()
        ZeitLabel.text = NSString .localizedStringWithFormat("Reaktionszeit: %.3fs", Zeit) as String
      
    }
    func ChangeBild(){
         Bild.image = UIImage(named: "Bild2.png")
          self.Zeitstop = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: #selector(ViewController.ErhöheZeit), userInfo: nil, repeats: true)
    }
    func ErhöheZeit(){
        Zeit+=0.001
    }
        
    }


