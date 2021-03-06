public with sharing class AdvancedVFPreTransientController {

	public Contact con {get; set;}
	public Account acc {get; private set;}
	public List<Contact> contacts {get; private set;}

	public AdvancedVFPreTransientController() {
		con = new Contact();
		acc = new Account();
		contacts = new List<Contact>();
	}

	public PageReference retrieveInformation() {
		if(con.AccountID != null) {
			contacts = [SELECT Name, Id, Email, Phone, AccountID FROM Contact WHERE AccountID = :con.AccountId];
			acc = [SELECT Description, AccountNumber, AnnualRevenue, NumberOfEmployees, Rating, Website, Type, NumberofLocations__c FROM Account WHERE Id = :con.AccountID];
		}
		return null;
	}
}