//
//  NewTrainFormController.swift
//  DayTrain
//
//  Created by Mike Swierenga on 12/5/15.
//  Copyright © 2015 Parse. All rights reserved.
//

class NewTrainFormController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var confirmAdd: UIButton!
    @IBOutlet weak var confirmCancel: UIButton!
    
    @IBOutlet weak var activityName: UITextField!
    @IBOutlet weak var weekdayPicker: UIView!
    @IBOutlet weak var sundayToggle: UIButton!
    @IBOutlet weak var mondayToggle: UIButton!
    @IBOutlet weak var tuesdayToggle: UIButton!
    @IBOutlet weak var wednesdayToggle: UIButton!
    @IBOutlet weak var thursdayToggle: UIButton!
    @IBOutlet weak var fridayToggle: UIButton!
    @IBOutlet weak var saturdayToggle: UIButton!
    
    var daySelected = [Bool](count: 7, repeatedValue: false)
    
    let DAYS = (sun: 0, mon: 1, tues: 2, wed: 3, thurs: 4, fri: 5, sat: 6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundImage()
        
        activityName.delegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setBackgroundImage() {
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "sunset_tracks")?.drawInRect(self.view.bounds)
        let bg: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: bg)

    }
    
    
    func addNewTrain() {
        
        let user = PFUser()
        
        let newTrainCar = PFObject(className: "TrainCars")
        newTrainCar["user"] = user.username
        newTrainCar["activity"] = activityName.text
        newTrainCar["days"] = daySelected
        newTrainCar.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("train car saved")
            } else {
                print("problem saving new train car")
            }
        }
        
    }
    
    @IBAction func pressConfirmAdd(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        // build the parse object
        //let username: String = PFUser().username!
        addNewTrain()
        
    }
    
    
    
    @IBAction func pressConfirmCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pressSunday(sender: AnyObject) {
        daySelected[DAYS.sun] = !daySelected[DAYS.sun]
        setSelected(sundayToggle)
    }
    
    @IBAction func pressMonday(sender: AnyObject) {
        daySelected[DAYS.mon] = !daySelected[DAYS.mon]
        setSelected(mondayToggle)
    }
    
    @IBAction func pressTuesday(sender: AnyObject) {
        daySelected[DAYS.tues] = !daySelected[DAYS.tues]
        setSelected(tuesdayToggle)
    }
    
    @IBAction func pressWednesday(sender: AnyObject) {
        daySelected[DAYS.wed] = !daySelected[DAYS.wed]
        setSelected(wednesdayToggle)
    }
    
    @IBAction func pressThursday(sender: AnyObject) {
        daySelected[DAYS.thurs] = !daySelected[DAYS.thurs]
        setSelected(thursdayToggle)
    }
    
    @IBAction func pressFriday(sender: AnyObject) {
        daySelected[DAYS.fri] = !daySelected[DAYS.fri]
        setSelected(fridayToggle)
    }
    
    @IBAction func pressSaturday(sender: AnyObject) {
        daySelected[DAYS.sat] = !daySelected[DAYS.sat]
        setSelected(saturdayToggle)
    }
    
    
    func setSelected(btn: UIButton?) {
            btn!.selected = !(btn?.selected)!
    }

}
