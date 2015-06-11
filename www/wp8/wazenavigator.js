/**
 * Created by adaltojunior on 6/10/15.
 */

WazeNavigator = {
    navigateByPosition: function (position) {

        try{
            if (!isNaN(position.lat) && !isNaN(position.lng)) {
                window.location = "waze://?ll=" + position.lat + "," + position.lng + "&navigate=yes";
            } else {
                console.log("Latitude and longitude aren't numbers.");
            }
        } catch (e) {
            console.log("Error on navigate by position: " + e.message);
        }

    }

};
module.exports = WazeNavigator;