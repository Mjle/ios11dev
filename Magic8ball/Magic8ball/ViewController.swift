//
//  ViewController.swift
//  Magic8ball
//
//  Created by Michael Le on 2/12/18.
//  Copyright © 2018 Michael Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    
    let ballImages : [String] = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func randomAnswer(_ sender: Any) {
        changeBallImage()
    }
    
    func changeBallImage() {
        var randomIndex = Int(arc4random_uniform(5))
        
        ballImage.image = UIImage(named: ballImages[randomIndex])
        
    }
}

