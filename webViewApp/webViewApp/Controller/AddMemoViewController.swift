//
//  AddMemoViewController.swift
//  webViewApp
//
//  Created by 徳永勇希 on 2024/12/09.
//

import UIKit
import RealmSwift

class AddMemoViewController: UIViewController {
    // MARK: 部品
    @IBOutlet weak var memoTitleTextField: UITextField!
    @IBOutlet weak var webUrlTextField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "新規メモ"
        
    }
    
    // MARK: アクション
    @IBAction func registerBtnTapped(_ sender: Any) {
        // バリデーション
        if (addMemoValidation(memoTitle: self.memoTitleTextField.text ?? "")) {
            return
            
        }
        let memo = Memo()
        memo.titleName = self.memoTitleTextField.text ?? ""
        memo.date = getDate()
        memo.webUrl = self.webUrlTextField.text ?? ""
        memo.memoContent = memoTextView.text
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(memo)
            })
        } catch {
            
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: 各メソッド
    private func addMemoValidation(memoTitle: String) -> Bool {
        if (memoTitle == "") {
            let alert: UIAlertController = UIAlertController(title: "メモタイトルは必須項目です。", message: "", preferredStyle: .alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {
                (action: UIAlertAction) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            return true
            
        }
        return false
        
    }
    
    private func getDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter.string(from: Date())
        
    }
}
