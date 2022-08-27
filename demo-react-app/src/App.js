import logo from './logo.svg';
import './App.css';
import React from 'react';
import { Dialog } from 'primereact/dialog';
import { Button } from 'primereact/button';
import { Calendar } from 'primereact/calendar';
import { Panel } from 'primereact/panel';
import { InputText } from 'primereact/inputtext';
import { DataTableBasicDemo}  from './DemoTabla.js'
import { DataTableReorderDemo}  from './DataTableReorderDemo.js'

function App() {
  return (
    <div className="App">
         <header>

</header>
  <div class="card">
 
    <div class="card-container yellow-container">
        <div class="block bg-yellow-500 font-bold text-center p-4 border-round mb-3">
        <Panel>
          <InputText></InputText>
      </Panel>

        </div>
        <div class="block bg-yellow-500 font-bold text-center p-4 border-round mb-3">
        <Button icon="pi pi-check" iconPos="right" />
        </div>
    </div>
</div>
<DataTableBasicDemo/>
<DataTableReorderDemo/>

    </div>
  );
}

export default App;

class Contenido extends React.Component{

  constructor(){
      super();
      this.state= {
                    msg:"Link desde el estado de React.Component (inicial)"
                  };
      this.updateMsg=this.updateMsg.bind(this);
}

updateMsg(){
this.setState({
                msg:"Link desde el estado de React.Component (Segundo)"
              });
            }

  render(){
    return <div>
              <h1>{this.state.msg}</h1>
              <button onClick={this.updateMsg}>Haga Click aquí!</button>
           </div>
    ;
  }
}
