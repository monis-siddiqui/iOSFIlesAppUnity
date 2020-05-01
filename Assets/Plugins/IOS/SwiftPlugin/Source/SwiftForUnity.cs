using System;
using System.Runtime.InteropServices;
using UnityEngine;

public class SwiftForUnity : MonoBehaviour
{

    #region Declare external C interface

#if UNITY_IOS && !UNITY_EDITOR
        
    [DllImport("__Internal")]
    private static extern void _getFilePath();
    
#endif

    #endregion

    #region Wrapped methods and properties

    public static void getFilePath()
    {
#if UNITY_IOS && !UNITY_EDITOR
         _getFilePath();
#else
		Debug.Log("Not FOund");
#endif
    }

    #endregion

    #region Singleton implementation


    private static SwiftForUnity _instance;

    public static SwiftForUnity Instance
    {
        get
        {
            if (_instance == null)
            {
                var obj = new GameObject("SwiftUnity");
                _instance = obj.AddComponent<SwiftForUnity>();
            }

            return _instance;
        }
    }

    private void Awake()
    {
        if (_instance != null)
        {
            Destroy(gameObject);
            return;
        }

        DontDestroyOnLoad(gameObject);
    }

    #endregion
}