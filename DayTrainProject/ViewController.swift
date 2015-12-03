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
    
    var accounts: [ACAccount]!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBAction func menuToggleButton(sender: UIButton) {
        
        toggleSideMenuView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Send a test object to Parse
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (succes: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        
        // initialize the accounts
        self.accounts = []
        
        // Integrating with the iPhone device accounts
        //self.retreiveAccounts(ACAccountTypeIdentifierTwitter)
        
        setMainBackground()
        
        self.navigationController!.navigationBar.hidden = true
        
    }
    
    
    func setMainBackground () {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "dt_bg_1")?.drawInRect(self.view.bounds)
        let bg: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: bg)
        
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
            
            // ParseUI login, supports facebook
            let loginCtrl = DTLogInViewController()
            loginCtrl.fields = [PFLogInFields.UsernameAndPassword, PFLogInFields.LogInButton, PFLogInFields.SignUpButton, PFLogInFields.Facebook]
            loginCtrl.delegate = self
            loginCtrl.facebookPermissions = ["public_profile"]
            
            // signup view controller
            let signUpCtrl = DTSignUpViewController()
            signUpCtrl.delegate = self
            loginCtrl.signUpController = signUpCtrl
            
            self.presentViewController(loginCtrl, animated: true, completion: nil)
            
            
        } else {
            
            //self.userName.text = getWelcomeMessage(username: user?.username!)
            
        }
    }
    
    func getWelcomeMessage(username user: String?) -> String {
        
        if user == nil {
            return ""
        } else {
            return "Hi, " + user!
        }
        
    }
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        
        
        if username.characters.count > 0 && password.characters.count > 0 {
            
            return true
            
        } else {
            
            let alert: UIAlertView? = UIAlertView(title: "Missing Info", message: "Make sure you fill in username/password", delegate: nil, cancelButtonTitle: "OK")
            alert?.show()
            
            return false
            
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //self.userName.text = user.username
    }
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
        print("cancelled")
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        
        let alert : UIAlertView? = UIAlertView(title: "Incorrect Login Info", message: "We were unable to find that combination of username and password", delegate: nil, cancelButtonTitle: "OK")
        alert?.show()
        print("failed login")
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.userName.text = user.username
    }
    
}