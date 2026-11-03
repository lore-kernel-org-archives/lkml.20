Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742669;
	b=YB8AijYFgxckbqNVzEY1K3Y5qsS5yHGCrKcN/DwVlZXe8DKpTHG1qRUEjWpac1+XRGCm
	 U4I5UbrjZ2pbrfQpSxx8TIyTYYjtdoRZeAqhWqHMFoWiZ2EBnmjdIL3mgjKfWwD5dH+dY
	 0kR99B6dxTmOe9E3GN/omygaEwh4izzSwUjh8WPgUtIiuAFnz8gu0R8TiFYCSfcso2zhr
	 z6r4IyHw7DrbmHDUKYPI4E8qUzeCBacjDgZcmKx/Ww/TlDTggMY0HZVvNwJ9ee60/u1ok
	 x3ZhHgD8+HbhB/Bu1/ZlCj5heppfgL9T4ftYasOUtmLYaXwFIXsEAbJ5Idz6R4ztD+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742669;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oOCoaiK3lYihVTC9GyN2XUTEBjCafrbhOuJwc41mfmU=;
	b=a6XXSJUhuOEa/rJWFf04mLlxoDUThR6hRUj2TH8Jo7c5xMwgKugBxVWnClRJOFozM1k5
	 BqUqk68hnVG6PPCH6UNDWrk3AQ9BIprUZrD01DYfhTxtYB09XzuS5lj5JDS5AKEKVhOj/
	 J/jw2P4K7wp50Da4QFjHESKNHE8qGQuvgLLnWKyZnuEq6lJACT/itjkbNaCv0UhQ1+Q3S
	 EWgUNK8CbB2a6B+rUf9eblH7fAZNRlzerBzWrOM8HcfPB2tpSo4Zt79DQH23jzDY2BA0k
	 IfOw3RlzzGkKl515UJGWr/0OrauG2JqLoAbfTCSZs6u4Cr5i7F2OA6bxPMWk3Uu6tgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCVZ7byn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36670606A31B;
	Tue,  3 Nov 2026 21:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCVZ7byn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CEB1F000C1;
	Tue,  3 Nov 2026 21:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742668;
	bh=oOCoaiK3lYihVTC9GyN2XUTEBjCafrbhOuJwc41mfmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cCVZ7bynNP49y5CRY1U6qLmhOUeASHX0lfyepfHaKMdwDIbD9+o1j2BZNA0POwLsQ
	 kWCPxpNZft69FTpVspbqNjnY1neNZEfA5ohb7cP0Jd9N4xgOBuGc3RTgIIOB4U8tYx
	 0Tv3oKtoKiyAIhMTetCH+PsCizTeRk0MFgbflBfcw4CBLUqqPiplHacHQIGcZwZw5B
	 TkNJFzzQbzLNxrI6HaU9F0K6h/xRKkufbLMwWa05VxeAQlwoC+6Ty0lQJXn+aS5i8F
	 6gebeDMWI0EcPvc/PyJe+jIZOc16tCFVvBnVsqrBAhYKyP/De8Bn9iZF64UFrpw5HQ
	 DAZ6ZI0NG8s+g==
Date: Tue, 3 Nov 2026 21:51:03 +0000
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
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 7/8] riscv: dts: gf: Initial support for the P8700
 Boston board
Message-ID: <20261103-paralysis-unshaved-f4881b1e5f14@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-7-3ac5d49f2c37@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="0iSalawA4TywXS7d"
Content-Disposition: inline
In-Reply-To: <20261103-p8700-dts-v2-7-3ac5d49f2c37@htecgroup.com>

--0iSalawA4TywXS7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			compatible = "gf,mips-p8700", "riscv";

> +			compatible = "gf,mips-p8700-aplic", "riscv,aplic";

> +			compatible = "gf,mips-p8700-aclint-mswi";

> +			compatible = "gf,mips-p8700-aclint-mtimer";

> +			compatible = "gf,mips-p8700-aplic", "riscv,aplic";

> +			compatible = "mips,p8700-aclint-sswi";

ngl, it'd look less stupid if you just called the whole thing
mips,p8700-foo...


--0iSalawA4TywXS7d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupXRwAKCRB4tDGHoIJi
0oKmAP9aysi9V1FiJAIfteQt8MnEEzKF8RPskRuE1kR1e/wiEgEA4vCGnAoPhGWK
QJ7nCDgpNO2aGTl3HKw9iY6bkFodTA0=
=lZdu
-----END PGP SIGNATURE-----

--0iSalawA4TywXS7d--
