//
//  DTNavigationController.swift
//  DayTrain
//
//  Created by Mike Swierenga on 11/28/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class DTNavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: DTMenuTableViewController(), menuPosition:.Left)
        //sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 180.0 // optional, default is 160
        sideMenu?.bouncingEnabled = false
        
        // make navigation bar show over side menu
        view.bringSubviewToFront(navigationBar)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    func toggleSideMenu() {
        if sideMenu!.isMenuOpen {
            sideMenu?.hideSideMenu()
        } else {
            sideMenu?.showSideMenu()
        }
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
