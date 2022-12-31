//
//  UesrsTableViewController.swift
//  Messanger App
//
//  Created by maram  on 07/06/1444 AH.
//

import UIKit
import Firebase

class UesrsTableViewController: UIViewController {

    
    @IBOutlet weak var UesrsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",   style: .plain, target: self, action: #selector (handleLogout))
        let image = UIImage (systemName: "square.and.pencil")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image,style: .plain, target: self, action: #selector (handleNewMessage))
    }
    @objc func handleNewMessage() {
        let newMessTableViewController = NewMesswController()
        self.navigationController?.pushViewController(newMessTableViewController, animated: true)
    }
    
    func loadUserData() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector (handleLogout))
    }
    @objc func handleLogout() {
    let loginController = LoginViewController()
    self.navigationController?.pushViewController(loginController, animated: true)
    }
}
