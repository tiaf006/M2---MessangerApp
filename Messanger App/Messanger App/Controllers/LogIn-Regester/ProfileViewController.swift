//
//  ProfileViewController.swift
//  Messanger App
//
//  Created by Shatha on 03/06/1444 AH.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
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
