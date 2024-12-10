//
//  ViewController.swift
//  webViewApp
//
//  Created by 徳永勇希 on 2024/12/07.
//

import UIKit
import RealmSwift

class MemoListViewController: UIViewController {
    // MARK: 部品
    @IBOutlet weak var memoTableView: UITableView!
    // MARK: 変数
    var memoList: Results<Memo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpMemoTableViewCell()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Realmからデータを取得
        do {
            let realm = try Realm()
            self.memoList = realm.objects(Memo.self)
            self.memoTableView.reloadData()
            
        } catch {
            
        }
    }
    
    // MARK: 各メソッド
    private func setUpMemoTableViewCell() {
        self.memoTableView.delegate = self
        self.memoTableView.dataSource = self
        self.memoTableView.register(UINib(nibName: "MemoListTableViewCell", bundle: nil), forCellReuseIdentifier: "MemoListTableViewCell")
        
    }
    
    // MARK: アクション
    @IBAction func addMemoBtnTapped(_ sender: Any) {
        let addMemoVC = storyboard?.instantiateViewController(identifier: "AddMemoViewController") as! AddMemoViewController
        self.navigationController?.pushViewController(addMemoVC, animated: true)
        
    }
}

// MARK: エクステンション
extension MemoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.memoList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoListTableViewCell") as! MemoListTableViewCell
        print(memoList[indexPath.row])
        cell.setMemoInfo(memo: memoList, index: indexPath.row)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memoDetailVC = storyboard?.instantiateViewController(identifier: "MemoDetailViewController") as! MemoDetailViewController
        memoDetailVC.rcvTableViewIndex = indexPath.row
        self.navigationController?.pushViewController(memoDetailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(self.memoList[indexPath.row])
        }
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
}

