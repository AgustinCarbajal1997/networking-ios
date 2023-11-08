//
//  ViewController.swift
//  networking
//
//  Created by Agustin Carbajal on 08/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        nameUser.text = ""
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }


    @IBAction func getUser(_ sender: Any) {
        activityIndicator.startAnimating()
        NetworkingProvider.shared.getUser(id: 1700682) { user in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = user.name
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = error.debugDescription
        }

    }
}

