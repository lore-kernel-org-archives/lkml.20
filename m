Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204C33E44F6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281019; cv=pass; b=VGJZzoJQcY21geZArCBj/plSN2NU8Z/LUXOM32lEX9mPS0v8HF8NtqI3wsFZfb415cNO0OVTL2HGz6zQfKrWbSokFPs1jjoD/tQoMBHT4KZ7mylND5NdBXK+oq159TFYYU4c/2GuubGzxJI8CIMPn7t7GMBzAcdAFWpHDPy9k2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281019; c=relaxed/simple;
	bh=WS/57KdXBBwGfRZNL7QHE0ldeTLI0dMl0tLbZXWOYHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bayNu5NjbgXwK8V/HullaXM6AyPFk//pcd5S2i9mtfDTF2m8MJTUsFRqLO4v3j+fjTtOhRFHHB5dFdW26ijWMMySSO8buLPStIpQXEhQaepskzfvTfh1+zrAgF3ZbwXPew5zq0zIi7frGjw1ndpwAa4wJNpDY4SQ3bsIBJgD/lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDptfiZo; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDptfiZo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so1249505ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281012; cv=none;
        d=google.com; s=arc-20260327;
        b=UXX34lkFe6DOzySgBDNfPGfiTCpAPpN1xiHTZljeGfKXMge+xcXjtvRwCvRRv4fg0L
         YZzFTyBWXMQW82SX06kzPBuKKs1JDzvghA0I5yMvZWitkku+QmNNji6uv/Qsi+pgZi4Z
         BBsSkXf2aoou4yrIavLfqQbhEItOw4Q/qp5YhfPyNkgrMXxjWzX/MMYotbm3etUsMGO7
         IW/T28NKZtDRNrDewqBHM9w0Z5i4X3DGlEPVV56iXMWan75p+m05JA5y7N8i8U5/8A0q
         87nW0dFEKB1LXVULG8H4V3oiKtuidK9ha/V/hi6adUuRsCCfD1QBOzdKC/DzDLaurM1n
         zWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        fh=DS2qsjgSvEvTj/uJKJnuEI/IEV6I3nMRXySJsNTrlTo=;
        b=Bc+tDjMMc7A8pwhN4hVU5Si8CEHfnGL+aB0gfX/ROMKouqx9LYFmjT/C280KXi7UTP
         dN9ELzae7UWwcKN/3LI2OQDBnbpXZYx9GfaS9yJelaHyz+4AGCurQvEFy3Q3CQHGIJ4k
         I8IxfvV3o9CzXQZGMnKrEYS2GE19TQe7ZHBRyo3WsjieZjvUADTl72KfgzWsQRIVFoik
         X6n52CPEZVwAhVFKUZlA39CnynfO8CYYYX9u917DGarQ386qELtBSu1GrY5Uc2wmy4vi
         02mK2nLJpXODv39LsvtJNt4Z8YlU8IAlWhRI4ZEkodciMqD7OcVShWv8k3ou0NR6WPxx
         G75w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281012; x=1790885812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=FDptfiZoUBFpKzdVITD1XRMVOIjxusJPJxSOhaSvbP7KCi/f3/QcB8hUPWlSjFoi41
         vnZw2SLdexrhgfsW2YwmWYkvkmUKD5NGjNsNDVaKk/R3KsouniekBMluP3ZJ3xqyNeN2
         GfFCZ9ISKZY7REOjKuqVm1mTRx8cSOnCoC5XC36PW7JQoOIZPOUZ3t6PBa+/Y9VZsXBe
         +4bF5CFsjq7J7UkDtBWfumIN8dSximBL79u3mQmSMM6+/cWfbZOAszU/eIu3fa+mdsy9
         vYiWlEN/WLEmyHOiA0eJC9cdLIpZweuI4T0GefxDd7A4RZE6bQK6EgyTPitj7AITBHgK
         hJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281012; x=1790885812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=opSSGLoh8HIEHDgb7EzAIgEpfDjAyOmUSYNlBDafPtN0Qnk0OoYaAn4LOJ3fCQbSaW
         +ziItvCrP69GYQN8VIRiG/Xr1S5wdEkldq6lLGbC9wSCMjmB4ClrI+DqlvRWRFRocIAk
         y9S1+zJzTf01nhy6bfeuiWXM7K1Lsrhh9EYqpr9xnd4r4qkCZB2xuJPv+KqKbWr4pSNy
         F9LQBH1vfvJYMY34PQsWkTDlVyPDGhI7oDOBXLHyi2RmDwzsgSV0CsmqA84PcQKZ6aTk
         Cmv4/8dKJPeyyHEndbwB0M4THsoerrUvP9usyTYUT3x8xi4sNeqPRfexn3k6Ybr/cy3n
         sJog==
X-Forwarded-Encrypted: i=1; AKwUvBxnvwsVOY5g7TRhRc0qJMbeklrAiMBYLxXicBHT0Dh3z/2xbrw4Pfk9Pq046gGBCCPI+IxCIYKHepzGgTM=@vger.kernel.org
X-Gm-Message-State: AFuF++n8+4zVlP/ShxIZdJKbld4iFmKHaxgeOF4K0RQj3vIU4RZQhUXS
	GevL91ErqRK+9OfmEReSZGED8KSiDg7LDTz34QmftOe3Bt8s1FYBZCjZsZY7au/Jcs/2hsxZ7Qs
	9JoHougo2DT5bNuPLNeEewbXy5uPRcs4YTQs/Rid+8A==
X-Gm-Gg: AYBFou1Z/Wg9wcZDJfMYlQHO796BpIUQ684yigBE+G0dhFY0uK9o2eDgC330Wq+7T94
	APnhGb4CNz0CUiLjm4iPrVd+vFkrZmq8sBCXkFFNfx5mwRhFFQSyxv5vK/fgIYsGjvFlpFjcmXt
	a7m5wEqXhSkiWv1i4Bv5Wnt5tyBriuWMU8pwubAYkQQV2E5BTxCFrZ/uWbsSeWvwymnJAbT4ZMQ
	DQXn3obWowRwtIfAvrz3HcutDJp9C038R68FmOe0uQh5dQTx1rCQvJ8phgfSc3XL2YVCKsTZsFB
	6ZDsql/iWKrhzDwRP7q32MFIQ59ussVpmEFZxLpyAxHx6XbxhD/m68X89Ti1Yx6Bjto51cc=
X-Received: by 2002:a17:903:22cb:b0:2dd:c100:943d with SMTP id
 d9443c01a7336-2df7e6632cemr33132005ad.59.1790281012320; Thu, 24 Sep 2026
 13:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-3-pmazzini@gmail.com>
 <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
In-Reply-To: <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:16:17 +0100
X-Gm-Features: AclHuK9Ix7omORkFeC8AEjcG9VWZQpvYqS7tGdczHTc-lHozfzxFcTWbaDF7Pzg
Message-ID: <CAAxh=ju7+vQ=_opueqK-3Fe-qj9_OJiVunBWDmdmxk86dRqWxw@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> Can't you just add the new compatible string to the existing
> allwinner,sun4i-a10-pinctrl.yaml binding?

Done for v2.

Thanks,
Pablo


On Thu, Sep 24, 2026 at 10:07=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Pablo,
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > One controller at 0x01c20800 with four external interrupt banks.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 +++++++++++++++++=
+
>
> Why is this a new file? Can't you just add the new compatible string to
> the existing allwinner,sun4i-a10-pinctrl.yaml binding?
>
> Cheers,
> Andre
>
> P.S. Since we have seen this a lot lately: please wait with a new
> version of your series for a few days, to allow other people to comment,
> and to allow discussions to settle down. Not everyone can respond quickly=
.
>
> >   1 file changed, 108 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinne=
r,sun8i-b288-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-=
b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun=
8i-b288-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..806da97ab708
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pi=
nctrl.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctr=
l.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner B288 Pin Controller
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun8i-b288-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      One interrupt per bank of external interrupt capable pins.
> > +    maxItems: 4
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: High Frequency Oscillator
> > +      - description: Low Frequency Oscillator
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: hosc
> > +      - const: losc
> > +
> > +  gpio-controller: true
> > +  interrupt-controller: true
> > +  gpio-line-names: true
> > +
> > +  "#gpio-cells":
> > +    const: 3
> > +
> > +  "#interrupt-cells":
> > +    const: 3
> > +
> > +patternProperties:
> > +  "-pins$":
> > +    type: object
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      pins: true
> > +      function: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +      bias-disable: true
> > +      drive-strength:
> > +        enum: [10, 20, 30, 40]
> > +
> > +    required:
> > +      - pins
> > +      - function
> > +
> > +  "^vcc-p[bcdfg]-supply$":
> > +    description:
> > +      Power supplies for pin banks.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sun8i-b288-ccu.h>
> > +
> > +    pio: pinctrl@1c20800 {
> > +        compatible =3D "allwinner,sun8i-b288-pinctrl";
> > +        reg =3D <0x01c20800 0x400>;
> > +        interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> > +        clock-names =3D "apb", "hosc", "losc";
> > +        gpio-controller;
> > +        #gpio-cells =3D <3>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <3>;
> > +
> > +        mmc0_pins: mmc0-pins {
> > +            pins =3D "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> > +            function =3D "sdc0";
> > +            drive-strength =3D <30>;
> > +            bias-pull-up;
> > +        };
> > +    };
>
