//
//  BillingBrain.swift
//  Tipsy
//
//  Created by Vineal Viji Varghese on 22/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct BillingBrain {
    func calculateBill(billObj: Bill) -> Bill {
        var bill = billObj
        var localBill = billObj.enteredAmount
        let tipPercent = Float(bill.percentString.replacingOccurrences(of: "%", with: ""))!
        if localBill == ""{
            localBill = "0"
        }
        print(localBill)
        print("\(tipPercent/100)")
        print("Persons:\(bill.personSplit)")
        let tip = Float(tipPercent/100) * Float(localBill)!
        let totalBill = Float(localBill)!+tip
        bill.splitValue = String(format:"%0.2f",totalBill/Float(bill.personSplit))
        print("Per person :\(bill.splitValue)")
        return bill
    }
}
