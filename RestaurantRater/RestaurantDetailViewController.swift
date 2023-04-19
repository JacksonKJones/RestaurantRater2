//
//  RestaurantDetailViewController.swift
//  RestaurantRater
//
//  Created by User 2 on 4/4/23.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var restuarantName  : String = ""
    var dishtypeOut: String = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    @IBOutlet weak var textRestNamePassed: UILabel!
    
    @IBOutlet weak var dishRatingSelected: UISegmentedControl!
    @IBOutlet weak var txtDishName: UITextField!
    
    @IBOutlet weak var pckDishType: UIPickerView!
    
    let dishOrderItem: Array<String> = ["Entree", "Appetizers","Dessert"]
    
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component:Int)->Int {
        return dishOrderItem.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dishOrderItem[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> String? {
        let dishType = dishOrderItem[row]
        dishtypeOut = dishType.uppercased()
        return dishtypeOut
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pckDishType.dataSource = self;
        pckDishType.delegate = self;
        textRestNamePassed.text = restuarantName
        
        //let textFields: [UITextField] = [txtDishName, txtDishType, txtDishRating]
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveDetails(_ sender: Any) {
        
        //Create a details
        let restDets = RestaurantDetail(context: context)
        let textDishName = self.txtDishName.text
        restDets.dishName = textDishName!
        restDets.dishType = self.dishtypeOut
        restDets.dishRating = Int16((self.dishRatingSelected.selectedSegmentIndex + 1))
        //Save context
        do {
            try self.context.save()
            
        } catch {
            
        }
        dismiss(animated: true, completion: nil)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
