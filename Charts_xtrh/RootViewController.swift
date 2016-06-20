//
//  RootViewController.swift
//  Charts-Swift
//
//  Created by zjwang on 16/4/26.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
let cellIdentifier = "cellId"
class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let titles = ["柱状图", "折线", "K线", "饼状图", "雷达图"]
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createSubviews()
    }
    func createSubviews()
    {
        tableView = UITableView.init(frame: CGRectMake(0, 0, s_w, s_h), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(tableView)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let firstViewController = ViewController()
            self.navigationController?.pushViewController(firstViewController, animated: true)
        case 1:
            let secondViewController = LineViewController()
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 2:
            let thirdViewController = KLineViewController()
            self.navigationController?.pushViewController(thirdViewController, animated: true)
        case 3:
            let fourViewController = PieChartViewController()
            self.navigationController?.pushViewController(fourViewController, animated: true)
        case 4:
            let fifViewController = RadarBarViewController()
            self.navigationController?.pushViewController(fifViewController, animated: true)
        default: break
        }
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
