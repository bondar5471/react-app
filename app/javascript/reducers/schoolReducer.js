import { SET_SCHOOL_TITLE } from '../constants/actionTypes'
const initState = {
  schoolTitle: 'BlaBla'
}

export default (state = initState, action) => {
  switch (action.type) {
    case SET_SCHOOL_TITLE:
    return { ...state, schoolTitle: action.payload };
    default:
    return state;
  }
}