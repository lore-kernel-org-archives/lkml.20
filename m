Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CCA49CF2C;
	Mon, 28 Sep 2026 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594809; cv=none; b=R8IJsC77d7E/5FYvjoRXu0uWkifNCjdyVpT8lVqlF5/Wt1TkfMvdyiVSrZTquW8aRRn61oj/NUSLJgKkE2bNg+iWQ4Xj4ItH4JpMYsVUcaR8A5NoshssabAJ0Osp+afzA5m0PTFAJgXshyzDAYI7s8txHOgGn3UtUEDTUOyapIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594809; c=relaxed/simple;
	bh=0nQAsdI9MKQ6bi1a3Tac1SYFqN/k0GiAZO6cdT/9jQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDcc1Oxa69+IyzuZcrSvWbV+aFGUXQrepkgLmVuLSIPtSFpNYuh4FV+UQWf1azMaQgMB2xCyFEmc27YNZsE6DxzfrcUbQWm4bSZ41+IyfG1NLFumWbWsYN8Ym2Ag+AplXDyVxGSGpC4MZLGJdk3u7fCH0kDVFk5lrkJY2wptXw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahxNhXzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahxNhXzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248561F00898;
	Mon, 28 Sep 2026 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790594808;
	bh=MIgiakxNIvlbIOvXbpa9aAXTvVdIjMv2YRdjshxXmZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahxNhXzBmiYTokoVc3H9EOIJnhTiIRXS8yTi4jkl4NBTZ/Nv4WBvbWNNickZgLD1z
	 tNTkt7Rpv9XxkYAOXiaXinGpn1TVGBrrbxanqOu9maY5zQYsCbj2Kl2WxEpMoLo6lA
	 HyRfdH+ObdVSBA7w4w9JV+SDdnt9JSpXYy2YAyZS9KKWJSWRd9riZxE6F0W6HOVL9X
	 2iAWSuoOVWLw3Ct8h8c7Sh+0rVPFOiRRWCfOZjZSIp8/fNo5+a2/vmeOP2Yj4rEmOJ
	 tDEEBitSlXsbvXPDtbXy8t1DqLoOL26HqgSKvoMF/Kp/L8ROFcPMKaTrW/S34orq3w
	 f7DQ71vdlasSw==
Date: Mon, 28 Sep 2026 12:26:41 +0100
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
Message-ID: <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agS6p3a5qSig1fa6"
Content-Disposition: inline
In-Reply-To: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
X-Cookie: All is fear in love and war.


--agS6p3a5qSig1fa6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 02:17:27PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.

This and patch 5 are not threaded with the rest of the series which
really upsets b4 :( .  I'll fix it up but please look into your tooling
here.

--agS6p3a5qSig1fa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6TvAACgkQJNaLcl1U
h9AZrgf/VFOKxMUjK6hmwAHkqM+y0Ua45JlbNuxKyoHHyV84DmfhdqY51ofpXfuQ
6N+x6DTT+UZJkw8xrPqdRMRhps2mxGnkl0FdOiqAe1dR/VuGMOAck7lF80PMIOxD
CUljelqNF6bYnmr8MQ5qPzYIUn7VEcvZiirLFwT5OHfi5/x37fQUAFJ1YJFgq8MX
fuuBv1DOxVGdXUD5MsFdkcMfd9617FupVjCOhrZFQpTzj1yEvuAnmnTCs02wF/3S
QjBDyIaaTRdUFDag3qQ/tMKwfIJjvLDrHsp2iXwoQUdoL+Ga6f9W+QJUrBcoiu+B
TkSZSFWED6F7dnYsXunQoC0iWlZFGg==
=A3IY
-----END PGP SIGNATURE-----

--agS6p3a5qSig1fa6--
