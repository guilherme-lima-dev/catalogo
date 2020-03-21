import { AlertController } from '@ionic/angular';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AlertService {

  constructor(public alert: AlertController) { }

  async alertas(titulo, msg){
    const alert = await this.alert.create({
      header: titulo,
      message: msg,
      buttons: ['OK']
    });
    return await alert.present();
  }
}
