describe 'Htaccess grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-htaccess')

    runs ->
      grammar = atom.grammars.grammarForScopeName('text.html.mustache')

  it 'parses comments', ->
    {tokens} = grammar.tokenizeLine("# Comment")

    expect(tokens[1]).toEqual value: '# Comment', scopes: ['comment.block.htaccess']
