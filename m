Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F2480DEB;
	Sat, 17 Oct 2026 19:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266338; cv=none; b=W7mCGvKNxyrQWHHf1C4KDh5RK9TjUAe1QOaYTuGTWzr1Vz67hoUN6bEG2mEEgaonrD6AKA5dZVbFiA5M46YWM6qBJnnTpnBRl48nSchYddojtFyN8R6iXngvBEMqrzWGg2tw5JIEWqDuvpOiIYu7kJwq3rsunlTgUhpl0e9cRg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266338; c=relaxed/simple;
	bh=BZcI6/T8K2XM+gDjhbVCYRN04u9p1Eu3pbdoSkiEfb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUqnnWMAPo+37sgipuNz9sOGfYZzoopILLDF3CD79HqDTLxkHHnMxgNnDnoDA0WwVmz2jTt04CBKB+sd8UV8zkFfIOxOzntnvKByJPoVGN09MrvJe4tNdA483GEbAgzloPe+O2qhtupU3EpUYV6GJ8wliqPjA9sHz6cZSViN6PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bwi+SiYb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bwi+SiYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15EA1F000C4;
	Sat, 17 Oct 2026 19:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792266336;
	bh=5GflxBgAWbS+Fj6Ge52Dypki/HERxr5qLRgmLPB9EYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bwi+SiYbdCeQJ5hSig15CcBvXE8sMk6Y5pOY800bn2LzOW8ymC2q7DW2dhCfs5KI3
	 OvADrKP52OS4/ZGFUdgOzrEzheb9rUlPgco115TvCTfTxApEN2rCenbrv10nKU7tgn
	 wUoM2jOLL8JKFzDHDpgDrsDVg7VVzAVtUR2H2T6L974Dy0PG7Ox1M3LIgtPFdC0+dJ
	 vRPTA/B0yaSxy12JdorQkCtzLiapQOxv4jIS37tX0z16QPzjJEej1kLHrmevqs1sqm
	 oxyqkRzWCrP8zAHi8S0KcEChbhCSpYPoCPH97ezO4Rq0FwzYQpdvG4//1eK2qKgdRd
	 gQFy6kns0E8eA==
Received: by venus (Postfix, from userid 1000)
	id B573C182304; Sat, 17 Oct 2026 21:45:33 +0200 (CEST)
Date: Sat, 17 Oct 2026 21:45:33 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
Message-ID: <atPPpADkwx_5BeVf@venus>
References: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
 <55831eb0-b7b0-43f3-8c03-4d1029ea97a2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pawwmm3ux5cvrbm5"
Content-Disposition: inline
In-Reply-To: <55831eb0-b7b0-43f3-8c03-4d1029ea97a2@sirena.org.uk>


--pawwmm3ux5cvrbm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
MIME-Version: 1.0

Hello Mark,

On Thu, Oct 15, 2026 at 07:10:58PM +0100, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 07:02:54PM +0200, Sebastian Reichel wrote:
>=20
> > This codec is typically used with ALSA UCM, which right now falls back
> > to handling mute in software. Expose proper hardware mute control
> > considering the driver already handles it internally anyways, which
> > allows UCM to bind speaker mute LED to the new control knob.
>=20
> > +	wsa884x->user_mute =3D mute;
> > +	if (wsa884x->pa_on)
> > +		wsa884x_set_mute(component, mute || wsa884x->trigger_mute);
>=20
> This is checking for pa_on but...
>=20
> >  static int wsa884x_mute_stream(struct snd_soc_dai *dai, int mute, int =
stream)
> >  {
>=20
> > +	guard(mutex)(&wsa884x->sp_lock);
> > +	wsa884x->trigger_mute =3D mute;
> > +	wsa884x_set_mute(component, mute || wsa884x->user_mute);
>=20
> ...I can't see what guarantees that pa_on is set here.  It looks like
> these are mono speakers with multiple speakers connected to a stream,
> someone could fiddle with the routing on an active stream and power up a
> speaker.  We should probably recheck in the speaker event.

pa_on is set via SND_SOC_DAPM_POST_PMU/SND_SOC_DAPM_PRE_PMD. My
rationale was, that mute update is not needed with the widget
powered down and at startup the .mute_stream handler will update
the mute state automatically.

Greetings,

-- Sebastian

--pawwmm3ux5cvrbm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrT0F0ACgkQ2O7X88g7
+ppFdhAAp+0fdJMAITu4L4LpMZ/PQtRcbXejA96Hp7rwtNQD4zHoOWWC/kzKksKh
/xG7ylk7TxMLXCMsf8w1wrgArcKjCP8LrwsUZtkXV6n3qslEw/3KV9+OHf6HqUs0
WV0nbMHLjt17KCa3NiDtOWM/wgY8CIP1eXntNocGjYKrQddhccrNbKNAHgV1oCdh
9R6ZJBfzOalf+sHk0HmaitUS6YsoxKxLQbj0a441x9rAKYQoZm0xATWfTWb267Bd
sjk1QiPB39yX3AKLMcfolzXcN/soTQ65ILYw8iwN1NI/2qLxh5WpqEgMR5phdC+A
QnlI4tEYCCZzzrZhwTv1F2gEIbCDzXWtLfnwGjfmW/ylZOp/XeXIarDzYH6Tpset
zraOqhhU1p0740ZJ2AOFcz8jEQaUzxGkjEpnrrqcMOA26inW9I+6ZnIr76UlFRLq
5PdXgDsdsCYX6gXA7fKUuCOKgJ4fK4PiqLxpUZqB3Mg8bTrZ6lVON3c0aLI9ERhK
h9aip+CQuFB8Snu3SsVlZCGv7/+C9B2mAW+0Zy6UvIVgdqkYbS4yy9qS9YVa3E82
UzhEfomB7/1fJBCyO6whufZ4/3QaVs/d0+qTNYAF2j8weRff+C0UQrnWqvyDsRXF
yx394ZspinpDkgL/4m9awWjfNooi7iT0SPMR91Httl9zwlfSOac=
=3sBP
-----END PGP SIGNATURE-----

--pawwmm3ux5cvrbm5--
