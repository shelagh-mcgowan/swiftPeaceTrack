//
//  VCMain.swift
//  swiftPeaceTrack<3
//
//  Created by Shelagh McGowan on 7/4/14.
//  Copyright (c) 2014 Shelagh McGowan. All rights reserved.
//

import UIKit
import CoreData
class VCMain: UIViewController {

    @IBOutlet var txtFullName: UITextField!
    @IBOutlet var txtVolunteerID: UITextField!
    
    //creates a new user object and saves it to the database
    @IBAction func btnSave(){
       
        //create a new variable appDel to store app delegate 
        //cast delegate of type UIApplication to our delegate type AppDelegate
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        //get our ManagedObjectContext from our app delegate. now we are able to save and load information from our SQLite file.
        var context:NSManagedObjectContext = appDel.managedObjectContext
        //make a new user object that will be inserting itself into the database
        //cast it back to an NSManagedObject
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        //user has a full name. set the information into our data model
        newUser.setValue(""+txtFullName.text, forKey: "username")
        //user has a volunteer ID. set the information into our data model
        newUser.setValue(""+txtVolunteerID.text, forKey: "password")
        //save the object
        context.save(nil)
        //placeholder to show an error message
        //print object to the console
        println(newUser)
        println("Object Saved")
        //test case
        //println("save button pressed \(txtFullName.text)")
        
    }
    @IBAction func btnLoad(){
        
        //same as btnSave() function
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        //same as btnSave() function
        var context:NSManagedObjectContext = appDel.managedObjectContext
        //asking database to perform a request on the user's table
        var request = NSFetchRequest(entityName: "Users")
        //fixes a bug (optional) objects were always coming back as false.
        request.returnsObjectsAsFaults = false;
        //ask the context to execute a fetch request. errors will be handled here.
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        //if there are results, loop through them and print them to the console
        if(results.count > 0){
            for res in results{
                println(res)
            }
        }else{
            println("0 Results Returned...Potential Error")
        }
        //test case
        //println("load button pressed \(txtVolunteerID.text)")
        
    }
        override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
