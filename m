Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850861;
	b=GO6a/sss/ahUfePdtfasoU6jViMzFu15uS5D+ocQ/rLFxhELTBrTJLITndEpMtBTLoBv
	 XCBPsp90b6bMG79qQsQY9cbaftQYhbyRx8DyPvCYaYaax6tO5hXHVxqsD7yFJ+i2fXqbH
	 nQi3LbqtXRNwi3jvY4eSDoJYNUsNDFCwyAm4Q4P4xK1jLJ/48eKrd0ZhEALhdOrJlFwF7
	 X5ZvuMII0Tm9mGzpPrXn8xJck0z+fhLdaFCq/HC/MBHye9bDPs++HFitUOCRXS/WQSWXM
	 I0sk+gO7GK5RxfhEGHpq0nquc7VNmHLVnzULllEel0bPcmJvVZSrI36Sa6rIvZ9us4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850861;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wbM7PObAphnFp29ig3MYdFeHyh+1rC5d4x5j+W0SbqY=;
	b=j9QoVlDEwPXc2shzpe22o5fs2ialNEWiry07Fbuitji3NJjffZUGns5bocXcAG83VC0T
	 htImSm5oTuD45ARnnumdAaR5WyFHTKxAOCLmM4g25nxIyy/LLqbyJMI+2DdRE1JIAl/+Y
	 830WkTM5b3+eKd1XI4rfJ+ktdLkpQWwJkG6VrG7r3kNuHGLCe8N7IheeLVb3rxy9TNWHX
	 EbR75UmQ4QyFPRQXx6PbROuBS2UHvyjPp2iHiAy3JxDUdQOGCpi71uOtz99D20qeV/O0c
	 0jNg2f/P4ihGXS3S5sobAfE8tpftoed9FBCdDskmh2MPXVKN/q91sgxOJ/hD9EPs+oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6zrnKo+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A7606A322;
	Mon, 16 Nov 2026 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6zrnKo+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02A81F000C9;
	Mon, 16 Nov 2026 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794850861;
	bh=wbM7PObAphnFp29ig3MYdFeHyh+1rC5d4x5j+W0SbqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O6zrnKo+1vIXmFQnUBm1R4U9NxwK1087y+Lng2RIuXFg1i0w1tMIHvLxCQSK/Gs+O
	 LpVoSakcIfjh8msixhP+Om0d8TqzajVwTp+f8aKyOOh9Cm0KRqWMgRQK4pq8pVLHrP
	 KstwU+HcAvT4/LA4CD0nvkzFXWOOFwK7DGPpZooBEi20eLu/AAZ4kNl8VZ9GakU5k5
	 m4fd922WMIKw9dzySH0wJVLE28rtsUhlfIYgdjs4V0bXB5Z+HMsr4p3d5h66cU97iv
	 F+OSg10v62Lu0/oHRxRl5GlpSzCO8hRnugMZpn5fdtgEF2ZfKi6/MH+WjOwZL5eBwR
	 2sx6gn5oB+XJw==
Date: Mon, 16 Nov 2026 17:40:55 +0000
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
	Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
Message-ID: <20261116-canary-pedometer-9df9d756da82@spud>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
 <20261116-p8700-dts-v3-7-ec5d4b7de39f@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="1XvBLiguEsEm543R"
Content-Disposition: inline
In-Reply-To: <20261116-p8700-dts-v3-7-ec5d4b7de39f@htecgroup.com>

--1XvBLiguEsEm543R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:55:14PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Add a MAINTAINERS entry covering the MIPS RISC-V devicetree sources
> and the board binding.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2414447892c24d58595059ca27b18775919ac12..a00f1a801be3c532c33918e67=
3c7977d9de91823 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23542,6 +23542,13 @@ F:	drivers/spi/spi-mpfs.c
>  F:	drivers/usb/musb/mpfs.c
>  F:	include/soc/microchip/mpfs.h
> =20
> +RISC-V MIPS SoC SUPPORT
> +M:	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/riscv/mips.yaml
> +F:	arch/riscv/boot/dts/mips/

Right, so still no git tree here. How are we going to get this applied?

My comment on the last version was:
| You're missing a MAINTAINERS entry for the platform, since someone is
| going to have to pick up the patches for the arch/riscv/boot/dts/gf and
| that someone is neither Palmer nor Paul.
| See Documentation/process/maintainer-soc.rst for more info.
|=20
| I'd apply patches as a very last resort, but even then you'd need an entry
| to make sure that you're CCed on patches for the platform because I
| don't care about the platform and would just apply things that look
| correct if there was no reviews provided.

You have added the entry, which is great, but the absence of a git tree
implies you're not actually intending applying the patches? Ideally you,
someone that cares for this platform, would do that - and the lack of a
tree implies that you're expecting someone else (me?) to do it.

Cheers,
Conor.

> +
>  RISC-V MISC SOC SUPPORT
>  M:	Conor Dooley <conor@kernel.org>
>  L:	linux-riscv@lists.infradead.org
>=20
> --=20
> 2.43.0
>=20
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--1XvBLiguEsEm543R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtAJwAKCRB4tDGHoIJi
0iBkAQCJvGKE3LM6qVP/x7ZRhCNl841gAEn9bwsxQj0K/mhPuAEA1a3Ds1qdqjYO
wJ/wgZaVpxM0yvjQSWXIB9hn1o6WTQg=
=2URi
-----END PGP SIGNATURE-----

--1XvBLiguEsEm543R--
