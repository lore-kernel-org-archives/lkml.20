Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2874A43F8;
	Thu, 15 Oct 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091007; cv=none; b=LIk+GPbaDLFo9WDKguEkqWG1w52BgNPBpA0LtzkUNr8TW7ZOUEzN9deEDvA4Zi45Mhusira25gx/laGbMmooEFInPcBb8m4cM62PXRJpxtrdo40FGwCSpZ1EsN1YYo9ZfYRkVPWHvMawjizOS4tJ2mWz6hBso6U8lDYbfuZfueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091007; c=relaxed/simple;
	bh=eCpQS2pY/uIfTWrkF2FXUdCk4bTqWWVfpHIP7uWqUd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMOvupEd6jDdpEk8PBxpNgppbJv97NkJTMxRqi6bOCQ64B3Mioa+fqNzs3WDgBlxBwV9ABgLhbXoxZTodCeUCzx7bpqu55CFm7wKsfNrLlJnXOb3NbI1YD35pnIgW6yRy2XcgZx/2Q0whXczWQxp7RiEysivd2UJo/QA+zyF3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evZOV3qy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evZOV3qy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7411F000C4;
	Thu, 15 Oct 2026 19:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792091005;
	bh=ZPKERoZ7LJS+ax60+9moP0P18/yZsLBWUzgLuoqv2Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=evZOV3qygawQ6CVWLL4kNphfRaDs3xSTnbyoSAK013tHj0tNzEgOwu6ftdpvXfJaA
	 7p4OM56mPWvxtXmZBHgawQo502oTMT4vd/3M1qsE5Yb8vxHJZPqELUbLz80CIbIh31
	 EgB8pFKDDIxcu17Y2PU6/8RNWby50bkGIOABTwLyNt03TyI0gf5cZ8l5ZsluS3fDWH
	 F4SLINdOFxykTC+A+9FacO4p74S/XP45lS06yy1wUucj6f7xssHfZLenmunIiJYdRv
	 BNP6/aTHm4tWJBz2g0eQ/TobXwvmnjAD+xLTjbK21ZbmNtwERjnj1g35jJFTofNQHt
	 2hWmGz6el9svA==
Date: Thu, 15 Oct 2026 20:03:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: codecs: pm4125: Keep the micbias reference
 count balanced
Message-ID: <a3df845a-ab58-4945-9221-ff671c3dc378@sirena.org.uk>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x5rN7tE44XbwbmSh"
Content-Disposition: inline
In-Reply-To: <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
X-Cookie: Tax and title extra.


--x5rN7tE44XbwbmSh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 07:43:11PM +0530, Mohammad Rafi Shaik wrote:

> The analog master bias is shared between the microphone bias supplies
> and the playback and capture paths, so pm4125_global_mbias_enable() and
> pm4125_global_mbias_disable() reference count it and only touch
> PM4125_ANA_MBIAS_EN for the first user and the last one.

> MICB_DISABLE clamps the per-supply reference count at zero but then
> evaluates the enable and pull-up counts regardless, so a release that
> has no matching request still reaches pm4125_global_mbias_disable() and
> drops a reference it never took. The MBHC framework issues exactly such
> a release: it takes MIC_BIAS_2 once when it starts detecting a plug
> type and releases it both at the end of the correction work and again
> from wcd_micbias_disable(). Inserting a jack while a stream is running
> therefore switches the analog master bias off underneath it, leaving
> the path up but silent, and it stays silent until another stream takes
> the first reference again.
>=20
> Return early when there is nothing to release, so the hardware is only
> touched for a request that was actually made.

This feels like a bodge for poor reference counting elsewhere - in
particular the MBHC seems to be fairly clearly double freeing.  The fix
here just silently eats double frees AFAICT?

--x5rN7tE44XbwbmSh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRI3cACgkQJNaLcl1U
h9Anewf/SNebW625O2/DwvATSkMuiiycXhDUV3/GVNmGNZwSzupnWogSeg+dZH5l
bZCxrxAbWPjJZ461KNz1KVOAvo557NAHQ8CNBv6mEiNwN+6aA7PLtYnJ/7EYxbsV
dt8fOSWRisvRPMLv497JhH6hkJDrZIGTbHyS1F42ESxEotM4QFSlF2NZAyImgGHh
AoQGmVuA7X2mu5RO86mKA8HTqDL/sIeAv1yPYtWY1dWuZiqhU5Lt7LQveRhBrRUV
cAQdk5t5rHr8Y1FTNTPFRBqGCwhnb4lz5Xu1YsPT3un5BALkGQftyfPbDmK/G5HH
vXyUq53umdBSlddd60yZ/bqzsHk+pg==
=8J6p
-----END PGP SIGNATURE-----

--x5rN7tE44XbwbmSh--
