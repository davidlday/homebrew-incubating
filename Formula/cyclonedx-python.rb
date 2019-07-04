class CyclonedxPython < Formula
  include Language::Python::Virtualenv

  desc "Creates a CycloneDX bill-of-material for Python projects"
  homepage "https://cyclonedx.org/"
  url "https://files.pythonhosted.org/packages/c2/8b/45d2068bb6e79ba04fba4e313d865bdacab1cbba2c7d620f30ed56190515/cyclonedx-bom-0.3.0.tar.gz"
  # version "0.3.0"
  sha256 "1ce9c1594f9aeca121882a5e1b461e1654224298fbd2c1a1c176bd26735a2312"
  head "https://github.com/CycloneDX/cyclonedx-python.git"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
  end

  depends_on "python"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/c5/67/5d0548226bcc34468e23a0333978f0e23d28d0b3f0c71a151aef9c3f7680/certifi-2019.6.16.tar.gz"
    sha256 "945e3ba63a0b9f577b1395204e13c3a231f9bc0223888be653286534e5873695"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/a4/5f/f8aa58ca0cf01cbcee728abc9d88bfeb74e95e6cb4334cfd5bed5673ea77/defusedxml-0.6.0.tar.gz"
    sha256 "f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5"
  end

  resource "elementpath" do
    url "https://files.pythonhosted.org/packages/e8/3e/faba400bd0c339fb2b78b483f3eff489b3bd97bf6f66ad12abd9f2569a87/elementpath-1.1.8.tar.gz"
    sha256 "c1aec0aec576fdb8fe6ade696b3fc370a8bb709af8b6d1aeb62e4a4396878da9"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz"
    sha256 "684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16"
  end

  resource "packageurl-python" do
    url "https://files.pythonhosted.org/packages/fa/8d/a6aad6369fdfe40978332891a9fb82746da47a14b5485f095821eb2a4eb9/packageurl-python-0.8.1.tar.gz"
    sha256 "014ea6542dd7fe081bb48e9801c288f7666bfdedd28ad59d6b0e5270edf9de90"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/16/51/d72654dbbaa4a4ffbf7cb0ecd7d12222979e0a660bf3f42acc47550bf098/packaging-19.0.tar.gz"
    sha256 "0c98a5d0be38ed775798ece1b9727178c4469d9c3b4ada66e8e6b7849f8732af"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/5d/3a/24d275393f493004aeb15a1beae2b4a3043526e8b692b65b4a9341450ebe/pyparsing-2.4.0.tar.gz"
    sha256 "1873c03321fc118f4e9746baf201ff990ceb915f433f23b395f5580d1840cb2a"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/40/35/298c36d839547b50822985a2cf0611b3b978a5ab7a5af5562b8ebe3e1369/requests-2.20.1.tar.gz"
    sha256 "ea881206e59f41dbd0bd445437d792e43906703fff75ca8ff43ccdb11f33f263"
  end

  resource "requirements-parser" do
    url "https://files.pythonhosted.org/packages/2d/45/ed1be0fa777cbddd352e94f942e9acc26bba403091d98c86f5ce3780b344/requirements-parser-0.1.0.tar.gz"
    sha256 "fee2380a469ffe4067bc7f0096a6fcfb27539da7496fae12b74b8d5d0f33a4ee"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
    sha256 "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/8a/3c/1bb7ef6c435dea026f06ed9f3ba16aa93f9f4f5d3857a51a35dfa00882f1/urllib3-1.24.3.tar.gz"
    sha256 "2393a695cd12afedd0dcb26fe5d50d0cf248e5a66f75dbd89a3d4eb333a61af4"
  end

  resource "xmlschema" do
    url "https://files.pythonhosted.org/packages/b9/a0/33ebc0ac2be83a3d27d708f524af5ad640d0c911710bf7e2166863c9c5d6/xmlschema-1.0.7.tar.gz"
    sha256 "48fc390a6aec49f9d9d6a24a981d31208253e41c1096e21022b16550f04f72ba"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "TRUE", "TRUE"
    (testpath/"requirements.txt").write <<~EOS
      cyclonedx-bom==#{version}
    EOS
    (testpath/"expected-bom.xml").write <<~EOS.strip
      <?xml version="1.0" encoding="UTF-8"?>
      <bom version="1" xmlns="http://cyclonedx.org/schema/bom/1.0"><components><component type="library"><publisher>Steve Springett</publisher><name>cyclonedx-bom</name><version>0.3.0</version><description>CycloneDX software bill-of-material (SBoM) generation utility</description><hashes><hash alg="MD5">5ddcd938b7e9c862de59cfff20483f26</hash><hash alg="SHA-256">995ea19448f47092f4576cb8129fd462698c5936a169615d5629c5f93646a96d</hash></hashes><licenses><license><name>Apache-2.0</name></license></licenses><purl>pkg:pypi/cyclonedx-bom@0.3.0</purl><modified>false</modified></component></components></bom>
    EOS
    system "#{bin}/cyclonedx-py", "-i", "#{testpath}/requirements.txt", "-o", "#{testpath}/bom.xml"
    assert compare_file(testpath/"expected-bom.xml", testpath/"bom.xml")
  end
end
