import {NativeModules, requireNativeComponent} from 'react-native';

module.exports = {
    Wikitude: NativeModules.RNWikitude,
    WikitudeView: requireNativeComponent('RNWikitudeView')
}
