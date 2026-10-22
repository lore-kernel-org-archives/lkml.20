Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676900;
	b=mWcrBrGHS8iLigad8Ia3g8a0cHMoSVhCYzgHMLMjA4i4jeDXomLJsPgKnJe08RQ9I/AC
	 SfXd80c9R8Px4fX8hOo2undQbnxZZcKUkWKP1/vCCwBtPXupSsHfGJhIBve//GEdQ8Kuf
	 qxZhS+foZ7k21dpXFuxlWkjUrAq4gvtdE8fDj93jKJ5OC+9oheQDdKAdC+2syhROhfGm+
	 yPGoD/BZOWDHLDJvh4Xfrb6J+E/eBrQnsDr1mw8v8CyoDmRHglh29QG27PcYiZlUSQCFa
	 qir3FzWo+QKyhhwdLCZs8hExgacfuQHr5hBL4NR/+tBbXPjJa9SAK57iVIh72DxsIWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676900;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=QhXcjp6lTFUhCzSDXzvZVT+YXJSxyuxpT6ZlL9To4Mg=;
	b=TX6iWBCwJte2XD8yXFTU6yLKvKp0vdl+nHbqNVj3G1RJvvQjNZ9ZbH0N7scjZAtdZpfX
	 LYhzfZnVSIOlyn1Xo9/OFu02BnvK0rjjG9fyr/YIC2FlnLvcAC3KovQEuWDBTM4/rtKas
	 SXSKbui8Q5K4bKOljiV+h8fx/Di012BLRJlUT4v9qnhPvYidLKYZwfrljLg7NTq09Tq7d
	 zn0S6fpw5ys/6DAQPezF72HtxZWV2LTLPwFshQ+QAY+I0nP9QY1CJmXl2v8DPSrJGR12z
	 MUoAsYK01nOA3JFTv79ItBUWoJnutjAiF2LZmcWUDg1Yz7mzDvNhqD7oqP1sahAI3Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNG7oGz9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C960A5BE3;
	Thu, 22 Oct 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNG7oGz9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EC21F000C1;
	Thu, 22 Oct 2026 13:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676899;
	bh=QhXcjp6lTFUhCzSDXzvZVT+YXJSxyuxpT6ZlL9To4Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HNG7oGz9ilZABZqE38A/snbutzpYkVdnN/UTbCHaV+Y/JJseekKyPBBiYjLNoFPVO
	 MTcgxyEjE8eHKUmzlYvsRErt6PbpVSbc0WWeWlj0R31tqzG0dgXcH3z5wLS57lUE86
	 YiJ4Tv+ObmR5qX96W1gAPH891etI09znYK9UQntilk7v1zusnEojUogq0b2iLeyyD0
	 2djd2by3LMH2Ur8JdAZ7085D9wg4+29Zq2YPsPe+etxCylOcawaxwoap7Ex/TtZu62
	 vI+yD91YzQStBMnS3O27PvbhjFOQjjDis9GMwNHIblHgLad/EYni2E+3n7V/DfyGpc
	 LMFRrXz5y5LGg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 59FC91D25E86; Thu, 22 Oct 2026 14:48:17 +0100 (BST)
Date: Thu, 22 Oct 2026 14:48:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/5] regulator: core: Add mechanism to force disable a
 regulator at boot
Message-ID: <atoUIb5y26996HIr@sirena.org.uk>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-3-25f0ffbffa8d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="XBaz1mmPtGVZpRyy"
Content-Disposition: inline
In-Reply-To: <20261021-paul-lm51772-v1-3-25f0ffbffa8d@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.


--XBaz1mmPtGVZpRyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 12:27:44PM +0200, Paul Louvel wrote:
> Regulation activity may be enabled by default when the device powers up.
> A consumer may query the regulator's state during probe and may disable
> it if it is already enabled, potentially resulting in an unbalanced
> disable operation:
>=20
> ret =3D regulator_is_enabled();
> if (ret < 0)
>   return ret;
>=20
> if (ret)
>   ret =3D regulator_disable();
>         ^^^^^^^^^^^^^^^^^^^^

As covered elsewhere this driver code is buggy.  I can't see how to use
this feature sensibly, if a driver can safely disable the regulator on
startup it should just do that and if the regulator could be shared then
it has no idea why the regulator was enabled.

--XBaz1mmPtGVZpRyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatoUIQAKCRAv73Ows9A4
iR33AQCyyjm4Q6eudT94N/F3kSMdByIHonkh7CYDjY5PhNBdhwEA3YZO69fPvUy9
l9kJa/YMGf3wY+cHEKVAofATJtwj3Qc=
=RXZL
-----END PGP SIGNATURE-----

--XBaz1mmPtGVZpRyy--
