//
//  RomanTableViewCell.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit

protocol openViewDelegate {
    func didOpenViewController(atindex : Int)
}

class RomanTableViewCell: UITableViewCell {

    @IBOutlet weak var txtSerialNo: UILabel!
    
    @IBOutlet weak var txtRomanNumber: UILabel!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    var openDelegate : openViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(data : [String : Any] , index : Int) {
        self.txtSerialNo.text = data["serial"] as? String ?? ""
        self.txtRomanNumber.text = data["value"] as? String ?? ""
        self.btnDelete.tag = index
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func didTaponDeleteBtn(_ sender: UIButton) {
        
        self.openDelegate?.didOpenViewController(atindex: self.btnDelete.tag)
        
        
    
    }
    
}
