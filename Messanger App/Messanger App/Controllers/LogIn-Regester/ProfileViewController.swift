//
//  ProfileViewController.swift
//  Messanger App
//
//  Created by Shatha on 03/06/1444 AH.
//

import UIKit

import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    let photo = RegisterViewController()
    var photoData = Data()
    override func viewDidLoad() {
        super.viewDidLoad()
        photoData = photo.imageData
        profileImage.image = UIImage(data: photoData)
        profileImage.tintColor = .gray
        profileImage.layer.cornerRadius = 70
        profileImage.contentMode = .scaleAspectFit
    }
    
    
    @IBAction func logOutAction(_ sender: Any) {
        try! Auth.auth().signOut()
        if let storyboard = self.storyboard {
            let logInView = LoginViewController()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
    
    extension UIImageView {
        func Rouned(){
            self.heightAnchor.constraint(equalToConstant: 150).isActive = true
            self.widthAnchor.constraint(equalToConstant: 150).isActive = true
            self.layer.masksToBounds = false
            self.frame(forAlignmentRect: CGRectMake(0, 0, 150, 150))
            self.contentMode = .scaleAspectFill
            self.layer.cornerRadius = 150.0/2.0
            self.clipsToBounds = true
        }
        
    }

