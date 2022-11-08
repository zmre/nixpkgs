{ lib, stdenv, rustPlatform, fetchFromGitHub, darwin, fetchgit }:

rustPlatform.buildRustPackage rec {
  pname = "ironhide";
  version = "1.0.0";

  src = fetchFromGitHub{
    owner = "ironcorelabs";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-5Mlm18W0F05+B9AZwsjJSveNx7RexpRPouBLVWEhbfs=";
  };

  cargoSha256 = "sha256-7N2iNyPLo8f40EbpI8gVJXt9G9ex8trvwfkCBn7j+Mw=";

  buildInputs = [ ] ++ lib.optionals stdenv.isDarwin
                 [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "Tool to easily encrypt and decrypt files to users and groups. Similar to GPG, but usable at scale.";
    homepage = "https://github.com/ironcorelabs/ironhide";
    changelog = "https://github.com/IronCoreLabs/ironhide/blob/${version}/CHANGELOG.md";
    license = licenses.agpl3Plus;
    maintainers = with maintainers; [ zmre ];
  };
}

