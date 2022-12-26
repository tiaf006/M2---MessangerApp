//
//  RegisterViewController.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 02/06/1444 AH.
//
import UIKit
class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address..."
        field.backgroundColor = .gray
        field.keyboardType = .emailAddress
        return field
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password ..."
        field.backgroundColor = .gray
        field.isSecureTextEntry = true
        return field
    }()
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "First Name"
        field.backgroundColor = .gray
        field.keyboardType = .alphabet
        return field
    }()
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
        field.backgroundColor = .gray
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
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("wwwwwww")
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
    
}
