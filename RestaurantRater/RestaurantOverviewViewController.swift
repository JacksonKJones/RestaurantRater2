//
//  ViewController.swift
//  RestaurantRater
//
//  Created by User 2 on 4/4/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var currentRestaurant: RestaurantOverview?
    var text: String = ""
    
    
    
    @IBOutlet weak var txtRestaurantName: UITextField!
    @IBOutlet weak var txtRestAddress: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
        
    @IBAction func buttonSave(_ sender: Any) {
        //Create a Restaurant Object from Managed Object Context
        let newRestaurant = RestaurantOverview(context: self.context)
        let textRestaurantName = txtRestaurantName.text
        let textRestaurantAddress = txtRestAddress.text
        //set values to Resturant Object
        newRestaurant.restaurantName = textRestaurantName
        newRestaurant.restaurantAddress = textRestaurantAddress
        //save data
        func prepare(for segue: UIStoryboardSegue,sender: Any?) {
            
            let destinationVC = segue.destination as! RestaurantDetailViewController
            destinationVC.restuarantName = textRestaurantName!
        
        do {
            try self.context.save()
            txtRestAddress.text = ""
            txtRestaurantName.text = ""
        } catch {
            
        }

        }
    }
    
}

