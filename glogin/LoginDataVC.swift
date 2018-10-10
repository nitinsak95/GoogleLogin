//
//  LoginDataVC.swift
//  glogin
//
//  Created by AFFIXUS IMAC1 on 4/16/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit

class LoginDataVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var name1: String!
    var imgg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

           //Declare globally
        self.name.text = self.name1
        self.img.image = self.imgg
        // Do any additional setup after loading the view.
    }

   

}
