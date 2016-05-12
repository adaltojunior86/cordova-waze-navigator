package com.adaltojunior.cordova.plugin;


import org.apache.cordova.CordovaPlugin;
import android.content.ActivityNotFoundException;
import org.apache.cordova.CallbackContext;
import android.content.Intent;

import org.apache.cordova.LOG;
import org.json.JSONException;
import org.json.JSONArray;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;

import java.lang.String;


public class WazeNavigator extends CordovaPlugin {

    String CLASS_NAME = this.getClass().getName();

    private void openIntent(String urlToIntent) {
        Intent intent = new Intent( Intent.ACTION_VIEW, Uri.parse( urlToIntent ) );
        this.cordova.getActivity().startActivity(intent);
    }

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

        if (action.equals("navigateByWaze")) {
            String fromLat = data.getString(0);
            String fromLng = data.getString(1);
            String toLat = data.getString(2);
            String toLng = data.getString(3);

            try {
                openIntent(getUrlIntentByApplication(fromLat, fromLng, toLat, toLng));
            } catch (ActivityNotFoundException ex){
                LOG.e(CLASS_NAME, ex.getMessage());
            }

            return true;

        } else {

            return false;

        }
    }

    private String getUrlIntentByApplication(String fromLat, String fromLng, String toLat, String toLng) {

        String url = "market://details?id=com.waze";

        if (verifyAplicationIsInstalled("com.waze")) {
            url = "waze://?ll=" + toLat + "," + toLng + "&navigate=yes";
        } else if (verifyAplicationIsInstalled("com.google.android.apps.maps")) {
            String fromPosition = fromLat + "," + fromLng;
            String toPosition = toLat + "," + toLng;

            url = "http://maps.google.com/maps?saddr=" + fromPosition + "&daddr=" + toPosition;
        }

        return url;
    }

    private Boolean verifyAplicationIsInstalled(String wazepackage) {

        try {

            PackageManager application = this.cordova.getActivity().getPackageManager();
            PackageInfo info = application.getPackageInfo(wazepackage, PackageManager.GET_ACTIVITIES);

            return info.packageName.equals(wazepackage);

        } catch (PackageManager.NameNotFoundException e) {
            LOG.e(CLASS_NAME, e.getMessage());
            return false;
        }

    }
}
