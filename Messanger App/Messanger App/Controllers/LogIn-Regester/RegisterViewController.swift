//
//  RegisterViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address..."
        field.backgroundColor = .white
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.keyboardType = .emailAddress
        return field
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password ..."
        field.backgroundColor = .white
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.isSecureTextEntry = true
        return field
    }()
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First Name"
        field.backgroundColor = .white
        field.keyboardType = .alphabet
        return field
    }()
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
        field.backgroundColor = .white
        field.layer.borderColor = UIColor.red.cgColor
        field.keyboardType = .alphabet
        return field
    }()
    
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8).cgColor
        imageView.layer.borderWidth = 2
        imageView.tintColor = .gray
        //imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = false
        imageView.frame(forAlignmentRect: CGRectMake(0,0,100,100))
        imageView.layer.cornerRadius = imageView.frame.width/2.0
        imageView.clipsToBounds = true
       // imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("wwwwwww")
       view.backgroundColor = .white
        addSubViews()
        layOuts()
        
    }
    func addSubViews(){
        emailField.delegate = self
        passwordField.delegate = self
        
        // add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
    }
    
    @objc func layOuts(){
        navigationItem.title = "Register"
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 16).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -16).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:view.topAnchor , constant:120).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 120).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -120).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
        imageView.backgroundColor = .clear
        //imageView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        //imageView.widthAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 44).isActive = true
        firstNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        firstNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        firstNameField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        firstNameField.borderStyle = .roundedRect

        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 20).isActive = true
        lastNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lastNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lastNameField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        lastNameField.borderStyle = .roundedRect
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 20).isActive = true
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        emailField.borderStyle = .roundedRect
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        passwordField.borderStyle = .roundedRect
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 43).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc func signUp() {
        guard emailField.isEmail(),
              let email = emailField.text,
              let password = passwordField.text,
              password.count > 3 else {
            print("email or password is invalid")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            print("Create user finished")
            print(authResult)
            print(error)
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let profileVC = storyBoard.instantiateViewController(withIdentifier: "profileVC")
            
            self.navigationController?.pushViewController(profileVC, animated: true)
            
           
        }
    }
    
}
