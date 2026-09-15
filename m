Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1775418B0A;
	Tue, 15 Sep 2026 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496173; cv=none; b=apEVaUgZV+0+MUX6AuhJV5uAvDB7KWUdRh4q8AeiVC/Vze69uLP7pYJRMK/ByQFQMiazL2gTwTzKXy/z9WinC37q4g6fQVRRthbFk0PnvnVdeV0ZHlKlZtf4a0Ft4lLkWwFwSCLnnhAdQK0hTtCAWVWpah07nVpLBbZ/MZ6Ba8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496173; c=relaxed/simple;
	bh=tB0VehmOW9yEZ+OdOWtVYjUXbWyIYvkOBDRaPPuecwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzjA0Y7QxZlbzgxx/UwK09EE1opzgCGB9oTYXJDDGyC7QnyV2+v1guS0EviQnVjmCn5ac3tZLW6ptefSE1T6/SRpxJrkN2ctOtb7H+Kia1YNf9+GbISq236GKul4bvBue6hG/1qY7QkAy5flfUFfruXZnlymgSgvo6bl62Jnl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ydzy2E7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ydzy2E7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FA91F000FF;
	Tue, 15 Sep 2026 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496171;
	bh=ySr+56whePHW7B5Qp//edff3HYB29zXpe14GFiZEua8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ydzy2E7mRGaTox9NCLsc//oh6DLpnC840Z50/VcGsJVlmGC+XGO7HmrqI89C8B6n9
	 KtTCV0wKUFZk0D5iW0Zu2Ia1I3sXIJTBNtJAofNg/2ZJsg7mwD+UV5DU8NfVE3C+hs
	 AgW1E1RpMtLrAEIdW7H5+TucdPnSOMie0hjmpl28TzdAr7qTSMZhCfWDLKSuaxydQC
	 1Hu08eMCnY+B5V40O1oXKy3MgXbKCs2wTMEroKMj9AsvnIrPjWRy2aq7XEN4RTtYIg
	 OcEmen8kaChTAaXri19P2gvISEaI2a6LrY2Tp5biWBx9OwZj9LgNAI/gYQsknAMXKq
	 7qzkZQC2rLfEg==
Date: Tue, 15 Sep 2026 19:16:04 +0100
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
Subject: Re: [PATCH 4/9] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
Message-ID: <20260915-mummify-overripe-ed52faf90098@spud>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-4-3267f14ebce1@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0zvhSKx1C7J763gn"
Content-Disposition: inline
In-Reply-To: <20260914-p8700-dts-v1-4-3267f14ebce1@htecgroup.com>

--0zvhSKx1C7J763gn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:55:52PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the aplic compatible for the MIPS P8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,=
aplic.yaml
> index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe5=
35075111601b80e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> @@ -27,6 +27,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - gf,mips-p8700-aplic

I'm also curious about why "mips" appears here. Isn't p8700-aplic
specific enough?

>            - qemu,aplic
>            - spacemit,k3-aplic
>        - const: riscv,aplic
>=20
> --=20
> 2.43.0
>=20
>=20

--0zvhSKx1C7J763gn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmLZAAKCRB4tDGHoIJi
0r8ZAP93/tLAEnhBCnKK0KqnJFLPNSvTn8/pgSvD7+LthvtOUgD/RHbkEYrvDoM+
K4ZZEN7ahJ2apXzW1QvSUkjeRBuoDAI=
=c5qF
-----END PGP SIGNATURE-----

--0zvhSKx1C7J763gn--
