Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853599;
	b=m8SQweFf/qPfnoGn8LdCBECJZKyUzJXi/F8P89qW+8w2fmhxfUaktVunnrcDHYw1hyeM
	 SKAOVs7V4EmsNthPPHvHmaz0EnXF7LXsPHpsGzqsccqo1WkQq47H3/qz1SGegK16NTll9
	 RWdkNuBcXjxxngrNmPiYnWiZFPpkoiYpG/ho5SxmJNzHUA683Ok3Hv2I2cYkcB43ORXX0
	 oiRbwPrc1iOftQvXSOEXse/7EareH3WD6Ey5hf/jgNncSrDgb5y01W7uubgvabpqLU6/F
	 BnBU2XV3Ld2MiGMo124eSYwWykIXCJejzVE7laLg3i5bBZB/RYNoBB56w0e7GYuDgUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853599;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xU8Zv6Q9zSZob8EAaOmEe2n7yaNYuwxo2NXfjqN+WAY=;
	b=EUR8BDjW68N/0a582OMpy7aqWA7+YbQNxVsAolh1TwgLG/oKfNhD58RzXv6AktD+MtIV
	 zW8/b2H1/cb/StUzf3uY0sHTWmSpf6K67jznCqdt+NfOwuPDRqwpF23yZ8ufY58Q9ZSNT
	 OkdOGj96phafTmABuhhEU1UeV6dXrnMnyAjg0as68uHif63f5HCH50tstnM5X7skRfOEO
	 hE+wGw1a35oQ60Ne0AS90STNNyuPzsXHAqVxNjVtg1PL/lszDTCpJ1hIU0Xp+ijz4gXRy
	 dtWnXaWM2DrmnH4hUK+57tT2BDw1Oph08TxODJk5mAt00mWxbB8XaJXMtl/e5oHHNag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wt7x0p4J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D64606A322;
	Mon, 16 Nov 2026 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wt7x0p4J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F821F000C9;
	Mon, 16 Nov 2026 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853599;
	bh=xU8Zv6Q9zSZob8EAaOmEe2n7yaNYuwxo2NXfjqN+WAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wt7x0p4JJo8g/3xKlFUnlgI0KDdow44LpJZVjhKSbGUe5kQv4lWDhbGteSToeZDBX
	 Ye3nm7hm4SCGc7Vz5AvfQeeOp4dGnoLlQeKmB70L9b5yazwUk2wdAMA7OQ/S5qYWBh
	 toRKVEIsEpBWWCfSuLhtJvhVU+dcaLUhpwDKKaJl6M2DLXxACwJlSsRZr7mgodI9Hl
	 UZ98ABOWZtbKKX3IDEAb3SvMULs7RRCN/kse/nSSJiXZZ5Hh+UJY3/ugQcAWRl4lzh
	 9h2RY4Eg2dCxBpfvlwdOowVKJ8k8Um9B6ZKyKEtBMLXQVTCtO8r1cuTS3Zq93toJxl
	 BwZmi6psAKWmw==
Date: Mon, 16 Nov 2026 18:26:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
 compatible
Message-ID: <20261116-dreamless-matador-3163d4abbf0b@spud>
References: <20261116003937.1776888-1-minachou@andestech.com>
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
	protocol="application/pgp-signature"; boundary="FfymeufmoUF60Lg0"
Content-Disposition: inline
In-Reply-To: <20261116003937.1776888-1-minachou@andestech.com>

--FfymeufmoUF60Lg0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 08:39:37AM +0800, Mina Hui-Min Chou wrote:
> Add the compatible string for the Andes A27L2 CPU core, which is used
> in the Allwinner V821 sun300i SoC. The V821 devicetree will be submitted
> separately by Allwinner.

I'm going to apply this, on the basis that it will be used elsewhere.
Ordinarily, it should come with the allwinner series.

>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 0da219ae6769..fbe8f0625e76 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -46,6 +46,7 @@ properties:
>            - enum:
>                - amd,mbv32
>                - amd,mbv64
> +              - andestech,a27l2
>                - andestech,ax45mp
>                - canaan,k210
>                - nuclei,ux900
> --=20
> 2.34.1
>=20

--FfymeufmoUF60Lg0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtK2QAKCRB4tDGHoIJi
0ryVAP9W43QUwLeP0Px1uPAyZV3Aq9OKHhjCmTsoQo5pxt7MSgEA4tJF9qwL/7L6
ii/PIC5KXUrbOBvtmlVKZop5d7nR0QE=
=EoEb
-----END PGP SIGNATURE-----

--FfymeufmoUF60Lg0--
