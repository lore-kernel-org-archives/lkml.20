Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A92931DE;
	Fri, 25 Sep 2026 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357492; cv=none; b=iqmfV0pGcRXlV7U0q0jOSgk8JL9WlreW+g6+yQ/dRBF0rMONJ+/d9NTh+IgLfxiT7omaOZZcZWff62etpxIdj5ZL4LN4cBKukEUWXt+lEcMvmY3l6fddMhqiuxBUABfdjsVR5Vl1lVmCt/cdUe1gvkaG8D0RVsXMJ33s9lzYwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357492; c=relaxed/simple;
	bh=8zaxvuM9ZW3isrk+vgo03BgKo6l6ox32HTb6wYiMJ7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQg92/Zo4MB8Cwj76uHiXAfb2WUNZX6hydIqkmiw5LHUC/ySqF2OcJtU0l8Ji+ShqR4hzJQflHdRVBTJDGKMihX1AdghegrqELq7II/GwU5TCiXhCA0R3S3dFsrBQ9ty2cJ4mJM21N0Tt9j5PHwAwG/Td4BsHMqS7YTM25/D+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDii75er; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDii75er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BF11F00898;
	Fri, 25 Sep 2026 17:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357491;
	bh=CU8/3FStPs21uHCF0vCBdtC0kkoA18hsneGo7M9DKuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RDii75er0QkuQ23DAGmCWgjYPxAdpURlEQne5obx/yhOFyOQowRy2Qq5fYzDXWuCl
	 W5cOnXGDlOnCY3ob+n4kWalWj4bkjMRnCx3n4Tb9Ws66CKjbT7uNChqeqe3W2m53n7
	 rLaWQa/DtVXK/vB4dSA7F1R0mh8oHZraNd6y0Uv9xvdvdR0RNPXulaNniUQeZ3AnoJ
	 9K9TfibOWqsgibXHXCbGSn1pInf0Wbt8tcY45pm6bdzCkXisNv8eEYq3Ukveq95UYJ
	 T8IqhurIC7Pbwy6tGlYHx+wvfGjWIBut1Ml6l72yLdgx0SipGS1ixTrKOWIfD/s0bL
	 bd/zOpDgwZLUg==
Date: Fri, 25 Sep 2026 18:31:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v5 7/7] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
Message-ID: <e3797f4f-2e46-46ff-99ff-6ba9324bb427@sirena.org.uk>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-8-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SjxQyCN2LFaDkbso"
Content-Disposition: inline
In-Reply-To: <20260925161049.758913-8-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Love America -- or give it back.


--SjxQyCN2LFaDkbso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 05:10:48PM +0100, Srinivas Kandagatla wrote:
> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
> mode over SoundWire.  On ARM/DT platforms without ACPI/DisCo firmware
> the SDCA topology and SoundWire port properties are supplied as static
> data through the codec driver.

> +static struct sdca_control entity_fu6_controls[] = {
> +	{ .sel = SDCA_CTL_FU_MUTE, .mode = SDCA_ACCESS_MODE_DUAL,
> +	  .layers = SDCA_ACCESS_LAYER_USER, .cn_list = 0x6, .nbits = 1,
> +	  .type = SDCA_CTL_DATATYPE_ONEBIT,
> +	  .interrupt_position = SDCA_NO_INTERRUPT,
> +	  .has_reset = true, .reset = 1,
> +	  .label = SDCA_CTL_MUTE_NAME },
> +	{ .sel = SDCA_CTL_FU_CHANNEL_VOLUME, .mode = SDCA_ACCESS_MODE_DUAL,
> +	  .layers = SDCA_ACCESS_LAYER_USER, .cn_list = 0x6, .nbits = 16,
> +	  .type = SDCA_CTL_DATATYPE_Q7P8DB,
> +	  .range = { .cols = SDCA_VOLUME_LINEAR_NCOLS, .rows = 1,
> +		     .data = range_fu6_vol_data },
> +	  .interrupt_position = SDCA_NO_INTERRUPT,
> +	  .label = SDCA_CTL_CHANNEL_VOLUME_NAME },
> +};

Why do only these have nbits and type?

--SjxQyCN2LFaDkbso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2r+wACgkQJNaLcl1U
h9BjZAf+P+FCE41A3coeuFx7xgFIBhNG8FB/yhOQN5xDBaS28U8MLNeywuRKbotu
cZacw804ilmv5OyO2IO1nqTyTJr8w6w9d7O3dfBEtoC/ufi3dsqP9knQ2vyLK7vd
v2TF9eDzzNsQx0J3Cx8rSMHxkeNG5q6R/fWJoZ4gNtT5js+g1Eb8e9txI8OC18Wc
nfFkFiNjgcSE4CfLW7NU0ISA324oQmZOfbrNnzfy1mfp2aIPfEd7b4AyFQw1xr4+
G06mc/Yzodm3VHdo2lTT9tHlTnFO0iP4084zWHzApIRCE0CZRqU/jQQEVjIXplF5
BEeN/mJQL4NzNS2FhjLyQMOpSGzcsA==
=6ptd
-----END PGP SIGNATURE-----

--SjxQyCN2LFaDkbso--
