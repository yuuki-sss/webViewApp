//
//  MemoWebViewController.swift
//  webViewApp
//
//  Created by 徳永勇希 on 2024/12/09.
//

import UIKit
import WebKit

class MemoWebViewController: UIViewController {
    // MARK: 変数
    var webView: WKWebView!
    var rcvWebUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createWebView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.webView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        self.webView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
    }
    
    private func createWebView() {
        self.webView = WKWebView()
        let myURL = URL(string: rcvWebUrl)
        let myRequest = URLRequest(url: myURL!)
        self.webView.load(myRequest)
        self.view.addSubview(self.webView)
        
    }
}
