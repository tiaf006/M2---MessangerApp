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
=======
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let data = ["Log Out"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "person")
//        imageView.tintColor = .gray
//        imageView.layer.cornerRadius = 70
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // unhighlight the cell
        // logout the user
        
        // show alert
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in
            // action that is fired once selected
            
            guard let strongSelf = self else {
                return
            }
            
          
            do {
                try FirebaseAuth.Auth.auth().signOut()
                
                // present login view controller
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                strongSelf.present(nav, animated: true)
            }
            catch {
                print("failed to logout")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
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
