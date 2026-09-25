Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFEF395243;
	Fri, 25 Sep 2026 21:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373145; cv=none; b=SRJbnCjVlyPEdWpT4bUZ8lrzS1Yxkt1JZ9efBV/h98YQzSjJXw8rWJqzy9Y55GfZ9fJ5rhBnY4pwloysvsIrmvo90tmM8QIOeQ7vaXuuD9KlmxCmcDZPtXnv8oNencbGz6nknCxTd1TVnhaGEfk3/3IObzNhyOEUK+H/dIvQums=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373145; c=relaxed/simple;
	bh=RDS6yZNNxj2nJN3muesoIlX1hvTIfihxzOAf2aEMt1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIQZTV7/4mDoBPszZud5bBRgfixTvs08ofxa30UtHjEymFAeLTBdZBS9kfYViUrDOWMuaj/79iiKCD/o/nIus4DYgE8gCXaRA6uZhO+v1TVMUNpMtPisKhOzw6aoMwWUzjV7C3dZD6R9dgU4cCHDAfqsLedIwBsEmObwlCtjbH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRmmZAzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRmmZAzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F891F000FF;
	Fri, 25 Sep 2026 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790373144;
	bh=RDS6yZNNxj2nJN3muesoIlX1hvTIfihxzOAf2aEMt1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mRmmZAzHfZI7iqIwGGwkbYveyq6QGL43nbtmHnrd/CvQv4Nb9syvBwIVK64Q2chkd
	 MPUR8HjDMX5I6pVMOUqjtG9eW+CAl48cZNRi+YBL6Zg3Bi5Uk/5pbxS1pUCWaDWxWt
	 geh/x80XiNZ4dASPYn3jRikYJxueUPSLSJ4/oUYSMQ5YJJZmTTLmUwk2DcvSdBfnRV
	 631b4Fftnz2FlV9OvnHKNI0q8qecjT3q0cUhicAX1DCp6WuYCj+sZ4Gpy3FISbVUm7
	 tORmqevK3U3LObTY5rSFUiVgo8Qf/zWWgjQIUFfkoUfzRm3HTYq9DrEnXuDNbtuTZY
	 CM5fGWFj6LJZg==
Date: Fri, 25 Sep 2026 22:52:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v5 7/7] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
Message-ID: <c8a786a9-0104-4da8-ad9e-52aa2c622ac8@sirena.org.uk>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-8-srinivas.kandagatla@oss.qualcomm.com>
 <e3797f4f-2e46-46ff-99ff-6ba9324bb427@sirena.org.uk>
 <43a45cca-e214-4f0b-a026-14da8b33b3f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JQbGe5UXgaftHFqU"
Content-Disposition: inline
In-Reply-To: <43a45cca-e214-4f0b-a026-14da8b33b3f8@oss.qualcomm.com>
X-Cookie: Love America -- or give it back.


--JQbGe5UXgaftHFqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 09:28:51PM +0100, Srinivas Kandagatla wrote:
> On 9/25/26 6:31 PM, Mark Brown wrote:
> > On Fri, Sep 25, 2026 at 05:10:48PM +0100, Srinivas Kandagatla wrote:

> > Why do only these have nbits and type?

> These are the the controls exposed to user as mute and Volume.
> Looks like asoc_sdca.c does not use type and derive nbits, it directly
> uses control->nbits. We can add the conversion in framework, if that is
> something preferable.

If it's not needed that's fine, I just saw that there was an
inconsistency and don't really know the SDCA code. =20

--JQbGe5UXgaftHFqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq27REACgkQJNaLcl1U
h9DToAf+Ihd1/73oz37XG0CW1y27I9F6meLWQgXBMzD5YRil4KRiw34fSDKthyUc
Vc+Q2PHu572TapUJbkUG/+qJNcjw33ingCevuR/DCzRuuLd6Tb1xxRG2aVarILDo
X3kRI5z24wy1UdzNVoW3WoiRBbB18XjEvyFp8+euKrgGyIJ2r0mLJeHWBLgc9TCZ
EOdKgD67Md/OEOV6Rw5Q6qB1m+6wVIJP2CrO3Xu6ok0OXHHZPFuv0ZuEwXz5l/n1
ImIkyolDZRDaVEDowUMKhbNLIuLTODcPgkM7qk2CjO7m8mICifbz1W9ICesNGcyK
El3ifhxXUPd7DJ+voHqeq/Zcnoi2Vg==
=KIOH
-----END PGP SIGNATURE-----

--JQbGe5UXgaftHFqU--
