describe('rg-code', function() {
  let tag, spy

  beforeEach(function() {
    spy = sinon.spy()
    $('body').append(`<rg-code theme="monokai"
                        mode="javascript"
                        tabsize="2"
                        softtabs="true"
                        wordwrap="true"
                        readonly="true"
                        code="<h1>hello world</h1>">
                      </rg-code>`)
    tag = riot.mount('rg-code', {
      onchange: spy
    })[0]
  })

  afterEach(function () {
    tag.unmount()
  })

  it('is mounted', function() {
    tag.isMounted.should.be.true
    spy.should.have.been.called
  })
})