import { AlertService } from './../../service/alert/alert.service';
import { HttpClient } from '@angular/common/http';
import { UrlService } from '../../service/url/url.service';
import { Component, OnInit } from '@angular/core';
import { NavController, LoadingController } from '@ionic/angular';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  public email: string = 'ggg@gmail.com';
  public senha: string = '123456';

  constructor(public alert: AlertService, public url: UrlService, public http: HttpClient, public nav: NavController, public loading: LoadingController) { }

  ngOnInit() {
  }

  async logar() {
    if (this.email == undefined || this.senha == undefined) {
      this.alert.alertas('Atenção', 'Preencha todos os campos!');
    } else {
      const load = await this.loading.create({
        message:"Entrando..."
      });

      await load.present();

      this.http.get(this.url.getUrl() + "login.php?email=" + this.email + "&senha=" + this.senha).pipe()
        .subscribe(data => {
          if (data.msg.logado == "sim") {
            load.dismiss();
            this.nav.navigateBack('home')
          } else {
            load.dismiss();
            this.alert.alertas('Atenção', data.msg.texto)
          }
        });
    }
  }

}
