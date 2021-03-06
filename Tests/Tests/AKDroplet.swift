//
//  main.swift
//  AudioKit
//
//  Created by Aurelius Prochazka on 11/30/14.
//  Copyright (c) 2014 Aurelius Prochazka. All rights reserved.
//

import Foundation

class Instrument : AKInstrument {

    override init() {
        super.init()
        setAudioOutput(AKDroplet())
    }
}

AKOrchestra.testForDuration(10)

let instrument = Instrument()
AKOrchestra.addInstrument(instrument)

let phrase = AKPhrase()
for index in 1...100 {
    let note = AKNote()
    let time = Float(index) / 10.0
    phrase.addNote(note, atTime:time)
}
instrument.playPhrase(phrase)

let manager = AKManager.sharedManager()
while(manager.isRunning) {} //do nothing
println("Test complete!")
