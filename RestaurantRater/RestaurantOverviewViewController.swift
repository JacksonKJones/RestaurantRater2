//
//  ViewController.swift
//  RestaurantRater
//
//  Created by Marc Turner on 4/4/23.
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
        assignbackground()
        
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
        do {
            try self.context.save()
        } catch {
            
        }
        /*
        let vc = RestaurantDetailViewController(nibName: "RestaurantDetailViewController", bundle: nil)
        vc.text = textRestaurantName!
        navigationController?.pushViewController(vc, animated: true)
        */
        func prepare(for segue: UIStoryboardSegue,sender: Any?) {
            
            let destinationVC = segue.destination as! RestaurantDetailViewController
            destinationVC.restuarantName = textRestaurantName!
        }
    }
        
    
    
    
    //stolen from https://stackoverflow.com/users/3240583/mina-fawzy
    func assignbackground(){
        let background = UIImage(named: "TeaTime")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    
    func createRestOverview(_ sender: Any) {
        
        
    }
    
    
    
    
}

