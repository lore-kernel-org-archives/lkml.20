Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2C35F180;
	Fri, 25 Sep 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344848; cv=none; b=B6WzOzcblcMu1pnaRQJtDIP6Ong/Kh48XWce6866AN834XiMebAXqbPtATft507ExA1/3KkzBqqIW61VRry5B4DzQtZd8KtO38uTeLM12zhowBl1JMvDHmLLA3eGYL3UZ6EHeu0uQeaACK8lV+ZEgTa92OkhCo8HVDw7SXO3gNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344848; c=relaxed/simple;
	bh=/D7OLlAcSt4bHGM6mQVL2tDwdF72U2tVdBVQLq6CrgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPC3JaCluADmQhYFU9g09WeiH2XGlyQJoYTdFV4CaPvzCsDOJdGe5NpgiC+fKHLsQbr8mEHfLWHdZOOvGDpAKebJg9QpRvbrLBWkdiqs5HnsqbP9Wl8bmXDtcSWQynzfd8WPf5CGOlRDoJyPVfU1FbyZMVwxdEICijdnlmZGvfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCwhotO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCwhotO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C094E1F000FF;
	Fri, 25 Sep 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344847;
	bh=miitlFqrZJ3O9f+cCMnSVGG6jxgp5wyJfCxurXE3ANQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VCwhotO3kSlrDkcBmXFAxNYyyNJOkNcK7Ux9Dd4nk0be2BG+oJFEsOjIeHXlH5mOW
	 PIXNdPSHjGD3tDCS6A9YRAe1dgGUg9GU2mc6t01b4rIdhzNI6dSGKzuWPoFvHCR+2Y
	 QVFqENDPIMVS/dXbnLy8Vi7Di/u/9aBy7Z4unEn8iz1kmYkgpQGXDvq1b8qcPLshqz
	 24cUJIT5ivMSssUltWhhHuJAPPob4NHFhKi3GJV5CftLKG/UeANK4EFPNXyofl/3L8
	 qQlZ/jS/G48JzCPCyR+A/VbvmglxLQ77JzVFqozKpBL3hYlf0Eksz295w+UIJmPcuJ
	 8dyC5ZyQ3O9Og==
Date: Fri, 25 Sep 2026 15:00:43 +0100
From: Mark Brown <broonie@kernel.org>
To: webgeek1234@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 1/6] ASoC: codecs: aw88166: support changing sample rate
 and bit width
Message-ID: <93d91d10-3d3c-4dae-bd5a-62a2f71458a0@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-1-11f74cb5fe28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FTu+px7R4XOd4BJN"
Content-Disposition: inline
In-Reply-To: <20260925-aw88166-cleanup-v1-1-11f74cb5fe28@gmail.com>
X-Cookie: Love America -- or give it back.


--FTu+px7R4XOd4BJN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 02:47:29AM -0500, Aaron Kling via B4 Relay wrote:

> The aw88166 driver only worked with 32-bit 48kHz streams so far due to
> the lack of a proper PLL initialization sequence. Fix by selecting all
> the necessary PLL settings based on what was passed to us by the
> hw_params/set_fmt ops. This replaces the strange downstream routine
> that tries two divider modes in sequence.

> -	ret = regmap_read(aw_dev->regmap, AW88166_PLLCTRL2_REG, &reg_val);
> +	/* PLL divider must be used for 8/16/32 kHz modes */
> +	ret = regmap_update_bits(aw_dev->regmap, AW88166_PLLCTRL1_REG,
> +			~AW88166_CCO_MUX_MASK, aw88166->cco_mux_value);

We seem to just completely drop all reference to PLLCTRL2 and switch
over to PLLCTRL1, I'm going to guess that this means that something that
used to work now no longer works...

> +static int aw88166_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
> +
> +	case 32:
> +		aw88166->bck_value = AW88166_I2SBCK_64FS_VALUE;
> +		break;
> +	default:
> +		dev_err(aw88166->aw_pa->dev, "unsupported physical bit width %d\n",
> +			params_physical_width(params));
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

This doesn't touch the hardware, it just writes state so if hw_params()
is called while things are powered up nothing is going to take effect
until the next stream.

--FTu+px7R4XOd4BJN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2fooACgkQJNaLcl1U
h9CQagf/VJ3Qdqzt5DWOXKiXjLnL4JSOL5OU6LUK3UmwqOQiAmvIbiP6jH0mGuYH
3WAkMfI9GSoDkItViKVUL7I0AyVTRpkklT2pz0ElZukygBktFs9r9iwHE7UP/73I
hGEBIwWvJZACHPb8TYlz53fgt/PAbN4Lb4xNUf1LS2+1dzE1+lRNLt6JFmoxLKUq
HYPzevrIcO5Ob58SRWgVPwoVsrTeVi8FVhmjeTIN7+HHDhKsWLRnMyYXhyOr5k7x
OY1mZ2gq52k9Wa4tWf7Sy6P4t7LdEpg5XhHSl1jQvwzguUuJV4oQCL5SZsOxotvD
kamgznXoJFugw2aaS+QY5NZRtAKrOA==
=iLDV
-----END PGP SIGNATURE-----

--FTu+px7R4XOd4BJN--
