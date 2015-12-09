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
import ParseFacebookUtilsV4

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var accounts: [ACAccount]!
    
    @IBOutlet weak var trainTrackContainer: UIView!
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
        
        setMainBackground()
        
        self.navigationController!.navigationBar.hidden = true
        
    }
    
    func setMainBackground () {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "dt_bg_2")?.drawInRect(self.view.bounds)
        let bg: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: bg)
        
        UIGraphicsBeginImageContext(trainTrackContainer.frame.size)
        UIImage(named: "track_2")?.drawInRect(trainTrackContainer.bounds)
        let track: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        trainTrackContainer.backgroundColor = UIColor(patternImage: track)
        trainTrackContainer.transform = CGAffineTransformRotate(trainTrackContainer.transform, 3.14/8)
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
            
            // a user is logged in
            
            
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
    }
    
}