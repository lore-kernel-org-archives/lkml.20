Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850231;
	b=zWZCC6tN8fS5LPrZxKurNunFKGWcSWCpL2nwwn5fiicKu8GW98eYhQaZKzcijjWxzfjB
	 ZvVumV44AL8WwBDwWiWdKfPA8f3lstID5mvZ26w6ibHHjH6lwqs4C34mdcEVszgNwxC2y
	 Mn2sGVcjtO3xZcVsTWAXBh5TYIyVfJL3fkynvxPeyE8WEijSkvmtwFp/IDRg9dzY60zBb
	 wazLmSNQNUSI0vVt6axUp3aH81cgJXvtVFivFzfr2rcrKwEvbeCD2lbWz68flClXilSj8
	 65rl56QO5gsOEhTnSJOFKXkBtWf3zTCCy1UsGbCMDX/wouAfroqBtv4kwHTwKXW6qYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850231;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6YyjGsuK+qsmWUW6iOiYpmAGFCmyQyZ9NbxIpIgGTg0=;
	b=ZycjN2sGiBa6yOqaPM72NKlXKSe3ZtwPlvkYndCPIFko9MNrQsnUjMKt3vL5sxGCHM4X
	 wiaJiHzLlw540+6TW2RbmgqET/oIeIb3Iidg/oWSre95AJfSEaTTb2CJ5K568Nggj3pZ4
	 2FQxuUXhX1QOxm265I4G8sAyo+p8COvm0EnZvYkLCfMMJefKOz1FjaeiJlpk65KBVusM0
	 2UM7d9P+PkOX3iydAVvUaZ+A0pUhiCG9LyqCL/K8bcNDyAO9/y7S0I0EeyZO6m1hoQ7by
	 dYAXXZXmDX/Hq1hhZO1Z8VIThkWReS4aUnFTGD0YPCvBqggQKgjexGN/6mi0Thyxi5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHEHMQSK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED34606A330;
	Mon, 16 Nov 2026 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHEHMQSK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04581F000CA;
	Mon, 16 Nov 2026 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794850230;
	bh=6YyjGsuK+qsmWUW6iOiYpmAGFCmyQyZ9NbxIpIgGTg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHEHMQSKaxgr4dNnoQCnCtY2RQ1dZNB2PirO2DGGsoZjShp0jnioomSdBcgSlbP+S
	 S8CURBOykelBClBbJkMqA+eNubpWaxIiCatWsqRql2kyhwyCMspy7tM+owhE5bnUTK
	 c3rEwZYMf+XJFkvCdYSIKPWjTBbN0X+Ok4OsgwDIhtQ6QVhUD/wQsAhcqQ4hRQ91Zn
	 fkw69JFT8NkQIiHpnMjI8ACNt0/h5UXaCwhQ2ySccPjunMvqp/T61tEEyyC3IAZYXZ
	 s119D7JhV+zmYWjijjRhPDgzcIxFGB0I6lt6IGVVFhdC5mXT/GVObXCM/cqo6QtVSj
	 kYTpBTGzRz4tw==
Date: Mon, 16 Nov 2026 17:30:24 +0000
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
Subject: Re: [PATCH v3 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20261116-exquisite-taco-e48371fe6912@spud>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
 <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="CVnCqKmtYuCXL2ot"
Content-Disposition: inline
In-Reply-To: <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>

--CVnCqKmtYuCXL2ot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:55:12PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS P8700 ACLINT MTIMER.
> Extend support for both mtimecmp and mtime registers
> within the ACLINT MTIMER, identified via reg-names.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Perhaps worth mentioning that we are doing this this way because opensbi
expects this behaviour, as does u-boot, for the riscv,aclint-mtimer
compatible and we wish to align this device with it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

(If I end up applying this, I will amend the commit message)

Cheers,
Conor.

> ---
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index cf7c82e980f674afcf59fc726742dc4f49c1a820..a5ebe04ade9ed61c8beac5017=
aab94ab12afa9ea 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -21,13 +21,19 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - const: mips,p8700-aclint-mtimer
> =20
>    reg:
> +    minItems: 1
>      items:
> +      - description: MTIME Registers, or MTIMECMP Registers if only one
> +          region is present
>        - description: MTIMECMP Registers
> =20
>    reg-names:
> +    minItems: 1
>      items:
> +      - enum: [ mtime, mtimecmp ]
>        - const: mtimecmp
> =20
>    interrupts-extended:
> @@ -42,6 +48,26 @@ required:
>    - reg-names
>    - interrupts-extended
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mips,p8700-aclint-mtimer
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
> +          items:
> +            - const: mtimecmp
> +
>  examples:
>    - |
>      timer@ac000000 {
> @@ -53,4 +79,15 @@ examples:
>        reg =3D <0xac000000 0x00010000>;
>        reg-names =3D "mtimecmp";
>      };
> +
> +  - |
> +    timer@16108050 {
> +        compatible =3D "mips,p8700-aclint-mtimer";
> +        reg =3D <0x16108050 0x8>, <0x16154000 0x7ff8>;
> +        reg-names =3D "mtime", "mtimecmp";
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

--CVnCqKmtYuCXL2ot
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavs9sAAKCRB4tDGHoIJi
0s5EAQCSUQ4DdcvwqeBYb+HrksHy7xGNiAQ1VyEPqGiIFKuuYQEAgVGb9xosFIMM
h2HmXwz1L8sUNsduaLdiHG3jbCEJBw4=
=ArEc
-----END PGP SIGNATURE-----

--CVnCqKmtYuCXL2ot--
