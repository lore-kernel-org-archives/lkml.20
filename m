Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCF45FFD9;
	Thu, 27 Aug 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835923; cv=none; b=jmJn/nvTdMMua9NaHzJhqs7HGW17lGycGTHM1dtYpMzDhwzbw8VasSlbqRn0AiZU0oXcNIm8Of2rkq7d4n0JkE1Xrrggrts9SoM14ovg2a9SaSofih5UOgyHSnEv08Ju4Of4JvPRj2c9EhphPV/oEg7zp3qEFy1+l6Sdr48imcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835923; c=relaxed/simple;
	bh=AteT2pQsVcjrkJV+D2jeAV1doOdHG0LconUmSxsnWpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPTrG/pKM2Y0HyFuKPVn3Bj8PEaAVMzJX/z960Yr1kAjKsmwLvj1NC8VD9NWhiyHqkuHOeupU/K6ZXO3HAFjxyPtgBS7faj1J+GovQj1KHWkQMW/36itXjTQ1uDgzcR5gluxQsl/3qiTsdayH4vHhmoZrWI4Q+MU375RF3SbjvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnOEryNu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnOEryNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E251F00A3A;
	Thu, 27 Aug 2026 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835910;
	bh=5N2NHwJ9ekiynGs9A4R9WYmF9Lz/Lz4EWA7of7Z5Lgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NnOEryNuYlH832ez6i90oIGqNA+xgOZPP6jhlZb2rhV/Dm3TFq3HRzI9f5WLxboTL
	 ryWIwoGxQKY7CeDv9ciNI+wpZoq5b1JyofLv3OsOxqx6pnPANckzJeV70cIRyu3CZ6
	 rFCw/oJjJj/2OvdYgod6LInChkb8Q16tbBantpvbxZD556S0CXMF7UMrJuORE/1nFV
	 gsHRwHIQEyHzhsFJVxwAx1HVtEXdn+QY8bDi2BUFcxVz9iHukQCpBbDPkGIRCLrq3R
	 9RKYc2nJ59hy6zY8ekHM7Bg0B0V+1dlG3jyFdokQoiNbw4YKmiAMCMVbFagaJhlrHa
	 U4ffjg96V0Yeg==
Date: Thu, 27 Aug 2026 14:05:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: Intel: Add Cherry Trail RT5677 machine
 driver
Message-ID: <901421b8-6e7b-404a-ba67-10c3166911f9@sirena.org.uk>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
 <20260827072517.1401173-2-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="02JyUJ345uZ0PE2y"
Content-Disposition: inline
In-Reply-To: <20260827072517.1401173-2-mauriziocasciano7@gmail.com>
X-Cookie: Alimony is the high cost of leaving.


--02JyUJ345uZ0PE2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 09:25:16AM +0200, Maurizio Casciano wrote:

> Link: https://github.com/jekhor/yogabook-linux-kernel/commit/4e41d0ff72c1=
d1fd8d5c59dda247e4ca8a1da999
>=20
> Link: https://lore.kernel.org/linux-sound/20260611-asoc-yogabook-v2-v3-3-=
3128447b67b6@gmail.com/
>=20
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
>=20
> Assisted-by: Codex:gpt-5.6-sol sparse

This isn't how trailers should be formatted, please look at other
commits for examples.

> +static int cht_rt5677_codec_fixup(struct snd_soc_pcm_runtime *rtd,
> +				  struct snd_pcm_hw_params *params)
> +{

> +	/*
> +	 * Configure SSP2 for the 24-bit format expected by the codec. The SST
> +	 * ssp2-port front end still advertises S16_LE and converts the stream.
> +	 */
> +	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);

params_set_format() is addative, it won't clear any existing format that
was set which is not what you're looking for here.

--02JyUJ345uZ0PE2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQNgAACgkQJNaLcl1U
h9AQswgAgUPt0bIXdFJSZxVT7TpT208MNCIDuuCtxIVhf5YZtT+z2frAM/cjl89l
kc3TAfzKH/wT20JTj8YzuPkZXUHRjsog7oltSyIIMklJZ3ZMASLDLoUr1/a54hTS
ccEbDb6Ot2RumCNbYk3XKwZNTw0cmE+qj6YxekgmADzR68Ns3LXx4Z/7q+kL+iQR
IPAJ9qV4hT8Bw4dDEGEYxGCleUzywMDNYlf9vnnrNcc5QXaKa9ll+Jb/LrTjikJT
tLinGIueSE2SsofLk4uNFj84EA3aafGNWRVhHWG0ivUGmnASFsOI3pH2NWwHhd+7
XocLVvWC0Rr9l07pNWmPqS9qxlr0Mw==
=4+xY
-----END PGP SIGNATURE-----

--02JyUJ345uZ0PE2y--
