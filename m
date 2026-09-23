Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDFB414DF4;
	Wed, 23 Sep 2026 09:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156735; cv=none; b=YWwR5kDcnHofuuAz7uaJnJjT4Xhhtt0C/xR24L1j7ge2REsCxOIIgfwt8OSIlh0ZzL9Gd9ojMQ5ABWqKTWLoUx5xLTBfc5csC10jQnKvS8+KOGSw02SYH6ULnSJe7pdOQeSQ64qLma4WfMAmeOW89ZFlMa15YQ0vj2R2Si/6oSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156735; c=relaxed/simple;
	bh=Ube8kn2P3BCPhYrAYjq7xDwqyF9VEQh8pAgyIv1Rork=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR4oJQKjTQO6h6LxwsiuYJ/1RboxKbmec3UyWT7hfV8q9EeIO+sXaQodW5xU3vdefJ0rOwuNHFFnRD0Hk9yBhJ9fWhJTucZkx/vxNWu9XhIV8tV70jEOqyDXaGjBrmmItBE2NQ291MwmS0+pe2K81AeoXvRp9KwgpZBfhPNMcYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okuFB37Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okuFB37Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3DC1F000FF;
	Wed, 23 Sep 2026 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156733;
	bh=YEEnur3s3rC0Mflr55H1yIyOHjYYmIlYX5pEaRs+FD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=okuFB37ZHvRO94mQOXv9BeVw1Pg8xo1D93fFWqoOP1/tsnt7h52Dq+Xbj5lOMpVUG
	 aTKJXOWzar3q7IEZtXL4B9ABUyyjM4ffTk8lpKXrod+mkpeVp+VJSuYQd4hCKreBS2
	 +1N1EFmVMhTdzxnisZnip0xl2ZaYv8n0QI78IIZMUPW3dRWBlrV7TYeqxHSik8iIfL
	 ISie0r/cl1hdEENOgdDxpeFD6W++gSllaDzH56JKHt5XZVlJLgxykO/M0qhdHlPiAt
	 VACVOh7VXX6+XdWVZezdOk7iEYr/kELDTGbzV5LLaxx93rUx4vgY/ClhFc2//mPGJq
	 RXYPNLdLerCnA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 87BE11AC5737; Wed, 23 Sep 2026 10:45:29 +0100 (BST)
Date: Wed, 23 Sep 2026 11:45:29 +0200
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: Re: [PATCH v7 07/10] ASoC: qcom: Add QAIF PCM operations
Message-ID: <arOfufqav6zRT_Rd@sirena.co.uk>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a5mAK43x4cyqjWo4"
Content-Disposition: inline
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--a5mAK43x4cyqjWo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:18:27PM +0530, Harendra Gautam wrote:
> Add the PCM platform callbacks needed to use QAIF DAIs for playback
> and capture.

> +static int qaif_platform_pcmops_open(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream)
> +{

> +	dma_mem_info->alloc_size =3D qaif_platform_hardware.buffer_bytes_max;
> +	dma_mem_info->vaddr =3D dma_alloc_coherent(component->dev,
> +						 dma_mem_info->alloc_size,
> +						 &dma_mem_info->dma_addr,
> +						 GFP_KERNEL);


snd_pcm_set_managed_buffer().

> +static int qaif_platform_copy(struct snd_soc_component *component,
> +			      struct snd_pcm_substream *substream,
> +			      int channel, unsigned long pos,
> +			      struct iov_iter *buf, unsigned long bytes)
> +{
> +	struct snd_pcm_runtime *rt =3D substream->runtime;
> +	size_t buffer_bytes =3D snd_pcm_lib_buffer_bytes(substream);
> +	size_t channel_bytes =3D buffer_bytes / rt->channels;
> +	unsigned long offset;
> +	void *dma_buf;
> +	size_t copied;

If the buffers are already memory mapped why do we need a copy()
operation? =20

--a5mAK43x4cyqjWo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzn7gACgkQJNaLcl1U
h9CCrQf/dKYHsrN2nFZxcCWjZtrnWknBOss6IXlwY8bAVNMpIUoaBlduns0RLq1g
MT/AupMLNasVO4K47cUZj5o1T4emjSqRHIW599Ls37nbiI9Y3JgqmfZysJkft89g
vD+aPz/ZZfZOkRDG3kmcnOfNlof0Ye73/rUM8/KQsVLzetA45XMci/5o7e6pGt+J
S/Qa5b0oojdIsboArDxekxejRkfeFx6lUS5axnlPPVxY8IkVIwsA/6NIU0Paebmd
BLZh7YS67LvjcPvTi1MqyvVHeduGbvaBD2jcqgveldLqCkDr9m9ro0RAi8yNAvjg
3tghhIriZ72F1Slqt89GsHfB9y1I1Q==
=tfSA
-----END PGP SIGNATURE-----

--a5mAK43x4cyqjWo4--
