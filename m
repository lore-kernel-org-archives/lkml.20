Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231523CC324;
	Thu,  3 Sep 2026 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464082; cv=none; b=To5cpFA71ZUkJySifPxLxPUDTDNBy/Zvg6uETL6BQ5jmOpX69whp39ZJC+MSPNxQRvw9WEinM7bof/joyP6TKnTrchf9KLFMmCc5THeh+ztqIQETCuWRM8bIFnin4lgv69o8/6XpXZk63JaysC3RkWOEBXSG//m3KkGmg39gT1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464082; c=relaxed/simple;
	bh=u4s+iu1Yf/TCUJM4nazk6EEs7+nbgAwdFjRgT5lfTNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bu7oX1Pw4DKUILyOrdwh1TlTRlhOWp1n5uzdgsG6QYK9HaR2mViasWgw6B3lwzIUt2et+/mWwah1m9drm9ACqj9If2yrZ8Uy8uLjS5yGiISVSmXE0A4B+2f4wTEHlf4d02YOa2kbjISB1nA8x+ZhO/y221X6YmMNJwr0K76W4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7Ka3A0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7Ka3A0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBACB1F000E9;
	Thu,  3 Sep 2026 19:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788464066;
	bh=suZkwiMct3hheO+EMb3kqYfGhwlptuBzYRAK18xvSag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C7Ka3A0tFrBP97oXyJYZ2oYHhKC0LGOMBHKxyQCcKqhtfRewxwpIQ0tILw06wJipl
	 vckG9F+J+jv1UokOafhGPhXpUcpduJKIAKP5TNIHB/DKzNfI8tLtkDAAdZJCzptCjS
	 672l9hHiHUmv3nGxo6adBI2dK5vAUyposED3BRFn6t65PbUvOXMUzFnie+JAx1kDpj
	 ej0GfzwYgENJi3hzb5vDkyZ6jLt2qegHX4iODJsQnQyCkbYcg0pIdBRrR1lY4+ZZ4w
	 38AJ7Jb0r7hOyGzidOO9780UelZ7mf2TAzpBlsyQdh2osnFvl+1DKVWcI8y2pmxToX
	 T9zYnqJzG2siQ==
Date: Thu, 3 Sep 2026 20:34:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/10] ASoC: qcom: Add QAIF PCM operations
Message-ID: <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-8-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MWtWDsgRn0acMxSD"
Content-Disposition: inline
In-Reply-To: <20260903072902.3870009-8-harendra.gautam@oss.qualcomm.com>
X-Cookie: One picture is worth 128K words.


--MWtWDsgRn0acMxSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 12:58:58PM +0530, Harendra Gautam wrote:

> Add the PCM platform callbacks needed to use QAIF DAIs for playback
> and capture.

> +static int qaif_platform_pcmops_open(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream)
> +{

> +	dma_mem_info->alloc_size = qaif_platform_hardware.buffer_bytes_max;
> +	dma_mem_info->vaddr = dma_alloc_coherent(component->dev,
> +						 dma_mem_info->alloc_size,
> +						 &dma_mem_info->dma_addr,
> +						 GFP_KERNEL);
> +	if (!dma_mem_info->vaddr) {
> +		ret = -ENOMEM;
> +		goto err_free_mem_info;
> +	}
> +
> +	mutex_lock(&drvdata->stream_lock);
> +	stream_dma_idx = v->alloc_stream_dma_idx(drvdata, dir, dai_id);
> +	mutex_unlock(&drvdata->stream_lock);
> +	if (stream_dma_idx < 0) {
> +		ret = stream_dma_idx;
> +		goto err_free_mem_info;
> +	}

Shouldn't this be err_free_dma from here on?

--MWtWDsgRn0acMxSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZy7sACgkQJNaLcl1U
h9Aw8gf+MPFVo6tdM2uz9W0LOqpoahJ5Tvl0gxFLQ0o9dQdyf442MneOMMvTcKP9
UhuFh6K0LgSNcy6usGkPJVzJeXLuvB2zEhpf9YMSXjE0MvuuNMoTXa86/AXLrq4s
CSV8SF/G6H/eGfqRA0fw0tu5+qhQAvo6UJ4frejJ3DB/rIpo2y2NY8uh/wdmCMb5
wTsEfCd6BtF5J8o1bmgj42L4GBVy+qMq4CPoaYAoYu0srtFhLQkhAf7khj1KGcMq
SFldrV7d7XdP51Ygw+ztGGjK0cIuN3STH7NCXgHTlaXK5RM5W1JN/1+D84B07K4T
9aJgrG6/adFeIRjLzjMEF7K8dId5mQ==
=O6UG
-----END PGP SIGNATURE-----

--MWtWDsgRn0acMxSD--
