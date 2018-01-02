describe 'Htaccess grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-htaccess')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.htaccess')
  
  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    return expect(grammar.scopeName).toBe("source.htaccess")
  
  it 'parses comments', ->
    {tokens} = grammar.tokenizeLine("# Comment")
    expect(tokens[1]).toEqual value: ' Comment', scopes: ['source.htaccess', 'comment.block.htaccess']
