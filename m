Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315207;
	b=lyPTcsgF6oxda9W1bDfZ2fXZmvWfmyztoZOtX/KgBSIazzUnHoPX8/I78ogtz0txY4K+
	 LnhhjYbaNLNepNJWybdjd9X85bOw6XRt8QkCucNxihL5jJzDtmiWjv1tNtLkfeQC85QSG
	 GQ2w+Gw1ZKKMYnz1VyTIb+AXNTAHat8eEuaCk0przmtMiN39oi8hNrsWKb9zIQsTVfPuo
	 f2v0dvXTSm10cquKpOQfyv738CuJF0qFpe48N9fNdKihciY10CChy07RyMJcNKTw6DnBX
	 N9fKVnpipfvEoAxsGNDxE3IvEsXCnLyN9aJg8O5VnlM2uTLPaKAfXdUrGnssEbfKQrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315207;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xy2U26Mne6M5YW3gXWwYO3+KzvxuP8VoL+G09hFdvhk=;
	b=aEaJVQG6hMeUKEsvNH4nwxavF2KgH3DqO4buyEmmeLSazDVg1RN2iRJiedWHxMYod9yA
	 Z88K6ujxOwLMU+yf7xeeyIzJ83XAXf+BGb9Gxise26MXTJLg3V8DrSrlROW99ZutK8IeL
	 GKaqR/ZwWCFhCsyrAMlrT5CscqISYOt9WqjZlNlxfbnYvRgZP5ZGWiA/DI87urfYE1NDf
	 5wu/ws73cHf+Do8E1/VdC1bG7pHu/ZI5SfueMKGv7jk4TUi4NL6cxHtKQ3RONzx4ESYhX
	 usIKh4j98JJxWIVaoPKFpCjfBq0O+U0UvWC7uc+W4xicxblAo+f7HN7UdVB8MUen88w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8au5m+k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D89606A31A;
	Thu, 29 Oct 2026 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8au5m+k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6191F01824;
	Thu, 29 Oct 2026 23:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793315206;
	bh=xy2U26Mne6M5YW3gXWwYO3+KzvxuP8VoL+G09hFdvhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f8au5m+kyaX+MsBYWeZmjmWrABpfpcSUO75UyTcFSkgugktEXglr2BfkxmILKQ0+f
	 P5wqwuxpLHGn8FuTl3/LQbqQyS/FiVvYEGXQlkF4rpFwTvCPwJRltypcvPMKJDD6fK
	 TBa+rvdM2/hpSgwDCSLMMuz3X8jUDg7KA8o/6kRRHD/yJdWFOK0ZYqp7GsleAnsU0X
	 th0gqTn1s3aR859qD+mZiJECMuKlo7/DTaQdQft1fG7kihyicsSC+Raam4oNDDYVRz
	 UsueypUmyVlI9zoRELsGj2sn0Q/9LFbjLI9RcqHfZSUBObA18dFfYVhBuMJWl+mbE+
	 UTOdpdKfmZHRA==
Date: Thu, 29 Oct 2026 23:06:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Yakir Yang <kuankuan.y@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v6 04/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20261029-flinch-header-bad94288c71b@spud>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075358eucas1p111293c602fc3aac9c6a044fc41488919@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
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
	protocol="application/pgp-signature"; boundary="BltxCjlw5sIY5QTf"
Content-Disposition: inline
In-Reply-To: <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>

--BltxCjlw5sIY5QTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 08:53:38AM +0100, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
>=20
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map, and its
> two children: the PHY and the controller.
>=20
> The two have separate resources. The PHY takes the 24 MHz reference
> clock and provides both the pixel clock, which the VOUT clock generator
> routes on to the display controller, and the phy the controller uses.
> The controller takes its clocks from the VOUT clock generator. What
> they share is the register space, which the parent maps.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++=
++++++
>  1 file changed, 95 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh71=
10-hdmi-subsystem.yaml b/Documentation/devicetree/bindings/soc/starfive/sta=
rfive,jh7110-hdmi-subsystem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2ff8b0b920aec41a83f0aeaa0=
ed9c4249fe87f46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi=
-subsystem.yaml

Why is this in bindings/soc? I feel like it should be in
bindings/display or something along those lines, since it's the display
subsystem of the device?

Cheers,
Conor.

> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-hdmi-sub=
system.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 HDMI subsystem
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The StarFive JH7110 HDMI block is a monolithic IP containing both
> +  the digital controller logic and the analog PHY logic in a single
> +  register space. It sits inside the video output subsystem, which owns
> +  the NoC bus clock and reset gating this region and the power domain it
> +  belongs to.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-hdmi-subsystem
> +
> +  reg:
> +    maxItems: 1
> +
> +  phy:
> +    $ref: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> +
> +  controller:
> +    $ref: /schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.y=
aml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - phy
> +  - controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        hdmi@29590000 {
> +            compatible =3D "starfive,jh7110-hdmi-subsystem";
> +            reg =3D <0x29590000 0x4000>;
> +
> +            controller {
> +                compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                         <&hdmi_phy>;
> +                clock-names =3D "pclk", "mclk", "bclk", "pixel";
> +                interrupts =3D <99>;
> +                phys =3D <&hdmi_phy>;
> +                resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +                starfive,vout-syscon =3D <&vout_syscon>;
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&dpu_out_dpi0>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&hdmi_con_in>;
> +                        };
> +                    };
> +                };
> +            };
> +
> +            hdmi_phy: phy {
> +                compatible =3D "starfive,jh7110-inno-hdmi-phy";
> +                #clock-cells =3D <0>;
> +                clocks =3D <&xin24m>;
> +                #phy-cells =3D <0>;
> +            };
> +        };
> +    };
> +...
>=20
> --=20
> 2.34.1
>=20

--BltxCjlw5sIY5QTf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauPRfAAKCRB4tDGHoIJi
0q9aAQDv07UymcETvBZlVghJCL8rpRoohfFFCoPKCAXQf1RVRAEAxilNjF3B0oMe
r04GfPnJ8scs0S42SIRPrV01ClukYAM=
=ziB+
-----END PGP SIGNATURE-----

--BltxCjlw5sIY5QTf--
