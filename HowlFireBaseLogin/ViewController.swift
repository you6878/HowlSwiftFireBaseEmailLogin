//
//  ViewController.swift
//  HowlFireBaseLogin
//
//  Created by 유명식 on 2017. 6. 9..
//  Copyright © 2017년 swift. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController,GIDSignInUIDelegate {
    @IBAction func signIn(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn()
        
    }

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func signin(_ sender: Any) {
    
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!) { (user, error) in
         
            
            if(error != nil){return}
            
            
            let alert = UIAlertController(title: "알림", message: "회원가입완료", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

