// in src/App.js
import * as React from "react";
import { Admin, Resource, ListGuesser } from 'react-admin';
import { PostList,PostEdit,PostCreate } from './posts/posts';
import jsonServerProvider from 'ra-data-json-server';


const dataProvider = jsonServerProvider('https://jsonplaceholder.typicode.com');
const App = () => (
    <Admin dataProvider={dataProvider}>
        <Resource name="users" list={ListGuesser} />
        <Resource name="posts" list={PostList} edit={PostEdit} create={PostCreate} />
    </Admin>
);

export default App;