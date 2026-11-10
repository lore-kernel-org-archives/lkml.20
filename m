Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337325;
	b=JbL2KKwoT3/GH0YDz7FBiaSwIHrAV6W1fAdjHm1ExWZNbnTOrk/cPBv59rC9iexcyLQe
	 1OZ4zq01NoyVKqVS6L6CuNeSp97AJ/gjvYnhATKwwA22aqfm5i03hC/8BWwgLxOivz7/1
	 maILz1neW6/VKE6SvisCFnE1vs70ZxwptT7b7R2G3WAT1l1wadUiM6S7lRLkcOkctslPw
	 40f2i3ilTKbyH2CuX5/Ie5etArJjLUemJHj+QkBA5WLOmuzBY+3v/P33M+0Ow+r75ES+f
	 Q0aPhr46fFgh9nXOQUryYSByK9ryJM/Q8m9d1/Lr6bxX1st9vkofEzkTm0pQdDUz8Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337325;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=m+Mg2pmSN+BG2xokzdSJfneMVVdXbskQcyg2u8EG8MU=;
	b=XCYHzj8MlYc96kJj5QB6r+5t28GYbWWhGCodzea8P3QF9xGMw1JkMCo7EJHbAS3LZykd
	 FnhUY21A7W6KPD9xYrIKJJt2bW1wxV2APBY5qLI5JMC2Ozc6O5VHJHPdbtXBik2CUChu8
	 6QzbleUEwsyMrifBClKFyMRKM5ln20lKze3fxKk5pvWv15OtLGfPbSrEiE1EXuoDPRJRJ
	 T6LJBx4ZFk1MxxH05CN1k/Aog/NNX9ZVnK/icvcRQSuzFPAbnqpF6hY8HViGjhXAN4BQj
	 f0X4VRjH0M2iOAXpmgFbwbJkTo2hqoLzufXZH9Kfsw/mHd04+QrdJZq4kVf56gtlblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbEQZYms;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA25606A33B;
	Tue, 10 Nov 2026 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbEQZYms
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB301F008A1;
	Tue, 10 Nov 2026 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337324;
	bh=m+Mg2pmSN+BG2xokzdSJfneMVVdXbskQcyg2u8EG8MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EbEQZYmsiV+CwZPSKhwsGVnIZd75BetlSFkt7NHcBffbaKVP2/TkY23QXNN3Clolo
	 abc7ybU7CMsSYFnt8xNr9d/UySv4qAwypcO5LtrrusJib1wz+egSYqq8ueaQC57FtJ
	 tAkGDIja4G1AbC+nbwUByLb3kNBi7UEYCzlW3YgGlyU30PYMQmyyMkdBGdWFjjXPoz
	 OthuZlSPkoC3SbxAT7LruVAzF6G/HxJqlGb+UgiBOUZQEeDR/f/QO7d7ChWlxioCUe
	 /obJwbUHcL01lXtXbJiKnNjaGW3MKtcedGJOrQEStsAidjoUSKyKHskaN6eNyUt4L6
	 4JSF6bjDCosdg==
Date: Tue, 10 Nov 2026 19:01:59 +0000
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
Message-ID: <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
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
	protocol="application/pgp-signature"; boundary="jx4O88Jzwpr7VcWr"
Content-Disposition: inline
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
X-Cookie: You can't take damsel here now.


--jx4O88Jzwpr7VcWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 11:38:51AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Hi all,
>=20
> This series fixes clock error handling in the Atmel I2S driver by
> propagating errors, using optional clock APIs, and simplifying probe
> error reporting.

This doesn't apply against current code, please check and resend.

--jx4O88Jzwpr7VcWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzaiYACgkQJNaLcl1U
h9Djlgf/V/gElCZDZ2VSQGSm5CRyeWp1zE0bW51v2sBWGhM3Oxkt2yTcCnIENuWj
L+TEeDNt2hiwRTsd1U3OOluIqWJXy9HTdqVDfvn5mLlKDl33vrEbFwrx3O3Oet36
p2oEONoOjq+GD0Cu46z1rZeMXQZn0F5wJg/YxDgQGO88pxsR7R1AxcFj5GSILNGu
mqR6t9sBzEdVOpqPhoFoy8Xo0VFrILtZJdjUU1JItMpaxa8RQilIyXvP2/CU8Fd2
v80iKAI4CUY/1z0a1ASZNCQMCCOVbLPwop7Ys+zDQlxZOByMCR816d/hNG8RGx6d
D1ISdJata6AvCyRqC20n6d1v/o5joQ==
=4SwU
-----END PGP SIGNATURE-----

--jx4O88Jzwpr7VcWr--
