//
//  ViewController.swift
//  Durationunit
//
//  Created by Peter Saathoff-Harshfield on 6/30/18.
//  Copyright © 2018 Peter Saathoff-Harshfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var du = DurationUnit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        display.text = "0:00:00"
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            self.du.updateTime()
            self.display.text = self.du.getTime()
        }
    }

    @IBOutlet weak var display: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

