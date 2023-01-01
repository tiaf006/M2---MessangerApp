//
//  newMessTableViewController.swift
//  Messanger App
//
//  Created by maram  on 07/06/1444 AH.
//

import UIKit
import Firebase

class NewMesswController: UITableViewController {
    let cellid = "cellid"
    var users = [Users] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handelCanel))
        
        fetchUser()
    }
    
    func fetchUser() {
        Database.database().reference().child("Uesrs").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = Users()
                user.id = snapshot.key
                user.name = dictionary["name"] as? String
                user.email = dictionary["email"] as? String
                self.users.append(user)
                self.tableView.reloadData()
                print ("!!!!!!!\(user.name) \(user.email)!!!!")
            }
        }, withCancel: nil)
        print("noooo")
    }
    
    @objc func handelCanel() {
        // dismiss(animated: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell (style: .subtitle, reuseIdentifier: cellid)
        cell.textLabel?.text = users[indexPath.row].name
        return cell}
    }
