Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987116;
	b=Qfw4n9asdQN5UoYxa32WokQeP5ulHoPT1pW31DZ69ZlcpVFF6/rVZPjZayCjSfbqnRWU
	 Mf4fLwsLwU+LM72rbWXJsmT8rCjZGnSsC3JfkANSlYjS6et/sTj264icvKoQU0x20MFge
	 7/hbGFBwS9QRvNG1UVckxBcqiJxPBMHdWCBeFP1rsqzK4vekm20XqS55opng/mmtpcX8o
	 upL4segZdIEKtHIJ34BZJFlco+0HGlVM0CYMAp3sdYRKnIs4revK8bAcBIs5IIiU7Df5Y
	 v63eB1Nvrn9tWVHZMKIEz41f9WYjY1C49ugIOUnuUG5EZHldb825FO228wKnXCbq6Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987116;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ftIdbysST0P8zc8W2j5oI4chnAQ1xI7+prS5h7tjIaU=;
	b=PHXdNyk9B55ZiqS7xZdmlbN4u1OV20T5z+b/4GqhkJMbqsDXW32Nqx9ZDHKTLGIj5O8b
	 +RfRvqnI1Dx5Y2AWA8OFpthtuYIUQwfRkzPqyIQor5g96wGCZAokqr/Y7WLMVBebfZXGW
	 Djazsi2PZ2G/kKBbprKMc9/xZtpLlnIS1MhjLbhXjMrTf6Ko7ihV8WbUJ0hzH5eanzks/
	 v7x8dmqCGeFYety1IdEV3ngRES6NeHrzYPGxP778QZvu1+EGlNybyZIcYHFZ4WEL3lrCX
	 FrEUGB3fssXz+38dHEUu4B4BlGWzLL5dkq2HZFEohQktN2Vjs5JtldHbV9ESGGE52Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1q9qgYu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BD606A32E;
	Fri,  6 Nov 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1q9qgYu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945961F0089F;
	Fri,  6 Nov 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987115;
	bh=ftIdbysST0P8zc8W2j5oI4chnAQ1xI7+prS5h7tjIaU=;
	h=Date:From:To:Cc:Subject;
	b=m1q9qgYuWjp4E01FkQL1Qst8tIOpRROzU5pkM1uuGy5wQalY3e5rgP/Y1VFKPSn1p
	 zkM/6rpj2yz79pAiroc+uEihHdoggw+fJwzlrtnrk/Ky1wvFYCtpkG10bmNXzxNK6o
	 nBMyrs/18oeXNzzRFk+ueJKSTkjJoSpIr6cm0/atwfxgjkiRDg71AYKSPKjI8N91PH
	 BCkAspV2omBs1utnwaZKg7g3VY4y0d1N97cfuIQ+nxDcmIDBJoYogxMo7szqOXWpy8
	 /CwINwRN149Sbvtfh1H25cc4nQCuU/X1Rx5Pc7woCShi/FIgJs9SvyiQZsZ6crkU7g
	 K9RnknCl+4U7w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0BE011AC5995; Fri, 06 Nov 2026 17:45:13 +0000 (GMT)
Date: Fri, 6 Nov 2026 17:45:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the thermal tree
Message-ID: <au4SKRePRjYBItxx@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="y7VuDAVNNj9xQL9s"
Content-Disposition: inline


--y7VuDAVNNj9xQL9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 support")

is missing a Signed-off-by from its committer

--y7VuDAVNNj9xQL9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau4SIwAKCRAv73Ows9A4
idVvAQDRkfBx2Zod0eW1P5axl3WNpnpdkDaZjCmCTxDfLncfdwD9HsyXC1bKnICc
ZDIqfTu7/J+rUSAXWa6ThJiKOPSiYwQ=
=OrTd
-----END PGP SIGNATURE-----

--y7VuDAVNNj9xQL9s--
