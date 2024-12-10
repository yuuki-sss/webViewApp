//
//  MemoDetailViewController.swift
//  webViewApp
//
//  Created by 徳永勇希 on 2024/12/09.
//

import UIKit
import RealmSwift

class MemoDetailViewController: UIViewController {
    // MARK: 部品
    @IBOutlet weak var memoTitleLbl: UILabel!
    @IBOutlet weak var webUrlTextLink: UIButton!
    @IBOutlet weak var memoContentLbl: UILabel!
    // MARK: 変数
    var memoList: Results<Memo>!
    var rcvTableViewIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "メモ詳細"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Realmからデータを取得
        do {
            let realm = try Realm()
            self.memoList = realm.objects(Memo.self)
            
        } catch {
            
        }
        self.memoTitleLbl.text = memoList[rcvTableViewIndex ?? 0].titleName
        if (memoList[rcvTableViewIndex ?? 0].webUrl == "") {
            self.webUrlTextLink.isHidden = true
            
        } else {
            self.webUrlTextLink.setTitle(memoList[rcvTableViewIndex ?? 0].webUrl, for: .normal)
            
        }
        self.memoContentLbl.text = memoList[rcvTableViewIndex ?? 0].memoContent
        
    }
    
    // MARK: アクション
    @IBAction func webUrlBtnTapped(_ sender: Any) {
        let memoWebViewVC = storyboard?.instantiateViewController(identifier: "MemoWebViewController") as! MemoWebViewController
        memoWebViewVC.rcvWebUrl = memoList[rcvTableViewIndex ?? 0].webUrl
        self.navigationController?.pushViewController(memoWebViewVC, animated: true)
        
    }
    
}
