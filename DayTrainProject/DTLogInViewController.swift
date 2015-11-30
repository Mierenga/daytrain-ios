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

        self.view.backgroundColor = UIColor(red: (255.0/255.0), green: (153.0/255.0), blue: (0.0/255.0), alpha: 1.0)
        let logo = UIImage(named: "DayTrainLogo1")
        let logoView = UIImageView(image: logo)
        self.logInView?.logo = logoView
        self.logInView?.logInButton?.setTitle("All Aboard!", forState: UIControlState.Normal)
        
        let logoFrame = logInView?.logo?.frame
        
        self.logInView?.logo?.frame = CGRectMake((logoFrame?.origin.x)!, (logoFrame?.origin.y)! - 50.0, (logoFrame?.size.width)!, (logoFrame?.size.height)!)
        
//        var yOffset: CGFloat = 0.0
//        
//        let fieldFrame = self.logInView?.usernameField?.frame
//        self.logInView?.logo?.frame = CGRectMake(66.5, 70.0, 187.0, 58.5)
//        self.logInView?.logInButton?.frame = CGRectMake(35.0, 385.0, 250.0, 40.0)
//        
//        yOffset += (fieldFrame?.size.height)!
//        
//        self.logInView?.usernameField?.frame = CGRectMake((fieldFrame?.origin.x)! + 5, (fieldFrame?.origin.y)!, (fieldFrame?.size.width)! - 10.0, (fieldFrame?.size.height)!)
//        
//        yOffset += (fieldFrame?.size.height)!
//        
//        self.logInView?.passwordField?.frame = CGRectMake((fieldFrame?.origin.x)! + 5, (fieldFrame?.origin.y)!, (fieldFrame?.size.width)! - 10.0, (fieldFrame?.size.height)!)

        
        
    
        
        
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
