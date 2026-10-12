Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3FC3B6C18;
	Mon, 12 Oct 2026 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831084; cv=none; b=eI3CPr37V8H/IU2eIQqt4I+0YCrDGOwGTuZnySL0MjiuC+28Aad+R7H2J+S9L6dI3Iqhqt6KFCVmrnVnB9etM5fOnBurXoWo7NypODOzUna6kwaQx6IEYUcJNS9CsOuoAIyln40eNh/6OdaKWtJviVDb7QjgYuiT0YTpj7Vy5F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831084; c=relaxed/simple;
	bh=tfy65yP12CcWTjn1RnefFR1V3iYUiXSFUr0itScFnjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3A2ytcUgFdYiH4RN5eooGsgreEskDyg0f3TAycUObcHvJP9IG1SO3+fqclXQWS6E/5YwNiye/CcrWFHdVm2Air4WBUWroKi5KAPZy+4HgFvIvM8QK/6qRhzSEFDNzcW/S5g7DmEuzXq8j9jcEjd0TzkdyWSUQhdohFrPIlhcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4v22Wme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4v22Wme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD1B1F008A1;
	Mon, 12 Oct 2026 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831082;
	bh=mtwNcRmsXn/xuMBw14syHv+FkpWcbZDNksry092ds7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4v22WmeYCzxHSaE0NqmdnqB4AdrnQ6Sqp6YQpyRSYVY+05Rhw101353K1WwyOM89
	 MnFeGMGyl4i35nBiKC6GzuJH7UpI6JoMB55tloiTsR0XPYJ2VGQ77+gHBqhTkeslPR
	 8RPztJAq/0n4jCAhB4DKqmdWlZ1tB77cS5Dd5kOxpz7e/5Htmui8H84MOF1neAXh7E
	 LF1eQUUfHI0+8ZOUndULcI4IWbUl4NhaeCjAcXc1UbeYr3JbisOxQ7QvO/WRgYe5Zl
	 U/Hd+aFcqr3yHfoQnKeiZAF1lQMk7IApY9Y6gIhs/esdrSHv6bHIov4d7gzva3PMN8
	 pKNWCNxJrUFjg==
Date: Mon, 12 Oct 2026 19:51:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
Message-ID: <20261012-shale-rosy-805c49f6c404@spud>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kzOJFdMHckNIu+r4"
Content-Disposition: inline
In-Reply-To: <20261012164354.3872326-2-elder@riscstar.com>

--kzOJFdMHckNIu+r4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
> Define the binding for the reset controller functionality present in
> the Toshiba TC9564 SoC.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc956=
4-reset.yaml
>  create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h
>=20
> diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset=
=2Eyaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> new file mode 100644
> index 0000000000000..1908e9539abac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 Reset Controller
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description:
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The switch
> +  includes an embedded PCIe endpoint that provides access to various
> +  SoC peripherals (including a reset controller) via its BARs.
> +
> +  A total of 13 resets are implemented, though two of these are not
> +  controllable.  Access to the reset controller relies on PCIe being
> +  functional, so the PCIe reset is assumed to be deasserted.  Similarly,
> +  the PCIe controller relies on I2C, so the I2C reset is also assumed
> +  to be deasserted.
> +
> +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
> +
> +  The reset controller uses registers within the same page as a
> +  clock controller, so both devices are defined as children of a
> +  "config" syscon.
> +
> +properties:
> +  compatible:
> +    const: toshiba,tc9564-reset

Why does this need to exist as a standalone device, rather than be
rolled up into the parent syscon node? It doesn't have any resources, so
it should be doable.

This kind of thing for a syscon is always difficult to review when only
one element is present - where is the rest of the syscon's
functionality?

Thanks,
Conor.

> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - "#reset-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/toshiba,tc9564.h>
> +
> +    syscon@0 {
> +        compatible =3D "syscon", "simple-mfd";
> +        reg =3D <0x0 0x2000>;
> +
> +        reset {
> +            compatible =3D "toshiba,tc9564-reset";
> +            #reset-cells =3D <1>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 252b6d7ee1638..d0eb44079fe17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28180,6 +28180,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>  F:	drivers/misc/tc9564-pci.c
> =20
> +TOSHIBA TC9564 RESET DRIVER
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> +F:	include/dt-bindings/reset/toshiba,tc9564.h
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include/dt-bind=
ings/reset/toshiba,tc9564.h
> new file mode 100644
> index 0000000000000..5fcc9a06d4ff6
> --- /dev/null
> +++ b/include/dt-bindings/reset/toshiba,tc9564.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */
> +
> +#ifndef __RESET_TOSHIBA_TC9564_H__
> +#define __RESET_TOSHIBA_TC9564_H__
> +
> +/* Reset IDs */
> +
> +#define RESET_MCU		0
> +#define RESET_MCU1		1
> +#define RESET_MSIGEN		2
> +#define RESET_INTC		3
> +#define RESET_UART		4
> +
> +#define RESET_MAC0_MAC		5
> +#define RESET_MAC0_PMA		6
> +#define RESET_MAC0_XPCS		7
> +
> +#define RESET_MAC1_MAC		8
> +#define RESET_MAC1_PMA		9
> +#define RESET_MAC1_XPCS		10
> +
> +#endif /* __RESET_TOSHIBA_TC9564_H__*/
> --=20
> 2.53.0
>=20

--kzOJFdMHckNIu+r4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0sJgAKCRB4tDGHoIJi
0oqSAPwNxBIvjhaBhF7CJTcI0meS3jCsI9l2BBRqwKlPkloAywEAvSvMRRPPRUKQ
BuRZ9h/UYo88OYteapf9SFkhBOjY2A8=
=qWp5
-----END PGP SIGNATURE-----

--kzOJFdMHckNIu+r4--
