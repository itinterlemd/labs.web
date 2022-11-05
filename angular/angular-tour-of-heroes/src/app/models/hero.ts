import { Poder } from "./poder";
import { Tipo } from "./tipo";

/*export interface Hero {
    id: number;
    name: string;
    tipo: Tipo;
    poderes: Poder[]
  }*/


  export class Hero {
    constructor(public id: number, public name: string, public tipo: Tipo,  public poderes: Poder[]) {
      this.id = id;
      this.name = name;
      this.tipo = tipo;
      this. poderes =poderes;
    }
  }