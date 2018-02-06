//
//  LoginViewController.swift
//  Instagram
//
//  Created by Dhriti Chawla on 1/29/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passWordField: UITextField!
    // initialize a user object
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
    
        PFUser.logInWithUsername(inBackground: userNameField.text!, password: passWordField.text!) { (user: PFUser?, error: Error?) -> Void in
            if (user != nil) {
                print ("Youre logged in! ")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
    }
    
    
   
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        // set user properties
        newUser.username = userNameField.text
        newUser.password = passWordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) -> Void in
            if success {
                print("YAY! New user created!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else  {
                print(error?.localizedDescription)
                if (error?._code == 202)
                {
                    print ("Username is already taken.")
                }
                
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
