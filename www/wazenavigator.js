/*
 * Created by adaltojunior on 6/11/15.
 */
WazeNavigator = {
    navigateByPosition: function (from, to) {

        try{
            if ((!isNaN(from.lat) && !isNaN(from.lng)) &&
                (!isNaN(to.lat) && !isNaN(to.lng))) {
                cordova.exec(
                    function () {
                        console.log('Good navigation!!!');
                    },
                    function () {
                        console.log('Sorry, there are problems to navigate!!!');
                    },
                    'WazeNavigator',
                    'navigateByWaze',
                    [from.lat, from.lng, to.lat, to.lng]);
            } else {
                console.log("Latitude and longitude aren't numbers.");
            }
        } catch (e) {
            console.log("Error on navigate by position: " + e.message);
        }

    }

};
module.exports = WazeNavigator;
