Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647459;
	b=HeaO38Jyp8jatKBgSlGf574x8EQVBwERdPruC50DBWCd6EzguIcxRv/Bx6t9K6ebe/eD
	 rRjA2sG8AESkJMWPFHL1TZNclIWeNgctHrOoTXCU1V46dP9JWI6aeqyE5Ywjk95RFdJQl
	 /zFSehZ98e8AmPtR69jZgCeZkDiwp/cLK3Sf5HPhxwhAkL0633t7CVnrJgT2M6bzD4sI4
	 tm5GinOcw3CSfC3DIlY4EcMvip8iDV9McUeXhy+t6bSXjRPa6sCY6Xx/STMBKFhfUZmcw
	 8KqVivqKYGkswrd1EKEH/rMtC4mAsRj4z7N37AqV7lYPxIMmTOv5vB9P3bbfpjOKUng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647459;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BqhAHZ1CAtWu/7yJzc2Z1CotAWcWleo0RVIl/xA44qo=;
	b=d5cyBIB2Cf9F9mL4UV0IVVXGclAETgNLa1EPB+LtRb18+O/1ClNd1uukEQzwnPzij1m5
	 5aLBTQSXfCTbCEDH05Gw4yBsDPwn5StIlIkWPCIQ9ZTbC81gY1B89t90ADAeH05JlAqFN
	 viJOZRwoYu3YAWAgycFVy+z4RnFPSifm1cVwC4/UgqUaW+pZjQALFU101Gpm/MhcKy6+A
	 dFwq1ySZTu3VQsQsVu+uibQO/TIcpKAJlP/tLfH3ZrmgxTWz/0qmDfbGRK9uYKNyusjrw
	 2N2KhGNFwOVIxiq/2MQk5x0NuGPAxPyGc5ZWtXR9p7ef3OLJSdzH5KhFzu1lIEVOm5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=butBOikZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B625606A324;
	Mon,  2 Nov 2026 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=butBOikZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5E21F00A16;
	Mon,  2 Nov 2026 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647458;
	bh=BqhAHZ1CAtWu/7yJzc2Z1CotAWcWleo0RVIl/xA44qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=butBOikZsSTt6L+OgmLjcLlwoy1icu8Z0meF6li9wTbJCgd7o9KG3YERIQmLWn/os
	 6/PphErsbvCfBXuC+G1xamDNqRymIcKvXGavKrF5O2q56iRKksae6nfjJhM5LRAS2z
	 KnvNnjzXg30V+heQDPRauiomUylktC/jxRffmoDAQIhaAjd04yIhZaZxVSzwrsQG/Q
	 H+2XNm1pxJfdtWqdftFbIRd4gjC8NgTt90/hdzP3uCgPFk5rcukhp4OIsnsX4PTeAw
	 Ic7wB//aUsUzXUvoQNOpZvCxM/KCThD+dAi8xeOl/YtVgj6dHTGE43+mCw7vcBsk8t
	 1bRfioQZK+poQ==
Date: Mon, 2 Nov 2026 19:24:14 +0000
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
Subject: Re: [PATCH 6/8] riscv: add ARCH_OPENHWGROUP Kconfig option
Message-ID: <20261102-rice-large-30bcaaf9de67@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-7-marouene.boubakri@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="SVuCYZvGx7jAhdE2"
Content-Disposition: inline
In-Reply-To: <20261102141727.640769-7-marouene.boubakri@oss.nxp.com>

--SVuCYZvGx7jAhdE2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:17:25PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> Add the SoC selection entry for OpenHW Group platforms, which is used
> to build the device trees of the CVA6 APU FPGA platform.
>=20
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
>  arch/riscv/Kconfig.socs | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index cecbce0c49..289448e489 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,15 @@ config ARCH_MICROCHIP
>  	help
>  	  This enables support for Microchip SoC platforms.
> =20
> +config ARCH_OPENHWGROUP
> +	bool "OpenHW Group SoCs"
> +	help
> +	  This enables support for OpenHW Group SoC platform hardware.

> +	  Current support is for the CVA6 APU, the FPGA platform built
> +	  around the CVA6 application class core, with the 32-bit (cv32a6)
> +	  and 64-bit (cv64a6) configurations of the core on the Digilent
> +	  Genesys 2 board.

Delete all this, it'll just bitrot over time.

> +
>  config ARCH_RENESAS
>  	bool "Renesas RISC-V SoCs"
>  	help
> --=20
> 2.43.0
>=20

--SVuCYZvGx7jAhdE2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujjXgAKCRB4tDGHoIJi
0jALAP0WW8TLwZ7TIANzBaugcK0mbOjCrVpgWybIjtJQ951x5wEAktICrb4s4gPY
pj1QuLqMdR3V8VoBM2VBfuXOfRWqjwU=
=dT3B
-----END PGP SIGNATURE-----

--SVuCYZvGx7jAhdE2--
