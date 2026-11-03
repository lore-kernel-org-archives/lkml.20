Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742568;
	b=Z0rGaf68WbT/6KtqlnXkImY4fTv/Gu+JyRWq6R+0Zcx2cmVKzzlNt4FLQ6KhIDaZUBQa
	 Li/8nQKOnKycy6e3Wx/8EMPZScW8EOtofNejUFcyzq0Ke4loGs3HhxKHc/N0d2CDYbWFe
	 j2+z4cjDhwLhaGBuDf6JipmKceelt7QtHFVMDCLmK73tK0pWfnJ2AMQmWYrHP26M3jk2f
	 CkP+MdBv/K+uL0Ish+83FHzoz4FIub3Bm+uOmBYnS71rK+cVEPyCIM24fK2/SZhdfTAWa
	 +g7c54lOkiEsAsp/4Y+p51NrglZDnG+SSwOcnNh/HBJKebmzOyX4EGgREeJBERxPzBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742568;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FJgcBT3yUspZwomLITUHEv0rgME0CFKs4q1Bs4VNORM=;
	b=D6HKKlFOL36Q7xnBnXNgBBVmy3Gmy0tcjP+bvUIN113ZcekVqTs7C+ZIceojoH3cLUMF
	 hZqj60751vR+26TiHig9LK4XfpOCnOVHGJp3tK4YrqlvnZD2QF5A5G+DuoXK2GwvtiAD7
	 TTvvueqYdYzg1u/dFVvNnnPZSmmiyUmUlp7xDxWfdo+g8nn+zuJrUKRN0aGU1PP4WmJYn
	 hhQ29iaPxxKtOzXDPvQ/zZ9rAGc4ZCanOEfeWOIOY1Eq1lvhncAtY2WVGRyHpFBMxkFk2
	 2h8WayOflipGPctwx4ANbSp6YXbDkvIa4+a242qTNmTY2MFqNEa7bxCTLXTN0KYrVCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1jGmjkW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B04606A328;
	Tue,  3 Nov 2026 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1jGmjkW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBDE1F000C1;
	Tue,  3 Nov 2026 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742568;
	bh=FJgcBT3yUspZwomLITUHEv0rgME0CFKs4q1Bs4VNORM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1jGmjkW/El3Tva6vihe8cxVRUPbg2hY5HjUM4mkhSCk8vNr9wBC52vmIo4SeyXqz
	 zU00jiRxv105FYDCrxtYJd8vfQlshOvlZ2cx1h6PH1ePSl9EnU9uqJhQFFY/IiYUAv
	 4eKBsLTi9/+13AwbiSDbF8OGA8uelmiazKJOxdW6nqFlDxqh7NOLKV02bVsRSkQP/r
	 V27mMQmODaGZT7EqVPlkQHsP7PtR9h/I0kcb5XVKaL/GEPzpJtYzdk7sg52lNteP+Y
	 GSkkWl4s2R46Ix0tz69OGEdQ6/chKg5xIqGACH6yDzvbCwBRZN7hWbCdimxd/i+mEn
	 8t2OTDZ5yM4Zg==
Date: Tue, 3 Nov 2026 21:49:22 +0000
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
Subject: Re: [PATCH v2 6/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20261103-charm-ending-efe2b7081ca7@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="zB/wqLxM1r6PbqUO"
Content-Disposition: inline
In-Reply-To: <20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com>

--zB/wqLxM1r6PbqUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:30PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS P8700 ACLINT MTIMER.
> Extend support for both mtimecmp and mtime registers
> within the ACLINT MTIMER, identified via reg-names.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Same comments here too.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 35 ++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index cf7c82e980f674afcf59fc726742dc4f49c1a820..40acb651c27b7eaa8a20caa8b=
bc225b350088810 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -21,14 +21,19 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - const: gf,mips-p8700-aclint-mtimer
> =20
>    reg:
> +    minItems: 1
>      items:
>        - description: MTIMECMP Registers
> +      - description: MTIME Registers
> =20
>    reg-names:
> +    minItems: 1
>      items:
>        - const: mtimecmp
> +      - const: mtime
> =20
>    interrupts-extended:
>      minItems: 1
> @@ -42,6 +47,25 @@ required:
>    - reg-names
>    - interrupts-extended
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: gf,mips-p8700-aclint-mtimer
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          maxItems: 1
> +
>  examples:
>    - |
>      timer@ac000000 {
> @@ -53,4 +77,15 @@ examples:
>        reg =3D <0xac000000 0x00010000>;
>        reg-names =3D "mtimecmp";
>      };
> +
> +  - |
> +    timer@16154000 {
> +        compatible =3D "gf,mips-p8700-aclint-mtimer";
> +        reg =3D <0x16154000 0x7ff8>, <0x16108050 0x8>;
> +        reg-names =3D "mtimecmp", "mtime";
> +        interrupts-extended =3D <&cpu1intc 7>,
> +                              <&cpu2intc 7>,
> +                              <&cpu3intc 7>,
> +                              <&cpu4intc 7>;
> +    };
>  ...
>=20
> --=20
> 2.43.0
>=20
>=20

--zB/wqLxM1r6PbqUO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupW4gAKCRB4tDGHoIJi
0tBmAQCRIIS3LK3kIk683cX88JVgQMAIB2a2Eg4xoiGAWzuF1QEAjZk3AD06su9q
TUaxj84yuk7WH4tO+RnQj6h7foIK1gk=
=51DL
-----END PGP SIGNATURE-----

--zB/wqLxM1r6PbqUO--
