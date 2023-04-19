require_relative '../lib/mybot_test.rb' 

# si la connexion marche, c'est que la variable response ne sera pas égale à nil. Par exemple, si ta connexion marche, la ligne puts response devrait te ressortir un truc du genre énorme pavé avec des id, des objects, etc et nil si cela ne marche pas.
describe "the login_openai method" do
  it "should return response, and response is not nil" do
    expect(login_openai).not_to be_nil
  end
end