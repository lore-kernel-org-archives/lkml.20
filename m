Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4D5172FF;
	Thu,  1 Oct 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865441; cv=none; b=N6cBWfjMcECjo5mMb+vsCkWpk/MAm/Tuj8YGFF1QUefMb8wQtCNVVVAqI47dhSPhP81O1EOEw1tv2fQuauSoGOWPn8J239ZhbfGbK5F4TyIecpgnsZShfMRV4pTLPmHKz4HMom6zo4A8/3mzJ5kZt9tKEvg5Nda1I0OT1XpEgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865441; c=relaxed/simple;
	bh=ZXI3D882dpORQgy2wxfTyPkVqi4WkonaIxdoOpLEKoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Us62Yj9F97kWyIqpTmjOgoz58SdKURSlgaE6x0TFYiq9s/bo7/kE/rfMkjpH8XbjqKOtScZbp8u88ZyT8HQciN6nCITE9G6MApqTsx/HzvfEoWPVDhAnc2KY1wNwQ9ZGRUUzmDMW9XW+f8eQKoCdv+a68pcQxbcJRRYwMNbZvXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQjFnj4b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQjFnj4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBA31F000FF;
	Thu,  1 Oct 2026 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865432;
	bh=NdA/62krFuAwNoaz5uZV4xzOet4skWdDuz3OFh80PhI=;
	h=Date:From:To:Cc:Subject;
	b=bQjFnj4bOuCM656WokvueXglay2d36shWSDVot6PmLtJgIqeOb9/XqCXBBg9kr88g
	 doAaXYFH3h89KagN4cZbGGJb7Ntbc5YfnHtCyUyIML5I+D7udx0PFJbg2ofJOuBtv7
	 6Rtv9X18PPNR7Gqx2uouJK4U6jQixmwxSTW+Pyxywade+Ap+kLOAfIfQFka4X4+yz6
	 zFNoJ1vXX/k+AJC7xvtFkYTfu9AzUugsJYo6u9HrsdLC/d4CBKS+BejscprmfSZT6c
	 4aI2aSbwxAMTcl8qxJRaBtE5HlcgCJrG2pW2H2eK/+ot51KQbmbBYvOu4ni8mwUc0E
	 WvpHF4qE09wQw==
Date: Thu, 1 Oct 2026 15:37:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: linux-next: manual merge of the phy-next tree with the v4l-dvb tree
Message-ID: <ar5wFFE64tWhmCKg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3bVQS4ZDU/7fUfrE"
Content-Disposition: inline


--3bVQS4ZDU/7fUfrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml

between commits:

  42b96f94929c9 ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
  a93b9de71466f ("dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur comp=
atible")

=66rom the v4l-dvb tree and commit:

  3b0140f37d25b ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")

=66rom the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-ph=
y.yaml
index 1f1e2a4993b2a,dc64af97da6c6..0000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@@ -16,11 -16,7 +16,11 @@@ description
 =20
  properties:
    compatible:
 -    const: qcom,x1e80100-csi2-phy
 +    oneOf:
 +      - const: qcom,x1e80100-csi2-phy
 +      - items:
 +          - const: qcom,glymur-csi2-phy
 +          - const: qcom,x1e80100-csi2-phy
 =20
    reg:
      maxItems: 1

--3bVQS4ZDU/7fUfrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+cBMACgkQJNaLcl1U
h9A2Pgf9HD/Bvu3dQsANXxkz6EjdkxIWHfHEUxjlX+scdnASAEEtiC+4Yp8IYnmF
8eKMWU0Q5fHgmqZoNSxv4XocuroYcKhF/mQHMoVMJ8CNkyn0bv29WFyo3eu4hy1Q
GOTEBc+jp+rElxBXP2fQRsKSv2nlLHNE5LmmE9UJHDYBxEYXOs/qwxNkvGXIh2Rz
03044ekTy9QN8jdW/QldE6Mw5Db1qMma6ScIBburFnJu1wwOVNviLaXrxaRH/xZD
84UePQZKC9sYh6ZRZoYinV73CB0KocqkxfbK6nY4hrbMYjkoU/eZP2Wl6ZdlPWu8
d5fwbqAprv/C9jsjv1tQWYoTbMYqnA==
=olVU
-----END PGP SIGNATURE-----

--3bVQS4ZDU/7fUfrE--
