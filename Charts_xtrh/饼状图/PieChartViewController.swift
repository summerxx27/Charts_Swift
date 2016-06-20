//
//  PieChartViewController.swift
//  Charts_xtrh
//
//  Created by zjwang on 16/6/20.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController, ChartViewDelegate {

    var pieChartView = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
        pieChartView = PieChartView.init(frame: CGRectMake(0, 0, s_w, s_h))
        pieChartView.delegate = self;
        
        // 可以调整大小, 位置
//        pieChartView.setExtraOffsets(left: 20.0, top: 0.0, right: 20.0, bottom: 0.0)
        
        self.view.addSubview(pieChartView)
        
        
        var yValues = [BarChartDataEntry]()
        // 最好从0 开始. 否则第一个将失去点击效果, 并出现bug...
        for i in 0...5 {
            // 占比数据
            yValues.append(BarChartDataEntry.init(value: (Double)(arc4random_uniform(5)) + 2.0, xIndex: i))
            
        }
        var xValues = [String]()
        for j in 0...5 {
            // 描述文字
            xValues.append(NSString(format: "%d\("夏天然后")", j + 5) as String)
        }
        
        let dataSet: PieChartDataSet = PieChartDataSet.init(yVals: yValues, label: "data Set");
        
        // 空隙
        dataSet.sliceSpace = 5.0
        
        var colors = [UIColor]()
        colors.append(UIColor ( red: 0.8185, green: 0.8172, blue: 0.0023, alpha: 1.0 ))
        colors.append(UIColor ( red: 0.0, green: 0.81, blue: 0.81, alpha: 1.0 ))
        colors.append(UIColor.greenColor())
        colors.append(UIColor.grayColor())
        colors.append(UIColor.purpleColor())
        colors.append(UIColor.blueColor())
        dataSet.colors = colors
        
        // 如果你需要指示文字在外部标注百分比, 你需要这样.
        dataSet.valueLinePart1OffsetPercentage = 0.8;
        dataSet.valueLinePart1Length = 0.2;
        dataSet.valueLinePart2Length = 0.4;
        dataSet.yValuePosition = .OutsideSlice
        
        let data = PieChartData(xVals: xValues, dataSet: dataSet)

        let formatter = NSNumberFormatter.init()
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = NSNumberFormatterStyle.PercentStyle
        formatter.multiplier = 1.0
        formatter.percentSymbol = " %"
        data.setValueFormatter(formatter)
        data.setValueTextColor(UIColor.blackColor())
        
        pieChartView.data = data
        
    }
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        print("chartValueSelected")
    }
    func chartValueNothingSelected(chartView: ChartViewBase) {
        print("chartValueNothingSelected")
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
