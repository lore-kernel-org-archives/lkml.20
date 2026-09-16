Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0613803D0;
	Wed, 16 Sep 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571415; cv=none; b=IB/3b30LC1m6CZoNYL61zGDxcG779kr/CvJev5OfmaYXg62UcM7Ew+vc9HWJnI1xy16Z6iDUyiNbEw36iJDna8GikktOkJyaS5IfU4ikDxCXBFD/af8bRlxN/3oEuoD0uTFxb3+5pX5rqrHajuqzgL5JUsbG81Qg6G2jmHph+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571415; c=relaxed/simple;
	bh=/rcMOwcawxMdtjAilt+TqjxShNkBrmtMVVIjZN5cdfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rvd8Jereji5QtxwE/w7o0MI1e74fuclYsyJXvKTPRu4gAF2MLHCcmCIbWTmSIvsg9DRtOhZrlSpwo62yz0+AvCW6sqtrCAetX3MQKwySELvR9LJy/H9Qw7GW0ndSkI8d8vdejqXZ5zELfRR20Q7fdydLQ4D0OnmhD9LvONlUOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1XNtHB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1XNtHB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0318D1F000FF;
	Wed, 16 Sep 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789571414;
	bh=i3mbAK07lJIQZ5e6ixX0pGgI16Y5e88sohe7LDJ4u4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1XNtHB07Dv8jIQG5E4phGag7m/ed9bAggWzED6nMWmXCUK6G2+Dv9yzABdv7w2Ut
	 9jolVh8BsNV3iJ+BDEHufe8SkJRRg2a8ZWy70dF6OVkBm6DhAoQLmETadvmafNBWXw
	 C2RbbfuosXjbqcGlVYgHMUB0Elz3HsEHlaa8URrVGzlP6CQrQqoaUoBgZVPz0cwgF2
	 31DQrqqIpQIU/dsEkADkzgXvLxqRywEDSJIGieOAPS0HzOWKfcydpPAltgMbB034sD
	 t5azNw/21/PsFB9QOrroEvhnFR3vV7/w9rEIvC1MPATaU4Y2RIQyoyAL7NgtlRyU7X
	 ynsCsQErj0+eg==
Date: Wed, 16 Sep 2026 16:10:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Julian Braha <julianbraha@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
Message-ID: <f9c9aef3-6e0b-4f7e-914e-35a82b5f962a@sirena.org.uk>
References: <20260915211658.1671821-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R1yQ/9HMfkfcH3Na"
Content-Disposition: inline
In-Reply-To: <20260915211658.1671821-1-arnd@kernel.org>
X-Cookie: Double!


--R1yQ/9HMfkfcH3Na
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 11:16:34PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>

> Selecting SND_SOC_SDCA_HID only works if HID is enabled:

> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1992,6 +1992,7 @@ config SND_SOC_RT766_SDCA_SDW
>  	tristate "Realtek RT766 SDCA Codec - SDW"
>  	depends on SOUNDWIRE
>  	depends on SND_SOC_SDCA
> +	depends on HID
>  	select SND_SOC_SDCA_HID
>  	select SND_SOC_SDCA_IRQ
>  	select REGMAP_SOUNDWIRE

Should that be HID=y || HID=SND_SOC_SDCA like for SND_SOC_SDCA_HID and
SND_SOC_SDCA_CLASS?  The dependencies on _CLASS should stop the
problematic cases from actually occurring but I'm not sure if it stops
the warning.

--R1yQ/9HMfkfcH3Na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqsU8ACgkQJNaLcl1U
h9ADhgf/dvvQMVvwjM+Ig75S0ELaFEz6K5oMglXaJ60ag8uRATcWY3454fGkQNVB
j4KKiQTzluRVjsCJ1h8gkZFw2LHMmxHNFK/O29Qz2G14qT+yR0F8+8G59dVS/x5U
EBFESKiK0VOKmLo1+Y7LN487esRbOsdZ4Q0BaemXQfMAud9rNoaLr8QPOQaZXfpY
tmP58lv5tXsIy8cRRV8N/zZ8isArbwsbaDgbSkq5BcmcJnOcRFRaCvx67flOWilB
zlEJmMbmMW2If8PiVAxhSfRZviGvdYF2AuVnYN6hDa5cElsHhC+KYXwgyzsUJamN
vkZFlpP4x/59u2KKBo5RwvYge7q/9w==
=sMZB
-----END PGP SIGNATURE-----

--R1yQ/9HMfkfcH3Na--
