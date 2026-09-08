Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8755849CF3E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903500; cv=pass; b=V1Z9qWFcvquWJ4GzDhqua53YhhrDrShgXuWGJZA8EnRJ/OKP383dDOVQ1nImYvq98nItsIjSaQ91Cq1nHXTyJG/WHptDm3qySH7CLx4SLILdKxm6gD1c+wVEEJI6yDMfbZwYkTR0xNR3guYon6yKW6fDz09QxDp+783ASowB/84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903500; c=relaxed/simple;
	bh=ssVSDwjmS2dwY9p498QdiQJSOb77cq69dampDEHDR8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYkyKvCWqfN9Rw7QBGAJisqk184pa46y4MuLSRizTNrm7PhW9QA+RSllVPxhAj4OFommXyyf9jsqZu5jiuy+pcYr9xyVnvPtLTsqhi+Nh+y3DWgPdUUatUIbMnY/NU3sWKA/Y1XaeTDIfFhe9884UBltleubxh4Mbu7BqGDA6yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csTK4lNO; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csTK4lNO"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98286dbe569so563720241.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903493; cv=none;
        d=google.com; s=arc-20260327;
        b=sPgn4MTjg1VwBsgcfuDIg2uNQbD+PGcMi4CsYcvoKUnkqCjS5Lej/HveP+uZuxBl/I
         MwRtleOk12yJCyANJJTNF92OqVC8ZeivLtnD9gbbI6mdWYZDn70lS7klxzovTg+CtJQf
         JTm5KTXLhE2DXxVFaN7D8TnBFinWI8i27oypAmuHBFBn+tVY69S8ffiJve8xEgKnhzgA
         tcdm3Uh/GuXakIEmJ7Nrbc64P28ppS+etuNKeycfk/UEHEy4m6XXHWaWjLk+i9BBX+6L
         P6m9R9DUelUA4qbnz8cu7fgTAN1vhlo9FkYCCuCOF/oMY8B9KGZUck+VuLZ8sWqjkC+C
         myDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4jLmDGxwfAGIYL/jv2AOETlQx7ZhdpacKiwdRFBfE3U=;
        fh=jATeHd2kT/pOlnYhuFGi0zj1BjZO3qny9HWjdJ7yOWo=;
        b=Y9+AyMKQCi6vz8BRbP0Qy6zcraIKyI8cuDciZMcMsFbuMbVw8Vk+VcLTirf+gIGgKi
         Dpj8Bx0wioFlfc3A5BGcozp648FZBdQKXYzfiBwgDs2Wp2UC7EByy4IG2+uI1KCZFbq4
         2Mpdp9l7nMuL/JPChLUI6hz7F4HoXVExv2m+OmK2oWFWzOPJJAmD3LFxAVfxZIbTz+IK
         SF5YzRCkxXLkOiT6FEiP/qD8NUf5arEgYwVDEIyniX6w+F/8YzGq09hCwgulSjbaRT5Q
         t6Wj2YpPb9Uwqv4mDXsCfd6ljzgf2cFRsP1Z0YsloCgIiPQSUsWg45IlhUe6Rf9x3ewH
         /3Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903493; x=1789508293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4jLmDGxwfAGIYL/jv2AOETlQx7ZhdpacKiwdRFBfE3U=;
        b=csTK4lNOiIkalnwV2fRl7E7P9FQDQPNtZS8qb/DPPtrSI9XHE4LaSyS8R3eAA0K0wD
         t7YkAn5CHorcwRUZz3AODMrD3blvSHUM1gF9INi6zg++np5pJSIDuhktRa/pfPHHz9VY
         0N3wQPxI/38FTgWtoEdFmvA4JQgGRe94PnR7DYsktotTPpBRL0ZRI2kSUeWeQEQ8pa06
         dNyLaEPGQu5pW20yzLcDgLAG/MkP6JPUw0frgoPhJlvhseAX/vb2GEI4qBC1cwKkZ92U
         NNyLSkORC4VqnRcWh/lBNVz0OrPYJhxjRpwJWMMQhL8yNX4p8iZoLjzGNBldP7gsiOj0
         NO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903493; x=1789508293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jLmDGxwfAGIYL/jv2AOETlQx7ZhdpacKiwdRFBfE3U=;
        b=K4/eFon4FwqqiR4+rSWegEWQ2FLxjJkJzJkeuUmjkGLk2oj9xX0JJtqZFchi6R3q6X
         0xiy3x6fqA5i9UNyO5IQyx64sbtFM2x3XPcaDSq7wtWcNudxedPDNSGQbWkqjcX/6UMW
         30yQQ10sZ2suE960vgvN6CjNZoD50f/xiyqYNLQIX9jCt/vTAUrwCvaKeqgFynr+tObt
         HVblbXxwtYLae/fDoRdXThTwwqhmmb2q2vyA+dOHgAbzUai64tysLh1UAZ5xLLCg4LFT
         bUZukzSqwUtenRfk38+E4AXp3JUUT0QgQUmHESgbuMEduTyl3Cn5xNUZhy9eSUHWLWzL
         t1xQ==
X-Forwarded-Encrypted: i=1; AKwUvByoPu2otYt7hOxJ4VAD8gBVxMmkMryB7pcmvm1wFxT7AvKCzuOEDpQ1s2Jbf2wj1oQvEc28Bw0rylYWR2A=@vger.kernel.org
X-Gm-Message-State: AFuF++nPpiZpS1ZTwr2C1Cg5v66VdWEvcu7pbKoanSJEjyGFPxvSr5yp
	uhaNnVBTMIyf+p66m/tAxT5UGx0txULuY8SksVHRWrlruxVxa4rSV4TSX2jDQh/gLYKJX+wpRuv
	G2b9rQ9KDzRuVIalriCnlG0ZmHJdar+0=
X-Gm-Gg: AYBFou1WBgg0TNQbJrLYia9eNuxrokJ36juzanUcFCyHsQTn8oDd8Zvys8Iyi3E8Su2
	KtMZDXZ8Kj2tzUZUqYnQIauqrom73nSQL2d+hgMH7EiOWlKyII1LbW9aVjx4uXR2JerMJSZ4iao
	cRvY21PdluGtJAOL7goiErylxpBQSuyJgxsyiwpG8aGgChxzOZ5MNO9TBR62uDGlkjg9QwE2e91
	MbSKCUlRkPMkhvzORdL++bO22xCgUrQ0uA3vWYLACQt0+kpzJBOmbCeheF5KgX0nAHUuf+o+ufJ
	ERRfvTxc2eZXODHMgHRKGn4dHo9pEMSm5OTvkYhPwKk6JC6JFqBNoA9tRDjc/V2Xwd5HeqFnOfW
	5vBKQxA8sB4+T3+OZWj4C0cDcONp0OOBcIh3e6cBYIqdvWpF6NMnmMvImNA1NoysHqG6cXAoiLL
	+QFp67TnMjaz/jYrR+Ggw4WCuqrNNARNrT4kBXqg==
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-78a4a96d8c3mr14080328137.5.1788903492257; Tue, 08 Sep 2026
 14:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
 <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com> <20260908-semisoft-appendage-ecbeb9b2d88e@spud>
In-Reply-To: <20260908-semisoft-appendage-ecbeb9b2d88e@spud>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 8 Sep 2026 15:38:00 -0600
X-Gm-Features: AcwNN1UkidVz5Gd_E6Th5guOx-OoCVgj0ZJUHg6bA3hbnSRk_No17K-VefpmGY4
Message-ID: <CADvTj4rZnsSWe2NOKxpmTE9inyUFU2Cz4AS-zwuBEXkM4hjkLQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: mfd: x-powers: Add AC200
To: Conor Dooley <conor@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Sep 07, 2026 at 03:03:14PM -0600, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the shared input clock, audio DAI, TV encoder display graph an=
d
> > optional bandgap calibration in one parent node. The codec and TV encod=
er
> > do not need separate firmware nodes.
> >
> > AC_LDOIN and TV_VCC are distinct 3.3 V supply inputs. Describe them
> > separately without requiring different external regulators. Require the
> > audio supply when the DAI is described and the video supply when the
> > display graph is present, while allowing PHY-only configurations.
> >
> > Describe the optional shared INTB connection without an internal
> > interrupt domain. Cable detection status remains readable over I2C when
> > INTB is not connected. Include wired and unwired examples.
> >
> > The Ethernet PHY is represented by a PHY package on its MDIO bus, with =
a
> > phandle back to this device for access to the package control registers=
.
> > It therefore does not require an MFD child node. The input clock must r=
un
> > at 24 or 27 MHz when the Ethernet PHY is used, matching the rates encod=
ed
> > by its documented clock selector.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> btw, this is kinda odd. Jernej has a signoff, but no other attribution.
> Are they a coauthor missing a Co-developed-by

I had just retained the existing Signed-off-by from some of his patches
that got incorporated into this one, is using Co-developed-by better
practice for attribution? Should I use both a Co-developed-by and
the Signed-off-by for this sort of thing?

His work came from I think this branch and maybe some older ones:
https://github.com/jernejsk/linux-1/commits/opi3-eth/

>
> > ---
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
> Thanks,
> Conor.
>
> >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 175 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > new file mode 100644
> > index 000000000000..75dafa7c1071
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > @@ -0,0 +1,168 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: X-Powers AC200 mixed-signal IC
> > +
> > +maintainers:
> > +  - James Hilliard <james.hilliard1@gmail.com>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +description:
> > +  The AC200 is a mixed-signal companion IC containing audio, video, RT=
C and
> > +  Fast Ethernet PHY functions. Its control registers are accessed over=
 I2C.
> > +  The audio codec and TV encoder are described by properties of this n=
ode.
> > +  The Ethernet PHY is described separately on its MDIO bus.
> > +
> > +allOf:
> > +  - $ref: /schemas/sound/dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac200
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC200 input clock. When using the Ethernet PHY, its configured r=
ate must
> > +      be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> > +      selector.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The shared, level-triggered, open-drain INTB output for the TV e=
ncoder,
> > +      Ethernet PHY and RTC interrupts. Omit when INTB is not connected=
. TV
> > +      encoder cable detection status can also be read over I2C without=
 an
> > +      interrupt.
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +  ac-ldoin-supply:
> > +    description:
> > +      The 3.3 V supply connected to the AC_LDOIN pin for the audio cod=
ec LDO
> > +      input. This may be the same regulator as tv-vcc-supply.
> > +
> > +  tv-vcc-supply:
> > +    description:
> > +      The 3.3 V supply connected to the TV_VCC pin for the composite-v=
ideo
> > +      DAC. This may be the same regulator as ac-ldoin-supply.
> > +
> > +  nvmem-cells:
> > +    maxItems: 1
> > +    description: TV encoder bandgap calibration.
> > +
> > +  nvmem-cell-names:
> > +    items:
> > +      - const: bandgap
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input to the TV encoder, carrying CCIR656.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output to the composite-video connector.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +dependencies:
> > +  '#sound-dai-cells': [ ac-ldoin-supply ]
> > +  ports: [ tv-vcc-supply ]
> > +  nvmem-cells: [ nvmem-cell-names ]
> > +  nvmem-cell-names: [ nvmem-cells ]
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
> > +            compatible =3D "x-powers,ac200";
> > +            reg =3D <0x10>;
> > +            clocks =3D <&pwm 5>;
> > +            interrupt-parent =3D <&pio>;
> > +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> > +            #sound-dai-cells =3D <0>;
> > +            ac-ldoin-supply =3D <&reg_aldo2>;
> > +            tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    tve_in: endpoint {
> > +                        remote-endpoint =3D <&tcon_out_tve>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +
> > +                    tve_out: endpoint {
> > +                        remote-endpoint =3D <&composite_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
> > +            compatible =3D "x-powers,ac200";
> > +            reg =3D <0x10>;
> > +            clocks =3D <&pwm 5>;
> > +            /* INTB is not connected. */
> > +            tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint =3D <&tcon_out_tve>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint =3D <&composite_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a19da74d00c..419340093c9b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29504,6 +29504,13 @@ F:   drivers/net/wwan/
> >  F:   include/linux/wwan.h
> >  F:   include/uapi/linux/wwan.h
> >
> > +X-POWERS AC200 DRIVERS
> > +M:   Jernej Skrabec <jernej.skrabec@gmail.com>
> > +M:   James Hilliard <james.hilliard1@gmail.com>
> > +L:   linux-sunxi@lists.linux.dev
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > +
> >  X-POWERS AXP288 PMIC DRIVERS
> >  M:   Hans de Goede <hansg@kernel.org>
> >  S:   Maintained
> >
> > --
> > 2.53.0
> >
