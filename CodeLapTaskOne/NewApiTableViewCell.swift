//
//  NewApiTableViewCell.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit

protocol updateTableView {
 func didUpdateTableview()
}
class NewApiTableViewCell: UITableViewCell {

    @IBOutlet weak var txtId: UILabel!
    
    @IBOutlet weak var txtTitle: UILabel!
    
    @IBOutlet weak var txtLink: UILabel!
    @IBOutlet weak var txtPublished: UILabel!
    var isflag : Bool = false
    
    @IBOutlet weak var expandAbleHeight: NSLayoutConstraint!
    var delegateUpdateTableView : updateTableView?
    @IBOutlet weak var expandableBtn: UIButton!
    @IBOutlet weak var expandableView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.expandAbleHeight.constant = 0
    }

    func setData(data : NewsData , index : Int) {
        self.txtId.text = "\(String(describing: data.id ?? 0))"
        self.txtTitle.text = data.title ?? ""
        self.txtLink.text = data.link ?? ""
        self.txtPublished.text = data.published ?? ""
        self.expandableView.tag = index
        self.expandableBtn.tag = index
    }
    
    
    @IBAction func didTapOnExpend(_ sender: UIButton) {
        isflag = sender.isSelected
        sender.isSelected = !isflag
        if sender.isSelected {
            if sender.tag == self.expandableView.tag {
                self.expandAbleHeight.constant = 200
            }else {
                self.expandAbleHeight.constant = 0
            }
            
        }else {
            if sender.tag == self.expandableView.tag {
                self.expandAbleHeight.constant = 0
            }else {
                self.expandAbleHeight.constant = 200
            }
        }
        
        self.delegateUpdateTableView?.didUpdateTableview()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
