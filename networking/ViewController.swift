//
//  ViewController.swift
//  networking
//
//  Created by Agustin Carbajal on 08/11/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getUser(_ sender: Any) {
        NetworkingProvider.shared.getUser(id: 1700682)
    }
}

