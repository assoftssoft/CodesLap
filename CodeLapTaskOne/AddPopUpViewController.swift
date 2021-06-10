//
//  AddPopUpViewController.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit

protocol dataFromAddDelegate {
    func getdata(data : [[String : Any]])
}

class AddPopUpViewController: UIViewController {
    
    var addDataDelegate : dataFromAddDelegate?
    var count: Int = 0
    @IBOutlet weak var txtToValue: UITextField!
    @IBOutlet weak var txtFromValue: UITextField!
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var tapDismissView: UIView!
    var valueIntoInt : Int?
    var valueIntFrom : Int?
    var valueIntTo : Int?
    var collectedData = [[String : Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapgesture = UITapGestureRecognizer.init(target: self, action: #selector(didDismiss))
        tapDismissView.addGestureRecognizer(tapgesture)
        self.txtValue.delegate = self
        self.txtToValue.delegate = self
        self.txtFromValue.delegate = self
    }
    
    @objc func didDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func didTapOnOkBtn(_ sender: Any) {
        
        self.view.endEditing(true)
        if !txtValue.text!.isEmpty {
            count += 1
            collectedData.append(["serial": "\(count)" , "value" : valueIntoInt!.toRoman()])
                addDataDelegate?.getdata(data: collectedData)
        }else if !txtFromValue.text!.isEmpty && !txtToValue.text!.isEmpty {
            for value in Int(txtFromValue.text!)!..<Int(txtToValue.text!)! {
                count += 1
                collectedData.append(["serial": "\(count)" , "value" : value.toRoman()])
                    addDataDelegate?.getdata(data: collectedData)
            }
        }else {
            print("No Value entered")
        }
    }
}

extension AddPopUpViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if textField.tag == 1 {
            self.valueIntoInt = Int(txtValue.text ?? "")
        }else if textField.tag == 2 {
            self.valueIntFrom = Int(txtFromValue.text ?? "")
        }else if textField.tag == 3 {
            self.valueIntTo = Int(txtToValue.text ?? "")
        }
    }
}
