/**
 * Created by adaltojunior on 6/11/15.
 */
WazeNavigator = {
    navigateByPosition: function (position) {

        try{
            if (!isNaN(position.lat) && !isNaN(position.lng)) {
                cordova.exec(
                    function () {
                        console.log('Good navigation!!!');
                    },
                    function () {
                        console.log('Sorry, there are problems to navigate!!!');
                    },
                    'WazeNavigator',
                    'navigateByWaze',
                    [position.lat, position.lng]);
            } else {
                console.log("Latitude and longitude aren't numbers.");
            }
        } catch (e) {
            console.log("Error on navigate by position: " + e.message);
        }

    }

};
module.exports = WazeNavigator;