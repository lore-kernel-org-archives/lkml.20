Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2A3C9ED5;
	Thu, 24 Sep 2026 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251463; cv=none; b=HgMajMxEFANSNjXuWfw5DfwFO6CqfjF7/sREsEVfE+xiArQvmlKYPWQvNZuYZDlwMYeYh5uTg3VcVPWOTYwqoxUAWWD60FmmJtMR3x85M0Qnq2JeyAWpHMpjsOY1ss4cyEzBnp1vjfPyl22fGVxtVPlplt62oji9po45HGI8KDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251463; c=relaxed/simple;
	bh=lZtzM67ZZS6o6CtJP+NWPrM6wRKSQjI+gZqFE12UoYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKk/CTRWPfNEAa/zCwnwG600GtRFfqCQkN/rloMelGXS0DPPXTn2dE9rkvVZ6rNH5QkWAK8c3GqxdiEW7wjxoO7WLT+asiw+ZeG9fIYlBjwP+sGKqXpZOn8QrKUZHHptcorO6kUaZJsrLlq6QoQLQNn82Petp28eOseuFglRF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8HApBs/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8HApBs/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC7B1F000FF;
	Thu, 24 Sep 2026 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251461;
	bh=cpNzIOf6JBg8PY3kgkufSnFkA9KEdOeE2vPEyyc4THs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8HApBs/bqL2niZIu5y5MMZcH1oSpsllMbogtMlXbpUmNUD0o42PjBA4tNMcegtnX
	 mluffjtBYXYmiH3t98uXwoDKdyYGwYdXKgYXzUtrkZH5kTKe/mValbQUjBz5DvMUc9
	 abu8To6eIbxLRsXAufxnN/BxK9NTVKQI4RE8d4+tOHfWWwZbX451ETXURIms/SUBCP
	 LHLwC/n16qQG/5rZJEB8H/nWkZn3+x7Gw3rfWItLU0yUvvzzROYzgCLxGaDTJuTHy8
	 bVKYdoAvx2uRIk3qlRwm7M5V8COIrGLXctHcllHw2e9p1XwpuvmuWRfDqvlOTp/xF+
	 V62khVuM/lrJg==
Date: Thu, 24 Sep 2026 13:04:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: use regmap_assign_bits() for conditional set/clear
Message-ID: <0a1eb6d0-262a-4e19-b947-e9c810a79261@sirena.org.uk>
References: <20260924083420.461715-1-peng.fan@oss.nxp.com>
 <arTxlkxUFjg8EOJ2@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyw+g88Kkc0aBFcB"
Content-Disposition: inline
In-Reply-To: <arTxlkxUFjg8EOJ2@opensource.cirrus.com>
X-Cookie: Oh, so there you are!


--dyw+g88Kkc0aBFcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2026 at 10:47:02AM +0100, Charles Keepax wrote:
> On Thu, Sep 24, 2026 at 04:34:12PM +0800, Peng Fan (OSS) wrote:

> > Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> > the simpler regmap_assign_bits() calls in the cs35l45 codec and the
> > mediatek mt8188 ADDA and DMIC DAI drivers.

> > -	if ((bool)ucontrol->value.integer.value[0])
> > -		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
> > -	else
> > -		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);

> > +	regmap_assign_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK,
> > +			   (bool)ucontrol->value.integer.value[0]);

> This doesn't work value will be bit(0) but SYNC_EN is bit(8).

No, it's _assign_bits() not _update_bits() so it'll set the bits
specified in the third argument if the fourth argument is true.

> Also would be better to split this patch into two, one for the
> mediatek stuff, one for the cirrus stuff.

Yes.

--dyw+g88Kkc0aBFcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1Eb8ACgkQJNaLcl1U
h9Ag9Qf/bbluKqqo8gwkquyxMVdUqUH8brqCm+6p+VsV9Vs6wCTg7IaHDuPkGuAT
X2z+UORhW3l9s437znTQK6dbJ5A5holY0VLcIxe8Gy5s0x7zLzsBZ8QJCmosx6R1
L8g9/Mp3AxicrwjLxqXPIFWl7UCkD0Qs4ovtd0nHeZT0dnzv4wh/FV9klrICnxE7
1YyvUMwTddCRcO7aVOSgF3v6GxtW94NT8ZSFfNIg0UwWZWYIMQSIFll0fuJRf1/N
BPcrjFX0hd1bNTtO8GpMwem5b57Mot8a2ma40Ojjw1AGRGofNb1oF8tCFQATFfYX
ktVmnIyxOXnEaiDvUlNphZo1jA/v8w==
=45lD
-----END PGP SIGNATURE-----

--dyw+g88Kkc0aBFcB--
