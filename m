Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE322D4E9;
	Fri, 28 Aug 2026 16:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934476; cv=none; b=qFd+hyH3wlkRYdFbQztBLL6Q5SM6LbMw1EbIyHaEhx7v/PaRFy2qlYqUC6wStALDsRZakn02ISV+I5qrNmKfj7FtUxkS/xA3EaORRlO9AGuOa3Duxjk2FeKDpo3RHGV03ItriezEGRxQafgTFYtDaDERY4so345Zl0US2ZToDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934476; c=relaxed/simple;
	bh=yl6y9mZJ5VnhIjF8coMC0aOc4Rq/WH4qk2wOgE4sDnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH9Wxxf+OENWVD+9gGTWXvZZINJgs40AlM1HRKjLLobW4hMOX5MtNgI+H0bnSJij08o1ZJeRM4IqSgvyLS3yVgE9zw8ZOdKXeRs7NOhD6wAv/TiGd0kbJzzzvJogyyV2F2wuk0fGVYw5ZZNoTmwZYQplz4W08UtIT4bON2IL7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeGed1sn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeGed1sn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F0F1F000E9;
	Fri, 28 Aug 2026 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787934475;
	bh=Do6HGKdFSHlyVZzT9ZR00fEBfIajeCE0oC1qtv8IPQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XeGed1snHMMLRRglJS8oYZwA/IKwdvhPDXz1qshAgpxruD3jAryNa1Vj41PG000Fw
	 QXDzEKWRxYCbsHsDUetVOesZiuO8tGv1xKglhtG5T2ywlR7l8zGx8Y1H3QGd/Lhjy2
	 DcmDuOkaHPhwyh5IJkWMSMBWk2eAL40ewtg/xEUzkfWrsWd4HDk4/8/y2Z81gr18Y+
	 FkKrDBN/drGMdeDsXFv/+0I9jyRBoi0fxjXfWXgsGP2oru3hW4GKJBB2wc7bejErOi
	 JF0q0gwZkbCvT9qeOcfbDEWLHHvzXlZnplPaaUdrvy/Zh4fbqk4/N8WYvDHI4oPCGx
	 +ChCnpt0ivy6g==
Date: Fri, 28 Aug 2026 17:27:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Rahul Sharma <r-sharma3@ti.com>
Cc: peda@lysator.liu.se, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vigneshr@ti.com
Subject: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add binding for
 event mux router
Message-ID: <20260828-goes-scrawny-a5cf40c9514d@spud>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZSBlRIhINotMVeyO"
Content-Disposition: inline
In-Reply-To: <20260828100615.1700223-2-r-sharma3@ti.com>

--ZSBlRIhINotMVeyO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
> Add binding for the event mux router of TI's K3 based SoC AM62L.
>=20
> The TI K3 mux routers which route the GPIO input events or Time-Sync
> events b/w peripherals instead of routing to a CPU.
>=20
> Refer Section 10.2 and 10.2.1 of https://www.ti.com/lit/pdf/sprujb4
>=20
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>  .../mux/ti,am62l-event-mux-router.yaml        | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l-event-=
mux-router.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-rou=
ter.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.=
yaml
> new file mode 100644
> index 000000000000..a5ba7f78a156
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mux/ti,am62l-event-mux-router.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI Event Multiplexer on K3 SoCs
> +
> +maintainers:
> +  - Rahul Sharma <r-sharma3@ti.com>
> +
> +description:
> +  The TI K3 mux routers routes the GPIO input events or Time
> +  Sync events between peripherals instead of routing to a CPU.
> +
> +allOf:
> +  - $ref: mux-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,am62l-event-mux-router
> +
> +  reg:
> +    description: Register base address and size.
> +    maxItems: 1
> +
> +  '#mux-control-cells':
> +    const: 1
> +    description:
> +      Number of cells in a mux control specifier. This should be 1.
> +      The cell specifies which mux control to use (0-based index).
> +
> +  ti,reg-mask-val:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: Register offset (relative to reg base)
> +        - description: Bit mask for the mux control bits
> +        - description: Value to write when mux is active (state 1)
> +    minItems: 1
> +    description: |
> +      Array of triplets specifying register offset, mask, and value for =
each
> +      mux control. Each triplet contains:
> +      - register offset (relative to reg base)
> +      - bit mask for the mux control bits
> +      - value to write when mux is active (state 1)

You have a device-specific compatible, why do you need this? If the
active setting depends on the device or w/e, why can that not come from
a mux-control-cell?

> +
> +  idle-states:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

This is not needed, you get the type from mux-controller.yaml.

pw-bot: changes-requested

Thanks,
Conor.

> +    description: |
> +      Idle state for each mux control. Each entry corresponds to a mux c=
ontrol:
> +      - 0: clear masked bits when idle, also refers to inactive state
> +      - 1: set configured value when idle, also refers to active state
> +      - MUX_IDLE_AS_IS (-1): keep current state when idle
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#mux-control-cells'
> +  - ti,reg-mask-val
> +  - idle-states
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mux/mux.h>
> +
> +    // Example 1: TI AM62L GPIO Mux Router
> +    mux-controller@a00000 {
> +        compatible =3D "ti,am62l-event-mux-router";
> +        reg =3D <0xa00000 0x400>;
> +        #mux-control-cells =3D <1>;
> +
> +        /* Mux Register addresses: 0xa00004 + (J =D7 4) */
> +        /* GPIO0_40 -> BCDMA trigger 15 */
> +        ti,reg-mask-val =3D <0x40 0x000ff 0x00028>;
> +        idle-states =3D <0>;
> +    };
> --=20
> 2.34.1
>=20

--ZSBlRIhINotMVeyO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG3BwAKCRB4tDGHoIJi
0mNJAP9rUvyFy5JNGwgheb+aUIWgHsr+3DGU81x5tayNlIOEZAEAgaAIYI+yZ8Ki
6JCw3OCbt0eEDqHg++Udu/NwLTxX8g0=
=nX9D
-----END PGP SIGNATURE-----

--ZSBlRIhINotMVeyO--
