//
//  ViewController.swift
//  RestaurantRater
//
//  Created by Marc Turner on 4/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
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


}

