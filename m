Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647426;
	b=gfKB/qeQzBHv0Q6ZtoT4bmh6LpPYMrYyEEJWBFYOYKfTUhmSU8Pv5F3V5g3c/ZtrodY5
	 qJpfocSG7JedGxsikYTBcWQrA8VFvQT6mxirZbtUUcbWSgzxDLyrqlppY+lXebBXZcf7s
	 91+HwLiWhsOaI10BJT7H8tM7u5Xu3L5kWh0gLy6Vp0ZunWyXaxizd++y90ZhbPsVUmKQd
	 +BYe39kQUGSgqWi8GXDCwzQaKUBGtDS7/8PCb9EcdU6Iime53Pf+z1TPLn8gZ9z3uyVWN
	 TcWZ3J+aKMACgNmY9Yxr6kMfQvrDLnk0mVdu1iFO/VyTLYsIfaVrqA7g1pJj1YNfSDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EwvMk+FvxyHkKynm6O8LyVDYXYAT5668MebC2DyFOqc=;
	b=vI3jxNY06+jyv/ER6l/7yyCkG0p09HwtojpvJDrWIBzKqYGlIxw1/GiV5yus70GDMDSy
	 vKnZjoJfOmmcMLzGOO/5Mx9DsGGUvYVxZp8cZjD6c1Vh3ceIN/1tYr4KfRxOFosmtP7wP
	 nqgzdQtKr8NNhmrblp1yWtlZlxGS9/hzJcP+BY8X5qLgAxDIl1DW+fVLPCd82DS4WLJB7
	 IjAPVpZFvrdm5yiRhmQDVynuPiKDImQe/HTUKE/S+FvdLnQk/denBzCldqpWtN9yV3pgI
	 jXG394y/eiU2jQ63QKmncYRBATgZXFX1aVDJEz7qPzNMOCxW8SStAGi3qhwxeLEOKHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vk8EScHH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D60606A324;
	Mon,  2 Nov 2026 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vk8EScHH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D2E1F00A16;
	Mon,  2 Nov 2026 19:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647425;
	bh=EwvMk+FvxyHkKynm6O8LyVDYXYAT5668MebC2DyFOqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vk8EScHH4BY0tv2o/GU5Nl90Wz0Al+tOJrBKf0Swgc5pqAkaU46RRlHsUL/GYHqYM
	 kGWsCIQzCgxX11emEjYGu+09Yb/kKLE7Yi9qR4OoigCIyvtJyGHxfwkaHKD/JNdY6T
	 Sl0LM4U6oDdhQ6RcjHFgMWOSwzYdNmFJXRs91RM/5R2bMAEbjd9TgoRMVF7BfBCs4y
	 jFDwoFYSS1+VR4pDZ8Q8AxF5IazJzKNMoqbj2UQZuVpJpjYpUzv6cWMr0H5D3T9JN2
	 xH6h2L2hh2khoEhVdKpxJve4UsM91o3xUdvHXLwHeBsfMWj3X4rChstUbT+lo5KsxR
	 i6DtVbZES/WSQ==
Date: Mon, 2 Nov 2026 19:23:40 +0000
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
Subject: Re: [PATCH 5/8] dt-bindings: riscv: add OpenHW Group CVA6 APU boards
Message-ID: <20261102-breeze-upstate-4d9b96db18aa@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-6-marouene.boubakri@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="EzvXeiIbN3v5MlHk"
Content-Disposition: inline
In-Reply-To: <20261102141727.640769-6-marouene.boubakri@oss.nxp.com>

--EzvXeiIbN3v5MlHk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:17:24PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core in
> the CVA6 repository (corev_apu/fpga). Add the board compatible strings
> for its Digilent Genesys 2 builds with the 32-bit (cv32a6) and the
> 64-bit (cv64a6) configurations of the core.
>=20
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
>  .../bindings/riscv/openhwgroup.yaml           | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/openhwgroup.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/openhwgroup.yaml b/D=
ocumentation/devicetree/bindings/riscv/openhwgroup.yaml
> new file mode 100644
> index 0000000000..3bca66cad5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/openhwgroup.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenHW Group SoC-based boards
> +
> +maintainers:
> +  - Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> +
> +description:
> +  OpenHW Group SoC-based boards. The CVA6 APU is the FPGA SoC built arou=
nd
> +  the CVA6 core in the CVA6 repository (corev_apu/fpga).
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: CVA6 APU on the Digilent Genesys 2 board
> +        items:
> +          - enum:
> +              - openhwgroup,cv32a6-genesys2
> +              - openhwgroup,cv64a6-genesys2
> +          - const: openhwgroup,cva6-apu

On riscv, the rule for platforms implemented on FPGAs is that they must
be strictly versioned and match with some clear and obvious release from
the vendor. In your case, this should be easy, because you have github
releases of the platform to match with.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +additionalProperties: true
> +
> +...
> --=20
> 2.43.0
>=20

--EzvXeiIbN3v5MlHk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujjPAAKCRB4tDGHoIJi
0nVwAP9AoxwPfhIeSgR5WU7RTWmZxKvataQAbsLxoHx97QlQ7AEAi8hMNBrVghJU
PZNzs81fYIhAJ8KZSqZQWSuC51Bk2gs=
=67u3
-----END PGP SIGNATURE-----

--EzvXeiIbN3v5MlHk--
