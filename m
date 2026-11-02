Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643706;
	b=I1cRPLB/CNhgNVAf1iV9qgOfFXtSNlEArw0LD2Mn1lTB4S6YbqE3BerPDzAX3PFdJGPq
	 kZNUTdbeAU7lpyd3AJZR9p9NQtfe6Dg213GaNexOyo+Q/qsyIl337Aop9NAdxmHFEesxb
	 F1mA6jx6OX0GjfGHxDo/1OJLO/UepxHQBxDRHdRCl94+90/omkX5P9+/JR8fY7zASskAu
	 KS3EnURomkI23qXO0+rvlSSkOQheiHcvkFPk+2z+z78QjPB8QEYhvFKNBQK7009IB/SmN
	 mxlnOIJFpYvtSFXlOywN2jo+xwCNrd6cHqJIeLAaY5YJeYC7FaB0gbZfrvfxUYSe7bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643706;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gK9GJJKs/V4qySrVA2fuFkfXf1inzwWdahmhiWz/WSQ=;
	b=OhixkM7sVniaoa1gVcruXyNWo2YsY5GC0FoNoTYI2Sr2JoqkGQxkVZPpOjQUxGWPdCxd
	 kKPVYHdIhv+Ou8/ZbX4ZljcmaVn/GZFRoHg5ajW2wx6w5a9YgtabzvnUlqHA1CnuIgXrF
	 DmxyRKWBEPyiAV2+F6m4QGbat+OWVLz12+6Tgod8EIFgn1Tdz1aY/CnzSdIvWbefkkl9P
	 Jb08ChYE/ZHH+RZjXOje9cpGCKSGrXl7fUM8p+i4ioARbQ8PEpaltODVH2HjUaqcnAIa0
	 yagI+CumUUxz+9Je3VFB+Wq/PCUOhtdCq3VSua3FfA9INy5v94fe2OKQK+/5gqEq+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJRgl5Uq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A6606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJRgl5Uq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7351F00A1A;
	Mon,  2 Nov 2026 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643705;
	bh=gK9GJJKs/V4qySrVA2fuFkfXf1inzwWdahmhiWz/WSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XJRgl5UqE3HvLu1NZODc4vBFRK4He0SctDo4orhuYZ0M0xMh/WuCPnG5rKdBZsOHQ
	 jpQOjvEB8GlWiHe3t6/Sis9N4D2jlYa3L3f/9L5bvYIwocYHUV7ua0HNMZtQ1yPLLk
	 STwbINqAioLEgckp9upns+IVv4mERXz88vacVUXk6YLP/J1NTLHDU6pVuuYR4sn20l
	 aGlZsuFlxOv6mtvTSBdsBIvJiHBChkOhYIg5RuFqDEgWAjfR201UtVNXW+xvU7RWPb
	 qEYTDPJ70JJ20Rj2F+kQZx1mFgRzVujq3tkbfWNZ4WXEKfJWv4waikM1FtXG9Z1gxX
	 qSoTgizad5VrQ==
Date: Mon, 2 Nov 2026 18:21:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: accept the atomic extensions this kernel
 was built with
Message-ID: <20261102-shredder-pauper-67ef6eaae556@spud>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
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
	protocol="application/pgp-signature"; boundary="lEBywBTz0XLx9/RM"
Content-Disposition: inline
In-Reply-To: <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>

--lEBywBTz0XLx9/RM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:20:03AM +0200, Vladimir Kondratiev wrote:
> riscv_early_of_processor_hartid() rejects a hart unless its
> riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
> hart even when the kernel was built to use only LR/SC.
>=20
> Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
> when it emits LR/SC. A normal build defines both toolchain macros and
> still requires the full A extension. The legacy "riscv,isa" fallback
> keeps its rv{32,64}ima check.
>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com
>

IMO, this should not be a separate patch.

> ---
>  arch/riscv/kernel/cpu.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3dbc8cc557dd..5d1e39d16e59 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -82,12 +82,32 @@ int __init riscv_early_of_processor_hartid(struct dev=
ice_node *node, unsigned lo
>  		return -ENODEV;
> =20
>  	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
> -		pr_warn("CPU with hartid=3D%lu does not support ima", *hart);
> +	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
> +		pr_warn("CPU with hartid=3D%lu does not support im", *hart);
>  		return -ENODEV;
>  	}
> -
> +#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__ri=
scv_zalrsc)
> +#error "Need AMO or LR/SC atomics"
> +#endif
> +	/*
> +	 * Require each atomic form this kernel emits. The single-letter
> +	 * "a" extension satisfies either check. A Zalrsc-only build defines
> +	 * __riscv_zalrsc and checks that extension only.
> +	 */
> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)
> +	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
> +	    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0=
) {
> +		pr_warn("CPU with hartid=3D%lu does not support AMO atomics", *hart);
> +		return -ENODEV;
> +	}
> +#endif
> +#if defined(__riscv_atomic) || defined(__riscv_zalrsc)
> +	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
> +	    of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < =
0) {
> +		pr_warn("CPU with hartid=3D%lu does not support LR/SC atomics", *hart);
> +		return -ENODEV;
> +	}
> +#endif
>  	return 0;
> =20
>  old_interface:
>=20
> --=20
> 2.43.0
>=20

--lEBywBTz0XLx9/RM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujUtAAKCRB4tDGHoIJi
0oR3AQDuE8SstPeiNUwkeTI7ha4bQZGhdcmd7Wg4I5JTJ+qTowEA40aLV19NLCOy
MfKY2cbEpiLTtgUjq04Jv0U6VQb6bg4=
=Urv+
-----END PGP SIGNATURE-----

--lEBywBTz0XLx9/RM--
