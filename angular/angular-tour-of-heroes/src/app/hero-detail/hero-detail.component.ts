import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Hero } from '../models/hero';
import { Poder } from '../models/poder';
import { HeroService } from '../services/hero.service';

@Component({
  selector: 'app-hero-detail',
  templateUrl: './hero-detail.component.html',
  styleUrls: ['./hero-detail.component.css']
})
export class HeroDetailComponent implements OnInit {
  @Input() hero?: Hero;

  listaPoderes: Poder[] | undefined;
  poderesSeleccionados: Poder[] | undefined;


  constructor(
  private route: ActivatedRoute,
  private heroService: HeroService,
  private location: Location
) {}

ngOnInit(): void {
  this.getHero();


  //TODO: EL SERVICIO REST DE PODERES Y CONSULTAR TOSOS LOS PORDER
  // Y ASIGNARLO A listaPoderes
  this.listaPoderes = [
    { id: 1, name: 'Visión Laser' },
    { id: 2, name: 'Volar' },
    { id: 3, name: 'Ultravelocidad' }
  ];
 

}

getHero(): void {
  const id = Number(this.route.snapshot.paramMap.get('id'));
  this.heroService.getHero(id)
    .subscribe(hero => {
      this.hero = hero;
      this.poderesSeleccionados = this.hero?.poderes;
    } );
}

goBack(): void {
  this.location.back();
}

save(): void {
  if (this.hero) {
    this.hero.poderes=[];
    if(this.poderesSeleccionados) {   
      this.poderesSeleccionados.forEach(p=>  this.hero?.poderes.push(p)) 
    }
    console.log("Update heroe",this.hero);

    this.heroService.updateHero(this.hero)
      .subscribe(() => this.goBack());
  }
}
}
