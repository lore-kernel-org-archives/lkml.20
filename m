Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A03AC0ED;
	Wed, 26 Aug 2026 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784734; cv=none; b=kSTZf07d0QLi1ntnXhfFFT7SuHAol48i/HzxJDO9RbTnMIIix9bXwuhXRJ2GannLQdeMLCQIarxFifvp6s1wHcVfeTOQADeUVt/wWrrZ6vcZK32bs3avAAjy/gq0KrSOgrDEV5Z1XhJQHSLs/nSSgE+vf5zv/0kYcl21heA9l/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784734; c=relaxed/simple;
	bh=Rh2EB7O6u3E0TiXhDWUwLODYAKGwpgxnOvJ6cg6COBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2wHbu2oJNqjgAvpL1i6CE4UJm7/hXhnHLDxqKhk9lsAT3WPMRF2IT1X6Jj7wG/kNhqstSZsjTi2B0X8838n/fiWY3wiU53a9uGFt0yO6WVEJOVlf1zYP07hSn+tokHFYAb179l4FZc8I6FD2FnEpwZvnesU8xEGm4YjQWmOThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzBFueOb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzBFueOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E051F000E9;
	Wed, 26 Aug 2026 22:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787784732;
	bh=CZS7C6LT6h7Nx5WFzFNwahcSwOuDoEqIvEI+dGRsD2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NzBFueOboRdqXkz83tXzn7vIqYttjtbSKdVcIQvFBtip1HevEfNRZxq804PMFzPkB
	 ul9poVOdYU2hzrNoQ8WmdZQv73jJgQ9TfxxATiDo90zk88WUBXz2Ul3ruVXLode2J8
	 7BguQRLlxdPQ4GBO2iFUv7i9GAmXExLNdgviEnbMzoHVGnmYsQfnMuMW+pSIkFv3YM
	 XQJrkj9jTqMIH2ejN4WXHZNLZclRmbl6C/w5A3ItqHbxx7HkW2dY+seRAJCmvI9/98
	 3bUQFAYqPwJX34U36ZH/IrLtacPfqJxpsDjnC3KRR6BUZEbf9nXfUPgM63VELJR4kF
	 beXoqFcx4gsBw==
Date: Wed, 26 Aug 2026 23:52:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM
 assignment for mDSP buffers
Message-ID: <948de620-a482-4624-8383-6b65eb28a5e9@sirena.org.uk>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MYKMonRN2WMXWZoC"
Content-Disposition: inline
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
X-Cookie: Obey all traffic laws.


--MYKMonRN2WMXWZoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2026 at 12:10:13AM +0530, Ajay Kumar Nandam wrote:
> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
> reach the PCM buffers unless they are explicitly SCM-assigned to the
> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
> does not function on these platforms.

> -		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
> +		if (pdata->has_reserved_mem)
> +			ret = snd_pcm_set_managed_buffer_all(pcm,
> +							     SNDRV_DMA_TYPE_DEV, component->dev,
> +							     pdata->reserved_buf_size,
> +							     pdata->reserved_buf_size);

Does this do the right thing if the ALSA core preallocate_dma module
param is set to 0 for some reason?  I'm not clear why you would...

--MYKMonRN2WMXWZoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqPbhYACgkQJNaLcl1U
h9AgGwf/WbUZ1UnidNl88VuYhNBqGsutsE4jrqx1YH25jZhaDPaw2FiW8LzOmPFG
kOvhWuVq5/ynYyJpFQYylvvKwqaZb0cZN4TCynMbyA/XeEZASkWTsujFz9O4Z6v0
GveQ589yFyo7dYVVxkl1+9FM4ymszIQ/Ic6E6cEep6+D6uSyAcyymIpS2OkD2YP+
WnRJVz2alv8YkOAKyX0uS3191Bi678W8rYu7XUrYsrD5T442Fa3/gPIBM/UfJSjh
BVntSB6PAFg0+gtFcGtYkqtedrBS5A63/wiLc1eOoIzII9v8rz5tsqH3IHDIqpvD
VHqd1XOZHq9aQvVUhML148a182By2A==
=MeT9
-----END PGP SIGNATURE-----

--MYKMonRN2WMXWZoC--
