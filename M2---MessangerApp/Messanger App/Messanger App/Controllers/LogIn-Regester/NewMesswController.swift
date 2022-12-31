//
//  newMessTableViewController.swift
//  Messanger App
//
//  Created by maram  on 07/06/1444 AH.
//

import UIKit

class NewMesswController: UITableViewController {
    let cellid = "cellid"
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handelCanel))

    }
    @objc func handelCanel() {
        dismiss(animated: true)
        }
             
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection
    section: Int) -> Int {
    return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // let use a hack for now, we actually need to dequeue our cells for
        
        let cell = UITableViewCell (style: .subtitle, reuseIdentifier: cellid)
        cell.textLabel?.text = "Dummy TEXT LALALLA"
        return cell
    }
}
