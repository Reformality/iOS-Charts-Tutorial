//
//  ViewController.swift
//  Charts-Tutorial
//
//  Created by Will Wu on 7/22/21.
//

import UIKit
import Charts

class ViewController: UIViewController {

    
    @IBOutlet weak var lineChartBox: LineChartView!
    
    @IBOutlet weak var pieChartBox: PieChartView!
    
    @IBOutlet weak var barChartBox: BarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
        graphLineChart(dataArray: data)
    }

    func graphLineChart(dataArray: [Int]){
        //make the lineChartBox size have same width and height both equal to width of screen
        lineChartBox.frame = CGRect(x: 0, y: 0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width / 2)
        //make lineChartBox center to horizontally centered, but offset to top of the screen
        lineChartBox.center.x = self.view.center.x
        lineChartBox.center.y = self.view.center.y - 240
        
        //Settings when chart has no data
        lineChartBox.noDataText = "No data available!"
        lineChartBox.noDataTextColor = UIColor.black
        
        //initialize Array that will eventually be displayed on the graph
        var entries = [ChartDataEntry]()
        
        //For every element in the given dataset
        //Set the X and Y coordinates in a data chart entry
        //and add to the entries list
        for i in 0..<dataArray.count{
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use the entries object and a label string to make a LineChartDataSet object
        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        
        //Customize graph settings to your linking
        dataSet.colors = ChartColorTemplates.joyful()
        
        //Make object that will be added to the chart
        //and set it to the variable in the Storyboard
        let data = LineChartData(dataSet: dataSet)
        lineChartBox.data = data
        
        //add settings to the chartBox
        lineChartBox.chartDescription?.text = "Pi Values"
        
        //Animations
        lineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }

}

