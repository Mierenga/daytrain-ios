//
//  DTSignUpViewController.swift
//  DayTrain
//
//  Created by Mike Swierenga on 11/28/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DTSignUpViewController: PFSignUpViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = DTColors.SOFT_ORANGE
        let logo = DTImages.PARSE_LOGO
        let logoView = UIImageView(image: logo)
        self.signUpView?.logo = logoView
        
    }
    
    override func viewDidLayoutSubviews() {
        
        // get the window view
        let window = UIApplication.sharedApplication().delegate!.window!!
        print(window.frame)
        
        let x: CGFloat = 0.0
        let y: CGFloat = 0.0
        let width: CGFloat = (signUpView?.bounds.width)! - 60
        
        self.signUpView?.logo?.bounds =          CGRectMake(x, y, width, (signUpView?.logo?.frame.height)! + 20)
        self.signUpView?.usernameField?.bounds = CGRectMake(x, y, width, (signUpView?.usernameField?.frame.height)!)
        self.signUpView?.passwordField?.bounds = CGRectMake(x, y, width, (signUpView?.passwordField?.frame.height)!)
        self.signUpView?.emailField?.bounds =    CGRectMake(x, y, width, (signUpView?.emailField?.frame.height)!)
        self.signUpView?.signUpButton?.bounds =  CGRectMake(x, y, width, (signUpView?.signUpButton?.frame.height)!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
