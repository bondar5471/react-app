import { createStore, applyMiddleware,combineReducers } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import thunk from 'redux-thunk';
import schoolReduser from '../reducers/schoolReducer'

const rootReducer = combineReducers({
  school: schoolReduser
});
 export default createStore(
   rootReducer,
   composeWithDevTools(
     applyMiddleware(thunk)
    )
);