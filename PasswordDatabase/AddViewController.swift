//
//  AddViewController.swift
//  PasswordDatabase
//
//  Created by Fumiya Tanaka on 2018/12/03.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let database = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func tappedSaveButton() {
        
        let newPasswordDictionary = ["title": titleTextField.text!, "password": passwordTextField.text!]
        
        // すでにデータベースにパスワードがあるかをあif文でチェックする。
        if var passwordArray = database.object(forKey: "Password") as? [[String: String]] {
            
            passwordArray.append(newPasswordDictionary)
            
            database.set(passwordArray, forKey: "Password") // データベースにデータを登録。
            
        }else { // もしまだパスワードが保存されてなかったら == 初めてのパスワード登録
            database.set([newPasswordDictionary], forKey: "Password")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
