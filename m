Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4372C4052C4;
	Tue, 15 Sep 2026 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493018; cv=none; b=nY3faf5eUqzfpkNdmyYq/ZIsraAjBcIdl3tNMttdYN0FmxWDm0Epcnqv0yBsx50Ch5xt2jlkVQY1fYvrLJ/5ruwyd0blG5IKIdgCYiVgmtJBASf+3wNPTCtF2d9rmLlE1kEase3k+BGNGRA8vrgIM8NWz2L02ksCNstxEfuM4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493018; c=relaxed/simple;
	bh=JcetNCLl8uKiVPF2UfdSkI4RYP2vY4LIs+7BoLvBuZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1v4PFFwx14K6CKSwmKeWQxA6u8TZM9ZUCZv1l94BKy6UUe9YBddvWv2CwCSFPm971Bi8ixejqXoxawOeVC6/RVOvwcuKy2Xp4yzg5Q+1Fk3w0LFzIqYEwM83TIqOwlYOxiBk7Whn9eR/EzkuTMnN5e+JsuzUvKWzn+JLHDEgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+sbdMlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+sbdMlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B17D1F000FF;
	Tue, 15 Sep 2026 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493016;
	bh=O0F3EBbV6mf8kreRhQaVdo77prPO4C4vUbkal0XuR7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W+sbdMlEPGJglNEnvBPnrpHiBXoZA1O17nzC+ZauAem572eHajZPDXDEjsLb/sHCW
	 2zK8wpzuD4WLTUNpryW1Uz1IT+F0zUkEOVmsB/jpsLPTax2aQ4sDrpk/d7dk5gCq9P
	 OdhRhsoIbgn6iwXWHLQGxivuuWv07SNCGa3uyxzYEpjgCQ7p6pSVS6QWF5C1iOddqw
	 9j4GI4jf7GX9SFZix3NAn8iAFJRNrdQNy2/jKxSI/jliLmCM+Kf+eec/p27YKpOZCS
	 2uNsgC/jsB20qmZVJKjLa4WNGg0s2s9mWa6ChyLLKP6I71XYHVrWI/XruSvd1/QJEF
	 bqpi4DTiYiQ0A==
Date: Tue, 15 Sep 2026 18:23:31 +0100
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
Message-ID: <20260915-engulf-backpedal-fef3a5fc2607@spud>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OIxQvOJuL0fdlQhU"
Content-Disposition: inline
In-Reply-To: <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com>

--OIxQvOJuL0fdlQhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:55:49PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> GlobalFoundries acquired MIPS. All MIPS RISC-V
> compatibles should be labeled with the 'gf' prefix in the future.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969373433b1f48118872c46cf7bcfff276..b699935f60b96b3cfbb9c6e8c=
e802fcbedc52c1b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -668,6 +668,8 @@ patternProperties:
>      description: Genexis BV/AB
>    "^geniatech,.*":
>      description: Geniatech, Inc.
> +  "^gf,.*":
> +    description: GlobalFoundries, Inc.
>    "^giantec,.*":
>      description: Giantec Semiconductor, Inc.
>    "^giantplus,.*":
> @@ -1104,7 +1106,7 @@ patternProperties:
>    "^minix,.*":
>      description: MINIX Technology Ltd.
>    "^mips,.*":
> -    description: MIPS Technology (deprecated, use 'mti' or 'img')
> +    description: MIPS Technology (deprecated, use 'mti', 'img', or 'gf')

This is starting to look a bit hilarious.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>      deprecated: true
>    "^miramems,.*":
>      description: MiraMEMS Sensing Technology Co., Ltd.
>=20
> --=20
> 2.43.0
>=20
>=20

--OIxQvOJuL0fdlQhU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql/EwAKCRB4tDGHoIJi
0uLiAP4w9YFBQwqsXenGORWEzWckxSlmzMH52DXC7nY0nMSu2AEA6cQ4ooT1FQ67
O0sRxFvEgJyM/f/0nBSK6BjjMiewLQY=
=nmOM
-----END PGP SIGNATURE-----

--OIxQvOJuL0fdlQhU--
