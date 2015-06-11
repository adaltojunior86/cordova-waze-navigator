package com.adaltojunior.cordova.plugin;


import org.apache.cordova.CordovaPlugin;
import android.content.ActivityNotFoundException;
import org.apache.cordova.CallbackContext;
import android.content.Intent;
import org.json.JSONException;
import org.json.JSONArray;
import android.net.Uri;


public class WazeNavigator extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

        if (action.equals("navigateByWaze")) {

            String lat = data.getString(0);
            String lng = data.getString(1);

            try {
            
                String url = "waze://?ll=" + lat + "," + lng + "&navigate=yes";
                Intent intent = new Intent( Intent.ACTION_VIEW, Uri.parse( url ) );
                this.cordova.getActivity().startActivity(intent);
            
            } catch (ActivityNotFoundException ex){
            
                Intent intent = new Intent( Intent.ACTION_VIEW, Uri.parse( "market://details?id=com.waze" ) );
                this.cordova.getActivity().startActivity(intent);
            
            }

            return true;

        } else {
            
            return false;

        }
    }
}