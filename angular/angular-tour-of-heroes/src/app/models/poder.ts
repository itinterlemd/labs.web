/*export interface Poder {
    id: number;
    name: string;
  }*/
  export class Poder {
    constructor(public id: number, public name: string) {
      this.id = id;
      this.name = name;
    }
  }