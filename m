Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283462;
	b=JQcYfS98bGmkIov1/9mZGAScfyxSBa2SmukA2ufJPKPLa7pe87ubiag7MajwOBrVh5Vm
	 UdmCqXIaaco3Gc6u8qZK4cBHVhOMvaLOg3ltyfj4vCuifB0dk2OhU3t7s4o7p+0WMEceo
	 PLuYhP/kzxeQ2+AAo3dU1KHKxgm/GeBfUz6xzFv6BFb9jsCgcpamEgrr/ZwWDoPZ12U9L
	 t6gb8lkIWiIBK8G8Sse22iQXZEVzLaF71CFgcbuGLoPoBrO4jtbHB4z0kTTNNe46kMb8l
	 s/4AnR/DW8oDX8VgV9uWYDG3+t40h19Nb6jg3fn9UlmU3i1KAqcUPdQa8WzQ85lZJGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283462;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=zkRLZSrkFzza37z+oDzwz7XZv9jNqGLfFd+6mYZO/7Q=;
	b=nnu8wbGlwyfPlNgMOTLrKV9RHC7PCbYVmnS5yeTWJw+g0Jl523c9Cp+U0fq88m7O/p57
	 jZeFOaSdFlWrPeT+8nep9wlJYdOda4zFtxJTFtH0m0+9Kc+wyh6YLXImniSNs9CnI/OUm
	 aaKk40srfhap3kj5vJdUVNIjAf5n2bK+PebKo7byiAsUQy+jChysTrx77QAt7JBiuGUme
	 YQhSZeLY8bYHWI40Pfg3aTWe7xdIu90SO6t+W+yNZAVtj/1pBRlb9xnslxFCsncJ7hFaD
	 4vnCEkONl6r5+JTTLZ3BPzBf9siod4bYSuo0zqK05qsHVCyKIGfGl3vDK840mP3el8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m374tBJW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBDF606A32D;
	Thu, 29 Oct 2026 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m374tBJW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB871F01828;
	Thu, 29 Oct 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283461;
	bh=zkRLZSrkFzza37z+oDzwz7XZv9jNqGLfFd+6mYZO/7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m374tBJWyheDa8gFxeoa8Ck+nrY4CWbf4odLf4LVpbhyp9/B1WqNEs1cdbGRN864v
	 G0kQ2Z5IcAFd6h4AOxFce7WQXh5PPrIMyQKokfxX0WIDg0y8dTHSS2V7DSfuFbMP9W
	 3dPW8qu1HwIQe63SqO/6UIvcmUBvduER48Y+7AF4ALnjXNbUjHRrqHbFVVdkZi8gQ0
	 c8goHyjmppzGmWsQjk8pEl5LttPuMBK2Ip+TScTfkZ3VRzlb16Ct88n9sfWwfn7nMN
	 P8DtLthpGeuHav0xdEcbxvCtEdyQBZZoqPa74EKZr0cdJ/rI3Tf2lkqCZsRYYvTLH6
	 fhJ18rcAYbw7Q==
Date: Thu, 29 Oct 2026 14:17:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Louvel <paul.louvel@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add TI LM51772 support
Message-ID: <c927a734-10b3-4ebd-85aa-c170a138aac6@sirena.org.uk>
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-1-b2a767e34722@bootlin.com>
 <20261029-indefinable-bustard-of-ampleness-44abaf@quoll>
 <DMH7AO649J2M.2XFQNV3VXL6UP@bootlin.com>
 <a4a57e41-4e1c-4c94-8b92-6b50f8321ee9@kernel.org>
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
	protocol="application/pgp-signature"; boundary="m2OnoWSAlcU9cCzL"
Content-Disposition: inline
In-Reply-To: <a4a57e41-4e1c-4c94-8b92-6b50f8321ee9@kernel.org>
X-Cookie: I have a TINY BOWL in my HEAD


--m2OnoWSAlcU9cCzL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 29, 2026 at 01:42:43PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2026 10:05, Paul Louvel wrote:

> >> Use either existing over-voltage-threshold-microvolt from battery schema
> >> or ti,ovp-microvolt from the other TI binding.

> > IVP is not the same as OVP.

> ... because? OVP is overv-oltage protection, so ivp is not input
> over-voltage protection?

At a hardware level for regulators they're doing different things with
different downstream consequences, over voltage notifiations from a
regulator indicate a failure to regulate the output voltage which
wouldn't automatically follow from an excessive input voltage - the
output might still be clean.

--m2OnoWSAlcU9cCzL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjVX8ACgkQJNaLcl1U
h9CyHAf+IPb00dfDmN/vx46E36V1FJx7AWnsP0lZ8ab/yBQqSXD2P3scUILSrvBc
chpwF3fLEiKfEc5QtNnTKx5SbnGq6ax5fYkvzme+RlbLE3x6RoUf7ps75bHYCZCv
dUgAI9AY/ob9781bCXHcpIHoKTtMDZzG6fFESAW0WxhJnQdEktWD7ef4sDTK/BMf
5N3j31JsjWNCuCtVaQeu6l9uveM0hmyYlROHJNjihTKoDaEzeVPl00jG5CVDD5Rz
2X9rRKMEadM4oERZ5vhJRHItRwuQJm1/WvrafiIqxkcJi0wYZxZEjW2kZVsoOT/M
og0rnA4FzfV3GjIieRtkEZrPI6zwfA==
=qqbp
-----END PGP SIGNATURE-----

--m2OnoWSAlcU9cCzL--
