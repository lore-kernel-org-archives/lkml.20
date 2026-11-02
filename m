Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646798;
	b=zb1qM2BZyXlRk1AVy4upNPSVEni0rm5SOw4PjAS5TmXty1q1rJWobh+ssapPWjwqu5df
	 HiVTSVk69ot5iEx714Yt7G6qBInJSg9Nvnw7MBDhdqZdDSQfmRu8fimt2x9VNCnrUz/iH
	 jGisSXKvf6SoheIBJfzKhnPwHpgzK438tFhmVLGVas4ZL3RBM0Y1QnbUrF+q71zkAc6md
	 DybwmhfQCneCmoGaY6PHQ2galaI9/o5CvnoJ6jlYj6Q3Isob2W9ul/QPr3qsS9fBW+zZS
	 Ix6oYmqquhtwoeS6UJTLmVE++81jFvGNezgBR6/swzIqHeGCLKJnBliJ3+VrZkq7MiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646798;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=U/h1dd9RoS+VuRtmXiCs9roaZurmiqV74QqfDLQStI4=;
	b=DD3p8ZLnTU+JLuMwC0qKCvVxBC3zlrX7ysW6gO1WAKZ+QRXaK3zoTlH9DVnaNy6t89Wk
	 3yKI4n0q5zwg7dIwg+OmHHd1VF32eYdlcjhXoxkUf2FHfgWbyOs38DP9sW7+9ezlDJf+/
	 QRWdZWBdBUnKbYz2BpKNX3R5D4jauGLXoMQus1w4jWw9rIh0IkELSHLXFdBQBVw9rThWi
	 PPn9s6Fp7BNp7fJMOh67xpkjwop7fZImj/xCnTn2n39aEc/hM3kIZ9xQJ2z8LYPa9e179
	 i389azEaIBPXL4/R5Q0fnwdMWNwkNMkGSu6iW3Ut0b3TJSPxapMBmmqDjY5wKrFpQyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbV9vlqP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A710606A327;
	Mon,  2 Nov 2026 19:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbV9vlqP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDF71F00A16;
	Mon,  2 Nov 2026 19:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646797;
	bh=U/h1dd9RoS+VuRtmXiCs9roaZurmiqV74QqfDLQStI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BbV9vlqPwHUPdm3kW82aAIDSi8ejiJRNqBag8HwRiWmVd4S91ELHY7pDEr/S0c+99
	 YNrEOOKQCsyjJ6cml804uLD62Yi0QhWRV/TYNOT7yYxJGSUAz3ZzL1JdLdTrKAq6kd
	 U0WNSqzovG8M0bFQJW1cFlcx2J8rSfsWiH1V/sbXfsb3brf7r1T16eCvA3DZki/2HC
	 teKYbdm8OeofGO3BH22uE9TAdy6p01Ggqq4VPXDH0QI2IFpos3+0M8seWuO4xlesfB
	 lKloEkNVdz0k/rzlFbI6PDHoeI/Xcyyq8HWziUkxi5X+342G+rzItranW4v4bx7P92
	 q/XoB7ZOstFbA==
Date: Mon, 2 Nov 2026 19:13:12 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: vendor-prefixes: add OpenHW Group
Message-ID: <20261102-imprint-kindred-1c2d1a636a15@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-2-marouene.boubakri@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="1nuoCU+yS2icvDHP"
Content-Disposition: inline
In-Reply-To: <20261102141727.640769-2-marouene.boubakri@oss.nxp.com>

--1nuoCU+yS2icvDHP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:17:20PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> The OpenHW Group (https://www.openhwgroup.org) maintains the CORE-V
> family of open source RISC-V cores, including the CVA6 application
> class core and the CVA6 APU FPGA platform built around it.
>=20
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba20029693..82440d498d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1263,6 +1263,8 @@ patternProperties:
>      description: OpenCores.org
>    "^openembed,.*":
>      description: OpenEmbed
> +  "^openhwgroup,.*":
> +    description: OpenHW Group
>    "^openpandora,.*":
>      description: OpenPandora GmbH
>    "^openrisc,.*":
> --=20
> 2.43.0
>=20

--1nuoCU+yS2icvDHP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujgyAAKCRB4tDGHoIJi
0vdPAP9HJoZqHVETh6lvXFfQoqSezjaYtfGhm7AC26W3DnTZcwD/cOaOSLOxduk6
7uPL0h7O5luDzGQha9AH9mL4jd0jRwg=
=jKds
-----END PGP SIGNATURE-----

--1nuoCU+yS2icvDHP--
