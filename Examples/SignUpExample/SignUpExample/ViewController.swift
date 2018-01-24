//
//  ViewController.swift
//  SignUpExample
//
//  Created by Ethan Petersen on 1/22/18.
//  Copyright © 2018 Ethan Petersen. All rights reserved.
//

import UIKit
import VizAISDK
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        VizAIApp.shared().startRecording(sessionName: "Sign Up Example")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "homeToEnterInfoSegue", sender: self)
    }
}

