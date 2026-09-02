Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBB3B2FE7;
	Wed,  2 Sep 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366288; cv=none; b=uRiF/v/0N2o91lWf77NUWHRjNI0arz3Cl7Ir/FUYVgWDP/4iJZuy6N1wQYqZPO7OAE5fxfhgSj1Ffnv110MGlis40P3qwPmFk6vCBT4nX5RpGWeW9pptXC/Isu0vN0Kj9jvbTiuZdF3CAmYYerYuEmIhnlYnxawaIi+HuQ0Z+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366288; c=relaxed/simple;
	bh=yMCqNERsAbpPW7AktPeHbgftFbULiJ+hACoYejImCxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlojSgEyDwWy0HH46rIcOdVS6Hjcb33bVUxhl98vVcOl/7gJWwAlTKR8ikFPgLT5JtstFoKhkCUORwdRakQbuaC+ri5GSWudevgVTPHBN8Ta57IdC6NoB3hLWWypOPltrZo6zZZ1APLv8Vgdjai2CDMZApOrtZRldjvV8RmglkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSmDHhbu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSmDHhbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0016B1F000E9;
	Wed,  2 Sep 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788366287;
	bh=kQKLYupNggOU/j6Fu9OGdgLM/pshSgo/jAGeB1aBOo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lSmDHhbuPLFQVZyJU2l+4kD8VDe73Prh0Loa+Xs4n01pbW3wQ4mGb8HW8+KJ/kcrZ
	 Q50hBY/1yDqqbPff0iZpzuVuCVSxNb+Hhgi+86C9GSQBI25OlFHl6jxDT7TCY9B9Om
	 Ci8uni+VysiaDqwuc0C2FDCyhoxG2yrm39Ixn2t/2MICsffPFTdFwEtMpeQeE1UVR7
	 OCVhryKnpalxgzCDCjXFCftMDlYaspQh/bsytiHnYc83uFkxZn5Oj1VW+F0J8FF79O
	 tCfxwN+7PGoiV5Y9Y59dPFzXBtj4drynu9zk/7zYBm9V7N1oGCPIn36RfxFk8iYEzn
	 ZeM7/5GOCqHbQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 8D0C7D054A8; Wed, 02 Sep 2026 17:24:44 +0100 (BST)
Date: Wed, 2 Sep 2026 17:24:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-sound@vger.kernel.org, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com,
	jekhor@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] ASoC: Intel: Add Cherry Trail RT5677 machine
 driver
Message-ID: <aphNzNx3G4qDt9X-@sirena.org.uk>
References: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
 <20260902123007.769820-2-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxpN5qKwKI0xQyv5"
Content-Disposition: inline
In-Reply-To: <20260902123007.769820-2-mauriziocasciano7@gmail.com>
X-Cookie: Orders subject to approval.


--mxpN5qKwKI0xQyv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2026 at 02:30:06PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91F/L uses the Cherry Trail SSP2 link with
> an RT5677 codec and a TS3A227E headset detector. Its amplifiers and
> headphone path also need board-specific GPIO sequencing.

> +static int cht_rt5677_aif1_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);

snd_soc_substream_to_rtd()

> +static const struct snd_soc_aux_dev cht_rt5677_headset_dev = {
> +	.dlc = COMP_AUX("i2c-ts3a227e"),

Shouldn't this be using an ACPI formatted name?  Doesn't really matter I
guess but other Intel stuff does.

> +static const struct acpi_gpio_mapping cht_rt5677_gpios[] = {
> +	{ "speaker-enable-gpios", &speaker_enable_gpio, 1 },
> +	{ }
> +};

We ask for more names below...

--mxpN5qKwKI0xQyv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYTcsACgkQJNaLcl1U
h9Adugf/Rr2Zk4uMwMWh0oIrz7L3A1KjVVrY6Hl5mmwhQB8K/fhNmtOmA85VE4p1
evyN3Bd8dUJD5mvRH5gOd6jeK2uN1E0iUYJeXe01Tq0IPFIzuAPsJhp5e3gUgvaZ
V+0tOybeM18iK/bAocjbB32+aXxHSZzV6Xr5Z4hDxjK1wogI4CYvEEEKl8jTuKnd
9TIJBns8fiZeTTS9n/lCJjxa79RhDYEtZhYoKeiI3A6cRXbVukKtebm2j9yGRU79
2OznFjH3DmOAJvaLj168+Vy/ej9rjd53MUCoZ3cfU7UmT73IkWl/kBJJWNMXEPE/
SRW4TZ7jOrXZtWAxaPgwUSYUFQndCA==
=LNSB
-----END PGP SIGNATURE-----

--mxpN5qKwKI0xQyv5--
