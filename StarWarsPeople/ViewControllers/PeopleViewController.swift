//
//  ViewController.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 08/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit
import Foundation

class PeopleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let spinner = UIActivityIndicatorView(style: .gray)
    let searchController = UISearchController(searchResultsController: nil)
    private var persons = [Person]()
    private var nextUrl = ""
    private var loadMore = true
    private var filteredPersons = [Person]()
    private var isFiltering = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setSpinner()
        getData(nextUrl: NetworkingConstants.baseUrl)
        registerTableFooterViewSpinner()
    }
    
    private func setNavigationController() {
        self.navigationItem.title = NavigationControllerTexts.navigationControllerTitle
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = NavigationControllerTexts.navigationControllerSearchBarText
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setSpinner() {
        spinner.startAnimating()
        tableView.backgroundView = spinner
    }
    
    private func registerTableFooterViewSpinner() {
        tableView.register(UINib(nibName: "SpinnerCell", bundle: nil), forCellReuseIdentifier: "SpinnerCell")
    }
    
    private func getData(nextUrl: String) {
        RequestService.shared.getData(nextUrl, onSuccess: { (nextUrlResponse, personsResponse, loadMoreReponse) in
            self.nextUrl = nextUrlResponse
            if self.isFiltering {
                self.filteredPersons += personsResponse
            } else {
                self.persons += personsResponse
            }
            self.loadMore = loadMoreReponse
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }) { (error) in
            self.handleRequestServiceError(error!)
        }
    }
    
    private func handleRequestServiceError(_ error: RequestServiceError) {
        switch error {
        case .clientError:
            self.generateAlert(title: RequestServiceErrorTexts.clientErrorTitle, message: RequestServiceErrorTexts.clientErrorMessage, actionTitle: RequestServiceErrorTexts.tryAgainErrorActionTitle, requestServiceError: .clientError, viewController: self)
        case .serverError:
            self.generateAlert(title: RequestServiceErrorTexts.serverErrorTitle, message: RequestServiceErrorTexts.serverErrorMessage, actionTitle: RequestServiceErrorTexts.tryAgainErrorActionTitle, requestServiceError: .serverError, viewController: self)
        case .parserError:
            self.generateAlert(title: RequestServiceErrorTexts.parserErrorTitle, message: RequestServiceErrorTexts.parserErrorTitle, actionTitle: RequestServiceErrorTexts.tryAgainErrorActionTitle, requestServiceError: .serverError, viewController: self)
        case .emptyDataError:
            self.generateAlert(title: RequestServiceErrorTexts.emptyDataErrorTitle, message: "", actionTitle: RequestServiceErrorTexts.emptyDataErrorActionTitle, requestServiceError: .emptyDataError, viewController: self)
        }
    }
    
    private func generateAlert(title: String, message: String, actionTitle: String, requestServiceError: RequestServiceError, viewController: PeopleViewController) {
        DispatchQueue.main.async{
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            switch requestServiceError {
                case .clientError, .serverError:
                    alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { action in
                        self.getData(nextUrl: self.nextUrl)
                    }))
                case .emptyDataError:
                    alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
                default:
                    break
            }
            viewController.present(alert, animated: true)
        }
    }
}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            if(!filteredPersons.isEmpty) {
                return filteredPersons.count
            }
        } else if (!persons.isEmpty) {
            return persons.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        spinner.stopAnimating()
        if let cell: PersonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "personCell") as? PersonTableViewCell {
            if isFiltering {
                if (!filteredPersons.isEmpty) {
                    cell.setUp(name: filteredPersons[indexPath.row].name, id: indexPath.row+1)
                }
            } else {
                if (!persons.isEmpty) {
                    cell.setUp(name: persons[indexPath.row].name, id: indexPath.row+1)
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let personViewController = self.storyboard?.instantiateViewController(withIdentifier: "PersonViewController") as! PersonViewController
        if isFiltering {
            personViewController.person = filteredPersons[indexPath.row]
        } else {
            personViewController.person = persons[indexPath.row]
        }
        self.navigationController?.pushViewController(personViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if (indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex) {
            setTableFooterView()
            getDataPagination()
        }
    }

    private func setTableFooterView() {
        if loadMore {
            let footerView = tableView.dequeueReusableCell(withIdentifier: "SpinnerCell") as! SpinnerTableViewCell
            footerView.spinner.startAnimating()
            self.tableView.tableFooterView = footerView
            self.tableView.tableFooterView?.isHidden = false
        } else {
            self.tableView.tableFooterView = nil
            self.tableView.tableFooterView?.isHidden = true
        }
    }
    
    private func getDataPagination() {
        if (nextUrl != "" && loadMore) {
            getData(nextUrl: nextUrl)
        }
    }
}

extension PeopleViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            filteredPersons = []
            isFiltering = true
            getData(nextUrl: NetworkingConstants.baseUrl + NetworkingConstants.search + text)
        } else {
            filteredPersons = []
            isFiltering = false
            getData(nextUrl: NetworkingConstants.baseUrl)
        }
    }
}
