//
//  ViewConfiguration.swift
//  ESO
//
//  Created by Ilia Gutu on 5/3/17.
//  Copyright © 2017 __ESO__. All rights reserved.
//

import Foundation
protocol ViewConfiguration: class {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    
}
