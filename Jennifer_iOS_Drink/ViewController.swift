//
//  ViewController.swift
//  Jennifer_iOS_Drink
//
//  Created by S10409 on 2019/1/24.
//  Copyright © 2019年 104jennifer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var pvItem: UIPickerView!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblCup: UITextField!
    @IBOutlet weak var stepperCount: UIStepper!
    @IBOutlet weak var btnOrder: UIButton!
    @IBOutlet weak var sSegment: UISegmentedControl!
    @IBOutlet weak var iSegment: UISegmentedControl!
    @IBOutlet weak var aSegment: UISegmentedControl!
    @IBOutlet weak var tvMsg: UITextView!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnGoCart: UIBarButtonItem!
    @IBOutlet weak var btnGo: UIBarButtonItem!
    @IBOutlet weak var imageCup: UIImageView!
    
    
    
    
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var strMsg: String = ""
    var strMsgItem: String = "紅茶" //品項
    var strMsgPrice: String = "20" //品項價目
    var strMsgS: String = "正常" //糖
    var strMsgI: String = "正常" //冰
    var strMsgA: String = "無" //加料
    var strMsgC: String = "1" //杯數
    var strMsg2: String = "" //test
    var strTemp: String = ""
    
    var arrayItem: [String] = [String]() //品項選單
    var arrayPrice: [Int] = [Int]() //品項價目
    var arrayItemMsg: [String] = [String]() //顯示品項名
    var arrayOrder: [String] = [String]() //放單一訂單,strMsgItem,strMsgS,strMsgI,strMsgS,strMsgC
    var arrayOrders: [[String]] = [[String]]()  //放所有訂單
    var orderCount: Int = 0 //訂單數
    var intCost: Int = 0 //單筆總價
    var intCup: Int = 1 //單筆杯數
    var intPrice: Int = 20 //單杯金額
    var intTotal: Int = 0 //總金額
    var intPlus: Int = 0 //加料
    
    
    @IBAction func btnGo_Click(_ sender: Any) {
        
    }
    @IBAction func btnGoCart_Click(_ sender: Any) {
        appDelegate.strMsgApp = strMsg
    }
    func numberOfComponents(in pickerView1: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var intRowNum: Int = 0
        intRowNum = arrayItem.count
        return intRowNum
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var strRow: String = ""
        strRow = arrayItem[row]
        return strRow
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var strA = ""
        strA = arrayItem[row]
        if row == 0{
            intPrice = 20
            imageCup.image = UIImage(named: "c20")
        }else if row == 1{
            intPrice = 25
            imageCup.image = UIImage(named: "c25")
        }else if row == 2{
            intPrice = 30
            imageCup.image = UIImage(named: "c301")
        }else if row == 3{
            intPrice = 30
            imageCup.image = UIImage(named: "c302")
        }else if row == 4{
            intPrice = 35
            imageCup.image = UIImage(named: "c35")
        }
            
        
        strMsgPrice = "\(arrayPrice[row])"
        lblPrice.text = strMsgPrice
        strMsgItem = "\(strA)"
    }
    
    @IBAction func sSegment_ValueChanged(_ sender: Any) {
        let selectedIdx: Int = self.sSegment.selectedSegmentIndex
        var strS = ""
        if selectedIdx == 0{
            strS = "半糖"
        }else if selectedIdx == 1{
            strS = "少糖"
        }else if selectedIdx == 2{
            strS = "正常"
        }
        strMsgS = "\(strS)"
    }
    @IBAction func iSegment_ValueChanged(_ sender: Any) {
        let selectedIdx: Int = self.iSegment.selectedSegmentIndex
        var strI = ""
        if selectedIdx == 0{
            strI = "去冰"
        }else if selectedIdx == 1{
            strI = "少冰"
        }else if selectedIdx == 2{
            strI = "正常"
        }
        self.strMsgI = "\(strI)"
    }
    @IBAction func aSegment_ValueChanged(_ sender: Any) {
        let selectedIdx: Int = self.aSegment.selectedSegmentIndex
        var strA = ""
        if selectedIdx == 0{
            strA = "珍珠"
            intPlus = 5
        }else if selectedIdx == 1{
            strA = "椰果"
            intPlus = 5
        }else if selectedIdx == 2{
            strA = "無"
            intPlus = 0
        }
        self.strMsgA = "\(strA)"
    }
    
    @IBAction func stepperCount_ValueChanged(_ sender: Any) {
        let steperValue: Double = self.stepperCount.value
        self.lblCup.text = "\(Int(stepperCount.value))"
        intCup = Int(stepperCount.value)
        strMsgC = "\(Int(stepperCount.value))"
    }
    
    @IBAction func btnOrder_Click(_ sender: Any) {
        intCost = (intPrice + intPlus) * intCup
        strMsg = "（此為小計，結帳請選右上角購物車）\n＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝\n品項：\(strMsgItem)-\(strMsgPrice)元\n甜度：\(strMsgS)\n冰塊：\(strMsgI)\n配料：\(strMsgA)\n杯數：\(strMsgC)杯\n小計：(\(strMsgPrice)+\(intPlus)) * \(strMsgC)= \(intCost) 元"
        self.tvMsg.text = ""
        self.tvMsg.text = strMsg
        arrayOrder = [strMsgItem,strMsgS,strMsgI,strMsgA,strMsgC]
        arrayOrders.append(arrayOrder)
        arrayOrder.removeAll()
        
        //傳所有值
        strTemp = "《\(strMsgItem)》\(strMsgS)\(strMsgI)\(strMsgA)-\(strMsgPrice)元，\(strMsgC)杯\n"
        strMsg2 += "\(strTemp)\n"
        intTotal += intCost
        
        
        appDelegate.strMsgApp = "\(strMsg2)==================\n總計：\(intTotal)元"
        /*
         //歸零結束
         strMsgItem = "紅茶" //品項
         strMsgPrice = "20" //品項價目
         strMsgS = "正常" //糖
         strMsgI = "正常" //冰
         strMsgA = "無" //加料
         strMsgC = "0" //杯數
         strMsg2 = "" //test
         //歸零結束
         
         
         for (arrayTest) in arrayOrders {
         self.strMsg2 += "\(arrayTest),"
         }
         print(strMsg2)
         */
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.pvItem.delegate = self
        self.pvItem.dataSource = self
        arrayItem = ["紅茶","綠茶","烏龍茶","漂浮咖啡","氣泡飲"]
        arrayPrice = [20,25,30,30,35]
    }
}
