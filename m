Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913998;
	b=44QioCO3AvJf2OoHmBSawTzo1KdA+shVipXX45WXsCj9bmDkDBTL6XxJB7RrrQHDpP3h
	 GIo5bcxVZzwaIUJ/eh9kkmfxNbFhykEtoGqcAd+o/KAa7JbQ9WfYj9BXddghBclouT5fW
	 CtkeazGvwpfJGQ4xw5/J/wQnS1joet+FpTWb9FbKNAVr0RcSmauardj5zYV7HjPMXajVt
	 qTT8HktEbFKm56JTWkl4sTaMFaOUF7A4KYKFet9AtD1iKpLjigaj/6V69bWLYBw5kYfd2
	 YIY772wLs21lwffPLRvijeoVxoJN8md30Ac+oLL1WDT0PN8Hfa4S3edDSE9YSlIPeIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913998;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=udVS5qS21a7t0w91Y7+NhwHe7oHBGa60l92l3YZGJLk=;
	b=pXbn0sDSBg/J/hJ7cPSmTCIO98Iw1e5sHwrsKGGGKMPcOlWxrhH2juk7O5zrpa2HF/yE
	 lEfMNmMh6CWJXeUy5Tf/9qD+B6v7+fcmTwgGGBKvoBE7lTz+ssPVBgNnirTF+nYDmrTdP
	 /OA+1xLSS4aJDjULU5975vA7S3is7vU/RbpAuh/jAtZZRfbFrLdYOrmE9EZx47io/CDtF
	 qLSBQ3IFPjXGVh9ZDQ3iXZiHsQCmwcexRo9+ICl/ZWm/7E8DGYcIkfgE2FH7NybUbuclM
	 ELQO/Es3AFwNCCVIYGd6RfBRCKl0tuYgwqMMNwuCLUlaTUwfZXIOYtSY/HbBs3tPUMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6Vxie58;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4A606A31C;
	Tue, 17 Nov 2026 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6Vxie58
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FA21F000C4;
	Tue, 17 Nov 2026 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913998;
	bh=udVS5qS21a7t0w91Y7+NhwHe7oHBGa60l92l3YZGJLk=;
	h=Date:From:To:Cc:Subject;
	b=X6Vxie58jkWPIegkZw+s7j0c6B52bCkJ9Zs0/t6HfI9sJ9hQAmML3RKBSczB7fNTZ
	 nqZIwjbgIFDWcsllZtry8GJ7WugXqjKlNvIZRt2yit00FmVKUySuqektsXu3FtQUut
	 c6WmaeF3NM4/zcClp41wftIpzs454mf6Bq9k5z5CrIf65Zq1xrkRupNDcmt9NSEHmS
	 3rtOTpUDO8Yt0Gt1Bl7U1yJY9qbTuWf4PTeY85LnuiL2bJlJwrePV213xFE3UoKxkg
	 5sU27O9utOPgnm1KSQAaodhcKgb5ltmIdrh9lJ5c0EWOyoHkVZUMvqW9KrprffjMYi
	 rLhNKRJI3Tq8w==
Date: Tue, 17 Nov 2026 11:13:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mediatek tree
Message-ID: <avw2yoxCfKfHK9Hv@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a+90R2Wxfd744Wz/"
Content-Disposition: inline


--a+90R2Wxfd744Wz/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  af557feaed1f9 ("clk: mediatek: mt7981: fix "emmc_400m_sel" clock mux sources")
  6fe7aa32b1063 ("clk: mediatek: pllfh: clear state data in mtk_clk_cleanup_pllfhs")
  a3ef44f33667d ("clk: mediatek: Move fhctl_parse_dt call into mtk_clk_register_pllfhs")
  2def5260f4be1 ("clk: mediatek: pllfh: Add ops for PLLs using set/clr regs")
  4587b6170ea5f ("clk: mediatek: pllfh: Add configurable clock ops to mtk_pllfh_data")
  7cbf375f78def ("clk: mediatek: pll: Add ops for PLLs using set/clr regs")
  b7285135ac890 ("clk: mediatek: pll: Add PLL stabilization delay definition")
  efa27fb633420 ("clk: mediatek: pll: Factorise pll power on/off sequences")
  696eb5f8af066 ("clk: mediatek: pll: Add BAR reset register offsets")
  e998b6e82a481 ("clk: mediatek: Harmonize mtk_pll_fenc related symbol names")
  294637d60bc0d ("dt-bindings: clock: mediatek: Add MT8189 system/base clocks and resets")
  dc3a6ae2eeab9 ("dt-bindings: clock: mediatek: regroup MT8195 dt-bindings into MT8186")
  833dc5fe7832f ("dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186")
  09b156611b0a8 ("dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186")
  3b372542144aa ("dt-bindings: clock: mediatek: reorder MT8186 compatibles")
  cb47a7976bb5e ("dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8195")
  1a2b86804febe ("dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8192")
  51928be3081a2 ("dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8186")
  24bf5189aadf3 ("clk: mediatek: Reserve missing MT8516 top clock IDs")
  8779893558124 ("clk: mediatek: Reserve missing MT8196 MDP clock IDs")
  afd8231b5a434 ("clk: mediatek: Reserve missing MT8173 topckgen IDs")
  3ccbdb37d10af ("clk: mediatek: Reserve missing MT8167 clock ID")
  dbed26f4c4895 ("clk: mediatek: Fix MT6797 clock onecell IDs")
  8dcfe9e6b3cc7 ("clk: mediatek: Fix MT6779 clock onecell IDs")
  336f7db3af40c ("clk: mediatek: mt6795: fix the FHCTL DDS mask width")
  351444cd006ef ("clk: mediatek: mt8173: fix the FHCTL DDS mask width")

are missing a Signed-off-by from their committers

--a+90R2Wxfd744Wz/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8NskACgkQJNaLcl1U
h9BaRgf+KSVVp/jiJEK478mqzz187Tr7JzfvGkIyDkQUIxL7vpW//Xcj9+9XzBCr
eSADKbJvruiUks+eARyU0HhciyhvoiY5sxCHbyuQ6YgPs4SwSwlRDrJJ/jhrk8N3
kAGIAUnr/JuUSLB/lYPLgFIRVzHnaKMrQIStv94K+ejQ0DNEH7eCZ+WN6n722iL9
jUnpETvTv8xFlZn+/oVO1q54VF/q9nDwHRUNiMgbPPiTND+fOxuUMVgK7qkd1TB2
a8iP/1MEofvUOUpSHmVuCIlpZMaxsIKiFBma+TJWz+swumYt7Pkd4M5C34/JkDMO
M0Bym/VqPI5vlmQarE9mLLIoPbNRNw==
=dXDz
-----END PGP SIGNATURE-----

--a+90R2Wxfd744Wz/--
