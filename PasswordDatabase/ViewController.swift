//
//  ViewController.swift
//  PasswordDatabase
//
//  Created by Fumiya Tanaka on 2018/12/03.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView! // パスワードを表示するテーブルビュー
    
    var passwordArrayInDictionary: [[String: String]] = [] // パスワードを保存する配列
    
    let database = UserDefaults.standard // データベース
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPasswordFromDatabase()
        table.reloadData()
    }
    
    // パスワードをデータベースから取得してくるメソッド
    func getPasswordFromDatabase() {
        
        if let array = database.object(forKey: "Password") as? [[String: String]] {
            passwordArrayInDictionary = array
        } else {
            print("パスワードはまだ登録されてません。")
        }
    }
    
    // 表示するcellの個数を戻り値で指定することでその分だけセルが表示される。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwordArrayInDictionary.count // パスワードの数だけ表示
    }
    
    // １つ１つのcellに対して何のデータを渡すかを設定する。戻り値で完成したcellを返してあげる。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = passwordArrayInDictionary[indexPath.row]["title"]
        cell.detailTextLabel?.text = passwordArrayInDictionary[indexPath.row]["password"]
        return cell
    }
}

