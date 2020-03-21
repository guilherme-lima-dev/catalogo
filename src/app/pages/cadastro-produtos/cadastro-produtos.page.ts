import { AlertService } from './../../service/alert/alert.service';
import { UrlService } from './../../service/url/url.service';
import { HttpClient, HttpHeaders, HttpRequest } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { FormBuilder, Validators } from '@angular/forms';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-cadastro-produtos',
  templateUrl: './cadastro-produtos.page.html',
  styleUrls: ['./cadastro-produtos.page.scss'],
})
export class CadastroProdutosPage implements OnInit {

  public postagem: any;
  public nome: any;
  public valor: any;
  public qtd: any;
  public descricao: any;
  public httpHeader = {
    headers: new HttpHeaders({ 'Content-Type': 'application/x-www-form-urlencoded' })
  };

  constructor(public http: HttpClient, public nav: NavController, public form: FormBuilder, public url: UrlService, public alert: AlertService) {
    this.postagem = this.form.group({
      nome: ['', Validators.required],
      valor: ['', Validators.required],
      qtd: ['', Validators.required],
      descricao: ['', Validators.required],
    });
  }



  public postarProduto() {
    if (this.nome == undefined || this.valor == undefined || this.qtd == undefined || this.descricao == undefined) {
      this.alert.alertas('Atenção', 'Preencha todos os campos!');
    } else {
      this.postData(this.postagem.value)
        .subscribe(
          data => {
            console.log(data);
            this.alert.alertas('Atenção', 'Produto cadastrado com sucesso!');
            this.nav.navigateBack('home');
          },
          err => {
            console.log(err);
            this.alert.alertas('Atenção', 'Erro ao tentar inserir, procure o administrador do sistema!');
          }
        );
        
    }
    
  }

  postData(valor) {
  
    return this.http.post(this.url.getUrl() + "insertProduto.php", valor, this.httpHeader);

  }

  ngOnInit() {
  }

}
