//
//  newMessTableViewController.swift
//  Messanger App
//
//  Created by maram  on 07/06/1444 AH.
//

import UIKit
import FirebaseDatabase

class NewMesswController: UITableViewController {
    let cellid = "cellid"
    var users = [Users] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handelCanel))
        
    }

    func fetchUser() {
        Database.database().reference().child("users").observe(.
                                                               childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
            let user = Users()
                user.setValuesForKeys (dictionary)
                print (user.email,user.name)
            }
            
            //print("User found")
           // print (snapshot)
        }, withCancel: nil)
    }
    
    @objc func handelCanel() {
       // dismiss(animated: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection
                            section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell (style: .subtitle, reuseIdentifier: cellid)
        cell.textLabel?.text = "Dummy TEXT LALALLA"
        return cell
    }
}
