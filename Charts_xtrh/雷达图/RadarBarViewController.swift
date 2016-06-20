//
//  RadarBarViewController.swift
//  Charts_xtrh
//
//  Created by zjwang on 16/6/20.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
import Charts
class RadarBarViewController: UIViewController {

    var radarBarChartView = RadarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        radarBarChartView = RadarChartView.init(frame: CGRectMake(0, 0, s_w, s_h))
        // 描述文字
        radarBarChartView.descriptionText = "I am destext"
        // 指向定点线的宽度
        radarBarChartView.webLineWidth = 2.0
        radarBarChartView.innerWebColor = UIColor.blackColor()
        radarBarChartView.innerWebLineWidth = 0.75
        radarBarChartView.webAlpha = 1.0
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(radarBarChartView)
        
        
        var yValues1 = [ChartDataEntry]()
        var yValues2 = [ChartDataEntry]()
        var xValues = [String]()
        for i in 0...8 {
            //
            yValues1.append(ChartDataEntry(value: (Double)(arc4random_uniform(5)), xIndex: i))
            yValues2.append(ChartDataEntry(value: (Double)(arc4random_uniform(5)), xIndex: i))
            //
            xValues.append(NSString(format: "%d\("夏天然后")", i + 5) as String)
        }
        let dataSet = RadarChartDataSet.init(yVals: yValues1, label: "data Set")
        dataSet.drawFilledEnabled = true
        dataSet.setColor(UIColor ( red: 0.7913, green: 0.9949, blue: 0.4941, alpha: 1.0 ))
        dataSet.fillColor = UIColor ( red: 0.7913, green: 0.9949, blue: 0.4941, alpha: 1.0 )
        dataSet.lineWidth = 1.0
        
        let dataSet1 = RadarChartDataSet.init(yVals: yValues2, label: "data Set2")
        dataSet1.drawFilledEnabled = true
        dataSet1.setColor(UIColor ( red: 0.4702, green: 1.0, blue: 0.9962, alpha: 1.0 ))
        dataSet1.fillColor = UIColor ( red: 0.4702, green: 1.0, blue: 0.9962, alpha: 1.0 )
        dataSet1.lineWidth = 1.5
        
        let data = RadarChartData.init(xVals: xValues, dataSets: [dataSet, dataSet1])
        radarBarChartView.data = data
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
