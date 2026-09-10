Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2208625A321;
	Thu, 10 Sep 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061037; cv=none; b=RFeX3B0O9FhIcgBWTr+B4gNpxj3mLWWm2BkQAVDIqHWcfdcR7L/V7mrMDbHrD6q1fU9cptB3R1VgXbnzPVpXkNwvR11jRxgE8Io2dvg62JzDarEXXFDhBVhpNYYrOeZYKC5ZuSHZ94bohnTvefsM/uZTnkDBNDY9bGD3UrpWCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061037; c=relaxed/simple;
	bh=Hucj9uymLkUxkwbSaeKv/BEXQdE+g+JvNGNYDswB7Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsEesPNqKWLXpnD4sd41U1LXjKOAGKqXW0PO2SSyPpezeIObR5Rcwo0Q5KHjF4OobK6Tq5imGo2HpWh+OPaa0TZmJB7RXqp7Medt8keFaOtzZDCzzQQPFqNazcl7RmB5ZN8mWp/Lm61EkjMwFUyHiOtMIUlIrzDxIdgI0Fi5JWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7+Y6Ka6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7+Y6Ka6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469241F000FF;
	Thu, 10 Sep 2026 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061014;
	bh=QXCYnu9lQkfFUVZPWLXmxfPVjc+5rvAy8d0P0u627xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E7+Y6Ka6Nk57kLrhxFXEi4lqtDIj42F6cFLdquLIJHRU3BJwdIl5V0ZIEKxF78yuT
	 ygGgCU/Nf2GEDYamHUWHmWpPzd548bc7aOq2XIKfIgWuFgKCccHv2SFEKBOirMVB4J
	 kNITA2qnZ29pb9Ba6A1dVLvO61W8x9RQTPgG6Dq8LeBwIJ7qE/0OuzUpv2mrWU1zJ3
	 UcAdtUHCWQGw/gKu5YH7BdmnOIqNRBLqwiMMw2xSSORXDw0oggTagqKdfeVtwR+4RA
	 v3C/d4cOwwS3614QJ7tGn1/G5IkfibO/8ojeAOmqVzH4IPPlTlEEfm0Q+TsHbL1AxO
	 LQq2XCSthuphQ==
Date: Thu, 10 Sep 2026 18:23:28 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM
 errors
Message-ID: <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FojIabTh4PEnaq7B"
Content-Disposition: inline
In-Reply-To: <20260910114338.142682-1-phucduc.bui@gmail.com>
X-Cookie: Gravity brings me down.


--FojIabTh4PEnaq7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 06:43:37PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> mtk_afe_add_sub_dai_control() currently ignores errors from
> ASoC control and DAPM setup functions.
>=20
> Propagate these errors to the caller.

mt8365-afe-pcm.c has:

    {"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1", "Hostless FM DL"},

missing a Switch from the control.  I suspect there's other errors; this
really needs to be tested before it can be applied.  Given the general
quality of the driver here and the lack of anything constructive we're
doing with the errors changes like this have high risk and low reward
unless we're actually running the code.

--FojIabTh4PEnaq7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqi548ACgkQJNaLcl1U
h9ByLAf/YRDHKFMWDL4rpTtoEIQrI5nafwSGaOyH6yCyA57y9aVezzqFFkaQj7S8
+zrOPtx0U5/6ynt0fWoazqHxihGIJ7CswnlrQCYja9CC9YpsF7chr1d1rbWk6Np4
+MhIKL7+B44k4Tl1z5CHhjJwqvGMcgCIcPBYDWD3gQTIm3dMzTGyFTSUFmsgLAHK
uqBPjvRq/gshHEM5VdTMFiBekdkYTJ63uHOHYtj0rSBd4sLc+M7txiLeUfPPyBF/
rvqdMN6YVyWwG5Yn6aGyG3b2Y0W1r6nYaA62uSnIoeHvVdoTkpYaK0QiIEix0lls
GzAaBBQIrJgchPzqh+Och5hH+bFFIA==
=S+uQ
-----END PGP SIGNATURE-----

--FojIabTh4PEnaq7B--
