//
//  ViewController.swift
//  PeerLabEvents
//
//  Created by adeveloper on 09.06.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import UIKit


class DataHelper{
    static let shared = DataHelper()
}


class EventListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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

