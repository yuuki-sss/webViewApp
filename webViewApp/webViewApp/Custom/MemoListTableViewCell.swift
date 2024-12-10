//
//  MemoListTableViewCell.swift
//  webViewApp
//
//  Created by 徳永勇希 on 2024/12/07.
//

import UIKit
import RealmSwift

class MemoListTableViewCell: UITableViewCell {
    // MARK: 部品
    @IBOutlet weak var titleNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: 各メソッド
    func setMemoInfo(memo: Results<Memo>, index: Int) {
        self.titleNameLbl.text = memo[index].titleName
        self.dateLbl.text = memo[index].date
        
    }
    
}
