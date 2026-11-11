Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399730;
	b=sVstyt+Ey6iuuaHRIC1yrtQyuYisotsjWXdwuM6Daz0B2yTAoE1uiYHlCqGA0UVJtVwi
	 WPlTg824WXvA0psKlJZhvrjQ9TnNE2OFiJ6YaTB7C9KKJ0hkOmrEx5X/U4p5RW5zEoTfs
	 9px3M3a/dUxQoMOsDurJY+PjRtSxGPFN5GMuuF3JIuDbE3A4etnWQZ6SSZ928JZxgUwiq
	 Ua+Rg+z2yxb/xcYmNbq2PRHt7/ryi4QN4kMMYb0yyHUY4Dd/4+3vgAA5WW0huumCCMEtP
	 qj6A+N5mg8wsEJ4ZQqZIhuK6yJ0qeOr7CNu/gkSSonRIRgD157WIdO29zrBVS+ijQhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
	b=sOEAgbv8mLoNzFdsQevKbqiSYcE1+zSdqTR0PICsX1/on2YW7Do+iCGGwntSplhgjw9X
	 u/txm1gFX3VG22hZBXhjtFXJm4vG2EFPtEajuKnOpfKQh1CIGk/o+nERgFLy3ws72UbVL
	 9pDobwTbyiRpZPSoGdp6jjsr8Gb+NXb1Z72ORx8WGhG9s+TQW1ORnzE/B/VCMPbt9bxWf
	 YyA2V91P9ccd5DZJ7oNTPh3UCKY0hOMlFu6BxzX7WfDycUkDMKamyZWio8ziY4k9AekBD
	 MVOVACOD/TQGqCHOfqPE5VkzIGc4AAU3QqNVUNH0YXtDc2Bo92lln48MW55IkckPQ6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB5606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CB5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4895829a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794399727; cv=none;
        d=google.com; s=arc-20260327;
        b=g+4KSK3JxYbe8mvaR4d/81wq93jHbJyvWRZQjvJb/eQNarLN+LxsHZCwBAYRIkT3eA
         0S8bsByla2sod6iZ8i7sDyJy3vc+xrQ+fpTOCXYaWBJ/EJ53vxvtxFfWW0DtnOAeu+50
         uco0NPIGgcgYq+uDRIHKBkSwVn8yrq34geoyVt19xWszTow3Zknl5B4smYffiWgaAj0y
         dZh/ubETr4pHdF2ch68+9UjyA8CJpgQmh1d+OZ7d3cX9i5KVs2VLDldVvmiIJkHA6DCV
         hhcvnu5TeEdpTK5KFNnEOTeorOPj4oWpCrJaD7GrxwKZA2bRluFLH1zCVWhaAGsUBse4
         r6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        fh=9vl9fJdI0VAUndeQnYbIzk48lxvyvMxMYlADTzoLzuw=;
        b=P48kpzXVgR/vBgIe1zLziPrdErG8Cx6K/GIEcLap3fSLitdVCfgUr4bSKvCK8sb3pK
         hcwWoRMkATwemxwxlfvKMxOHZEEIiy6gjFC/nd1y/L8ccVhjMdqr6Uw6j+WPeEND0VxC
         nwGQzlSFR60xM5o5DUE2jD2vv3N9/sK4WXexp0h2SmwgiI2Eus/YOiis/62rsDhyaGo9
         WX/AfC/PoU8iDFkkF4vi3B2iaxkjvK++oBO5wq2zVYZdP8tAr+ujBWbznCcmINFf22Ns
         llr4+jWMZ2rbf/fvfu0IfZVL4OY9Tq4z39cUDypzDEYceQauDl3Dl23Tp5/5ky5bj6Bg
         5HNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794399727; x=1795004527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=v2fr2S1DGDPqqGLXJM0kfi9ZIPOyU1UGWmpu0npSnLbA5WBR6hpH/rG4VU2hltU8zS
         za8CRsV2O3JrFsFAay/QLnZET+MOOqogxpuwOCnkNqfpmQ1OOjk6EHCFNLyYmjNRHzxx
         TjP2pgMjGCIpG4tTyOZQcbXI4Nnc6nxvSqEiTiO9cRC3v2Jnu9cqa92QLc3o61kNV3VX
         WVc98vaFKG2XP3+d7F6GrPJEPBz/iC8AXu7cLYI90LbSCgcfRB2tVGGcX908son6zGil
         OfTYJPETnoL6UbrB/bGrDwnZFdamGY1XML70HVqyz/T9w0IzqnV3VYZ+yUaWUciFuudI
         n1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399727; x=1795004527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=v5RLtwKFnYR4+PXLGmGpu/4ElxOxtudLO0ChSySZtWvD3IBYcYfo7UmLIi6eraatVt
         UafDOnTX3kP7vMnFZi/pwgmSHVFtdh/p4L0Eh5JmP66TjsqxJaLs7+BP8bcUgM0cFYH3
         HUjzyro4/CaBYXI5Bh6+Je+xCBwrzwPQTPNddZLE4aYWIy8M10PwbSW2tT18LLIZq74t
         nm2PN9aY7EEa1akcREmi89ecNih4xtXXuoOlpRFRSxwmcohfzw+CofRD8hmCMyFJgI2/
         LFZgtSTmeEdhj44ep7yMMsj3hTBObDroGQjzodJIsL9djm3+SN3zdHrD29YcZYb/Aa7S
         obWw==
X-Forwarded-Encrypted: i=1; AL+hErEaG2v5PSoNMq9WaMmjKHnoG6o5uvTyrmye572c3Ty6KasZGawRSYhQiKMIYAoixgDTAXRkVbJqOPt0nAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C8KM81SkWSeJxlXXf2jxLEiL6tczOtksWBjCOZLL7mVp+E9sz
	1J8Hv6nSefbIb4gq5MY80ZlqdKfBaaeMJzRW2iPrQeSXVoo57IKVewDLiVh5b1haEY0oBcR5bv6
	jqYMRrF1RdAVsKWxY6bV8z/UChGiWN6LS19R1qLUPnw==
X-Gm-Gg: AYBFou0iZTACPaFIkhFrgldWN7e5YUp08J++fv1seF+n1esLHg3CPxxmXr4AJv8GLrc
	l3IYWNNL2cM8QdpgG2LrA8ty8P88xbc3M65Cl2obIIVHVx9O7RxAj/xYscDeYAnjXuQ8Eoy0au2
	nojzT5rcqXQsuVHA+f6IusmkJQu80+V4061lWzjNMD6i7kb+iaDzPDKGlwDnQzCjaJMgvejeF+a
	5CKr6cloRHIKsLGg3rrKklpY0TzN06cwnDIsijYbmzFFiEJz7iN2/UFc/4asDLrvRjoih/qFk9U
	kXa9K8zwHJvs8FJoHiiM3JznI0MCMzz+wbK3+dpj4VfBlTTW4zEOf3OuK9i66jUc4bGzaR66rxv
	+IYqqz9Foac5566xOpry9C5+Hv8+6Gpej8K/g6OxBbnuIq6p9lQs6mGfdpFkjdKOlJeqWhJHi2H
	SuiLrGEAf6AeHCFpSS0fe24GBs8rsftr3gIwL1biQwsTvsAlJmDUia9g==
X-Received: by 2002:a05:6402:2b92:b0:6b6:eefc:ae78 with SMTP id
 4fb4d7f45d1cf-6b777341867mr1845043a12.2.1794399727628; Wed, 11 Nov 2026
 04:22:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261110145414.GA3828324-robh@kernel.org>
In-Reply-To: <20261110145414.GA3828324-robh@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Nov 2026 13:21:56 +0100
X-Gm-Features: AclHuK-NDRpRb_jYg5FQQ5B5fgUCjjm_CP_VsQUIeOlFZDuAlC2eNYg1mYw5Bfg
Message-ID: <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > The LAN969x fan controller has a PWM output and tachometer input in a
> > register block separate from the Sparx5-compatible temperature sensor.
> > Describe it with its own compatible and binding.
> >
> > The optional fan child specifies PWM period and polarity, tachometer
> > pulses per revolution, and thermal cooling levels.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > - Describe the fan controller in a separate binding and compatible.
> > - Keep the existing temperature-sensor binding unchanged.
> >
> >  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,l=
an9691-fan.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-=
fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.ya=
ml
> > new file mode 100644
> > index 0000000000000..0b7d38a6d20ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yam=
l
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Fan Controller
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |
>
> Don't need '|'

Hi Rob,

Got it, will drop in v3.

>
> > +  LAN969x fan controller with a PWM output and tachometer input. The f=
an
> > +  child's pwms property references this node to specify the PWM period=
 and
> > +  polarity.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,lan9691-fan
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System reference clock
> > +
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
>
> Drop. That's already the max in fan-common.yaml. minimum should be added
> there too as 0 would never make sense.

Ok, will add 1 as minimum in fan-common.yaml as a separate commit in v3.

>
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
>
> The dependencies should also go in fan-common.yaml. Perhaps
> cooling-levels without #cooling-cells might make sense sometimes?

I removed cooling-levels requiring #cooling-cells, as it can
technically work without it, its not ideal, but it works.

I am not sure if its feasible for fan-common.yaml though as we already
have schemas for EMC2305, and more importantly
DTS-es for freescale/imx95-tqma9596la-mba95xxca.dts and
rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
that have #cooling-cells without cooling-levels.
EMC2305 driver even calculates cooling states without a levels table.

I would appreciate guidance on how to proceed with this.

Regards,
Robert

>
> Rob



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
