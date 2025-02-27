//
//  StopwatchData.swift
//  Activity
//
//  Created by Sandro  on 22.01.24.
//

import SwiftUI
import SwiftData

@Model
class StopwatchData {
    var times: [Time]
    var taskId: UUID

    init(taskId: UUID, times: [Time]) {
        self.taskId = taskId
        self.times = times
    }
    
    var totalInterval: TimeInterval {
        times.lazy.map { $0.interval }.reduce(0,+)
    }

}

@Model
class Time {
    var start: Date
    var end: Date
    
    init(start: Date, end: Date) {
        self.start = start
        self.end = end

    }
    
    var interval: TimeInterval {
        start.distance(to: end)
    }
    
}
