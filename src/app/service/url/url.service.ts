import { Injectable } from '@angular/core';
import { AlertController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class UrlService {
  public url:string = "http://172.16.5.250/catalogo/catalogo/php/";
  
  constructor(public alert: AlertController) { }

  public getUrl(){
    return this.url;
  }

  
}
