Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590575;
	b=Mdv0fwBKBDB5Ii93AyYQG+60JjMCgYCh6n1E47ZmhktM4oikOKlIY13KTC9BNFpwqWUV
	 BJ9++jOPmTgC4L1syhfJ+HAE6ZLFWEGJ/Li9lvLeeD6jfc3pKwg80vX34ap43BC4tMbiL
	 L4Vqfgvo2B6a8NUU/KlFov46jYWLaPPheW+TdjrJF/nZ9yLfNpLn2TRS16VbdTFIN8Tpj
	 uNDMcBbg5Yq/ge36vQRw+XZibUdEbdsQYiVNb/bmXUT3WPol5CiMXllEKTHNi++VIh1ZD
	 S6Z8w1o7aUilaHL679z5bfn1QPDVIMTV87UDBU6/XbplsbNlYn9O8QOPH9sxn//YWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590575;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=SyRgnEBIIL4GXTOjG2wJ8SS36I23HUnWzhud9kLCrZk=;
	b=IVa1PaHdTQO3Y7bwQwI34YAXuPluupDCecobLjVIPaeb2OQR+xKeDRsQdste+cldhpAB
	 WzHTigyyTnm3+ePnCzecn1Gt1HwZmjrthc/yxWvAVWUNaeukgUzavbrLQHEz2bM1XlcZQ
	 gCs/FkJqsg6GDybcw7tEq9B0Xde+XAyEVz+5AonoaVgfvDOtFzl0keM5fdKsTuxb7ufP2
	 rFEFmJcUlVIwv9uuiC64MmhW5K8QUTuEWaJ5nZ3LuCyueMCHPtC7DmqzmvtdIo8P7IoHZ
	 /ICX57Yw9zQ4EPdo3NSwGhmq44BLe0uMWG8YqT2TLRDs/TsmJSG8c6yjF2BXH2hjYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUbW82g1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888E606BD38;
	Fri, 13 Nov 2026 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUbW82g1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9421F000CA;
	Fri, 13 Nov 2026 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590575;
	bh=SyRgnEBIIL4GXTOjG2wJ8SS36I23HUnWzhud9kLCrZk=;
	h=Date:From:To:Cc:Subject;
	b=aUbW82g1hAwPjLJTRw4pTWBE8sdfPzNEyWT3peWiViOLjQB+XLRlPwh3ipmZT+Kev
	 HZaIrOtDJ10Q71a2HCdfuVzeFKFPSEEIg0p/WLiSwQOoMirQigqgDyV3c9eFgD9CgE
	 krcVfkfkPX77vEj7YXYoaZIJu9Gn4r8ODBj6rbJ33Vj4NXqBJgvG1t0/8G3tyRpFwJ
	 9G9kZWQTOzAf/9kO9wDBXXfTZNOX9sS5AXhGaXAsdkAA3gdBrAydpAC93uNwfNpdag
	 TzhQPW+QYWmo4GO05lKLcSSzJw2m+JtiFQh8LgMQswUMxNcI79vx2TOrish9rg/Rc3
	 yPExzC0ODsRWA==
Date: Fri, 13 Nov 2026 17:22:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <avdHa2nh2QNmbiOM@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="MSwn6vurTY9aEplu"
Content-Disposition: inline


--MSwn6vurTY9aEplu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/pinctrl/pinctrl-scmi.c:425:22: error: no member named 'function_flags_get' in 'struct scmi_pinctrl_proto_ops'; did you mean 'function_groups_get'?
  425 |                 ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only,
      |                                    ^~~~~~~~~~~~~~~~~~
      |                                    function_groups_get
/tmp/next/build/include/linux/scmi_protocol.h:806:8: note: 'function_groups_get' declared here
  806 |         int (*function_groups_get)(const struct scmi_protocol_handle *ph,
      |               ^
1 error generated.


Caused by commit

   b5848e117035 (pinctrl: scmi: give no groups to pin-only functions)

I have used the tree from next-20261112 instead.

--MSwn6vurTY9aEplu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3R2oACgkQJNaLcl1U
h9BeWwf/QWl/bRqB2r5X4P/HIrU9SnBQ1Gd0wLHronPQ6jIIujE7zlcvBiFiza94
9YMUiAjDILwCU53ho3yShBAQfM95eWn4NXYIkKvae9ZSE52tSDqlEw9wu837m4yy
n4kuWw6640+AeCEpIgsmj/S0escmQrCDDlJfMjYHFHYV/fhzchZBfO+Bf33gFkLn
7uLt+ialvXQYeDodVLNdjDJx3tNbdyDNDrI2XCCkwmDckP6xo5fPtvZL9yYafXWh
vIAXwgcjNB0iXE3Rw1eDYI2/rSm2aJ7lDGMD90TAiMPYqEeDyMOgfqruPsAd4pKg
fxa2x78xZ50MWW8ZOcyATGTJhsehgA==
=dZU0
-----END PGP SIGNATURE-----

--MSwn6vurTY9aEplu--
