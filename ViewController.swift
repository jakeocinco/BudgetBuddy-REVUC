//
//  ViewController.swift
//  HappyTracking2
//
//  Created by Jacob Carlson on 3/3/18.
//  Copyright © 2018 Jacob Carlson. All rights reserved.
//
import ShinobiCharts
import UIKit
class ViewController: UIViewController{
    
    @IBOutlet weak var test: UIImageView!
    
    let c1 = UIColor.init(red: 249/255, green: 204/255, blue: 172/255, alpha: 1)
    let c2 = UIColor.init(red: 244/255, green: 166/255, blue: 136/255, alpha: 1)
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var review: UIView!
    
    //Objects for Main Screen
    
    @IBOutlet weak var b1: UIView!
    @IBOutlet weak var b2: UIView!
    @IBOutlet weak var b3: UIView!
    @IBOutlet weak var b4: UIView!
    @IBOutlet weak var b5: UIView!
    @IBOutlet weak var b6: UIView!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var savingsCirceLbl: UILabel!
    @IBOutlet weak var charityCircleLbl: UILabel!
    @IBOutlet weak var incomeVal: UILabel!
    @IBOutlet weak var spentVal: UILabel!
    @IBOutlet weak var pmVal: UILabel!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var nonEssLbl: UILabel!
    @IBOutlet weak var essLbl: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var incomeLbl: UILabel!
    @IBOutlet weak var spendLbl: UILabel!
    @IBOutlet weak var pmLbl: UILabel!
    
    //Rate Page
    @IBOutlet weak var pictureRateLbl: UIView!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var catLbl: UILabel!
    @IBOutlet weak var datTimLbl: UILabel!
    @IBOutlet weak var yellowCircle: UIImageView!
    @IBOutlet weak var greenCircle: UIImageView!
    @IBOutlet weak var graph: ShinobiChart!
    @IBOutlet var chart: ShinobiChart!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    
    //All labels for the Review tab
    
    @IBOutlet weak var weekCounter: UILabel!
    @IBOutlet weak var weeklybudget: UILabel!
    @IBOutlet weak var TotalMoneySpent: UILabel!
    @IBOutlet weak var DateCounter: UILabel!
    @IBOutlet weak var EatCounter: UILabel!
    @IBOutlet weak var GameCounter: UILabel!
    @IBOutlet weak var Food: UILabel!
    @IBOutlet weak var Percentage: UILabel!
    @IBOutlet weak var GoodPurchase: UILabel!
    @IBOutlet weak var Dates: UILabel!
    @IBOutlet weak var Games: UILabel!
    @IBOutlet weak var numBadLbl: UILabel!
    @IBOutlet weak var numGoodLbl: UILabel!
    @IBOutlet weak var NextWeeksBudget: UILabel!
    @IBOutlet weak var s1: UIView!
    @IBOutlet weak var s2: UIView!
    @IBOutlet weak var s3: UIView!
    @IBOutlet weak var s4: UIView!
    
    
    
    //Data Accessors...
    let spendData = SpendingsDataStore.generate()
    let essentialData = EssentialsDataStore.generate()
    let nonessentialData = NonessentialsDataStore.generate()
    let savingData = SavingsDataStore.generate()
    let currentData = CurrentDataStore.generate()
    var purchaseData = PurchaseDataStore.generate()
    
    
    var counter = 0
    var updates = 0;
    var yN = [2, 2, 2, 2, 2, 2, 2, 2,2,2,2]
    @IBAction func UpdateButton(_ sender: Any) {
        if updates > 0{
            purchaseData = PurchaseDataStore.generate2()
        }
        var currentweeklybudget = 1800.0
        var essentials = 0.0 //val1
        var entertainment = 0.0 //val2
        var food = 0.0 //val3
        var etc = 0.0 //val4
        var sum = 0.0
        var goods = 0
        var bads = 0
        
        var goodCat = [0,0,0]
        var badCat = [0,0,0]
        
        var count = 0;
        
        for i in purchaseData{
            if i.cat == "Food"{
                food += i.value
            
                
            }
            else if i.cat == "Entertainment"{
                entertainment += i.value
                
                
            }
            else if i.cat == "Essentials"{
                essentials += i.value
            } else{
                etc += i.value            }
            sum += i.value
            
        }
        for z in yN{
            if z == 1{
                goods += 1
            }else if z == 0{
                bads += 1
            }
            
            
        }
        counter = counter + 1
        
        //let number = Double(arc4random_uniform(1000)+1000)
        weekCounter.text = "Week \(counter)"
        var CurrentlyWeekly2 = currentweeklybudget
        TotalMoneySpent.text = String(format:"%.2f",sum)
        let percent = (sum/currentweeklybudget)*100
        
        Percentage.text=String(format:"%.2f",percent)
        numBadLbl.text="\(bads)"
        numGoodLbl.text="\(goods)"
        
        let percentpositive = Double(100 * goods/(goods+bads))
        if(percentpositive >= 75.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget * 1)
        }else if(percentpositive >= 70.00 && percentpositive < 75.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*1)
            currentweeklybudget = currentweeklybudget*1.05
        }else if(percentpositive >= 65.00 && percentpositive < 70.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*1)
            currentweeklybudget = currentweeklybudget*1.05
        }else if(percentpositive >= 60.00 && percentpositive < 65.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*0.95)
            currentweeklybudget = currentweeklybudget*0.95
        } else if(percentpositive >= 50.00 && percentpositive < 60.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*0.9)
            currentweeklybudget = currentweeklybudget*0.9
        } else if(percentpositive >= 40.00 && percentpositive < 50.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*0.9)
            currentweeklybudget = currentweeklybudget*0.9
        }else if(percentpositive >= 30.00 && percentpositive < 40.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*0.85)
            currentweeklybudget = currentweeklybudget*0.85
        } else if(percentpositive >= 20.00 && percentpositive < 30.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*0.85)
            currentweeklybudget = currentweeklybudget*0.85
        } else if(percentpositive >= 10.00 && percentpositive < 20.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*0.8)
            currentweeklybudget = currentweeklybudget*0.8
        }else if(percentpositive < 10.00){
            NextWeeksBudget.text=String(format:"%.2f",currentweeklybudget*0.75)
            currentweeklybudget = currentweeklybudget*0.75
        }
        weeklybudget.text = String(format:"%.2f",currentweeklybudget)
        let dif = Double(sum)
        
        var perEss = essentials;
        var perFood = food;
        var perEnter = entertainment;
        var perEtc = etc;
        
//        if(dif==0.0){
//            val1 = 0.0
//            val2 = 0.0
//            val3 = 0.0
//
//        }
//        else{
//            val1 = (dif*0.75)
//            val2 = (dif*0.15)
//            val3 = (dif*0.10)
//        }
        Dates.text = "\(essentials)"
        Food.text = String(format:"%.2f",perFood)
        Games.text = String(format:"%.2f",perEnter)
        generateBarChart(views: [s1, s2, s3, s4], sums: [perEss, perFood, perEnter, perEtc],yPos: 100)
        purchaseData = PurchaseDataStore.generate2()
        currentIndex = 0;
        
        numBadLbl.text="0"
        numGoodLbl.text="0"
        
    }
    //Deleted load and Recieve memory
    
    
    
    
    
    
    var currentIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShinobiCharts.trialKey = "cXBp-elkH-A1oF-bHAm-N3pe-DFJW"
        //[ShinobiChart setTrialKey: @"cXBp-elkH-A1oF-bHAm-N3pe-DFJW"]; //Trial Users - Set your licence key here
        
        chart.datasource = self
        chart.delegate = self
        chart.backgroundColor = UIColor.clear;
        chart.plotAreaBackgroundColor = UIColor.clear;
        chart.canvasAreaBackgroundColor = UIColor.clear;
        
        chart.borderColor = UIColor.clear;
        chart.borderThickness = NSNumber(value: 0)
        
        chart.plotAreaBorderColor = UIColor.clear;
        chart.plotAreaBorderThickness = 0;
        
        
        generateBars(ls: [b1,b2,b3], ts: [l1,l2,l3], spend: essentialData,c: c1)
        generateBars(ls: [b4,b5,b6], ts: [l4,l5,l6], spend: nonessentialData,c: c2)
        
        savingsCirceLbl.text = "$\(savingData[0].value)"
        charityCircleLbl.text = "$\(savingData[1].value)"
        
        incomeVal.text = "$\(currentData[0].value)"
        spentVal.text = "$\(currentData[1].value)"
        pmVal.text = "$\(currentData[0].value - currentData[1].value)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changePageRate(_ sender: UIButton) {
        hideMain(b: true)
        rateView.isHidden = false
        //pictureRateLbl.isHidden = false
        loadPurchase(p: purchaseData,i: currentIndex)
        
    }
    
    
    @IBAction func dislikePurchase(_ sender: UIButton) {
        yN[currentIndex] = 0
        if(currentIndex < 10){
            currentIndex += 1
            loadPurchase(p: purchaseData, i: currentIndex)
            
        }
        var goods = 0
        var bads = 0
        for z in yN{
            if z == 1{
                goods += 1
            }else if z == 0{
                bads += 1
            }
        }
        
        numBadLbl.text="\(bads)"
        numGoodLbl.text="\(goods)"
    }
    
    @IBAction func likePurchase(_ sender: Any) {
        yN[currentIndex] = 1
        if(currentIndex < 10){
            currentIndex += 1
            loadPurchase(p: purchaseData, i: currentIndex)
            
        }
        var goods = 0
        var bads = 0
        for z in yN{
            if z == 1{
                goods += 1
            }else if z == 0{
                bads += 1
            }
        }
        
        numBadLbl.text="\(bads)"
        numGoodLbl.text="\(goods)"
    }
    
    @IBAction func reviewBtn(_ sender: UIButton) {
        hideMain(b: true)
        rateView.isHidden = true
        //pictureRateLbl.isHidden = true
        review.isHidden = false
        loadPurchase(p: purchaseData,i: currentIndex)
    }
    
    func backToHome(){
        hideMain(b: false)
        rateView.isHidden = true
        //pictureRateLbl.isHidden = true
        review.isHidden = true
    }
    
    
    @IBAction func revToHome(_ sender: UIButton) {
        backToHome()
    }
    
    @IBAction func rateToHome(_ sender: UIButton) {
        backToHome()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func hideMain(b: Bool){
        
        b1.isHidden = true
        b2.isHidden = b
        b3.isHidden = b
        l1.isHidden = b
        l2.isHidden = b
        l3.isHidden = b
        
        //bars and labels for nonessentials
        b4.isHidden = b
        b5.isHidden = b
        b6.isHidden = b
        l4.isHidden = b
        l5.isHidden = b
        l6.isHidden = b
        
        savingsCirceLbl.isHidden = b
        charityCircleLbl.isHidden = b
        
        
        incomeVal.isHidden = b
        spentVal.isHidden = b
        pmVal.isHidden = b
        
        btnRate.isHidden = b
        nonEssLbl.isHidden = b
        essLbl.isHidden = b
        
        name.isHidden = b
        incomeLbl.isHidden = b
        spendLbl.isHidden = b
        pmLbl.isHidden = b
        
        yellowCircle.isHidden = b
        greenCircle.isHidden = b
        graph.isHidden = b
        
    }
    
    func loadPurchase(p: [Purchase],i: Int){
        costLbl.text = "$\(p[i].value)"
        catLbl.text = p[i].cat
        datTimLbl.text = p[i].DateTime
        nameLbl.text = p[i].name
        
        var essentials = 0.0 //val1
        var entertainment = 0.0 //val2
        var food = 0.0 //val3
        var etc = 0.0 //val4
        var sum = 0.0
        var goods = 0
        var bads = 0
        var number = 0
        for i in purchaseData{
            if i.cat == "Food"{
                food += i.value
                number = 0
            }
            else if i.cat == "Entertainment"{
                entertainment += i.value
                number = 1
            }
            else if i.cat == "Essentials"{
                essentials += i.value
                number = 3
            } else{
                etc += i.value
                number = 2
            }
            sum += i.value
            
            if i.rating == 1{
                goods += 1;
            }else{
                bads += 1;
            }
        }
        
        let perEss = essentials;
        let perFood = food;
        let perEnter = entertainment;
        let perEtc = etc;
        
        generateBarChart(views: [s1, s2, s3, s4], sums: [perEss, perFood, perEnter, perEtc],yPos: 150)
        if p[i].cat == "Food"{
            number = 0
        }
        else if p[i].cat == "Entertainment"{
            number = 1
        }
        else if p[i].cat == "Essentials"{
            number = 3
        } else{
            number = 2
        }
        var ims = ["image", "image2", "image3", "image4"]
        
        test.image = UIImage(named: ims[number])
    }
}

func generateBarChart(views: [UIView],sums: [Double], yPos: Double){
    var sum = 0.0;
    
    for i in sums
    {
        sum += i
    }
    _ = [UIColor.blue, UIColor.yellow, UIColor.green, UIColor.cyan, UIColor.blue]
    
    let c1 = UIColor.init(red: 249/255, green: 204/255, blue: 172/255, alpha: 1)
    let c2 = UIColor.init(red: 244/255, green: 166/255, blue: 136/255, alpha: 1)
    
    var colors = [c1, c2, c1, c2]
    var k = 0;
    
    var movement = 0.0
    let start = 50.0
    let end = 350.0
    let range = end - start
    for i in views{
        
        let val = (range * sums[k]) / sum
        i.frame = CGRect(x: (movement + start),y: 150,width: val,height: 50)
        movement += val
        i.backgroundColor = colors[k]
        k += 1
        
    }
    
    
}




func generateBars(ls: [UIView],ts: [UILabel], spend: [Spendings],c: UIColor){
    var sum = 0.1;
    let q = spend.count
    var i = 0
    while i < q
    {
        sum += Double(spend[i].value)
        i += 1
    }
    sum -= 0.1
    
    var spendBarLen = [0, 0, 0, 0, 0, 0, 0]
    i = 0;
    while i < q
    {
        spendBarLen[i] = Int(spend[i].value * 200 / sum)
        i += 1;
    }
    
    i = 0
    var yPos = [38, 73, 108]
    while i < spendBarLen.count && i < q{
        
        ls[i].frame = CGRect(x: 8,y: yPos[i],width: spendBarLen[i],height: 30)
        ls[i].backgroundColor = c
        ts[i].frame = CGRect(x: 28 + spendBarLen[i], y: yPos[i],width: 120,height: 30)
        ts[i].text = spend[i].name
        i += 1
    }
    
    
}





func hideMain(b: Bool){
    
    //    b1.isHidden = true
    //    b2.isHidden = b
    //    b3.isHidden = b
    //    l1.isHidden = b
    //    l2.isHidden = b
    //    l3.isHidden = b
    //
    //    //bars and labels for nonessentials
    //    b4.isHidden = b
    //    b5.isHidden = b
    //    b6.isHidden = b
    //    l4.isHidden = b
    //    l5.isHidden = b
    //    l6.isHidden = b
    //
    //    savingsCirceLbl.isHidden = b
    //    charityCircleLbl.isHidden = b
    //
    //
    //    incomeVal.isHidden = b
    //    spentVaL.isHidden = b
    //    pmVal.isHidden = b
    //
    //    rateButton.isHidden = b
}




extension ViewController: SChartDatasource
{
    
    func numberOfSeries(in chart: ShinobiChart) -> Int {
        return 1;
    }
    
    func numberOfSeriesInChart(chart: ShinobiChart!) -> Int
    {
        return 1;
    }
    
    func sChart(_ chart: ShinobiChart, seriesAt index: Int) -> SChartSeries
    {
        let series = SChartPieSeries()
        
        series.style().labelFont = UIFont.systemFont(ofSize: 12)
        series.selectedStyle().protrusion = 30
        
        series.style().flavourColors = [c1, c2]
        series.selectedStyle().flavourColors = [c1, c2]
        
        series.gesturePanningEnabled = true
        return series
    }
    
    func sChart(_ chart: ShinobiChart, numberOfDataPointsForSeriesAt seriesIndex: Int) -> Int
    {
        return spendData.count
    }
    
    
    func sChart( _ chart: ShinobiChart, dataPointAt dataIndex: Int, forSeriesAt seriesIndex:Int) -> SChartData
    {
        let spendings = spendData[dataIndex]
        
        let datapoint = SChartRadialDataPoint()
        datapoint.name = spendings.name
        
        //; v = @()
        datapoint.value = NSNumber(value: spendings.value)
        
        return datapoint
    }
}

extension ViewController: SChartDelegate
{
    func sChart(_ chart: ShinobiChart!, alter label: UILabel!, for datapoint: SChartRadialDataPoint!, atSlice index: Int, in series: SChartRadialSeries!){
        label.text = datapoint.name
    }
}




