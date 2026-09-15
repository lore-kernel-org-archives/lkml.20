Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B26439F7C;
	Tue, 15 Sep 2026 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495125; cv=none; b=T/mak25gAemFAHbhxqpDU9GE6h6hkaCT89KAeWdgS17WMR9jdVC7ieJ5ugbLRM0cxLTD/Ot7F0dxgUvS8JrW9w8UwI1os2DR1DbGaLmJN9Z0iBLsvJTI8YY+XeFYyaA2wCsgVklMq1RKtVY6bV1Zngbt//uwEPzoPmOBQGyvqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495125; c=relaxed/simple;
	bh=HwGBpLCRw1Jt3wNvN5l7exLwWc/g3rAiWufrj89JgxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aB5uwMoz3gnCCsXvAnJyrVXyhBsjTdZUu3/CgrZw2q62RCA8IYHy82KZrtCoHH1Tir7GbgzR3vwsxUh0twCJsoRhYtoIM3upQGAJ3S9lM7z79QgcvMhpvmryShyIwCQYvJRdg9CyRli1yaBSpqWCO8NIQ9RwAQ7fXMde/xodVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hodTFs9U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hodTFs9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317361F000FF;
	Tue, 15 Sep 2026 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789495123;
	bh=oUHffrv3GQ6o5rtKOOsay9s8TNC5DB5ASbnygHPwxHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hodTFs9UAZ3ejFEuLYh469ysVLIHxRPQ+cG4KEjNf6o2JW4dSFbA5Fj2L4nFgUvLu
	 kaoEF0o5Bjfi2G+UmU5e0KNUT0eDxtM+dGE1FpdRQXtn+unZRUmB3QPYV+Kp6vdU6e
	 STCdRLkVqaUKqzEqvVH/gWAbgXeScfDBD+PR9/6MOIXUe7+XySbbHZq/Dqn1YRB6Gp
	 oEOpzVtZ98XqSJXj2zBZoz65cw07rpJjZWGVrcdTFa8dD6DCeAVIrrZ90z8xBt+XVH
	 ugHYt8oPFGCh9ubLAN8IWx2/xA6dCCyLiRETpMr6ci/OeaUyLA3DLce7vA1MCYkzwH
	 svOoup5dc3V7w==
Date: Tue, 15 Sep 2026 18:58:38 +0100
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
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Message-ID: <20260915-woof-ducktail-5e2f52bc5762@spud>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-3-3267f14ebce1@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rKfDYnTgx/BZV2g0"
Content-Disposition: inline
In-Reply-To: <20260914-p8700-dts-v1-3-3267f14ebce1@htecgroup.com>

--rKfDYnTgx/BZV2g0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:55:51PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS Boston board compatible with a P8700 bitfile.
>=20
> Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/riscv/gf.yaml | 27 +++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/gf.yaml b/Documentat=
ion/devicetree/bindings/riscv/gf.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..060910c9b04f482aee6f08f8f=
72232acbad118bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/gf.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/gf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GlobalFoundries MIPS SoC-based boards
> +
> +maintainers:
> +  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> +
> +description:
> +  GlobalFoundries MIPS SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Boston FPGA development board with a MIPS P8700 bit=
file

I'm not convinced that this is specific enough at all.
I have absolutely no idea from this description if there's even a
specific FPGA involved here - this could mean a bitstream used on an Altera
platform or a Xilinx one, with totally different contents.
I'm only happy with FPGA bitstream content being supported if it is
versioned strictly and matches with some clear and obvious releases from
the vendor. I cannot even find this board by googling it, let alone find
clear information about what this could correspond to.

> +        items:
> +          - const: gf,mips-p8700-boston

"items: - const" is the same as just having "const". SoC-specific
fallback is also missing, although in this case it'll be tricky to have
a meaningful one.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +additionalProperties: true
> +
> +...
>=20
> --=20
> 2.43.0
>=20
>=20

--rKfDYnTgx/BZV2g0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmHTgAKCRB4tDGHoIJi
0rgaAP9woGMlHghSEluZoJhl8LSYpU0BtwuQg/FGHRDSTJjk7wD9G5ghtcCqBeW2
I2QpH3waoJuqaWWujuvwJuXMKlMSyAE=
=lJT6
-----END PGP SIGNATURE-----

--rKfDYnTgx/BZV2g0--
