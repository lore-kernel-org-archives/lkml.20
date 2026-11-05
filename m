Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903069;
	b=igzdIwB5UkRrMJU9RCnGblY+XJ+pMT8/KmLRcfOwTy5y8oPvbk1o/MRtHByV5mQzWP4f
	 BzzdqMO/FnJoc/fBXp1wct+GyFdiOnPpiZBFTALLGQPadogdQbAOtKmcLq6V8ncXhNIFa
	 P/xUdKP4ZV/7sRmE+STTSrUmMSjeptqLIAkC7pVGCd4Y8TbH0EhHNLj4q4Gx7I11NIcij
	 qlfx7goMuoRQzt1q0QNUQ1RCeit5pbbK4CKjnEBomW8T4J9QNoKl/HhLcGlNnfuJZRYMN
	 UsURQm4F7lcz5ZCL+qcnosVozitV14mZKV97BMuXS+D+3898ghSPC5qxFU8MaesBLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903069;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZtmUTz3ZwmwR9910+Kg+d/RgBwrT3NvRt16MrNazlP0=;
	b=O4s4VqN9+bWyl27MzjwNQ1JyJ09xYtrGrpUHZlwx5EdMO0NfTse/gVn3hlsBGVgUzFLb
	 J5C+BgSG+O5q595mVY7Vehr3KH6FCgTnPqTUIv4yT/Jsv7IR+c2eDSA57JLinMr+vuRxr
	 ccOrwCaR5tUS4g64PKJyh4Tk/VQXtLsmEs0ZL1J8JO3I1bXD8JJMZwkz64rzR4z6xja6p
	 a7FZM4rl38DKgseK6/PaTI9U6OPPmFCHHN9ObGp4eCtnsxLV71heCwOUEFi8G7uwvIhXA
	 W58xynGmU7iIV74kctqtS5OM+/C3zvLq6IEJFpmwa5MBOJexLdiVXNqzbUEuBH3aJRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxlXOKrk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA03606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxlXOKrk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A5B1F000C1;
	Thu,  5 Nov 2026 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793903068;
	bh=ZtmUTz3ZwmwR9910+Kg+d/RgBwrT3NvRt16MrNazlP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fxlXOKrkd/ih8Okx46HxINwM6CuMC9k3XkFDcDWktB2Lvi9nC84OTal5TiE1jiJCp
	 zI+ZlKsoe+XNrq2L4yQ2abH/8wY8+3BQrGw/oMJ4DzUPxkb7Urt3Y6CcBP0pF0AaZ+
	 UCbnCWToAVwTuA/zW38iJp92W3eV77UJ4LB3qvPKBuQIN6Ck4OjmUaCpm27cTq0op4
	 4IlLdAcdf/7wJPFZX0nYfY0jSpRQbbGo/OOjlQMo09KlakorcwX+G4b/cFpocmlXaT
	 4g1ROKSN+zBA/p2YN/7Xf3RsZIMkm4X4CgQct9xhk425DhOOMaYSOdqCwn1Y9YXDQg
	 E0f2WAhQWgjRA==
Date: Thu, 5 Nov 2026 18:24:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Message-ID: <20261105-igloo-stunt-534496ad0518@spud>
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
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
	protocol="application/pgp-signature"; boundary="CB43f/tqOHsA+9GK"
Content-Disposition: inline
In-Reply-To: <20261028131939.1014720-2-thnkslprpt@gmail.com>

--CB43f/tqOHsA+9GK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 03:19:40PM +0200, Avi Weiss wrote:
> sifive_ccache_init() uses of_find_matching_node_and_match(), which also
> returns nodes marked as disabled. The initializer can therefore map and
> access a cache controller that the device tree marks unavailable.
>=20
> Select the first available matching node before accessing its registers.
> This also handles a disabled node preceding an enabled one.
>=20
> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller dr=
iver for SiFive SoCs")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/cache/sifive_ccache.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 71d3f94987fa..02878d54381d 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
>  	unsigned long quirks __maybe_unused;
>  	int rc;
> =20
> -	np =3D of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
> +	for_each_matching_node_and_match(np, sifive_ccache_ids, &match)
> +		if (of_device_is_available(np))

Are there any devices where this is actually possible? IOW, where there
are 2 ccache instances.

> +			break;
>  	if (!np)
>  		return -ENODEV;
> =20
>=20
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> --=20
> 2.43.0
>=20

--CB43f/tqOHsA+9GK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauzJ2AAKCRB4tDGHoIJi
0k2GAQCcXeNVe+fj3emdZR6xh3IMUE1u8VOnB5po9AZY1Q89nwD+P9vlx+0j5LZa
m37bmmAThH5ypyTRJYeBgmL2YjUTwwk=
=Fl83
-----END PGP SIGNATURE-----

--CB43f/tqOHsA+9GK--
