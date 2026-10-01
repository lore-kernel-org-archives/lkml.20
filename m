Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680737F8C1;
	Thu,  1 Oct 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865423; cv=none; b=nekhh5hBQpS7DysE5McL5/PqJ8gniwdydN/KtDmQqogP9bZCEPfIzyWquigA4AJBQ1yiTfTMbpmH3DeDKUqFP1jZoGRwa02RpbLYbaEAOwq5ZdJNgXMB+GRX6aXDBbX14kIXLix20uRqkmAoEkPKGboT5KqCVG+6VPSV9HG7eK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865423; c=relaxed/simple;
	bh=t6Jg8zeiEAcBR8YNYqeBh78jRO7rIERclDYNLOm78Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fY6KMUScKg3OqHkoq/0sgsuq0EQUENQEcOV8WacGjvJA7mLSHeaMDJT8Gl5tf3APYHQDZXxkk3pZ1nAH2ih0rNmr02Amp8nANZ63SI9NSkBkb5OEs069hPQQ9CwvGgT7K9zkxq1EXNj/9BLbo4qQhUcB1vPSKKmVsKZ1q8kVnY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/35vpq1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/35vpq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89211F000FF;
	Thu,  1 Oct 2026 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865415;
	bh=9Kl7NorRg2IaMMW/yKoSUGYdOP2biGFp+tfiOuGMtOQ=;
	h=Date:From:To:Cc:Subject;
	b=n/35vpq17RKEwpsm231L12Q3v3Dj+wMwPBtrs5/f7uP1wJ13I0P4izkjVVHiIVJ+q
	 e3oTStwN5MMHAUfsW5pcoAjm4PxRBlFeTjRez4FqbeyDvRfoLjdSS3Huf35yURtT2v
	 tJ7g+gBpvTWbcuXOFgohvICLhxLMOv2euBX6BM4257+yKZWo9kQ11Q9mEiDu+DTU+F
	 pMrAJtJzQREYJBqNgFmQv4mBWndG+xBVbQNOd9yW3ZWcs98CuFSoUbL/ki4iKXUsBl
	 AZVEcSYMjbZbmfEepp3PCfKBfBitpAbgwF3nrAQ5StT7/0BKgjfwCc00tS7khBPZSV
	 HWG7X9wrBiiPQ==
Date: Thu, 1 Oct 2026 15:36:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the phy-next tree
Message-ID: <ar5wBBfDCv9sUrDj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0TPFKzPbItPcEXxj"
Content-Disposition: inline


--0TPFKzPbItPcEXxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commits are also in other trees as a different commit (but
the same patch):

  090055ee62952 ("phy: core: Fix race-condition between _of_phy_get() and try_module_get()")
  2ee4e00dc1a38 ("phy: core: Add devm_phy_get_by_of_node()")
  3b0140f37d25b ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
  772ff99404a10 ("phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver")
  89c5ae2b19619 ("phy: core: Add phy_get_by_of_node()")
  fcce260fa4ba6 ("phy: core: Add missing kerneldoc colon in two locations")

--0TPFKzPbItPcEXxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+cAMACgkQJNaLcl1U
h9AiyAf9GDmxWL350Erropeuiv0Hh2V3hkVgP3tM4+ILyoRrueWP5IkIFBmpnK/2
5HaQ5H0RQg5XCexga9z1/QNIPD2EUw+Y8TDFJ0IxkHSrZzSSCTIyQ9dd5JwnQUG2
k4U2LxidL+CaDvtiUXtqb0wELHaI+8yZBNiTSdAlfgLqDIzZ/NGA51hc58al0FaR
/1t6x1cj2h9LVmara2Gz4UsJPGIQ2S24yCNAEvCSkhL8iwCCMLdHSRfHRLpD8ILp
mqwgpAW0oeX6AX/I+yBuMojGbIJ+vxxgRoaIB3/xC//qde1mD75gvi700czDiqVC
Y/3kiyy2jQtOr8f8QIFmca5LUXFRvQ==
=3BKz
-----END PGP SIGNATURE-----

--0TPFKzPbItPcEXxj--
