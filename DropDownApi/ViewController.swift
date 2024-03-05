//
//  ViewController.swift
//  DropDownApi
//
//  Created by Technicalisto on 3/5/24.
//

import UIKit
/// **(3) import DropDown
import DropDown

class ViewController: UIViewController {

    /// **(1) link UITextField
    @IBOutlet weak var txtField: UITextField!
    
    /// **(4) create variable of DropDown
    let dropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()

        /// **(5) link dropDown Variable With UITextField
        dropDown.anchorView = txtField

    }

    /// **(2) link Did Begin of txtField && Add 'sender.endEditing(true)' to close Keybored if using UITextField && Change 'Any' to 'UITextField'
    @IBAction func txtFieldBegin(_ sender: UITextField) {
        sender.endEditing(true)
        
        /// **(7) Call Function here and get your data
        DoRequestWithApiAndGetArray { strings in

            /// **(8) Handle the array of strings here
            ///  1. Remove Data
            ///  2. Add DataSource
            ///  3. Handle Selection Action
            ///  4. Show Dropdown
            
            self.dropDown.dataSource.removeAll()
            
            self.dropDown.dataSource.append(contentsOf: strings)
            
            self.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                
                self.txtField.text = item
                self.dropDown.hide()
                
            }
            
            self.dropDown.show()

        }

    }
    
    
    /// **(6) create method should Call your Api and for Example return result in Array of String
    func DoRequestWithApiAndGetArray(completion: @escaping ([String]) -> Void) {

        DispatchQueue.main.async {

            let stringArray = ["IOS Developer", "Android Developer", "Flutter Developer" , "Frontend Developer" , "Backend Developer" , "Graphic Designer" , "Project Manager" , "Team Lead" , "Technical Team Lead" , "Tester" , "Project Coordinator" , "IOS Developer", "Android Developer", "Flutter Developer" , "Frontend Developer" , "Backend Developer" , "Graphic Designer" , "Project Manager" , "Team Lead" , "Technical Team Lead" , "Tester" , "Project Coordinator"]
            
            completion(stringArray)
        }
    }
}

