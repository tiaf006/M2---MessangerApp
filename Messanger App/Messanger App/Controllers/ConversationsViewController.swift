//
//  ConversationsViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit

class ConversationsViewController: UIViewController {
        // check to see if user is signed in using ... user defaults
        // they are, stay on the screen. If not, show the login screen
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
            if !isLoggedIn {
                // present login view controller
                
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
            }
        }
    }

