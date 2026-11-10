Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318643;
	b=j/8/0J+odkZDU2TH35Hn7RvGrTy5To4Z3qVK2cunCM7aOUPRAzRugyAwiNvL3h71pytF
	 yqYkjCzCkhlmPnH6QpXUGKpMJr/l58VhQmMo1a16QCF8Jo/aS9yXgUhqOqR3B81wQg01Q
	 GS4ScmIdGoCNvrasnDkDSTp7i+D8lQoHfBHCpL6ofSOQXM2mgKHUM045p+4V7vl4wcFAv
	 SGPgernuHrw3EJ8x/+5t7WoNDulI7lC0Z0JiUU7pOHyeWtgiP9FQ2zM1G4eEKtDsWSCD4
	 RhjyqDl8C0G91yfc8E4Abs7q8Yb/LodunDmf7Urx00MhjSGLkOtPPYDI2LA5kIEVp1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318643;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=bkk99GpB+onYPxsrtaHgbhEvyTIZqHozrmoJcM8fpi8=;
	b=5th1HBBC2s3/eSHcCCFP0WZ6Wi2QVMO3JfKB5jk5mMIlrK7ofZ4RFb5nv8hEL/mH2Rtg
	 Nwrtr2YpLk9HTHhIaetVNK5x33PV48iX7py1StBfGV7JnL47xW8INsYlVLr40f0KYnxsW
	 syv9+xZ1FvuVHKDOUrpcSYAZLOhJ7kinX8eG4SdtE3K7A9wZfTfvdIIC31r9qHDOKMKDb
	 7uA/42i0BWmwod3agRaSwUc/byFQe0UjpMpmXH+RXpcpEYf4Yol/MT+q8ZpcIqHxvhe7F
	 6wp/bha5Hw+yCC/VDLRwkGua0a6QRZWHNkxH0Xc+9VjXod6UYDE0xO3c4sK2YobhNYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARQaY0hk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CC606A321;
	Tue, 10 Nov 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARQaY0hk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B797F1F0089F;
	Tue, 10 Nov 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794318643;
	bh=bkk99GpB+onYPxsrtaHgbhEvyTIZqHozrmoJcM8fpi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ARQaY0hkEu2mlYmzoDeCsETqRL70Rruf/IlDQMb8CRngH3xEQjbeKz+rJn/0MWFwx
	 GnFk/07ysVGmgEmqyg3PntGLWDCFLnLCxGGE38F9vwSzToqlUNaapzJfSHDW1sRn5p
	 12NYEd7Wno45uL6UBj91BsWCKVtD/CUiuNRAj2ObH943zdagznikm/PUpTmf0KSaEe
	 20sUGuB0L0BzmpA0KRDHyo9v1Ujg4WrPmuvcNSXzv+Oef3wgcp2PMindf9iQ9tZTKx
	 /WkBEJev9r8B3auYA1WRvdODvWQdIr5Jz39XqTOvyRsI/IiHRBqiGOSTGlgBa2aQqk
	 HSJK14RYiPGcw==
Date: Tue, 10 Nov 2026 13:50:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Hyun-Uk Son <hyunuk.son@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Ki-Seok Jo <kiseok.jo@irondevice.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Message-ID: <40646ae6-f6be-4408-aefe-521fb0ea9bee@sirena.org.uk>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-3-hyunuk.son@irondevice.com>
 <179318672062.199157.7461931531075403104.b4-review@b4>
 <SE2P216MB24230E7B98CD3F438E23E869FF722@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="wBWp4atyzpScsPlD"
Content-Disposition: inline
In-Reply-To: <SE2P216MB24230E7B98CD3F438E23E869FF722@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
X-Cookie: You can't take damsel here now.


--wBWp4atyzpScsPlD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 08:41:57AM +0000, Hyun-Uk Son wrote:

> > > +	ma5311->adc4_pga_left =3D 0x10;
> > > +	ma5311->adc4_pga_right =3D 0x10;

> > Like I said on v1 we usually leave the device with the hardware defaults
> > to avoid having to decide on a specific use case in the kernel -
> > presumably the defaults in the hardware were chosen for a reason.

> I added a register initialization function because the factory-default
> register settings are not suitable for practical use.

They rarely are, but they tend to be safe and what is suitable for
practical use will vary depending on the system.  A gain that makes
sense for a line output will be unsuitable for headphones, and vice
versa.  There are a few things, like zero cross for example, which are
pretty much universally sensible and we do change those but for things
that are likely to vary with use case we just go with what's in the
hardware since that gives us consistency without us making decisions
that might favour some users over others.

> static int ma5311_rx_tdm_slot_put(struct snd_kcontrol *kcontrol,
> 				  struct snd_ctl_elem_value *ucontrol)
> {

=2E..

> Also, this control is essential because it allows the speaker output=20
> channels to be dynamically assigned to different playback channels=20
> during PCM playback.=20

This would be better represented with DAPM routes directing playback
=66rom the audio interface rather than a custom control.

> > > +static int ma5311_reset_control_put(struct snd_kcontrol *kcontrol,
> > > +				    struct snd_ctl_elem_value *ucontrol) {
> >=20
> > > +	ret =3D ma5311_reset(component);

> > This might break the machine driver if it's relying on setting the DAI =
up
> > during probe()...

> With internal verification, I figured out that synchronizing
> private data to reset hardware register setting is enough,
> because The driver does not rely on probe() for any essential=20
> configuration and dai_ops callback functions always set
> the essential settings including PLL, TDM slot, etc..

The issue is that machine drivers often only reconfigure things during
probe() (including the generic ones) so the dai_ops might not get called
again after a reset.

> On our target platform, the required DAI settings,=20
> including PLL and TDM slot  configuration, are reapplied=20
> when the PCM streams are reconfigured after a reset.

Sure, it'll work for some systems but not in general.

> > > +	default:
> > > +		dev_err(component->dev, "%s: unsupported PCM format: %d\n",
> > > +			__func__, params_format(params));
> > > +		return -EINVAL;
> > > +	}

> > Don't we need to configure anything in the hardware for clock provider
> > mode here?

> Since the frame size is already calculated in ma5311_dai_set_tdm_slot(),
> I don't think we need to configure the clock provider mode here.

You shouldn't rely on set_tdm_slot() having been called, generally
things should work by default.  Usually the result is the equivalent of
a set_tdm_slot() based on the hw_params channels and widths.

> Lastly, do I need to address all feedback from the Sashiko bot, or are on=
ly=20
> the "High Priority" and "Medium Priority" comments mandatory, with the=20
> remaining comments serving as recommendations?

If it's pointing out something valid/useful then of course update for
that but there's no requirement to update for everything.  Your other
suggestions look OK from reviewing them here, though I might spot
something in context - in general it's a lot easier to just send the new
version, especially if it's just implementing the requested changes.

--wBWp4atyzpScsPlD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzIS0ACgkQJNaLcl1U
h9Da1wf/bgkQCHFqKUYSzIoHpxGeMZXf+w8h+CHd5ZTxYCvfLl9ySXYFUDHgakxz
nI4Wn1QFxeyaj/XuNMqnnSzZxFDaFDj4mNTwvOxLf1atQecJb3mZCGPqnNoC423W
a/uUhWOUQq2z1/5qVNLyiQQ8BvWWn00cc96zst3cTQXPeJwry2CWpq5J8OTD50KM
OZXR6g4AAeEJTqJIp4uFBqMPLQy8p3NaeJhe3toXjyB+3cDNjVKodkwjXdK0qCN/
u3C6p04IUf+czG2/QMoexte6gjH6qyXdyLca2W9PdaVp/XVw5i+V6KBMzJaPnuVx
z/g8aGOV9fwTq+Q5fXGK1e5L7Fonbw==
=q/0p
-----END PGP SIGNATURE-----

--wBWp4atyzpScsPlD--
