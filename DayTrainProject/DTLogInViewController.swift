//
//  DTLoginViewController.swift
//  DayTrain
//
//  Created by Mike Swierenga on 11/28/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DTLogInViewController: PFLogInViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = DTColors.SOFT_ORANGE
        
        // set the daytrain logo
        let logo = DTImages.PARSE_LOGO
        let logoView = UIImageView(image: logo)
        self.logInView?.logo = logoView
        
        // change the log in button text
        self.logInView?.logInButton?.setTitle("All Aboard", forState: UIControlState.Normal)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        // get the window view
        let window = UIApplication.sharedApplication().delegate!.window!!
        print(window.frame)
        
        let x: CGFloat = 0.0
        let y: CGFloat = 0.0
        let width: CGFloat = (logInView?.bounds.width)! - 60
        
        self.logInView?.logo?.bounds =          CGRectMake(x, y, width, (logInView?.logo?.frame.height)! + 20)
        self.logInView?.usernameField?.bounds = CGRectMake(x, y, width, (logInView?.usernameField?.frame.height)!)
        self.logInView?.passwordField?.bounds = CGRectMake(x, y, width, (logInView?.passwordField?.frame.height)!)
        self.logInView?.logInButton?.bounds =   CGRectMake(x, y, width, (logInView?.logInButton?.frame.height)!)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
