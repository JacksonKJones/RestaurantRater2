//
//  RestaurantDetailViewController.swift
//  RestaurantRater
//
//  Created by Marc Turner on 4/4/23.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pckDishType.dataSource = self;
        pckDishType.delegate = self;

        // Do any additional setup after loading the view.
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
