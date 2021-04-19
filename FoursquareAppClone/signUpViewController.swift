//
//  ViewController.swift
//  FoursquareAppClone
//
//  Created by Mert Kaan on 14.04.2021.
//

import UIKit
import Parse

class signUpViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      

    }
    @IBAction func signInClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titlemessage: "Error", alertmessage: error?.localizedDescription ?? "error")
                }else{
                    self.performSegue(withIdentifier: "toplacesvc", sender: nil)
                }
            }
        }
        else{
            makeAlert(titlemessage: "error", alertmessage: "Username / Password ?")
        }
    }
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != ""{
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(titlemessage: "Error", alertmessage: error?.localizedDescription ?? "error")
                }else {
                    
                    self.performSegue(withIdentifier: "toplacesvc", sender: nil)
                }
            }
        }
        else {
            makeAlert(titlemessage: "Error", alertmessage: "Username / Password is empty ?")
        }
    }
    func makeAlert(titlemessage: String , alertmessage: String) {
        let alert = UIAlertController(title: titlemessage, message: alertmessage, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Error", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }

}

