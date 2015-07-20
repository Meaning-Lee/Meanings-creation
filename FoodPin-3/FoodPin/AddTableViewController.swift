//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by Meanings Lee on 7/17/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit
import CoreData
class AddTableViewController: UITableViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var resturant:Restaurant!
    var isVisited = true
    
    

    @IBAction func yesButtonClicked(sender: AnyObject) {
        isVisited = true
        noButton.backgroundColor = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 150.0/225.0, alpha: 0.3)
        yesButton.backgroundColor = UIColor(red: 200.0/225.0, green: 70.0/225.0, blue: 70.0/225.0, alpha: 0.3)
        
    }
    
    @IBAction func noButtonClicked(sender: AnyObject) {
        isVisited = false
        yesButton.backgroundColor = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 150.0/225.0, alpha: 0.3)
        noButton.backgroundColor = UIColor(red: 200.0/225.0, green: 70.0/225.0, blue: 70.0/225.0, alpha: 0.3)
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Restaurant"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
      
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      
        
       
        if indexPath.row == 0{
        
           
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
                imagePicker.delegate = self
               
                }
            
      
            }
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
         println("\(indexPath.row) is selected")
    }
    //make sure select first cell,
    //lauch Picker 
    //
    @IBOutlet weak var imageView:UIImageView!
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    @IBAction func collectTextField(sender: AnyObject) {
        var errorText  = ""
        if nameTextField.text == ""{
            errorText = "name"
        }else if typeTextField.text == ""{
            errorText = "type"
        }else if locationTextField.text == ""{
            errorText = "location"
        }
        if errorText != ""{
            let alertController = UIAlertController(title: "Attention", message: "You have to sign up all the form", preferredStyle: .Alert)
            let doneController = UIAlertAction(title: "Done", style: .Default, handler: nil)
            alertController.addAction(doneController)
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        
        }else if errorText == ""{
            println("Name:\(nameTextField.text)\nType:\(typeTextField.text)\nLocation:\(locationTextField.text)\nHave you been here:\(isVisited)")
            
            dismissViewControllerAnimated(true, completion: nil)
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as
                AppDelegate).managedObjectContext {
                restaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant",
                inManagedObjectContext: managedObjectContext) as Restaurant
                restaurant.name = nameTextField.text
                restaurant.type = typeTextField.text
                restaurant.location = locationTextField.text
                restaurant.image = UIImagePNGRepresentation(imageView.image)
                restaurant.isVisited = isVisited
                var e: NSError?
                if managedObjectContext.save(&e) != true {
                println("insert error: \(e!.localizedDescription)")
                return
                }
            }
        }
    }
    
    
    
        
//        if  nameTextField.text!= ""{
//        println("Name:\(nameTextField.text)\nType:\(typeTextField.text)\nLocation:\(locationTextField.text)\nHave you been here:\(isVisited)")
//        performSegueWithIdentifier("unwindToHomeScreen", sender: self)
//                }else{
//         var alertView = UIAlertAction(title: "You have to write down all the information", style: .Default, handler: nil)
//            showalerView()
//        }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
        }
    
}

    //solution to homescreen
    //save button
    //yes and gray
    

