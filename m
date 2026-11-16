Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842584;
	b=ZS7MPbGjNwTNVaCkTjftDrufSLQnghWQ60L5m2/zSWZMfED7hOvR95HCsQFbKxctf2l7
	 UUjhEDZei9UdqsBLiYPgvxqUkLmC5mM+XVfBKZMrR+uqyM5x4Z56LUXRmEV+vo9X/x6+J
	 VzqIl9bUQHCNaI9vS5JwpyPXTjZBEdV5ZpQrwm0Jls9HSyPQfaZTSK2sIJz4MMo/kaJrD
	 gA1ykQqZb8b62u4+x0Veyw2MMymcgLKXFrBMBq51Tsl8qNGODAbHfq1K/M+DMNvNhXalY
	 1v+tkIcR3IRcEuCXpUUPp/8XpGJ4lC/08Gow9FLYTRLCzNoVwJkNXsxlBXPt0gf6QCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842584;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=LJuf0ZCGqdLJboOZF4DlxDPI6Z+k5ysg7SQ/ZD5jI2g=;
	b=xZdA/Qa5+iHMnWqKx1dQ1P+FV90lmmM50CQbDEeQ0Dmv03MaR1PNS01J3hzplCO7X3pm
	 +/OppXz9ivsUFO6ZBP6i9DTe043JV+hbV9RgbTHSr0zSJ73HwlRaEKjYLecLUb4l1vtiX
	 7vDpuevjvzi8Pg1HYKVowFwKQTogg0CHOgm20NpR7wL4GlNCwdm3LPPHKnjzclJ/S5ywb
	 LeCwirG72JQWihUdcaSoLAVkaA3WCnweChMcb6jk7Mh4ngAXFNsXWtwiqV5xzdRdKGkmf
	 iXHJnA9KoY8KMrJkCUPVSbfPrlsbS9vbsoOugQ52NYA+wQ8TkDLnoTT4R0A/TKaEpEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5EHZa3t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428CF606A322;
	Mon, 16 Nov 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5EHZa3t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E771F000C4;
	Mon, 16 Nov 2026 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842583;
	bh=LJuf0ZCGqdLJboOZF4DlxDPI6Z+k5ysg7SQ/ZD5jI2g=;
	h=Date:From:To:Cc:Subject;
	b=m5EHZa3tx6m6ZkA3STlE+X37rwrPBZxp/Y4rB5wAGDEETpjogWextC7TI7zLppG62
	 pkUd6wpBON9ImoBo78+7WctdKKbXVL4o9uY3k9gAotIiG24XCeXA01tCm+31Cuwd4G
	 1Z4DOqZfoABaHa0sJkHZ3yel7f7a1U5MtL1LtlG6YXOlF9+a8U6UefcmrcCfOdR0oW
	 /bjkgCLX60RDpSqp/RYdDXr5ZHcjQRmRvQen4qxm1vM12O/2QDJsQ5HYB556k2BVCp
	 mkKKgsYXZ+NbfzkBXq+emP3nGQoMAUCLOzy40QFMfXtWkCHzTl/tpdHTKqoX6NagSO
	 ml1vgI43C0teA==
Date: Mon, 16 Nov 2026 15:23:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pinctrl tree
Message-ID: <avsf1H1sTOSsGe6C@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="BtnlIhbClj3tnxWF"
Content-Disposition: inline


--BtnlIhbClj3tnxWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  58a755c16c452 ("pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm2835")

Fixes tag

  Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl  binding")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--BtnlIhbClj3tnxWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7H9MACgkQJNaLcl1U
h9C1agf7BbEChXGjGDRnSzWES1NAgrGgfOK+hPqNl403S5X233C/qFYyN1wJUcLG
YgiPR/5OpC+4AbzkZPqAH62G77OC84dDUNotTwJAW2VSPtCqjNoy19pfG4Am2oHg
MPMmuWJBDTw3NM7cpFOVsJuyWq/0ImtjbdbKEyoGnZR0yO1NbCwpe9JHZKu36Fk/
bvYV/TpTnd8T+jlHCjaJeQiPmHleflTTqTf+S0azQ+9w8Co6/StNH4eW5IVWLbOv
Z/VIcz7uBHJecaQPtkHnY1HIxuG3/rCnxczFlU7B2F5FGNcEbH3xTQlbx/TVoA4e
uUb4yPw+9yiPv/fF5rj9/zVOg5SiNg==
=Obiv
-----END PGP SIGNATURE-----

--BtnlIhbClj3tnxWF--
