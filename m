Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB08476681;
	Wed, 30 Sep 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767084; cv=none; b=aaW6w/HkuTfbmCmvlML0hbmu1hYfPn9ZAbF4spsUtzqMBVEj5JYH2UWBpsBIlun4Vs8xeNmQ0Xv/LtI9nLawKep+1oRg7dO08tL47AMC5yt2c3e8ng+AuYgLagz4OaynMVcn2DhlrGMjjzUql2VZmalrSg61zSWHY7GUKCDdV28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767084; c=relaxed/simple;
	bh=bYX1S7jAyB8LEZM08JTB4OaUJy3ZEYbGMk8aJJigrbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWZKQmak/7bP44ZmOblmNBAmLJyh2ezAWyx752KTKWhzSq5J7RTenKPS92hYOsqY+uylZxQuOHPV83/jsVdodK3+OjkGLYGy0FcHLIsgwGNYb1r1h4BL5S3iTuCu+v+9epNqhvgS+GWk7Zd2qVMnGEeejJdYK5dgREN+46+XbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WelI3HrT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WelI3HrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0911F000FF;
	Wed, 30 Sep 2026 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790767082;
	bh=83rwTdO/FGr48GtBLJOLuXq/CyA1VYNTtnCj+4o0YoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WelI3HrTq5Q+OeeK7mUJq3BaQTbRmXCV7thColG6Cwi2zu+D/821EpOAu1biw6XX9
	 KjWSX+fc0aNUY5nsHXHHnfwzBLnju7Yewex+2qKERqCtnwPOItwJNSvGFGkL/oo8oe
	 oPrv+8LoTNlyIVElv8+sAghuuUmmjwcvyEt+J1qNhseq+cgYZBV5kMx6EEBdl3bPfS
	 5M0ttAIvtIoUOHyXp4KlVjP0sdJzuoM9VQ3YOigDUSt4QZCdhmYZ0aPb6X6vtK1L1s
	 iUcoISpT2meiyK+v5NxY+jZ6kxuiJ0BuO+RTuQsZJtiesE28XbCT54duUufkOkHiUp
	 gxDaKvINcgGPA==
Date: Wed, 30 Sep 2026 12:17:54 +0100
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,
	Hector Martin <marcan@marcan.st>,
	Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Message-ID: <d591a288-a8b2-4c28-8caf-6dfa11655fc7@sirena.org.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
 <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
 <ItQHm5ZKQ4Wltp6qbCRkSA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nnH+SEOf/vZYoZnv"
Content-Disposition: inline
In-Reply-To: <ItQHm5ZKQ4Wltp6qbCRkSA@gmail.com>
X-Cookie: (null cookie


--nnH+SEOf/vZYoZnv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 05:36:21PM +1000, James Calligeros wrote:
> On Monday, 28 September 2026 9:03:13=E2=80=AFpm Australian Eastern Standa=
rd Time Mark=20
> Brown wrote:
> > On Sat, Sep 26, 2026 at 11:06:02AM +1000, James Calligeros wrote:
> > > On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern S=
tandard Time=20

> > > > > +	if (props->is_sense) {
> > > > > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > > > > +		return 0;
> > > > > +	}

> > > > It feels like this DAI ought to have separate ops...  Also, for the
> > > > sense link will we definitely already have a rate set up?

> > > AIUI, the cpu rate should always be set up by the time we hit
> > > this path as it is only taken when setting up the VISENSE FE (after t=
he
> > > playback stuff is already set up).

> > Is that something we actually enforce or is that just a thing a sensible
> > userspace should do?  I can see something racing.

> We don't really enforce it. speakersafetyd is the only thing that opens t=
he
> VISENSE PCM and does a blocking read of samples
> which only starts and subsequently completes after the "real" PCM
> is configured and playback begins. The sample rate is reliably
> reflected to speakersafetyd via the kcontrol on the VISENSE PCM. We
> have not experienced any race issues with this arrangement in ~5 years
> nor has anyone reported any to us. I'm happy to take pointers on
> how we should be doing this if the current approach won't fly.

You could just return an error if there's no rate set, it sounds like
your actual userspace will DTRT anyway.

--nnH+SEOf/vZYoZnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq87+EACgkQJNaLcl1U
h9Cxhgf/WcFsoEMkfmXz8RaOTaYRSb5C0qxwrbBKBoUhhIsznqLaBZmbCYldSt+C
z+HAA+DYIwT0Hod2VkGiT4b8sL2S92svIkrouVYKa4TreBxzK4GY0cabHusPWQwe
EeXxCKfvgQj8+akOUfcXEsp391TQ0mtBW6AseRd2tLZh/h32OjqkwX+NpxcLYRF4
/LIQAFAIGxTEB/xeXE4GlcI4fnPfMggKGnG2Dn+r+iDgeD/tIZkfK2BiR+nAatIj
RF5JM1d5eHFJxqApPWsliNdUKU00LB0sRWYWUj9FRvqImMYIz6TD4mJX6EfeAsL9
EOeh5DCM3Ud1EMHlvn+J5iPMDMmupQ==
=y+Ex
-----END PGP SIGNATURE-----

--nnH+SEOf/vZYoZnv--
