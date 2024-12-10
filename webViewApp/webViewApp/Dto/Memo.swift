//
//  Memo.swift
//  webViewApp
//
//  Created by 徳永勇希 on 2024/12/07.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var titleName = ""
    @objc dynamic var webUrl = ""
    @objc dynamic var date = ""
    @objc dynamic var memoContent = ""

}
