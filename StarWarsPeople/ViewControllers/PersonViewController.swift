//
//  PersonViewController.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 09/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    var person: Person?
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personBirthYear: UILabel!
    @IBOutlet weak var personGender: UILabel!
    @IBOutlet weak var personHeight: UILabel!
    @IBOutlet weak var personMass: UILabel!
    @IBOutlet weak var personHairColor: UILabel!
    @IBOutlet weak var personEyeColor: UILabel!
    @IBOutlet weak var personUrl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        setUpPersonName()
        setUpPersonBirthYear()
        setUpPersonGender()
        setUpPersonHeight()
        setUpPersonMass()
        setUpHairColor()
        setUpEyeColor()
        setUpPersonUrl()
    }
    
    private func setUpPersonName() {
        personName.text = person?.name
    }
    
    private func setUpPersonBirthYear() {
        personBirthYear.text = PersonTexts.personBirthYearTitle + person!.birthYear
    }
    
    private func setUpPersonGender() {
        var personGenderTitle: String
        if (person!.gender == "unknown") {
            personGenderTitle = PersonTexts.personUnGenderTitle
        } else if (person!.gender == "n/a") {
            personGenderTitle = PersonTexts.personNAGenderTitle
        } else {
            personGenderTitle = PersonTexts.personMFGenderTitle + person!.gender
        }
        personGender.text = personGenderTitle
    }
    
    private func setUpPersonHeight() {
        personHeight.text = PersonTexts.personHeightTitle + person!.height + PersonTexts.personHeightTitleExtension
    }
    
    private func setUpPersonMass() {
        personMass.text = PersonTexts.personMassTitle + person!.mass + PersonTexts.personMassTitleExtension
    }
    
    private func setUpHairColor() {
        var personHairColorTitle: String
        if (person!.hairColor == "n/a") {
            personHairColorTitle = PersonTexts.personNAHairColorTitle
        } else {
            personHairColorTitle = PersonTexts.personHairColorTitle + person!.hairColor
        }
        personHairColor.text = personHairColorTitle
    }
    
    private func setUpEyeColor() {
        var personEyeColorTitle: String
        if (person!.eyeColor == "n/a") {
            personEyeColorTitle = PersonTexts.personNAEyeColorTitle
        } else {
            personEyeColorTitle = PersonTexts.personEyeColorTitle + person!.eyeColor
        }
        personEyeColor.text = personEyeColorTitle
    }
    
    private func setUpPersonUrl() {
        personUrl.text = PersonTexts.personUrlTitle + person!.url
    }
}


