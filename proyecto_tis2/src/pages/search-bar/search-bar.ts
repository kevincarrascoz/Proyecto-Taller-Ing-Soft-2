import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Http } from '@angular/http';


/**
 * Generated class for the SearchBarPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-search-bar',
  templateUrl: 'search-bar.html',
})
export class SearchBarPage {

  constructor(public navCtrl: NavController, public navParams: NavParams, public http: Http) {
     
  }
   
  ionViewDidLoad() {
    console.log('ionViewDidLoad SearchBarPage'); 
    
  }
 
}
