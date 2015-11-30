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

        self.view.backgroundColor = UIColor(red: (255.0/255.0), green: (153.0/255.0), blue: (0.0/255.0), alpha: 1.0)
        let logo = UIImage(named: "DayTrainLogo1")
        let logoView = UIImageView(frame: CGRectMake(100, 150, 150, 150))
        logoView.image = logo
        
        self.signUpView?.logo = logoView
        
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
