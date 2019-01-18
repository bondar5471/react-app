import React, { Component } from 'react';
import { connect } from 'react-redux';
import SchoolTitle from '../components/SchoolTitle';
import { fetchSchoolData } from '../actions/school';


class TopBar extends Component {
  componentDidMount() {
    this.props.fetchSchoolData()
  }
  render() {
  return  <SchoolTitle title ={this.props.school.schoolTitle}/>
  }
}

export default connect(
  (state) => ({ school: state.school }),
  {
    fetchSchoolData
  }
)(TopBar);