//
//  ViewController.swift
//  PeerLabEvents
//
//  Created by adeveloper on 09.06.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import UIKit


enum TableViewCellsId: String {
    case defaultCell = "defaultCell"
    case memberCell = "memberCell"
    case eventCell = "eventCell"
}



class EventListViewController: UIViewController {

    var tableViewEvents: UITableView!
    var events: [Event?] = []
    let heightCell:CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDemo()
        
        setupViewConfiguration()
        loadEventsFromCoreData()
        
    }
    
    func loadEventsFromCoreData(){
        
        let model = EventModel()
        model.getData{ items in
            for item in items{
                events.append(item)
                print(item.title)
            }
        }
        
        tableViewEvents.reloadData()
        
        
    }
    
}


//MARK: ViewConfiguration
extension EventListViewController: ViewConfiguration {
    
    func buildViewHierarchy(){

        buildTableView()
    }
    
    func setupConstraints(){}
    
    func configureViews(){}
    
    func setupViewConfiguration(){
        buildViewHierarchy()
        setupConstraints()
        configureViews()
        
    }

}

extension EventListViewController {
    func buildTableView(){
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableViewEvents = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        tableViewEvents.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCellsId.eventCell.rawValue)
        tableViewEvents.dataSource = self
        tableViewEvents.delegate = self
        self.view.addSubview(tableViewEvents)
    }
}

//MARK: Events TableView Delegate
extension EventListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let event = events[indexPath.row] {
            print("select event:\(event.title)")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCell
    }
    
}

//MARK: Events TableView DataSource
extension EventListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellsId.eventCell.rawValue, for: indexPath)
        
        cell.accessibilityIdentifier = "cellEvent\(indexPath.row)"
        
        if let eventInfo:Event = events[indexPath.row] {
            cell.textLabel!.text = "\(eventInfo.title)"
        }
        
        return cell
            
    }
    
    
    
}

//MARK: Demo Data
extension EventListViewController {
    
    enum EventType: Int64{
        case iOS = 1
        case android = 2
    }
    
    func addDemo(){
        if !UserDefaults.standard.isDemoAdded {
            var countResult: Int = 0
            countResult = addEventsDemo()
            addMembersDemo()
            
            if countResult > 0 { UserDefaults.standard.isDemoAdded = true}
            
        }
    }
    
    @discardableResult
    func addEventsDemo() -> Int {
        
        typealias EventTuple = (String, EventType)
        let events:[EventTuple] = [
            ("Встреча iOS разработчиков в SturBucks",EventType.iOS),
            ("Встреча iOS разработчиков в Avito",EventType.iOS),
            ("Встреча Android разработчиков в Avito",EventType.android)
        ]
        
        for eventTuple in events {
            EventModel().add{ event in
                event.title = eventTuple.0
                event.isOpen = true
                event.type  = eventTuple.1.rawValue
                return event
            }
        }
        
        return events.count
    }
    
    func addMembersDemo(){
        
        let members = ["Юрий","Андрей","Дмитрий","Макар","Егор","Артём","Семён","Екатерина","Анастаия","Татьяна"]
        
        for memberName in members {
            
            let memberModel = MemberModel()
            memberModel.add{ newMember in
                newMember.dateCreate = Date() as NSDate
                newMember.name = memberName
                newMember.position = ""
                return newMember
            }
        }

    }
    
}

