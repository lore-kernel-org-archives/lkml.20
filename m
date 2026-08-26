Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3E30F526;
	Wed, 26 Aug 2026 22:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784251; cv=none; b=TGIXDNxAE5RHOP9bJeQh+p2zKOxLs5XVPWNk+9km/imFgWavdtGXt7Heebj86hMWcMUCdZhtDlzUdG+yzBNlVMWrA/ElCINbvNBo9LExUevCwCd/v/ejuGAF8aFXNLw3UFusJ+I8BGiA/0XTNFFBs3+mED/10HrDDfbrRFFhdoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784251; c=relaxed/simple;
	bh=WtKwuad73ZA7KB+e2evPWVWEk8dpaQ9l5PD+N+RBzyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWzhdzfoxDEfDbR635UJaFM9/Sx7pg41ZX7ZIf2ILl5T6TTvI09aiu4g9Vh42U+8t0RgvpMeodmNQ2V/D5cc/6EI2AufHEymPAwRu4ciMPxBgmOPosnobYSGVRLa2iFoTULYiHpHWTtNX0KZ/0Ga1/LjUzyFev+K5pdTyg9JNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e13YDO4H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e13YDO4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A28F1F000E9;
	Wed, 26 Aug 2026 22:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787784250;
	bh=WtKwuad73ZA7KB+e2evPWVWEk8dpaQ9l5PD+N+RBzyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e13YDO4Hn6u/k2+QNfIMl1j6PGkAWlcSWnEFCEqZ0sd7C6eZTvyMe7kXPSG2q1xNI
	 7i7gyov7lL6+gI1U6QzKXUOSHRiVLE8mRQf/a0u3jhthpTYAWtBhAEdxl3shFjgKun
	 bJCXLkv9EfWr1uQ6hF0zwYyIiRG9bZQj5n/9s6g6AS5ZjmcKtC6nX/Z9n1pAzzSsop
	 EAqUnW7AUezEOLlFOQXc19uWGrGELKcE/i0po4RiqkuhGdOiut5D5GGkbt70j8Jm69
	 vnmy6aFusMmmY2vLpA82VrWrn+MmmyTFBH0OZu60jFXNtb/TFB4GFNJmJEL8Ol3W23
	 zxWDo0o+B9oVA==
Date: Wed, 26 Aug 2026 23:44:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
Message-ID: <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hd4wADyx6tZLNZ1g"
Content-Disposition: inline
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
X-Cookie: Obey all traffic laws.


--Hd4wADyx6tZLNZ1g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2026 at 12:10:12AM +0530, Ajay Kumar Nandam wrote:
> The APM DAIs expose PCM buffers that the backing DSP must be able to
> reach. On existing targets the DSP runs in a stage-1 context and the
> buffers are described to the SMMU via the iommus property.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Hd4wADyx6tZLNZ1g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqPbDQACgkQJNaLcl1U
h9D/mwf+Oldii1nLbT1oQfkDYm/DX8gI01xY4GAxyUSJpmwY3U09+eApU9Wg/5n/
b1ERIqRCstALM7VEwbd1Gi2Pvhx+LKPySCosEzbqRviReImo0nUvN9ALMviEsh8A
trwkMKtJ8kI231NWV8QlWZNRNYSiPX/E93hI/1R5G2NtNlW0kFdiBHpyIGPnmStO
nkyFW3hGe9NdF6KIZXkCNXk0Brdb+8N4R8Wmgmbq9+s6oGL1PEmhfuWveCdHefSS
Z4/ExLSoZslXDYFcXJP6ZR3RSIgH0WvNtyuIGGNLnVFb6LE4t8CwODtDg+/ZmgbI
3JBUptRtHQDPIcAY88H2cH9BoQgeTQ==
=unmd
-----END PGP SIGNATURE-----

--Hd4wADyx6tZLNZ1g--
