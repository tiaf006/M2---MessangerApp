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
    //MARK: outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
   
    //MARK: vars
    let photo = RegisterViewController()
    var photoData = Data()
   
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        layOuts()
    }
    
    //MARK: funcs and actions
    func layOuts(){
        photoData = photo.imageData
        //profileImage.image = UIImage(data: photoData)
        profileImage.image = UIImage(systemName:"person.circle")
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
        profileImage.layer.borderWidth = 5
        profileImage.Rouned()
        profileImage.tintColor = .lightGray
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
    //extintion to make the photo rounded
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

