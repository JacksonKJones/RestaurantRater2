//
//  RestaurantTableViewController.swift
//  RestaurantRater
//
//  Created by User 2 on 4/4/23.
//

import UIKit
import CoreData


class RestaurantTableViewController: UITableViewController {

    //let restaurants = ["Jim", "John", "Dana", "Rosie", "Justin", "Jeremy", "Sarah", "Matt", "Joe", "Donald", "Jeff"]
    
    //Referance to Managed Object Context
    var restaurant: [NSManagedObject] = []
    var restaurantdetail: [NSManagedObject] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Data from the table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromDatabase()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadDataFromDatabase()
        tableView.reloadData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
    }
    
    func loadDataFromDatabase() {
        let context = appDelegate.persistentContainer.viewContext
        let requestOverview = NSFetchRequest<NSManagedObject>(entityName: "RestaurantOverview")
        let requestDetail = NSFetchRequest<NSManagedObject>(entityName: "RestaurantDetail")
        do {
            restaurant = try context.fetch(requestOverview)
            restaurantdetail = try context.fetch(requestDetail)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
     
    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantdetail.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCellView
        cell.accessoryType = UITableViewCell.AccessoryType .detailDisclosureButton

        let restOverview = restaurant[indexPath.row] as? RestaurantOverview
        let restDetail = restaurantdetail[indexPath.row] as? RestaurantDetail
        
        cell.restName?.text = restOverview?.restaurantName
        
        cell.restItem?.text = restDetail?.dishName?.description

        cell.restMeal?.text = restDetail?.dishRating.description
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditRestaurantItem"{
            let restaurantController = segue.destination as? ViewController
            let selectedRow = self.tableView.indexPath(for: sender as! UITableViewCell)?.row
            let selectedRestaurantItem = restaurant[selectedRow!] as! RestaurantOverview
            restaurantController?.currentRestaurant? = selectedRestaurantItem
        }
    }

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)

        // Configure the cell... Get Restaurant from array and set as label
        let txtRestaurant = restaurant[indexPath.row] as? RestaurantOverview
        let txtDetail = restaurantdetail[indexPath.row] as? RestaurantDetail
        cell.textLabel?.text = "Restaurant Name:" + (txtRestaurant?.restaurantName)! + "That's it"
        cell.detailTextLabel?.text = txtDetail?.dishRating.description
        //cell.detailTextLabel?.text = restaurantdetail[indexPath.row]
        
        return cell
    }

     */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
