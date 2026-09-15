Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8943846E;
	Tue, 15 Sep 2026 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492396; cv=none; b=MWOU5o8Xev/2Ob1h9ewXqiW196temh9aYtYgXeWBkCwOeYpfsoo65X6FOzT46OITCAHBsNcj00ChDMUUbGTG1iJ66HG5HmzuElX1n//hMh3ckaFy41w+pj31BNI2yGCNxRwPHeoex6hMt6mM3Q4i/wRYmTZJddzv6ZfahFvIhiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492396; c=relaxed/simple;
	bh=ivBonYODbbsrsacrHrcfoJQOLzw23nGRDwkGNZqoBo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcHw+mQP2xxSbrLzj9X/393Wsjm8CwVi5eEZeK/74iIrQAcBdTlBi2RSGTW98hqnaqtafXGinarrZ97kLeFi0FbhbwulZaT3/8K2wYnSe1fkajkgJVc+o4IHM7lPceIDZ7rDnWp+FmJV6xeYWHNtYjMd0rq0yHK2Bf+29tFLtec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKOnqNmU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKOnqNmU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260F81F000FF;
	Tue, 15 Sep 2026 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789492394;
	bh=YJR9aq2r86J30eW8lL/Fjsuscy+SjBA6fWgSJoTL8AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OKOnqNmUUVc6YU90Q7sW0mC92AKXaFVQvfauDuNsQ6qdMUDZisWKNfUtoDsHiI0+l
	 eG2M47wjWgh0mM8K0aq+F74Ai/vQr7mouMeTdalC7p05GQaq04qSL6tN1GAAfvHNO6
	 8XnESBkddlGTcnbFYHtzRCI7CyLZraBqgOkTJIqTEADOEnFmXtGm/hz2Ep0Mcn2JaH
	 7/nrnmaIgyMVLDAfcELr0qkTO+zM9viRTsL5Ob+t9kP+r+7d81fAK3zyXFUVwY9jBD
	 Ux3yvf6LWDMYREU4qwh3MWyOEnervXSkfvCxLrmflqPxR2ogTn3ZtsCBQJIIm/bo5+
	 d4VcEfPSn/jkg==
Date: Tue, 15 Sep 2026 18:13:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rahul Pathak <rahul@summations.net>,
	Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
Message-ID: <20260915-reappear-hatchback-f4c3697a1b4e@spud>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnRve9bgpYmX7ikw"
Content-Disposition: inline
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>

--rnRve9bgpYmX7ikw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 03:15:16AM -0700, Amirreza Zarrabi wrote:
> Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
> TEE service group over SBI MPXY.
>=20
> Describe one mailbox channel per hart and an optional interrupt used as
> the availability doorbell for asynchronous notifications.
>=20
> Add the binding to the existing OP-TEE MAINTAINERS entry.
>=20
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

The clock and (?reset?) bindings for mpxy stuff have both S and M mode
bindings. How come you only have the S mode one here?

Cheers,
Conor.

> ---
>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 66 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.ya=
ml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> new file mode 100644
> index 000000000000..8f6ff313fd42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI TEE service group based message proxy
> +
> +maintainers:
> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messaging
> +  protocol which is modular and extensible. The supervisor software can
> +  send/receive RPMI messages via the SBI MPXY extension [2] or some dedi=
cated
> +  supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines a TEE service group which is the RI=
SC-V
> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.=
e.
> +  Linux) are peer endpoints and the RPMI framework (machine mode firmwar=
e)
> +  mediates every message. Entering OP-TEE on a hart runs it on that hart=
 until
> +  it responds, so the SBI implementation provides one SBI MPXY channel p=
er
> +  hart; all of them are listed, in hart order, on a single node.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,rpmi-mpxy-tee
> +
> +  mboxes:
> +    minItems: 1
> +    description:
> +      One SBI MPXY channel implementing the RPMI TEE service group per h=
art,
> +      listed in the same order as the CPU nodes.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Availability doorbell raised by OP-TEE to signal asynchronous
> +      notifications over the RPMI TEE signal bus. Optional; when absent
> +      asynchronous notification is disabled.
> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tee {
> +        compatible =3D "riscv,rpmi-mpxy-tee";
> +        mboxes =3D <&mpxy_mbox 0x10 0x0>, <&mpxy_mbox 0x11 0x0>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 207a6e2db70c..7d0e550085b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20577,6 +20577,7 @@ M:	Jens Wiklander <jenswi@kernel.org>
>  L:	op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-bus-optee-devices
> +F:	Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>  F:	drivers/tee/optee/
> =20
>  OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER
>=20
> --=20
> 2.34.1
>=20

--rnRve9bgpYmX7ikw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql8pQAKCRB4tDGHoIJi
0smFAP0R3vKvUGlmEV4YG9wl6CzD59R3GC/ptm3Ws/6hAwvFEgD/SWG7NL0Hb75u
DRG3OBY7VmT02Og/lMQzuGAffMPf/QA=
=mJKu
-----END PGP SIGNATURE-----

--rnRve9bgpYmX7ikw--
