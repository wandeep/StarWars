#  Star Wars Films

## Description

- Basic UIKit based iOS app that utilises the Star Wars API (https://swapi.dev/api/films) to fetch films and display them in a simple UITableView. Selecting a film then navigates to a detail view which fetches the  characters in said film and displays them in a UITableView.

- Architected using MVVM+C (Model-View-View Model plus Coordinator). Using the Coordinator simplifies the navigation flow and decouples the view controllers (i.e. the films list view controller has no knowledge of the film detail view controller).

- Utilising Swift Concurrency - using async/await and Actors/Task to carry out asynchronous API requests and process the responses appropriately. This avoids having to use completion blocks/closures and simplifies the code.

- Programmaticly coded the UI, using auto layout and constraints etc. Encouraged code re-use and flexibility by using generics for the Web Service.


## If I had more time I would like to add the following:

- Add more error handling - for example, when there is no network connectivity, or if the API request fails etc. Currently there is only basic logging in place for most errors. It would be better to handle these types of errors with appropriate feedback to the user.

- Improve the UI/UX design - due to time constraints, the UI is very basic with a Films List view and Film Detail view which only displays the characters of the selected film. Adding more information in the details list, including images, would improve the design. Also adding a pull to refresh gesture to update the data in the table view could be a useful gesture.

- Introduce design language to ensure the UI is consistent, for example a colour palette, font sizes and styles etc.

- Improve performance - introduce pagination support for the API requests, currently all the characters are requested in a single request. This could be improved by only requesting a subset of characters (i.e. enough to populate the current screen) and then fetching more characters as needed, as the user scrolls down the list.
 
 - Add local persistence - to improve the user experience and performance, a local cache of the data could be introduced (e.g. Core Data). This would speed up loading times on subsequent launches.
 
 - Add search functionality to the characters list view - this could be a search text field at the top of the list which would automatically filter the list depending on the search term entered.

- Add localisation - replace hardcoded strings with localised strings to support multiple languages/locales.

- Add more tests (both Unit and UI) - add tests around the WebService, using stubbed JSON responses to test different scenarios (e.g. invalid JSON responses). Add UI tests, potentially Snapshot Tests which could help detect regressions in the UI. 

