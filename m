Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E50547042;
	Fri, 18 Sep 2026 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769661; cv=none; b=QNjQ1h1nQoc2hsOlfs6uZuekcXFqB4X1FwmpNPU2f59Zf5k+xG26N9mAhWID6DSb6yz/BQD7yRynXQYhs63kE3pTl9Xtb5sc2uGwPdNfqgqmd7XtkVGRHY2G6AibEiQU64WOtnY8dOHivwhcOJfPQyGwXggtlKFUsgMPpZFHhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769661; c=relaxed/simple;
	bh=Up0QHi+soqO6V2LAQQLCVn6vIm320kW/+xtWq0JZF80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFlF3dJpt7As11beYG3PcBW2mjYzKNG02pPAr4D6I3WhvfP1fnsmhoqIauSFsh0/VlAC6Tx/0wt7ffbYCzmSylYE3Bs3j33QfQKGct6AIZ1R6x2VXY3VufZQWOtEBKa8oOQg3ATT3Z+QajXi/gy5tSlvFAnJizuR4n/aY0Hxzgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5jBIZ92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5jBIZ92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3E01F000FF;
	Fri, 18 Sep 2026 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769660;
	bh=Up0QHi+soqO6V2LAQQLCVn6vIm320kW/+xtWq0JZF80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q5jBIZ92/cSQHPTR9P+DDeNd5PRkc2erz32u8UZDPBDMkVY1EohKGSgZzn/q91ED+
	 fcYjI5Qro+0hOIddwKQ+VUHLLcKSTr4DC35g6VMjsyOTbTDtMxTLsFj106H9cdRwDa
	 rLETk05E79StongT8RpYwTwCnmvlTjtPiiglHunfeC+8Ccy4EnO6cw11pHbT0GESVI
	 n+mBtmhIRAAmVQ/M99V2rkflTydN3jT23ILUOgU5c6UB6e+tFBJpqbTvjzCk3zy3yJ
	 GylZ/C3/uUSEbJBFl2I7sfsL6hIs2mRmMVWHiAD7nS1O+LwjjY1iOJ9FLk22Q3odWO
	 PqREu2Gr3efyQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id EA3A511CD82C; Fri, 18 Sep 2026 23:14:16 +0100 (BST)
Date: Sat, 19 Sep 2026 00:14:16 +0200
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>, Peng Fan <peng.fan@nxp.com>,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	Arun Raghavan <arunr@valvesoftware.com>,
	Fu Hao <fuhao@open-hieco.net>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA/ASoC: use assign_bit() where applicable
Message-ID: <aq23uHBdnXfcYIpM@sirena.org.uk>
References: <20260918141532.3022761-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ILqcItDhvMDA2+QS"
Content-Disposition: inline
In-Reply-To: <20260918141532.3022761-1-peng.fan@oss.nxp.com>
X-Cookie: Orders subject to approval.


--ILqcItDhvMDA2+QS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:15:20PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.

Acked-by: Mark Brown <broonie@kernel.org>

--ILqcItDhvMDA2+QS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtt7gACgkQJNaLcl1U
h9CM+wf8CkAITPLDOQyvOakcXM8xy/mrwnT3AbG6uaQtl2lx8/atxi/xSaHeqQPO
yEyGcDRl9heEm2w9npASZBaGJEUEmRU2I2E9iBMmPkzLaW6mfwrL42LOBYEwjPlI
rWIQtr9hqDn045DXPCeW9O8/Kl53eS8UZQp1C4GYJ0MFMXLlBq5pfwJUJfacKgi7
jZkONFHvefnumuTYYmZ1D6L7kARCDIXkpDpKOssHjzbt6DdH9b7ZaMFg7L9yhPH7
0C3ESteh3XQriFEWw3iZHHb26E+2MCjbcFlCnSIuHPnXbXl4L+98ixiIbEe4G9f9
920V7CaqwlMq/ZbErje5e5Lp53pXtQ==
=VJAo
-----END PGP SIGNATURE-----

--ILqcItDhvMDA2+QS--
