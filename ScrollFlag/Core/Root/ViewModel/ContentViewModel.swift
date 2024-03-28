//
//  ContentViewModel.swift
//  ScrollFlag
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import Foundation
import Observation

@Observable
final class ContentViewModel {
    var isTimerRunning = false
    var startTime =  Date()
    var timerString = 0.00
    var timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    var currentIndex = 0
    
    @ObservationIgnored
    var countries = [FlagItem]()
    
    @ObservationIgnored
    let duration = 3
    
    init() {
        countries = CountriesData.shared.countries
    }
    
    func stopTimer() {
        isTimerRunning = false
        timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    }
    
    
    func startScroll() {
        if isTimerRunning {
            isTimerRunning = false
            stopTimer()
        } else {
            isTimerRunning = true
            timerString = 0.00
            startTime = Date()
            startTimer()
        }
    }
    
    func receive() {
        
        if timerString >= 1.50 {
            stopTimer()
            isTimerRunning = false
        }
        
        if isTimerRunning {
            currentIndex = currentIndex + duration
            timerString = Double((Date().timeIntervalSince(startTime)))
        }
        
        if currentIndex + duration > countries.count {
            currentIndex = 0
        }

    }
}
