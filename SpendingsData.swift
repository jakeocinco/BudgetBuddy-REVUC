//
//  SpendingsData.swift
//
//
//  Created by user137478 on 3/4/18.
//
import Foundation
//
//  SpendingsData.swift
//  HappyTracking2
//
//  Created by Jacob Carlson on 3/3/18.
//  Copyright © 2018 Jacob Carlson. All rights reserved.
//
import Foundation

struct Spendings{
    let name: String
    let value: Double
}

struct Purchase{
    let name: String
    let value: Double
    let DateTime: String
    let cat: String
    var rating: Int
}

struct Savings{
    let name: String
    let value: Double
}



class SpendingsDataStore
{
    class func generate() -> [Spendings]
    {
        return[
            Spendings(name: "Essential", value: 27),
            Spendings(name: "Nonessential", value: 14)
        ]
    }
}

class EssentialsDataStore
{
    class func generate() -> [Spendings]
    {
        return[
            Spendings(name: "Rent", value: 725),
            Spendings(name: "Utilities", value: 47.5),
            Spendings(name: "Groceries", value: 176.87)
        ]
    }
}

class PurchaseDataStore
{
    class func generate() -> [Purchase]
    {
        return[
            Purchase(name: "Chipotle", value: 9.68, DateTime: "2/3/18 -- 6:12 pm", cat: "Food", rating: 0),
            Purchase(name: "Atlas", value: 11.00, DateTime: "2/3/18 -- 7:02 pm", cat: "Entertainment", rating: 0),
            Purchase(name: "United Dairy Farmers", value: 4.03, DateTime: "2/9/18 --  7:30 pm", cat: "Food", rating: 0),
            Purchase(name: "Starbucks", value: 3.45, DateTime: "2/17/18 --  12:47 am", cat: "Food", rating: 0),
            Purchase(name: "ATM", value: 40, DateTime: "2/17/18 --  1:22 pm", cat: "Etc.", rating: 0),
            Purchase(name: "Uptown Rents", value: 650.00, DateTime: "2/18/18 --  1:00pm", cat: "Essentials", rating: 0),
            Purchase(name: "Second Sole", value: 128.40, DateTime: "2/21/18 --  2:08 pm", cat: "Etc.", rating: 0),
            Purchase(name: "Chipotle", value: 9.68, DateTime: "2/23/18 -- 6:12 pm", cat: "Food", rating: 0),
            Purchase(name: "Target", value: 23.70, DateTime: "2/24/18 -- 2:01 pm", cat: "Food", rating: 0),
            Purchase(name: "ATM", value: 20, DateTime: "2/26/18 --  3:00 pm", cat: "Etc.", rating: 0),
            Purchase(name: "Utilites", value: 52.00, DateTime: "2/26/18 --  5:30pm", cat: "Essentials", rating: 0),
            Purchase(name: "Raising Caines", value: 9.92, DateTime: "2/26/18 -- 1:57 am", cat: "Food", rating: 0),
            Purchase(name: "TicketMaster", value: 35.00, DateTime: "2/18/18 -- 9:32 pm", cat: "Entertainment", rating: 0)
        ]
    }
    class func generate2() -> [Purchase]
    {
        return[
            Purchase(name: "Womabats", value: 11.00, DateTime: "3/3/18 -- 7:02 pm", cat: "Entertainment", rating: 0),
            Purchase(name: "Uptown Rents", value: 650.00, DateTime: "2/18/18 --  1:00pm", cat: "Essentials", rating: 0),
            Purchase(name: "Dunkin Donuts", value: 3.45, DateTime: "3/17/18 --  12:47 am", cat: "Food", rating: 0),
            Purchase(name: "ATM", value: 40, DateTime: "3/17/18 --  1:22 pm", cat: "Etc.", rating: 0),
            Purchase(name: "Uptown Rents", value: 650.00, DateTime: "3/18/18 --  1:00pm", cat: "Essentials", rating: 0),
            Purchase(name: "Kohls", value: 128.40, DateTime: "3/21/18 --  2:08 pm", cat: "Etc.", rating: 0),
            Purchase(name: "Penn Station", value: 9.68, DateTime: "3/23/18 -- 6:12 pm", cat: "Food", rating: 0),
            Purchase(name: "Walmart", value: 23.70, DateTime: "3/24/18 -- 2:01 pm", cat: "Food", rating: 0),
            Purchase(name: "ATM", value: 20, DateTime: "3/26/18 --  3:00 pm", cat: "Etc.", rating: 0),
            Purchase(name: "Utilites", value: 52.00, DateTime: "3/26/18 --  5:30pm", cat: "Essentials", rating: 0),
            Purchase(name: "Wendys", value: 9.92, DateTime: "3/26/18 -- 1:57 am", cat: "Food", rating: 0),
            Purchase(name: "Ready Player One", value: 35.00, DateTime: "3/18/18 -- 9:32 pm", cat: "Entertainment", rating: 0)
        ]
    }
}
class NonessentialsDataStore
{
    class func generate() -> [Spendings]
    {
        return[
            Spendings(name: "Entermainment", value: 72.31),
            Spendings(name: "Food", value: 130.3),
            Spendings(name: "Etc.", value: 20.20)
        ]
    }
}

class SavingsDataStore
{
    class func generate() -> [Savings]
    {
        return[
            Savings(name: "Savings", value: 150.49),
            Savings(name: "Chartiy", value: 37.81)
        ]
    }
}


class CurrentDataStore
{
    class func generate() -> [Savings]
    {
        return[
            Savings(name: "Income", value: 900.01),
            Savings(name: "Chartiy", value: 750.01)
        ]
    }
}
