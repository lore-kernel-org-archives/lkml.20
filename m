Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415300;
	b=lw7gWRVLtBdQPWJOFV7z9GEPNkIg54SqBmSqeYlmPXsXQ2xkXmoDDennKYGNtgoufply
	 RJ8SW5g5ri7nIQGmX35xGGs4iyuvsoxabNb+2OL3ZClUeBpfdlIPpO2AL53XTorHsHhP5
	 cBgXLE5STSJEnSR/WiZEOtfIM6MrrNFVlGcXKsSH7z4fTKCDR7lNIqvoNX7jvkmSnM5Zh
	 1mZDgRot+PHDUffoSUjGi2shADLcRtSHlNjgATQ49xGzpzgf3xR//5xQpBlP9uQRDPU19
	 0rCLgudZIuQQBpK3j3mxKP0x8HzrPUP4l17sSEBfOYOa4oXQ0uKWLeA+2iW0MC34U2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415300;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=wANOiiKjW/qxgOjivfXeHivizU1b5gZ1N2dFw0ft0dI=;
	b=ERZo5p5ArYKni3z6zEFZAByKO26zuUdlm2FUKm46xUubLaenGYZtM9+IZ+kL+cj0tfUo
	 Nm29gG2ow6Tnob3J5Uyqr2BdxlNepHxr2lglMu1Em6ilUv+k9ksZscVBuisnxmCl0izST
	 n8diP5GDMJmtJlQtLCeTRw2KZCguGRB1iIoL7dsLO6SPLp5q1fCyzp1EixfMoY/zL8g/U
	 eT+UJ1C57Vi2/gkckk7RTSnOaiEkXfZNiG7mrTLRpXFG2R15YKfZBFw/mwe5nOn8GSlKy
	 SrMCSc2zfypkRO17f2XHj9EmJbCS8gtWnKbfqTG+4I6A8UkVM0F29PNv6RpGBWMPU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FlvU4NQc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3375606A88C;
	Wed, 11 Nov 2026 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FlvU4NQc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10AF1F00A05;
	Wed, 11 Nov 2026 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415300;
	bh=wANOiiKjW/qxgOjivfXeHivizU1b5gZ1N2dFw0ft0dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FlvU4NQc12rxI9uqQ8F0nP4NqkoI8fJgUgazUFAD/7pUcydeWm7sxiam7wAsFC8QW
	 icifKHsodJq4XOqFvLkaa3jjp+wfDvVdh4NYpA8u5Y4TB1yfqHGWzuivr/bUK9d542
	 8pRuQzkbj7U6TOlY3+QWP8c20KVTYDv6kpmgP8gOMFExUA979LF4pylhj37iY0O7tk
	 vd/VzRc17KVzKzItCY70ltTUSkAlLij4ck7jwW6IWkmhPCuFyLYb1/1CJNKHzLwzpu
	 ASS+Cv11uDSJBu/nSGSsdmy9TYUjdJqMlwbG0F24SFJ36hujiXCtKG1no5Sd6fP9/e
	 3IWHKjGYRuz0w==
Date: Wed, 11 Nov 2026 16:41:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alex Hung <alex.hung@amd.com>, Maxime Ripard <mripard@kernel.org>,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] drm/amd/display: give the dprx CRC test its
 connector state back
Message-ID: <7602a3b1-225c-4262-9336-c7c1913ee60d@sirena.org.uk>
References: <avNxxfHK_Zh2GN2o@sirena.org.uk>
 <20261111161427.3274232-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WqOsds+BakThmrX7"
Content-Disposition: inline
In-Reply-To: <20261111161427.3274232-1-sashal@kernel.org>
X-Cookie: Do not pick the flowers.


--WqOsds+BakThmrX7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2026 at 11:14:27AM -0500, Sasha Levin wrote:
> The merge fixup in commit c62c2736d82f ("amdgpu: Merge merge merge
> cherry-pick cherry-pick cherry-pick") dropped the call to
> drm_atomic_helper_connector_reset(), which drm-misc removed. But that
> call is what gave the test's connector a state, so the assert right
> after it always fails now.

> Create the state with drm_atomic_helper_connector_create_state()
> instead, and check it before storing it: cleanup would choke on an
> error pointer in connector->state.

Yeah, that fixup was obviously just a build fixup rather than an attempt
to actually get things working.

--WqOsds+BakThmrX7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0mr8ACgkQJNaLcl1U
h9CE8QgAhJWQI2k3RC2lcfC2jUckW0yU+e4yAoHkrAdZnRIbB+sf/pUgYNmQbCqP
Sc46MRT/fR2pFUABhg6E/ZV/oPY6jzbZmrE+OwCX0HF/czujDiXvuUqpjXANUZ2a
Wns/LsAGuEQLxYD+3g4B1s/1L/HAmFycKquloPQ7NIp9HM9Z5+FAQCtSOKzf+Q05
6WNw8hm2Fxfr/87Ouoql2chhHW2hzRIRVXkCR6IrmhIvOjcpU0+ylgFJjSGEtXfA
/YMsDVHGRY2gwpJKVqNjTKKysrK3q8QwYw5qhASw0+ChDe5ZvDs7daVJA+FBvFXR
QneFm9L3SyBwL9OhvIrF5+5ss2BOIQ==
=dFTH
-----END PGP SIGNATURE-----

--WqOsds+BakThmrX7--
