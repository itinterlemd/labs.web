
import React, { Component } from 'react';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { ProductService } from './service/ProductService';
import { Toast } from 'primereact/toast';

export class DataTableReorderDemo extends Component {

    constructor(props) {
        super(props);

        this.state = {
            products: []
        };

        this.columns = [
            {field: 'code', header: 'Code'},
            {field: 'name', header: 'Name'},
            {field: 'category', header: 'Category'},
            {field: 'quantity', header: 'Quantity'}
        ];

        this.productService = new ProductService();
        this.onColReorder = this.onColReorder.bind(this);
        this.onRowReorder = this.onRowReorder.bind(this);
    }

    componentDidMount() {
        this.productService.getProductsSmall().then(data => this.setState({ products: data }));
    }

    onColReorder() {
        this.toast.show({severity:'success', summary: 'Column Reordered', life: 3000});
    }

    onRowReorder(e) {
        this.setState({ products: e.value }, () => {
            this.toast.show({severity:'success', summary: 'Rows Reordered', life: 3000});
        });
    }

    render() {
        const dynamicColumns = this.columns.map((col,i) => {
            return <Column key={col.field} columnKey={col.field} field={col.field} header={col.header} />;
        });

        return (
            <div>
                <Toast ref={(el) => { this.toast = el; }}></Toast>

                <div className="card">
                    <DataTable value={this.state.products} reorderableColumns reorderableRows onRowReorder={this.onRowReorder} onColReorder={this.onColReorder} responsiveLayout="scroll">
                        <Column rowReorder style={{width: '3em'}} />
                        {dynamicColumns}
                    </DataTable>
                </div>
            </div>
        );
    }
}
             