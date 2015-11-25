/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse
import Accounts
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var accounts : [ACAccount]!

    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Send a test object to Parse
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (succes: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        
        // initialize the accounts
        self.accounts = []
        
        // This is for integrating with the iPhone device accounts
        //self.retreiveAccounts(ACAccountTypeIdentifierTwitter)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        let user = PFUser.currentUser()
        if user != nil {
            PFUser.logOut()
            self.setupParseLogin()
        }
    }
    
//    func retreiveAccounts(identifier: String) {
//        
//        let accountStore = ACAccountStore()
//        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(identifier)
//        
//        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted: Bool, error: NSError!) -> Void in
//            if granted {
//                let accounts = accountStore.accountsWithAccountType(accountType) as! [ACAccount]
//                self.accounts = accounts
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    // Do something here when user successfully logs in
//                })
//            }
//        }
//    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.setupParseLogin()
    }
    
    func setupParseLogin()
    {
        let user = PFUser.currentUser()
        if user == nil {
            
            // ParseUI login
            let loginCtrl = PFLogInViewController()
            loginCtrl.fields = [PFLogInFields.UsernameAndPassword, PFLogInFields.LogInButton, PFLogInFields.SignUpButton, PFLogInFields.Facebook]
            loginCtrl.
            loginCtrl.delegate = self
            
            // facebook permits
            loginCtrl.facebookPermissions = ["email"]
            
            // signup
            let signUpCtrl = PFSignUpViewController()
            signUpCtrl.delegate = self
            loginCtrl.signUpController = signUpCtrl
            
            self.presentViewController(loginCtrl, animated: true, completion: nil)
            
            
        } else {
            
            user?.
            self.userName.text = getWelcomeMessage(username: user?.username!)
            
        }
    }
    
    func getWelcomeMessage(username user: String?) -> String {
        return "Hi, " + user!
    }
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        let alert: UIAlertView?
        
        // error checking
        if username.characters.count > 20 {
            alert = UIAlertView(title: "Username too long", message: "Max length is 20 characters", delegate: nil, cancelButtonTitle: "Choose a different username")
            alert?.show()
            return false
        } else if username.characters.count == 0 && password.characters.count == 0 {
            // it's blank
            alert = UIAlertView(title: "Missing Info", message: "Make sure you fill in username/password", delegate: nil, cancelButtonTitle: "OK")
            alert?.show()
            return false
        } else {
            // it's good
            return true
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.userName.text = user.username
    }
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
        print("cancelled")
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        print("failed")
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.userName.text = user.username
    }
    
}