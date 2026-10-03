Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4337DADD;
	Sat,  3 Oct 2026 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038122; cv=none; b=QurUZe9VoSFfMfW1j/i+WILK+YXXg/gN895xECdxLY98T8Nnn4Jg4qQlSjnlTSx+JEA1Jzcow7wM1adG7APpG8VUSO0OsTL+P94UsQkODs5gXCwFOQA6wquxQ05aBdg4l4NbGMLhSLoWkl08tAyFputndoijII+k2C6tZWm4Ht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038122; c=relaxed/simple;
	bh=NAjrL1JkF6EDw+nhNXITlH9ICONMTArYO3x2qA5YUIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7+7VY4RxmaQCA9n8zmJ1PfqUiR320FSwO8GpYNtnrdrlv6WGoZ1Vdp7aNWd7xfCPggjKN7WtzzfeVNeaKNwYsEN25MO3zoGYKCt9gLMrqEREOKuhnBFrKRT2+koCv52kBE3/BNqg5zR47kl3FQfv3PCOPyJ6hozqraXLor3I98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWB4Fb3L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWB4Fb3L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6AA1F0089B;
	Sat,  3 Oct 2026 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038121;
	bh=a9OOJ2qmGtnw/zqCDkpqedwIrbMwoYyNLYRbTgVDKXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XWB4Fb3LO7VY8+829JpfcOM1Z4ohvxKpWJ+bPA6yDd55IlizVv27U7hP/JiFxe6zt
	 GXmMHjwaD3A5DthIYPYm9Si67fC+f+NmkTZwqlUS5z58W2i6u8tMmrdkHJBUgqMI0Q
	 WNSQj/RLxLWeKXMflCCaXjnwX42hN31Wl22WK/oXrgq5mZz+NrkH936nWB3GT68Tlt
	 EEu0aXwFMdGdNVsrHoniJ2x++YTWX75xkyWlC/v2DLs0WnTWyBJpHnnog9Z2G8+gmr
	 IrdMOEhURjnyo3QHSsIxaakS+IEvAUDxRwYJyoEj/zb9LAUmOs6CbRReYtto54z4G7
	 q9t6e1YQFjqqA==
Date: Sat, 3 Oct 2026 16:35:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman =?utf-8?B?U21yxb4=?= <roman@amarulasolutions.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
Subject: Re: [PATCH 4/5] ASoC: pcm179x: Add pcm1796 as compatible with
 pcm1792a
Message-ID: <20261003-generous-angelic-spaniel-181ab2@quoll>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
 <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>

On Fri, Oct 02, 2026 at 11:49:33AM +0200, Roman Smr=C5=BE wrote:
> The PCM1796 is fully compatible with the PCM1792A.
>=20
> Signed-off-by: Roman Smr=C5=BE <roman@amarulasolutions.com>
> ---
>  sound/soc/codecs/pcm179x-i2c.c | 1 +
>  sound/soc/codecs/pcm179x-spi.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2=
c.c
> index 5337bcc7c62c..e81e20fadadf 100644
> --- a/sound/soc/codecs/pcm179x-i2c.c
> +++ b/sound/soc/codecs/pcm179x-i2c.c
> @@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
>  #ifdef CONFIG_OF
>  static const struct of_device_id pcm179x_of_match[] =3D {
>  	{ .compatible =3D "ti,pcm1792a", },
> +	{ .compatible =3D "ti,pcm1796", },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pcm179x_of_match);
> diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-sp=
i.c
> index 192fee90c971..e5e4b942acfc 100644
> --- a/sound/soc/codecs/pcm179x-spi.c
> +++ b/sound/soc/codecs/pcm179x-spi.c
> @@ -31,6 +31,7 @@ static int pcm179x_spi_probe(struct spi_device *spi)
> =20
>  static const struct of_device_id pcm179x_of_match[] __maybe_unused =3D {
>  	{ .compatible =3D "ti,pcm1792a", },
> +	{ .compatible =3D "ti,pcm1796" },

Why are you updating only one place?

Best regards,
Krzysztof

