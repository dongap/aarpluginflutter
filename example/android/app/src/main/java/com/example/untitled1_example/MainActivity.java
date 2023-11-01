package example.android.app.src.main.java.com.example.untitled1_example;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

//import com.example.myapplication.MySecondActivity;
import com.example.customlib.ShowDetailsActivity;

import java.util.Map;
import java.util.Objects;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler {
    private MethodChannel channel;

    Context oC;

    MethodChannel.Result methodResult;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(Objects.requireNonNull(getFlutterEngine()));
        channel = new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), "untitled1");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        methodResult = result;
        Log.d("onReceiveMethod", "method: " + call.method);
        if (call.method.equals("getPlatformVersion")) {
            Map<String, String> dataReceived = call.arguments();
            assert dataReceived != null;
            String value1 = dataReceived.get("key1");
            String value2 = dataReceived.get("key2");
            String value3 = dataReceived.get("key3");
            System.out.println("randomtext" + value1 + value2 + value3);
            Intent oI = new Intent(getContext(), ShowDetailsActivity.class);
            oI.putExtra("name", dataReceived.get("key1"));
            oI.putExtra("emailaddress", dataReceived.get("key2"));
            oI.putExtra("mobilenumber", dataReceived.get("key3"));
            getContext().startActivity(oI);
//          startActivity(new Intent(this, ShowDetailsActivity.class));
         result.success("DONE");
        }
    }
}
