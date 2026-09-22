Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8DC4B1B5E;
	Tue, 22 Sep 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070227; cv=none; b=nfsBgnWn70G7oxliK+Xzt3UKijBYZvr4UhJKcepzgNMG7Sl44eE2CA0zf24dTQ3tzSsZZx5vn7TcMYtHF3+FH0bC63nY7B6YyTZZ0VvJZrylokQwTMDid9JH8jDNkfYw8zfxowENCc9mucoGCSnvxp5AzgRns075Yug6uznNbN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070227; c=relaxed/simple;
	bh=cx/LVZeeDFGHifiY72VoyVy15PZIyFlDu8/xuowZAyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NE+NZqcBON1zF8tSmrX6zkrl2HnRw85KO/rAE8RXDBQwccWBiwaTfCtcF+OHFsF0nBMjg36+FL/B+2IoNkhxg4FecOYpy0LBxkuBIwtIo0ijg4/5KELRv1eB0zvnLyQnTwt8iXF3pEQ7BFv/0DddqCIhOpRJIRKEeCXp+QwT9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYcMEpTH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYcMEpTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766D11F00898;
	Tue, 22 Sep 2026 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070225;
	bh=T7DhFwXtpjqqTNg2JPXQRDOE2UKkVRNsCGtZR4eTpAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oYcMEpTH6Q5aMk4NFddrYVjZMb30tGXyn0xwoTPBRuOpTlzOUh9WGAlfr1pk5sCmi
	 7W/bEe/SfwwN2ezubsSet/YmL8QVpeOXxjgVhg1qH9asWlfcYuxtYm4qLDdItvTBn1
	 Z0OcwWX8bjqvXqzGvQn/u4kA2VQIytRiKsX+/eroj94P1tHZgYSghhIESFXB2OgXB9
	 7HH4/rUwL1j3cywBY519ogBmPI/69lmmKtSpsj48kUVicso37cL/5WJbxtd7TcsS4L
	 gwQnZG3CAHfZpvJ+gqk2T52MeifiOo2an2THeSRI7pVeFosFrsmKg2qs7n8wGMv9qj
	 TwNrJ0JlhwQ+A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C24391AC56BF; Tue, 22 Sep 2026 10:43:41 +0100 (BST)
Date: Tue, 22 Sep 2026 11:43:41 +0200
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
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 14/28] ASoC: ops: Export snd_soc_control_matches()
Message-ID: <arJNzSKdKWMsatoE@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-14-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="12Ep3rrf+qEA2PeF"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-14-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--12Ep3rrf+qEA2PeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:53PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> This helper is useful for drivers that want to do their own control
> lookups and matching as part of more complex logic than the existing
> operations.

>  EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
> =20
> -static bool soc_control_matches(struct snd_kcontrol *kctl,
> +bool snd_soc_control_matches(struct snd_kcontrol *kctl,
>  	const char *pattern)
>  {
>  	const char *name =3D kctl->id.name;
> @@ -425,6 +425,7 @@ static bool soc_control_matches(struct snd_kcontrol *=
kctl,
> =20
>  	return !strcmp(name, pattern);
>  }
> +EXPORT_SYMBOL_GPL(snd_soc_control_matches);

Please document the API now you're exporting it.

--12Ep3rrf+qEA2PeF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyTcwACgkQJNaLcl1U
h9DA4Af+K7mR3OxqTfAC67to7qEqJQQ0Ug/vN9SgZhFMBNEFP8R/bozZv5ev35ko
azZVRzd+3ZOgE+bYY+lRrLiXZBYfbvRMF7rhsE4r9gGJ4mtsjbov0B0UaQ6mlGjr
pfN8bT6WcAWq9AmZHAwpZegV6zs4446SoNgug2hxmQR79DSk/VpFnBVo6pZOw2uR
tooItCshsxcHrMtkM3lwGhfVaTJRBcu4geSbs5XDGlVvNCrdc/tnTs4k/Ye3X7bo
CiTNo7YPzCkrvn0ry/Z619SEYXOjS6ApnaKzi5WgsCB+5aWYwwSXgGrF72XDhJmV
pNbfaQ3PmLgv750rg49idZahfnqEqw==
=TlRR
-----END PGP SIGNATURE-----

--12Ep3rrf+qEA2PeF--
