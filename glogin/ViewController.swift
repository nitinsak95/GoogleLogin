//
//  ViewController.swift
//  glogin
//
//  Created by AFFIXUS IMAC1 on 4/13/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google
import Kingfisher

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var labelUserEmail: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var error: NSError?
        
         GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            print(error ?? "google error")
            return
        } 
        
        
        //adding the delegates
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleSignInButton = GIDSignInButton()
        googleSignInButton.center = view.center
        view.addSubview(googleSignInButton)
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        //if any error stop and print the error
        if error != nil{
            print(error ?? "google error")
            return
        }
        
        //if success display the email on label
        lbName.text = user.profile.name
        labelUserEmail.text = user.profile.email
        
        let url = user.profile.imageURL(withDimension: 100)
        imgUser.kf.setImage(with: url)
    }
    
}

