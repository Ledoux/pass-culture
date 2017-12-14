import React from 'react'
import { connect } from 'react-redux'

const HomePage = props => {
  return (
    <main className='main page home-page'>
    </main>
  )
}

function mapStateToProps ({ user: { firstName },
  tutorial,
  tour: { currentTourUser,
    users
  }
}) {
  return {}
}
export default connect(mapStateToProps)(HomePage)
