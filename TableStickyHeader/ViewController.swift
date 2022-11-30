//
//  ViewController.swift
//  TableStickyHeader
//
//  Created by Genusys Inc on 11/30/22.
//

import UIKit

class ViewController: UIViewController {

    private let table : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    private let countryNames:[String] = [
        "New York","London","Paris","Kioro","DC","New York","London","Paris","Kioro","DC",
        "New York","London","Paris","Kioro","DC","New York","London","Paris","Kioro","DC",
        "New York","London","Paris","Kioro","DC","New York","London","Paris","Kioro","DC"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        let header = StickyHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.imageView.image = UIImage(named: "image")
        table.tableHeaderView = header
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countryNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = table.tableHeaderView as? StickyHeader else {return}
        header.scrollViewDidScroll(scrollview: table)
    }
}
