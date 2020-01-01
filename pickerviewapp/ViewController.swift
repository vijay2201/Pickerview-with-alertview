//
//  ViewController.swift
//  pickerviewapp
//
//  Created by COE-008 on 18/09/19.
//  Copyright © 2019 COE-008. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBAction func ShowAlert(_ sender: Any)
    {
        let alertController = UIAlertController(title: "Add state", message: "Please fill the state in box.", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "Add", style: .default){ (action) in
            
            
           let cityTextField = alertController.textFields![0] as UITextField
         let cityname = cityTextField.text!
            self.myDataArray.append(cityname)
            self.MyPicker.reloadAllComponents()
            self.MyPicker.isHidden = false
            self.MyToolbar.isHidden = false
            
            
            
                
        }
        
        alertController.addAction(OKAction)
        
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Add Your City"
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        self.present(alertController,animated: true, completion: nil)
        
        
        }
        
    }
    
   
    
    var myDataArray=["India","Australia","America","Canada","Pakistan"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myDataArray.count
    }
    

    @IBAction func btnlocation(_ sender: Any) {
        self.MyToolbar.isHidden = false
        self.MyPicker.isHidden = false
     }
    
    @IBAction func Done(_ sender: Any) {
        self.Selectedcountry.text = self.myDataArray[self.MyPicker.selectedRow(inComponent: 0)]
        self.MyToolbar.isHidden = true
        self.MyPicker.isHidden = true
    
    }
    @IBOutlet weak var Selectedcountry: UILabel!
    @IBOutlet weak var MyToolbar: UIToolbar!
    @IBOutlet weak var MyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MyPicker.delegate = self
        self.MyPicker.isHidden = true
        self.MyToolbar.isHidden = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.myDataArray[row]
        
    }
    


}

