Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742708;
	b=hde2UY0I624bcq/AG2K2f7gu3Mql6f0g4x2HNlt2pSMUslnYtJnQdZb1iBNpW/O6ounk
	 ULS1dzo0SrxAQfIi7oSAvPyhJ+e23qa1agMlicPhK4QVUSVo0sokU2GWtw3Ni4GdqZsT1
	 nMXvMPr8RVdT9jpE0JUj5JLQQY4yyS/d4JylgZzHDaR7zNodCBD9Bq9BLqHDQoPIpR5nM
	 2dUrXhq8o0WdcTZPgB+ztS2hWPF50p0HhGPkVrdxvvIb60Vgp3xdsFVNDnRthL+afuDot
	 yb2lXM/cXTehoU3OwLgLERC3/BXZDGUN/cADfLXArSMdj18cKyUqK1dAhLIViH/3E8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742708;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qMfzSFB0OroJMmPBnBqKVEnv9fzY7GHzp2GhXqpM3mc=;
	b=3xgLBZsSzKyPk2L1F3Vka4xzDHI6ZeoXqUoidE3ncB/mzIYH4N2KypSvz+igtyFLLYHY
	 jbAEFwt7iR3Z9d/CxPPy7RI/nnIUX/YnqDj1FPz5eidYS7iMO0kLLoMxLcGSxaRWqDfpZ
	 h2E+4z4D2k03rnTNuwDjYLaHQBnaoTsFn59PZPHSGDUMedfTsifunISdnQNxy5kPhd/XN
	 N72iyU/ycZkuawZo7EmrFOpAFtJ+WQf6+J7EfVOUHhApNdftr1If0mGs1x2yLaUgCGjtf
	 DoIJXF6bnqjKAjN8SoXv3CUWUVwt3YXX+imQq2vXopud2fz+Pcdsu3DRkqO9Xwvjl9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icoKQxZI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802DA606A32E;
	Tue,  3 Nov 2026 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icoKQxZI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DF01F000C1;
	Tue,  3 Nov 2026 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742708;
	bh=qMfzSFB0OroJMmPBnBqKVEnv9fzY7GHzp2GhXqpM3mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=icoKQxZIqkaP0akUtRsQbRO6KTR0laJIKdG6couGqtlpsJb+0fpoSWEs94wXYdoOt
	 OCRX+fhkyDr5YQ8RmzF6ULcOCtiLUg8vnSEc8BfQluomnfaX3KiMQ/fGkY+9d9uQM5
	 4CNiw+U5uQcZd98uo5h70pm08TXui1PRjvEKnc+7SV8J7du9hurl/yZLl16dGe6dPf
	 brsheO4RemIcTiE96yY8sQ/SZ32kS7OAOavKd1KN8fhHZpt+pGC8ljJLR43Nci08nT
	 bhaKpQGGHBLai4TJfcBkjwLSazWmGm1V6aKuZmn976LmA8/wSjOUrlue+dLxSAyymr
	 obGri9r6XY2OQ==
Date: Tue, 3 Nov 2026 21:51:42 +0000
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
Subject: Re: [PATCH v2 5/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
Message-ID: <20261103-ammonia-bonanza-dd6212357a3e@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-5-3ac5d49f2c37@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="tH29625J/yAJgHij"
Content-Disposition: inline
In-Reply-To: <20261103-p8700-dts-v2-5-3ac5d49f2c37@htecgroup.com>

--tH29625J/yAJgHij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:29PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the aclint mswi compatible for the MIPS P8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Again, same comment :)

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead=
,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-contro=
ller/thead,c900-aclint-mswi.yaml
> index 62fd220e126e650e3800d8eee2a749fdbbde6108..ca91b650caab8927b3a4ed91f=
1f7f142e3790a97 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-mswi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-mswi.yaml
> @@ -21,6 +21,7 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mswi
>            - const: nuclei,ux900-aclint-mswi
> +      - const: gf,mips-p8700-aclint-mswi
> =20
>    reg:
>      maxItems: 1
> @@ -46,4 +47,14 @@ examples:
>                              <&cpu4intc 3>;
>        reg =3D <0x94000000 0x00010000>;
>      };
> +
> +  - |
> +    mswi@16150000 {
> +        compatible =3D "gf,mips-p8700-aclint-mswi";
> +        reg =3D <0x16150000 0x4000>;
> +        interrupts-extended =3D <&cpu1intc 3>,
> +                              <&cpu2intc 3>,
> +                              <&cpu3intc 3>,
> +                              <&cpu4intc 3>;
> +    };
>  ...
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

--tH29625J/yAJgHij
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupXbgAKCRB4tDGHoIJi
0ro6AQCerbghjDIlBOLIboHDuekV1p4da16UBOHEghcjMtCuggD/WZOimiIwBuT7
NyQ+YYhTVm4SaEHlUuhIhSKSYODNAwI=
=QGKB
-----END PGP SIGNATURE-----

--tH29625J/yAJgHij--
