//
//  LogInViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit
class LoginViewController: UIViewController {
    // if not signed in, show the login screen, allow the user to sign up
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."

        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    



    let signButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Sign in", for: .normal)
        button.addTarget(self, action: #selector(signin), for: .touchUpInside)
        return button
    }()





    @objc func signin() {
        guard emailField.isEmail(),
              let email = emailField.text,
              let password = passwordField.text,
              password.count > 3 else {
            print("email or password is invalid")
            return
        }
//        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//            print("sign in user finished")
//            print(authResult)
//            print(error)
//        }
   }

    @objc func goToSignUp() {
        let signupVC = LoginViewController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }

    
}
