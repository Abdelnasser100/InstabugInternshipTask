//
//  ViewController.swift
//  InstabugInternshipTask
//
//  Created by Yosef Hamza on 19/04/2021.
//

import UIKit
import InstabugLogger

class ViewController: UIViewController {

    override func loadView() {
    super.loadView()
    InstabugLogger.shared.log(0, message: "Ahmed")
    InstabugLogger.shared.log(1, message: "Mohamed")

   
    }
    override func viewDidLoad() {
    super.viewDidLoad()
        InstabugLogger.shared.fetchAllLogs()
        print("**************************")
        InstabugLogger.shared.fetchAllLogs { (result) in
            print(result)
        }
    }

}

