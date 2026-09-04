Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E3048CD53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541582; cv=pass; b=qWhJlDfsOSDmJvlhXlZimYLKjKODIUZVlr6yQFoPw0KSBpeImcF3+MTD43ulDGZod2A4ToTnzVPDVK1oMb602fkGOEKN4yalrxsQWn16SJoHcvBbXoCPUIJQbeyu9LbNLJ/Qd4orlnwOlqmAGBAjEy9+wmsELWd3sPxvvKDDSPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541582; c=relaxed/simple;
	bh=it7al99Mn0Hztn1jkp4WlVXb+TrDxTMcFjo8QDlqTgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cks1NQLvgpeBB4r8uH9d9uy3bt47tzwHbIG4r0CvRH4Xw2McbNYG5lUajEgTszxfV4Df1dpjHrE0QW2lCmReg2Vdw5gGAcV3SdePDl7Dfcj1asS1/7RERaqWNkvmnK9xQhAhkah3a4L1/cmlIXrQ/ioMx5Rs/BxwJPyFRDYsgMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1iy0Tmw; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1iy0Tmw"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so704610241.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788541579; cv=none;
        d=google.com; s=arc-20260327;
        b=cEMnHt4rwtj/xT3CYRvT+ImNMxDPfR5JL4aD+yyxa0qjXdcTyFzrpOPpS5e3n3+2oR
         YCs8V6V++Q1yiEAiN/i4sZIuPorLDxEddr8WMzv5NrsQhDyVWwBuuesJYL3/zATGtnQ6
         eMl5YjFWcn08Zu7zXL8akQXh2nHsUeMSZ/m0eHvVfvimuzRWe3Oc87f8El5EMc/ExaLZ
         J2z8HjBMOjl/6IoPmTjPd8ScwMjoiPanlG1y3Y7UuRmbmBd/ZW3nao9vrGqJ0FvWKJ28
         0g9lw39/W67lhOqoY6TKqRzbav/v9mJtC3S2elKZKymAWg2eYVshgGymtfiDBrp9dIhb
         geCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        fh=7yQKl+TYedpbsywqxVcuanbbhsU9C8uR3MKk9LLurcg=;
        b=oplwoErN03GmpdCBdZDxh8PZXfC45nSk98k0qD+UIRkjnrdkrFZvHGj3yHS9HPOPtO
         chZ2QOJuwhbx5JDuBJ7Z5rJY67+3sS5/Fq2u7aF6zDFavrFIkAKOqsfyuRQENm6thSt5
         UDWlnXNmuVK8o65puYsSnpvLkhjyU/XfJojFxbMkvFk+ZdMOp5tXOR1pJ0fCcILEt4iR
         YYH5mImDDzsDgE0m9cpoL+w0WtE//eFDmhOvqtVjCntKVxuxKDRKVn3jJP8XTnqZ8GM0
         Wt45W4A27eOOm7RXOlRQbTL7EBKpFPdnoKBh1nwOux0T7aPZkR0uZsHtiGzas43/ILgJ
         j34w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788541579; x=1789146379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        b=T1iy0TmwvxT6MDw9zDdQroHyco7wq4E/D1PiDqhNf54KfWZKw8PJpqHWzJx5od4ovh
         JMagpYD1z9Lpvze4S2pVfCHgv+xd9zxrIjkDw11VoC439rdzuMhg/2A4REvsKp4/mhWG
         v+lMN5Ipr9ZMmsKfukwFd0ERFyOJK0vjWh5x/vEVWnVCuEYFjUjpoyzkURUopiDj1vrK
         rn7Zvtzvf1JOG8LPNjud6Yy65WFdt+J5ZlZ0h8CXEzp7jT3dB5bP3YSgLkhv7dKBJI6G
         G8z4V2EA3jXmfdW0/2qyFgXXqOj2R7S3EsaE70hXqsakVf8Z9YMyvkKgfT750k6W60Ed
         YN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541579; x=1789146379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        b=N/haGeN5rckigwOVqemrp/HANGftbGeV2FNSMiHgMRdVwrmWP5FW6lzEUwUJL4SoMX
         6BZ21/MIZSRpGdC0yoSHgM/V3vHBvDyexFicOFmwPjopI4iOKUc6Zr2NjlLEBsxyAMfU
         zg7n6KHn6z5EBwINqQqvczFKpD0yweOokRSIYEPTZLpy0IOjAcP3X1BkNay6XC0CXiwd
         v6OPHJSVcZQZ0NK3bLuZ4sO8Vitj1IxRlCgpnzJWqDubLqsyxwJSup/LFymxPgZSaAG2
         P2egjO0JG12h5FMgqqvgCL5duzYdrWds2yPKl+xIpgjz5yZz/w4OaQmcItsd2lQ7z2I7
         xzdw==
X-Forwarded-Encrypted: i=1; AKwUvBzVQw17I+t1+gRloTmhmw6LkQQ2Vpq7Gwb20lvo6u9nLZ9SqSsJ6B67PwL75pK2topz7x37p1/oqNcxiK0=@vger.kernel.org
X-Gm-Message-State: AFuF++nkVRBBHMquRRSyaVP0oZWbTOP8UrebU+41KghlE6nA2uyn7wkq
	67/m4RsJCHT6ZDwLdrGIOM9Jzj7SBZAVGmwUWtPqFbvTjVSYbFEAYvtbE25j7tvg+ZrhAyGHyET
	FNVHl0Qk9RIlbvSHiK9cBdUrUyeRAHGc=
X-Gm-Gg: AYBFou3EupoYbNxFF3+w8frGJOznexMNsoAP70t/nbRq6gNEp6d0+8c2WOmivYM2xx/
	lnqIULFJLHYe1i0tYBAv05nyiLiB+Feec4PPbL+l6cebw6wcIz6DgS0yALMhuxlGhu+FG8MD6GH
	JQRlhOzaZn/+P1UeGhokNYSBuNeW3LW+Ferz7Zxu21gU6KEcBEeno4qVyqOFJCzyqIUQ1vZo+OU
	j+nbht52y0fZw4XejqpQpb64TpoFwx9xY8v4VsC7kqPTrhlWMPMJer3yOAX/1eurwbj0dKNCme4
	xynOn6+C+qWFezKKuK5aQhy7Ot30Uxi6UQ8TW7cc6Y4wSxPQRBYzIBcSeGbOhcreez0IbU8NcJR
	0sxXzOt+Jst5mUP03P3loQCZupTvVIR7K4nsm/NEudPXAD1RsqLdWEOUkwY6Ow+WGsMTqGiJe+e
	LiIEetpBbyTw4F3EsMH1/T5qp60p559qIquSRguw==
X-Received: by 2002:a05:6102:8023:b0:789:5fc6:3693 with SMTP id
 ada2fe7eead31-78a4a6f8278mr2620716137.6.1788541579377; Fri, 04 Sep 2026
 10:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com> <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
In-Reply-To: <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 13:06:08 -0400
X-Gm-Features: AcwNN1X6bl9ODedCCrg0dVF5P7jGVB6L6R8M2S6nkA_KWsBfrKX-Ph0fkWo7Kdk
Message-ID: <CADvTj4qKxyPZMLBZgpNMMxkFn09MUCNEc9nLva-j=24C_Zg-nw@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200 functions
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:50=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 02:09:42PM -0600, James Hilliard wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Describe the AC200 audio codec and TV encoder as child nodes of the
> > shared I2C register provider. Keep their analog supplies on the functio=
n
> > consumers and describe the TV encoder display graph and optional bandga=
p
> > calibration cell.
> >
> > Add the shared interrupt-controller properties and interrupt numbers ne=
eded
> > by the TV encoder. The Ethernet PHY remains represented on its primary =
MDIO
> > bus and is therefore not an MFD child.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 136 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
> >  3 files changed, 150 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > index ca7a910b2c73..935dc07138cb 100644
> > --- a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > @@ -28,15 +28,114 @@ properties:
> >        be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> >        selector.
> >
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The shared open-drain INTB output for the TV encoder, Ethernet P=
HY and
> > +      RTC interrupts.
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +    description:
> > +      The interrupt number, as defined in
> > +      include/dt-bindings/mfd/x-powers,ac200.h.
> > +
> > +  codec:
> > +    type: object
> > +    $ref: /schemas/sound/dai-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: x-powers,ac200-codec
> > +
> > +      '#sound-dai-cells':
> > +        const: 0
> > +
> > +      ac-ldoin-supply:
> > +        description: The 3.3 V supply for the audio codec LDO input.
> > +
> > +    required:
> > +      - compatible
> > +      - '#sound-dai-cells'
> > +      - ac-ldoin-supply
> > +
> > +  tv-encoder:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: x-powers,ac200-tve
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +        description: Cable detection interrupt.
>
> Given the example, this looks like a hack.
> Is this mfd actually an interrupt controller, or is that just part of
> this hack too?

The AC200 has separate TV encoder, Ethernet PHY and RTC status and
enable bits which are multiplexed onto its shared INTB output, so the
intent was to represent that demultiplexer as an interrupt controller.

I notice that the example's tv-encoder interrupts property inherits
interrupt-parent =3D <&pio> rather than explicitly referencing the AC200
interrupt domain. Is that incorrect interrupt relationship what looks
like a hack here, or do you also object to representing the AC200
interrupt demultiplexer as an interrupt controller?

> Quite frankly, I am not really sure why either the tv-encoder or codec
> have dedicated child nodes, they don't appear to have conflicting
> properties.

Do you mean that the DT properties for both functions should be folded
into the AC200 parent node, while the MFD driver still creates separate
codec and TV encoder platform devices?

Lee requested at least two MFD children in this series, so I want to
distinguish the Linux MFD cells from whether those cells need dedicated
firmware child nodes.

> Additionally, why is this not part of patch 1? Add the binding in a
> complete state from the get-go. On that basis, at least,
> pw-bot: changes-requested

Do you want patches 1 and 3 combined into one complete binding patch,
while retaining separate implementation commits for the base provider
and the MFD cells?

> Cheers,
> Conor.
>
> > +
> > +      tv-vcc-supply:
> > +        description: The 3.3 V supply for the composite-video DAC.
> > +
> > +      nvmem-cells:
> > +        maxItems: 1
> > +
> > +      nvmem-cell-names:
> > +        items:
> > +          - const: bandgap
> > +
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Input from the display pipeline, carrying CCI=
R656.
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Output to the composite-video connector.
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    required:
> > +      - compatible
> > +      - interrupts
> > +      - tv-vcc-supply
> > +      - ports
> > +
> > +    dependencies:
> > +      nvmem-cells: [ nvmem-cell-names ]
> > +      nvmem-cell-names: [ nvmem-cells ]
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >
> > +allOf:
> > +  - if:
> > +      required:
> > +        - tv-encoder
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - interrupt-controller
> > +        - '#interrupt-cells'
> > +
> > +dependencies:
> > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > +  '#interrupt-cells': [ interrupt-controller ]
> > +
> >  additionalProperties: false
> >
> >  examples:
> >    - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/mfd/x-powers,ac200.h>
> > +
> >      i2c {
> >          #address-cells =3D <1>;
> >          #size-cells =3D <0>;
> > @@ -45,6 +144,43 @@ examples:
> >              compatible =3D "x-powers,ac200";
> >              reg =3D <0x10>;
> >              clocks =3D <&pwm 5>;
> > +            interrupt-parent =3D <&pio>;
> > +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <1>;
> > +
> > +            codec {
> > +                compatible =3D "x-powers,ac200-codec";
> > +                #sound-dai-cells =3D <0>;
> > +                ac-ldoin-supply =3D <&reg_aldo2>;
> > +            };
> > +
> > +            tv-encoder {
> > +                compatible =3D "x-powers,ac200-tve";
> > +                interrupts =3D <AC200_IRQ_TVE>;
> > +                tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +                ports {
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    port@0 {
> > +                        reg =3D <0>;
> > +
> > +                        tve_in: endpoint {
> > +                            remote-endpoint =3D <&tcon_out_tve>;
> > +                        };
> > +                    };
> > +
> > +                    port@1 {
> > +                        reg =3D <1>;
> > +
> > +                        tve_out: endpoint {
> > +                            remote-endpoint =3D <&composite_in>;
> > +                        };
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> >  ...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1d03b0060bda..8a48f6a1e593 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29511,6 +29511,7 @@ L:    linux-sunxi@lists.linux.dev
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> >  F:   drivers/mfd/ac200.c
> > +F:   include/dt-bindings/mfd/x-powers,ac200.h
> >
> >  X-POWERS AXP288 PMIC DRIVERS
> >  M:   Hans de Goede <hansg@kernel.org>
> > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bind=
ings/mfd/x-powers,ac200.h
> > new file mode 100644
> > index 000000000000..cc59e2ab4912
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +
> > +#define AC200_IRQ_TVE                        0
> > +#define AC200_IRQ_EPHY                       1
> > +#define AC200_IRQ_RTC                        2
> > +
> > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> >
> > --
> > 2.53.0
> >
