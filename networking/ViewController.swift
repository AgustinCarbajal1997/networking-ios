//
//  ViewController.swift
//  networking
//
//  Created by Agustin Carbajal on 08/11/2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var idUser: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var downloadImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        nameUser.text = ""
        idUser.text = ""
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }


    @IBAction func getUser(_ sender: Any) {
        activityIndicator.startAnimating()
        NetworkingProvider.shared.getUser(id: 1700682) { user in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = user.name
            self.idUser.text = user.id.description
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = error.debugDescription
        }

    }
    
    @IBAction func addUser(_ sender: Any) {
        activityIndicator.startAnimating()
        let newUser = NewUser(name: "Agustin", email: "carbajal123123@gmail.com", gender: "male", status: "Inactive")
        NetworkingProvider.shared.addUser(user: newUser) { user in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = user.name
            self.idUser.text = user.id.description
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = error.debugDescription
        }
    }
    
    //5704549
    @IBAction func updateUser(_ sender: Any) {
        activityIndicator.startAnimating()
        let newUser = NewUser(name: "Agustin editadoooooo", email: "carbajalEditadooooo@gmail.com", gender: "male", status: "Inactive")
        NetworkingProvider.shared.updateUser(id:5704549, user: newUser) { user in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = user.name
            self.idUser.text = user.id.description
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = error.debugDescription
        }
    }
    
    @IBAction func deleteUser(_ sender: Any) {
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.deleteUser(id:5704549) {
            self.activityIndicator.stopAnimating()
            self.nameUser.text = "Eliminado"
            self.idUser.text = ""
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameUser.text = error.debugDescription
        }
    }
    
    
    @IBAction func downloadImageAction(_ sender: Any) {
        downloadImageButton.isHidden = true
        logoImage.kf.setImage(with: URL(string: "https://images0.autocasion.com/unsafe/900x600/actualidad/wp-content/uploads/2015/12/_main_image_209701_5664c7bd92cd1.jpg"))
    }
    
}

