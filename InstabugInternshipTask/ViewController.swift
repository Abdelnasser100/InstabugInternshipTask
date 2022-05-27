//
//  ViewController.swift
//  InstabugInternshipTask
//
//  Created by Yosef Hamza on 19/04/2021.
//

import UIKit
import InstabugLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
    super.viewDidLoad()
        
        InstabugLogger.shared.log(0, message: "Omar")
        InstabugLogger.shared.log(1, message: "Mohamed")
        
        InstabugLogger.shared.fetchAllLogs()
        
        print("**************************")
        
        InstabugLogger.shared.fetchAllLogs { (result) in
            print(result)
        }
    }

}

