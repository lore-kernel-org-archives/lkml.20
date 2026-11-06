Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793971432;
	b=00PQu0YqcevDeqlQLq72fjZ/qKlgXNG9hvUD99w0kDnPo8527t+H9Dd6a5nX+t7FKTRQ
	 Uy1z9n8GemwDDJpw7yaoY5zN6aYO+L5fLTKyvWDlMlTDQkbRWAcw3mhiBmjTr1kV/THiR
	 aVXcJOltEiYbCNKPFndZO5B+xt2YOHByNlGYd0g+EJIPm7poxOyDcFm3xB0OzbcfmelAc
	 UFWcuezbdHXjsbEMO2zn3M/dyJE9rb7izUOs5nlJyARwck7qaDAUiYMl6K6lpQdiWhx9M
	 vWEmM2QDglJVem54FqNRIyPArBIh9jF/gRvd9T+7+Y97sbBmzxRIE5KhEwkAystnoOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
	b=P5PxHsu3BGeBtu1fvgFOUnsiVVkWpKoSkMuM+iXFacKr8trv9KiQbXIDaowjeu928SJV
	 pP89m+DiUr6ihT0Am6mwB1h34UfyxkbW842iNjz1fUsJ0wuW3K98f/kxBt7vOj/6QVpmL
	 XMdG0pCrSujvz6jCy1L1Hy8dHIzoimVLXXKr1e6OaqDnMnb2lFrbIuF2a37qaoqFN3w4Y
	 7QfF3RQDj/HGxgQVTBPerx5JSBSYC1EYCnWdCVi8SxoieypBsYX5UCOPs5rh9qjCiQ7BS
	 RfVpZ9qJlodP2Q1SfXa28cslVFqyoAAp6Cq9zR3muxhLj78xhAQulCyo49PAJ8c4QhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHyT6Y3I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FE0606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FE0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHyT6Y3I
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c411b7a2710so4801966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793971430; cv=none;
        d=google.com; s=arc-20260327;
        b=A9tNYK+u2E1GEsfDYS59g9aP7+QYrPDEQZhR3lkW8zYQRIHvGw7q2wXXYNCBY/mXNy
         XYzSWOMhPIaO2rCCbZLtKQTycZ+bXyDi/h4PHqZ8mNGDtcEbPyGnuWFXVNyi6a5q4Hv3
         T9Xvh2YslnfvLSLRqFvqsbczGO0ikojezK9dP1uYne1e1/fvmiVblcI23S7d/ndGMSll
         1TsIOhcqI4QzO3m5UBwaZg94yIm90mYia2vbOLXv8OF5SeYnNscqNyQDpT1xN9fI1nSc
         wgRjfvZwf/LtuMFA/wzGZLvP50ectoJM1T1IB0BBVYXOn6cjEcrPl90YO/2vRqzXaee1
         8VLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
        fh=V+Jlui+PZrWhscE7ZwJegRqAs7VQ2KI+FwtGgsB7f4s=;
        b=e6PcNgKVCcOXimgDquhrU1Gno7svdct9hryLtyvGpEQnF9/O8y0mddiRZJHe1QghOY
         yTvnR5I/Q+llbbSdkxh5fWOMDR3VfmJJ6rf5JstACcgSPaT+prVnqhz3yo8RlzEThmpo
         LZT3oPp2wkbwongyvvC6K9oQ2CRRtqd+2/GEO9UIXM8ACPZDaX/NQwxMYzbvcYx5ORQn
         Iazf5tWcmOfhrkTPD8jBHvl3RZ0VeSbMITT97rjwhPg5AwuEVWIotKoTtUAeIkxYXnL9
         5DNj4cxg6lox2I/DHWzG+sM1mtNhqdvDRRHHy/sEWc6NPylZP9q7NynSPVXPjPb6n6WP
         9Eng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971430; x=1794576230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
        b=UHyT6Y3IlscQit7QAcP8D623Xc5Zrq05PDz517rtZczx8QFEHTMAADKhgDY4BNamP4
         6bmfp7EpufEZgX2ulI45dbgCntQnaqCe8Sg3oI7Y68x0Blwkjy8UlEZv2OTyYWIGT18a
         6OH/TcOBsVVLjxeXjnVt0O7s0f2dBLb3uWvO9noZfSowQfNG8/KqFFQ9vvqWgkBX/N1x
         Dn0IrAIjGHl0tyT8l0i0S+bS1rzcEuNfqu4DnRQGh3V/IIF+msfVcZni59LpVqkd+UY0
         cYpTTPqxm8xvbVgUKQMvoJy/xuTOqCOA0knDOWVL8XwOw2Szsamxt9fOkBDN6MWWAETD
         ZnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971430; x=1794576230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
        b=GiSEhIvO0R9Gwwn5DDFi92SDVj3FfeLW666eNszvz2KzEVlhOfpehBYvUoi2GSCqqX
         aLhJSV+OrI+rs6bDGQa3J6dWbcg4+8DRNPsQDmGSZ21TYyXvL31fDY/3zUIIPLp05IQd
         RpsRAg4nRsFIvSG6rB8i/HVk15dLBf9EnUVYfKoAt54y7G6XZQGNoTx51I/H0VQ3fv+K
         mo7EG26nMmO5fqCzf5B+LNo70CmS6STI2kkNzuy7vcWMsAj/7FEQ20lrOCPOMge04GHn
         X+wy4yblPoyZHbv8X0XTaV78qr+Bs2lvbmKSngMjfbZ527bflHidjA4yntBan3thLOVg
         6wfw==
X-Forwarded-Encrypted: i=1; AKwUvBzPcyEYnlzM1IT6O8Xbxe64PhT2e7NaPX+4vHgS1AVjYqTy048hM0nxOG9tG7qGREVEg9g+Xp4A1u7tW1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fr2H9dfnl01G4K0HQpvlXUTVi/tHXRZI7BxchLcw6aXSFoYuB
	KJzslnjsrkwKecKD4ymTuN8bmc8TGEN8qjVl0Tg6hV7c5v8jTWyfB67CQDFW7xRnB/Oz2I9WaR/
	52D0X4rfSEHiM5rSbW1SA56uKmXeJJbY=
X-Gm-Gg: AYBFou1TZNUeYVXff7M+sW/8FMD51K6XDrJp5/L9Bd4ZnedDpeghAXn+dFpuqnPygjq
	QKd6qf/fB5zccLr6KwbeTezIU3XTMwpChgzppjVlKxTY7yplac9lceQtUOSBkScFLu8KjvIv7vQ
	CCYUGyjaEtRYtV4CY+K8JxKLYRq9izpxHCqKvxks7Rl0pm2qHRXeTNttCh1bh3qPWPvDOpyjLlS
	cKTYkMCalnuKkidm/h7JQ4SG0lmKccOz4u7C+xwVEAHAVyTYTcBYofXSbU8o6ichOZ6vO9YHkcn
	vQtXAmH8GTwISfGfxPeGJp++W3Q7rq98XKt8JiRuW0vS/JM4yKhKrrnSVYbjtLEx9GYfZs+Mnlz
	uGev81TYc0wbNqNHHgK/fRvGAAonzA9lIZ0DuC042f0XPmtlOacQyhjpa/ZlAkncalUOjI/8=
X-Received: by 2002:a17:907:29cf:b0:c34:db91:aa1e with SMTP id
 a640c23a62f3a-c4d34cbe4c6mr224296666b.4.1793971429837; Fri, 06 Nov 2026
 05:23:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com> <20261026222231.GA4050519-robh@kernel.org>
In-Reply-To: <20261026222231.GA4050519-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 6 Nov 2026 18:53:38 +0530
X-Gm-Features: AclHuK8vIx7cA9UMBf-q_bEDwVRNbmqHS9QHzWz5buXv8XkHwyi7N95tZvdJH68
Message-ID: <CAOWyW_7XoSeZ4iBzPt3VpV6R=T8vRa+WjPcw5bSOP0XjmXBTvA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: omap-l3-noc: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Santosh Shilimkar <santosh.shilimkar@ti.com>, Sricharan R <r.sricharan@ti.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2026 at 3:52=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Oct 03, 2026 at 12:28:32AM +0530, Bhargav Joshi wrote:
> > Convert TI L3 NoC binding from text to DT schema format. Older OMAP3
> > uses the SMX variant which also acts as a bus parent with simple-bus
> > compatible so child nodes are allowed using patternproperties. Mark
> > ti,hwmods deprecated as it is no longer needed and only used by older
> > omap3-l3-smx.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> >  .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
> >  .../bindings/arm/omap/ti,omap-l3-noc.yaml          | 149 +++++++++++++=
++++++++
>
> This should move to bindings/soc/ti/ or bindings/bus/ perhaps.
>
> >  2 files changed, 149 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Do=
cumentation/devicetree/bindings/arm/omap/l3-noc.txt
> > deleted file mode 100644
> > index 161448da959d2..0000000000000
> > --- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -* TI - L3 Network On Chip (NoC)
> > -
> > -This version is an implementation of the generic NoC IP
> > -provided by Arteris.
> > -
> > -Required properties:
> > -- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
> > -               Should be "ti,omap4-l3-noc" for OMAP4 family
> > -               Should be "ti,omap5-l3-noc" for OMAP5 family
> > -            Should be "ti,dra7-l3-noc" for DRA7 family
> > -               Should be "ti,am4372-l3-noc" for AM43 family
> > -- reg:       Contains L3 register address range for each noc domain.
> > -- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
> > -
> > -Examples:
> > -
> > -ocp {
> > -     compatible =3D "ti,omap4-l3-noc", "simple-bus";
> > -     #address-cells =3D <1>;
> > -     #size-cells =3D <1>;
> > -     ranges;
> > -     ti,hwmods =3D "l3_main_1", "l3_main_2", "l3_main_3";
> > -};
> > diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.=
yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
> > new file mode 100644
> > index 0000000000000..a72a0f4e64332
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
> > @@ -0,0 +1,149 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/omap/ti,omap-l3-noc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI OMAP L3 Network On Chip (NoC) Interconnect
> > +
> > +maintainers:
> > +  - Santosh Shilimkar <santosh.shilimkar@ti.com>
> > +  - Sricharan R <r.sricharan@ti.com>
> > +
> > +description:
> > +  The L3 interconnect is an implementation of the generic NoC IP provi=
ded by
> > +  Arteris. OMAP3 uses the SMX variant while OMAP4/5, DRA7, and AM4372 =
use the
> > +  NoC variant.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: ti,omap3-l3-smx
> > +          - const: simple-bus
> > +      - enum:
> > +          - ti,omap4-l3-noc
> > +          - ti,omap5-l3-noc
> > +          - ti,dra7-l3-noc
> > +          - ti,am4372-l3-noc
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 3
>
> Need to define what each region is.
>
> > +
> > +  interrupts:
> > +    minItems: 2
> > +    maxItems: 2
>
> Need to define what each interrupt is.
>
sure.
> > +
> > +  ti,hwmods:
> > +    description: hwmod names for each NoC domain.
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    deprecated: true
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> > +
> > +patternProperties:
> > +  "^(.*@[0-9a-fA-F]+|regulator-abb-mpu)$":
>
> I suspect that regulator-abb-mpu should be moved out of this node.
Sorry for late reply.
On OMAP3 the ABB registers are both inside the PRM, so prm would be accurat=
e
parent. However, on OMAP3 the L3 SMX node is deliberately the flat bus for =
the
whole SoC. The OMAP3 prm node is also not a bus so the ABB node can't be ne=
sted
there.
So for v2 I'll rename the ABB node to standard regulator@483072f0 instead.

>
> A-F is generally not used for unit-addresses. Do we need it?
will remove it in V2.
>
> Rob
