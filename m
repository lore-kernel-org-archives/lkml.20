Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34C3C9EF1;
	Thu,  1 Oct 2026 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880865; cv=none; b=H5hcAB6xQDp5j/qeGmoWmIV/9ndfzbf6XfPeF774QWu0DtDUNMT9wcBTBXfl3vlfVgfJMmSfyOED6ZNGuxfMgR0+0QirB0Fav8WZKSf0oxg/iRl88fnAmmdJ79/eBWp4xLzOTU4KQyuKUnbWyt6kkPnW9lycnZnhp0mHYi/RDP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880865; c=relaxed/simple;
	bh=69o43wfr+QLg2F3lA+uFscKI55zMh9gT3BQMW7eAumY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+DqRQ/0yVBdrugFUCdCriStvfRij4N7Zyt6v3jdLjoRekpJvW90Bgc+F1WZJ4te/iupYdxnKy1IEMfTE2R40GEF6xyqmMfXLyecJVtxdIiSu4Bs7mHHL2rD0q8j0ipFV2kAhxWu/eSV5dqOzG1eDCwkK4XsnyhC5w5xQYi1wAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lip+n3ES; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lip+n3ES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E561F000FF;
	Thu,  1 Oct 2026 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790880864;
	bh=hfmq75qq7pM3N6QAQNJXj/7OMVJK/9s/qcVq3SzkxRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lip+n3ES2zGOY+WIvdK/ZKoOhKbuu7V+epqLUQThSRQhSqTo/EFOS0aFGKJsZboEr
	 VbcnjNuZmumhJhDJZu+D6HqJ2GrOgV+cYZjs/n2bnxOOvjuKtz6LZ8mJD20UEr8Hgj
	 efWCIm0QHbOIPsFHlrfXGt0Q8HUwoCARUr6QDaUQelbj2eqs1Tx9WXfeOF/V2mFSnn
	 BOHAfw+U+aO9xiCuO9oVOCPWPcveiDZVDNGtKc3N7iE790X3vv7sqbpfNOevPBF+YG
	 cFN2b4nydSuPSgjCXvAwdfEQk2IO8cMQkZPvj1rjysBCyUG0EvIb9dpbEiNyIO2j+A
	 SuEYdVb+805fA==
Date: Thu, 1 Oct 2026 19:54:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jesszhan0024@gmail.com,
	airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <20261001-relight-unexposed-1a3d7dd8bfed@spud>
References: <20261001144128.2336301-1-azuddinadam@gmail.com>
 <20261001144128.2336301-2-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F5HQPdkis+8FesSJ"
Content-Disposition: inline
In-Reply-To: <20261001144128.2336301-2-azuddinadam@gmail.com>

--F5HQPdkis+8FesSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 10:41:25PM +0800, Adam Azuddin wrote:
> The binding is for SPI-connected RA8875 TFT display controller by RAiO
> Technology Inc. It supports display resolutions of up to 800x480.
>=20
> Assisted-by: LLM
> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
> ---
>  .../bindings/display/panel/raio,ra8875.yaml   | 77 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raio,=
ra8875.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.=
yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> new file mode 100644
> index 000000000000..4283de927b13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RAiO RA8875 Display Controller
> +
> +maintainers:
> +  - Adam Azuddin <azuddinadam@gmail.com>
> +
> +description:
> +  The RA8875 is a TFT LCD controller for panels up to 800x480 pixels.
> +  It can be connected to the controller via 8080/6800 parallel interface,
> +  SPI or I2C. This binding describes the SPI-connected device.

This binding describes all three, or at least it should describe both
i2c and spi in the current state. I have no idea what the parallel
interfaces look like in dt, but if what you've got covers spi it should
also cover i2c. Probably remove this last sentence.
pw-bot: changes-requested

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: raio,ra8875
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      3.3 V supply for the IO pins, the oscillator IO pins, the ADC pins
> +      and the internal LDO. The 1.8 V core rail is generated internally.
> +
> +  reset-gpios:
> +    description:
> +      GPIO connected to the active-low RST# pin. Optional, since the boa=
rd
> +      may instead use an RC reset circuit.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - display-timings
> +  - vdd-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel: display@0 {

Drop the unused panel label if there's a respin.

> +            compatible =3D "raio,ra8875";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <16000000>;
> +            vdd-supply =3D <&vcc_3v3>;
> +            reset-gpios =3D <&gpio 25 GPIO_ACTIVE_LOW>;
> +
> +            display-timings {
> +                native-mode =3D <&timing0>;
> +                timing0: timing0 {
> +                    clock-frequency =3D <25000000>;
> +                    hactive =3D <800>;
> +                    vactive =3D <480>;
> +                    hfront-porch =3D <40>;
> +                    hsync-len =3D <40>;
> +                    hback-porch =3D <40>;
> +                    vfront-porch =3D <10>;
> +                    vsync-len =3D <10>;
> +                    vback-porch =3D <20>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969373..99d5113fb035 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1395,6 +1395,8 @@ patternProperties:
>      description: Radxa
>    "^raidsonic,.*":
>      description: RaidSonic Technology GmbH
> +  "^raio,.*":
> +    description: RAiO Technology Inc.
>    "^ralink,.*":
>      description: Mediatek/Ralink Technology Corp.
>    "^ramtron,.*":
> --=20
> 2.55.0
>=20

--F5HQPdkis+8FesSJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6sWgAKCRB4tDGHoIJi
0tlTAQDXk4yhZi+jjWc4ZFnEhrat/Y8R5eIoMO8zhFPeP72ZsAD+JIHCPyObxBvT
zGrm/1Ypl043IOov0j84BXTAViaYzw4=
=YHhz
-----END PGP SIGNATURE-----

--F5HQPdkis+8FesSJ--
