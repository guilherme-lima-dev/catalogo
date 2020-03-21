import { UrlService } from './../../service/url/url.service';

import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { NavController } from '@ionic/angular';


@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {

  public produtos: any;

  constructor(public http: HttpClient, public url: UrlService, public nav: NavController) { }

  


  listProdutos(){
    this.http.get(this.url.getUrl()+"listDados.php")
    .subscribe(listDados => {
      this.produtos = listDados; 
    });
  }

  toProdutos(){
      this.nav.navigateForward('cadastro-produtos');
  }

  ionViewWillEnter(){
    this.listProdutos();
  }

  ngOnInit() {
    this.listProdutos();
  }

}
