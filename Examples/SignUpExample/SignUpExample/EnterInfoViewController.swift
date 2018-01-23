//
//  EnterInfoViewController.swift
//  SignUpExample
//
//  Created by Ethan Petersen on 1/22/18.
//  Copyright © 2018 Ethan Petersen. All rights reserved.
//

import UIKit
import VizAISDK

class EnterInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "enterInfoToSelectOptionsSegue", sender: self)
    }
    
    
}
