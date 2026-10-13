Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06652BE59;
	Tue, 13 Oct 2026 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913866; cv=none; b=aIKHg8cE6FlTdJAMDfc0NdSKcnSfIVqu+f1W8RVySX5Dl2mhVT4sGT6Zj7SP86AvzqV9RHkiw626s4cP3U+ImVgC++gurP6+uHNhHUQ5IKQLhovUf/V4eOTjQjEKP3RRHQp8QQ21qu6ZkrVhIC//nOxGrEPDBVcpeclaMqbIWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913866; c=relaxed/simple;
	bh=vD5fRfaeaWkj+ZGu2vIvObL2dpdWDKimRtwtWQr+D3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlthUxtQt/Bc2BCSVLdQkHZgRn1Txu7FyBnQJz9EsPtBFjrFvxZuX0SGAnwFCGT3Gn6mkFG1pRopMveWBUQhyINwV7Z3USYWIFJuDPH5pNB9ywLVogInoRdopdYl0+cepUqCU/YpcGu7mKKzIk4opfwLd1+dUvm27oftvxlTGGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a64bBD0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a64bBD0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B91D1F00893;
	Tue, 13 Oct 2026 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913864;
	bh=TlBOcrHV7Ks8zjh/VxrmRvdVhbz0DfHdxmu+gmL+0kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a64bBD0r0JJvyP+4075Pb++iBLDZ0ukmGa7jx7kSafkLoOS1mJGwANamvreSD7ZDl
	 OQkPYrx28wtrdCcJifhd6QpjxJictI5PMD9i3BQ/wKqbGkAxrsBVCzc+fygCVlyaEU
	 lK3n6Ag0uVeQvPWpmqi4U7cvCBOkLoxm0+xNhzAO0ob9zUmUIlTR8qiAVVtiIKa4D6
	 Mvatl3v7wqWkFVibXWwZhTEKVBHCLc69uAlquyQJvXrfsmG9VJr65FjZ9lPk/+hoa0
	 1N09ozYCqAJTGjkQKIpXxtoYe3yozRXP0ZMi+nVturmde2UGe4aqXLAMWH4K9fkFIx
	 eBPxAHPG3IxCQ==
Date: Tue, 13 Oct 2026 18:50:56 +0100
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 06/21] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
Message-ID: <ae2b9848-c8d6-425c-893e-ab2656158908@sirena.org.uk>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vbtYYCCIpz/5OgCu"
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
X-Cookie: Some equipment shown is optional.


--vbtYYCCIpz/5OgCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 04, 2026 at 04:03:33PM +1000, James Calligeros wrote:

> + * Return 0 for success, else error.
> + */
> +int snd_soc_deactivate_kctl(struct snd_soc_card *card,
> +	const char *name, int active)
> +{

> +	if (kctl) {
> +		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
> +		if (ret < 0)
> +			return ret;

snd_ctl_activate_id() returns 1 on change, 0 on no change, which doesn't
match the documentation there.

--vbtYYCCIpz/5OgCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOb4AACgkQJNaLcl1U
h9AYLwf/aQMd1A49AVVWSLal+oUhDhb+u+eE2UCj4TlvTucP2SjZBbIiudT1v3DH
Oa7vH82cpqNojB3T3P9lrxMV74PuaL/qQmErb9aCE0oS2dd+98jYmbIBcWY6GAcH
mpa7g4ufbQe4oHBnKKLffYcxQjn1Hs+u026oRVbOpox4gVi65973qHFCliEWFTSo
k79JtJ4LzX578YmyKLl/szQ+UCa+xpuV8+4yyhMQx2SOyzPFEbSBkTyULnePqmtM
rw/j993aXN6aYygCL7YvXp2Lr9FSNT2DMItFvXVXqGFgR5ZEd6wa4stS/WMLbAYh
8Io75MNDaQCnqUV6b5/CjzjD5d9OLw==
=Eq2Y
-----END PGP SIGNATURE-----

--vbtYYCCIpz/5OgCu--
