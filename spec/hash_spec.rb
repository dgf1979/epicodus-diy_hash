require('rspec')
require('hash_proto')

describe('Hash#new') do

  it('determine if initializing our class results in an object') do
    expect((MyHash.new().class)).to(eq(MyHash))
  end

  it('determine if store and fetch place and return given values') do
    hash = MyHash.new()
    hash.store(2,3)
    expect( hash.fetch(2) ).to( eq(3) )
  end

  it('verify if a key exists in the hash') do
    hash = MyHash.new()
    hash.store("test_key","value_string")
    expect( hash.has_key?("test_key") ).to( eq(true) )
  end

  it('verify if a value exists in the hash') do
    hash = MyHash.new()
    hash.store("test_key","value_string")
    expect( hash.has_value?("value_string") ).to( eq(true) )
  end

  it('return the length of the hash object') do
    hash_length_test = MyHash.new()
    hash_length_test.store("test_key","value_string")
    hash_length_test.store("1","2")
    expect(hash_length_test.length()).to(eq(2))
  end

  it('verify that hash rejects duplicate keys') do
    hash_dupe_test = MyHash.new()
    hash_dupe_test.store("test_key","value_string")
    hash_dupe_test.store("test_key","duplicate")
    expect(hash_dupe_test.length()).to(eq(1))
  end

end
