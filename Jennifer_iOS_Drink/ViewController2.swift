//
//  ViewController2.swift
//  Jennifer_iOS_Drink
//
//  Created by S10409 on 2019/1/25.
//  Copyright © 2019年 104jennifer. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var lblV2Msg: UILabel!
    @IBOutlet weak var tvMsg2: UITextView!
    @IBOutlet weak var btnMoney: UIButton!
    
     let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var strMsg2: String = ""
    
    
    @IBAction func btnMoney_Click(_ sender: Any) {
        appDelegate.strMsgApp = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        strMsg2 = appDelegate.strMsgApp
        tvMsg2.text = strMsg2
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
