import React, { Component } from 'react'
import { connect } from 'react-redux'
import { compose } from 'redux'
import { Footer,
  Header,
  Information,
  Link,
  Modal,
  Navigation
} from 'transactions-interface-web'
import { withTrackingPageView } from 'transactions-redux-react'
import { Guide } from 'transactions-tooltip-web'

const App = ({ children,
  IS_UNDER_CONSTRUCTION,
  pathname,
  userEmail
}) => {
  return (
    <div className='app'>
      {
        !IS_UNDER_CONSTRUCTION && (
          <Header>
            {
              !userEmail && pathname === '/signin' && (
                <Link className='link button button--alive button--inverse'
                  href='/tour'
                >
                  Tour
                </Link>
              )
            }
          </Header>
        )
      }
      {!IS_UNDER_CONSTRUCTION && <Information />}
      {children}
      {!IS_UNDER_CONSTRUCTION && <Footer />}
      {!IS_UNDER_CONSTRUCTION && <Modal />}
      {!IS_UNDER_CONSTRUCTION && <Guide />}
    </div>
  )
}

export default compose(
  // NOTE: pathname needs to be passes to make the App
  // responsive to pathname changes and this is done via withTrackingPageView
  // (lighter solution than using withRouter)
  withTrackingPageView,
  connect(({ setup: { context: { IS_UNDER_CONSTRUCTION } },
    user: { email } }) =>
    ({ IS_UNDER_CONSTRUCTION, userEmail: email }))
)(App)
