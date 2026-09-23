Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F582421239;
	Wed, 23 Sep 2026 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155792; cv=none; b=Q99IHd8jSMvWIv16NA4M3SZKJD4clMBVm20mLbCBh6PSPw/zufExPf9PZCUrbhshyKJ8gRYRUH2mcdaKm15Y2d7NkE4NFFFS7Bf03SRGgRxZ/fDiSqdnIas3beh1it8U1yRkIGaQT/nrscO4aCSaGmPy3s1VUaOTIQ2OhxFPs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155792; c=relaxed/simple;
	bh=65clxju926Ezay/iZzxLg+Id+l6luEUCeaS/XQLYTiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOpmDZR7CW4oLY22/SXGiPTJGPCh3fAv7C7ZUeAM4Cb2qK51358/3mM5kH4Fk3Z0COoH4S87yVHE5Z3XNTGCHJIrmwhNMq/j/PhqbjfvrOo4sNzcjP8txzrbnG8rbi2uOVV1MIGnLEJqn+3Jl/Na6xdNw4HTI8kvpPGApxe5rpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2DApsy/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2DApsy/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB13B1F000FF;
	Wed, 23 Sep 2026 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790155791;
	bh=fa3//q+AO+jYBEjkP36YJDAcZoXi3LGE10xm8vlk4K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K2DApsy/sEaSmDfcyIH+F9V9Woq4NVAzjmRGcK2P9pWwiDoCZV7ANas6JRtg+LJUA
	 K17E4M3M3Paw7U8YxttYp3lydYVbNtVc3/9gbsAQwXL/xLfUOzi+sjpAjHxZjarF0h
	 KlrRSfxY9nfAXKPQqOpRtGvy+rNXvq+f7RU8ZPaMCWoIAqqmaCrVoQvcpAqr7OBGg5
	 Im47bFw2m3mUuXMiwtqytZMrgK2Z9WTGlZCq69psHmx0xA+7f141FXeLV1kqc0bVSJ
	 37HiYyLWcugqTdDWORLTGJKOpP41F2WMZHfK6aBQVgGJiN2xX/KXkaZHA2vdxWlEeR
	 SNxq37vYEY7SA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7661A1AC5737; Wed, 23 Sep 2026 10:29:48 +0100 (BST)
Date: Wed, 23 Sep 2026 11:29:48 +0200
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
Subject: Re: [PATCH v7 02/10] ASoC: qcom: Add QAIF shared data structures and
 variant interface
Message-ID: <arOcDLy_ESS6Qwcs@sirena.co.uk>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EvifuDrkTJZzlz2v"
Content-Disposition: inline
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--EvifuDrkTJZzlz2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 12:18:22PM +0530, Harendra Gautam wrote:
> Add qaif.h to hold common definitions shared by the QAIF CPU DAI and PCM
> platform drivers.

> +struct qaif_variant {
> +	u32 rd_len;
> +	u32 wr_len;

Does anything use these?

--EvifuDrkTJZzlz2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqznAsACgkQJNaLcl1U
h9A15Qf+ODvs4O9cxzPAeZ29029Stq6ItNi+Q9Itn7hiVMsr8Q8bOj6hTweXj+iH
jzRQ4sZuCXhMWJ2vgCLKaC1bKJtk3NSCcbpbvWACOYDN4K+FbMfLbSuyWJPGsV2O
Zg4yISPbjMUT9JQReJItS1WEpegJ0I/24tV4GdVw2ceXus7ZvpeGM+CYTmSiAzR1
SUHXQCdkiF21KLG1kJcDWHkvlTSTmv9lNc1zli8swE0sRgSaqG6vEkUbl5/MPkhj
I+qCxbi3yUjCYspP3kGrz7ksAQ8NwblAHJrN7Bxex812VNjmhKfYipqddxA8Z2x2
yeLwUTVKyeL5zE+QpSX7m928dMCxag==
=M7hL
-----END PGP SIGNATURE-----

--EvifuDrkTJZzlz2v--
