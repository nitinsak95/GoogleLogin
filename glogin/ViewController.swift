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
    @IBOutlet weak var lbUserId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var error: NSError?
        
         GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            print(error ?? "google error")
            return
        } 
        
        
//        //adding the delegates
//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().delegate = self
//
//
//        let googleSignInButton = GIDSignInButton()
//         let newCenter = CGPoint(x: 250,y: 250)
//         googleSignInButton.center = newCenter
////        googleSignInButton.center = view.center
//        view.addSubview(googleSignInButton)
        
      
    }

    @IBAction func btGooglee(_ sender: UIButton) {
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().uiDelegate=self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        //if any error stop and print the error
        if error != nil{
            print(error ?? "google error")
            return
        }
        
        let url1 = user.profile.imageURL(withDimension: 100)
        let data = NSData(contentsOf: url1!)
        
//        let viewController: LoginDataVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab") as! LoginDataVC
//        viewController.name1 = user.profile.name
//        viewController.imgg = UIImage(data: data as! Data)
//        self.present(viewController, animated: false, completion: nil)
        
        let storybaord=UIStoryboard(name: "Main", bundle: nil)
        let tabBar=storybaord.instantiateViewController(withIdentifier: "tab") as! TabBarrVC
        let svc = tabBar.viewControllers?[0] as! LoginDataVC
        svc.name1 = user.profile.name
        svc.imgg = UIImage(data: data as! Data)
        //this is not required as it will always open UIViewController at Zero index so comment this
        //tabBar.selectedIndex = 0
       
       self.present(tabBar, animated: true, completion: nil)
        
        //if success display the email on label
        lbName.text = user.profile.name
        print("\(user.profile.name)")
        labelUserEmail.text = user.profile.email
        lbUserId.text = user.userID
        
         let url = user.profile.imageURL(withDimension: 100)
        imgUser.kf.setImage(with: url)
        
        
    }
    
  
    
}

