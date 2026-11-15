Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794762863;
	b=sBywylfgalkp7rEzsF+CZBxqtQQA9aBcP9pW0E+983E+D8S/EXb08DsyBtrGJYX/sYfm
	 WC4QXCHCDk0E1+WypNw/XUGk30YkykxLeGtMtHIfmzMrecEnWY+QyFRMX3fJOghfxE7rl
	 zT9hRcQ6H/VlPUPzCi+g4wLhLC/c4Uy+wOA3Ogv5Tedwr9+Iukugc8cWZproOMpjs536W
	 5wyAxTN9O0/NUnKsen1scfSBTzszHx574SBclfXh8kp2Vd5HbVkCKqaBG9UEw0L2E4VrY
	 mN3/0pzxTms0DpKJzWr8LWxJOH8bVUtBJRS0Lc6B/U3nIp0j1Bx8I25QERd195Md9ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
	b=nVdQApIAnFezdBs7dPe8GEicJcClOaOoTT2R+ghDzfPVJ7RUrvbiUGVS85tjdxuHWnu6
	 P2v+IecmS9QWopch9gy+ULeR2BsIKWICCL1oHU6+7/vSAihz+QrfKh0+xqZbnF/6biUDy
	 /9oCw++zDFDZOam3AOHgp9Md+ZcOwOiZXe/hVcrJmEU3dVAj6SQo/0E6bdUWSLl/7jzPC
	 0ClbKc/4d0MWXHu362R02YeIogTtdVgVStHS923/3FK2iUMfutlgui2k+KjFmHVkJyCyt
	 6SfE8en4Bkc4rJWJJDb39fWndwu47KIj2mS6LH1ughVr64ef3WsmIJbVOfMDKQgcd7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+n7pyFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72932606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72932606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+n7pyFg
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so193671cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794762860; cv=none;
        d=google.com; s=arc-20260327;
        b=Cog+0V+C0NOWWSCKAGoDT94Cqi7Qn9ffDNNAAZJGQy4s3/EVTjmLIFB90lbjOJMnHn
         5N0wUTLUsK1p/WnN2u3s63bHG3NUZcjQpU3/jh+T30av7FPVxoWTwiG68GyKuUBLfwe6
         R8P8JrBBH0+KfnfYvfA4ibP7LcOYU3AnR5t3LZ7nffo/kMV0F2zO94WuAp1DscmKkQd1
         LZyC4/J5dcvfKG5DyxZTxmv1pGijPpw860onPGIxYDBxUm9iASif+K/syc5DtvGAuR1T
         sGnQjBL8EM4QZonewpFwUBtPtuUD5Cbuq18nOi17DkNK9HHLBbnyQh4rCk3oQ7Vyv5G4
         NRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        fh=rpKMCmNqQT0wLZ6y9sZx+4Ie5qrLdlbxGGwyNFWAUPs=;
        b=HFqlb9GRZSMvuJXmmeZ4gPWjEXBzJHhlRe4MR7rCxM+GiKQGrL+qxIH1u4moi7Rl7Z
         ep6ZJ2ww2V0Xlvxockt2gb91bDCFO0GtKxqcTO5dILpufgzVIpL9aDmTvkDMi6z93Sxq
         lScHsnCAoHEZYalpyUA4b9GrK+olPwuw3sYOeuURFJLHFmh8CPkT0fAhEkInBTJQfVbo
         kkheG7jmLFKuzYsDYcXxwhit1UmXb0xgnmqkHB9sn08QNWvCqNDawCBG7X2grj8nh7gB
         DGeCiCbONZm/yEyLnss3yFoTduRX4fHsTNYW4Pf04a1Irl/TS5M1xhVM53McVmbv9xUo
         KAKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794762860; x=1795367660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        b=K+n7pyFg4BiDZzLhNlpFTGENkK5vRoZX6N2Vpd6Vp/EnuzX3L/S9y9Z/R0Ll6dCPq5
         6qoGuF8xVg5dyp5cIDJaJYYUAYrnVlkwYaTc8DfA8Xqav+SE/e1GjI/ubaYgyGKKO8kL
         HP90cXMh3SRoIr9PonX/RoiJpTlTZ7aLuw8pSBFTKrmrekGstAfxouYn7pJD32CyssvP
         WDLs74Efi7RKxt/HME+WlAXpWCrjKEM0JkvbO2VaRi0vcKCXTwyx2uNm0gRj5WGYKbvy
         +8NFL8lNgmIc84zr/A4E7NYikHtKHz3/L5GNRiilDh8HVnaGqBso1lcdQ4aBol8KrgAy
         cOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762860; x=1795367660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        b=ePCrlhTLUraoIrpKIUYaOT5WXxsYaCUGoFi/7o7xHPcr1yc6klV+ohR8fdGUUih/fF
         Z+Q1rABnFvhiZKFniJqIM6Fx+qDtGDzPQKLrwtGublVPdpfFLmqczbHITLSxGOcARqIK
         jlaE/4BJVak5dS2LpoZf34Tj1bGz90AuX4cuv+YFPkVazsXG7hH6G22qEA2oktmsfBjl
         6NF3eQO9s5Ne06eLQ39y9340up8pESSKEEA+PT3Ae07zz3OFhj2prKYUdgnwfMkUhlGu
         3XKSq+xIhA7xLz/bQqBj7GtrcWzitStGpKgn+xjIPL0d92F9Of0Tb8yvzY+6C1IIGuXF
         NLAw==
X-Forwarded-Encrypted: i=1; AL+hErFKeQLmxPPgBUtqujSL1iYZejEiVxgPLCSzX6yhvbpBRwD+4yeTqw9m3xsuWOnanJVnlR1RO0skFbkjA8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f4SXKYsP23RKR2oYJokvI/a01o2eQX+Vp0dwRhco16wWv61PB
	v+gtjJkCRFeVALfPGAnW5fV3OV5Tczvaje1ZBhcdsC+FrUHws/1Rs1DTRV+GI7Ulk+0/Zir0NQX
	BZesSqxdKg/7QQFbNVpqs6JmgGJ4TC1M2cm6TSRkN
X-Gm-Gg: AYBFou3Wuzb/JbkRxprxZi5ExquKQNszzwUtd9nDtFhQqgoSX8Dvkv6MBTuI6f1cFGs
	kUSPbeb6GQBYq/TKDeEgCDE6sbklyi1had0HtxBokOwyP3hYXs3xFnBi1yThyGmiGwnBOHieZlT
	nMqBdPUsa/mKEZYaTaOYkh30Fe/A0whrcwC3lrJl/bOhftpWGJm5DFHj95ebRE+zSXOcJvPBXf6
	ZvekqhfIZbXdZAyqx9S3557sKte6J1DUoAoUN/uPFl3aC2goQ/5tY/CUV82CpckDKnFTBTdU8/e
	8feXkDHm17Rwyeg8+qjAsMW+Ok5obv16YKOQFF0BavHKamhMyd3kLdmlgS0zTujWDM84QBY8642
	sOdrT8xnKjqFbdIBpshr3e6l/Ky8LDNjkAIHIZJR4IwzQuQXfVYKhcQE7T9zB4LERBmvrmAk4T4
	dYb/gs8tjn+3BTs1jD0nwx7nGvh2Gcnvv0ydqh5HVBY674Fg==
X-Received: by 2002:a05:622a:53ca:b0:536:78de:775f with SMTP id
 d75a77b69052e-55c69c2ff17mr23222831cf.15.1794762859662; Sun, 15 Nov 2026
 09:14:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com> <20261104-colossal-illustrious-guppy-87efca@quoll>
In-Reply-To: <20261104-colossal-illustrious-guppy-87efca@quoll>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:44:08 +0530
X-Gm-Features: AclHuK-yTkRrUncnurNuyi5Wl2ro-fglUcoEeHi8NCW7Il2Q9Y6sBXYKy5bfL-s
Message-ID: <CAMTSyjoBw6uL3yT2rEr8LUsoO-F22v7nSKiD6sOLhDwVsi=fvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Nov 03, 2026 at 09:56:06AM +0530, vamshi gajjela wrote:
> > From: Vamshi Gajjela <vamshigajjela@google.com>
> >
> > Document the device tree bindings for the SmartDV IP Solutions MIPI SPM=
I
> > master controller ("smartdv,spmi").
> >
> > This controller IP is integrated in Google Tensor SoCs starting with th=
e
> > G5 generation (codename: laguna, canonically written as "lga"), so add
> > "google,lga-spmi" with a fallback to "smartdv,spmi".
> >
> > Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> > ---
> >  .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 132 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b=
/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > new file mode 100644
> > index 000000000000..e0512e60d932
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SmartDV IP Solutions SPMI Controller
> > +
> > +maintainers:
> > +  - Vamshi Gajjela <vamshigajjela@google.com>
> > +
> > +description:
> > +  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) m=
aster
> > +  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
> > +
> > +allOf:
> > +  - $ref: spmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: google,lga-spmi
> > +          - const: smartdv,spmi
> > +      - const: smartdv,spmi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      Core clock to the controller from which SPMI SCL is derived. Opt=
ional if
> > +      the controller uses a free-running clock and clock-frequency is =
specified.
>
> Don't repeat constraints in free form text. Just create proper
> constraints.
>
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description:
> > +      Input core clock frequency in Hz when the controller uses a free=
-running
> > +      clock not described in clocks.
>
> Why clock would not be described in clocks? From where does it come?

Agreed. Even a free-running clock should be described through a clock
provider (e.g. fixed-clock) and referenced via clocks. On LGA the
controller has a clock and reset line, so in v2 I will drop
clock-frequency, keep only clocks and resets, and mark both as required
(removing the redundant prose from clocks).

>
> > +
> > +  smartdv,master-arb-enable:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enable=
).
> > +
> > +  smartdv,master-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Master ID for the controller on the SPMI bus.
>
> smartdv,bus-id, I guess

In MIPI SPMI this is the controller's arbitration ID (MID, 0..3) rather
than a bus index, used only in multi-master configurations. Since LGA
runs with arbitration disabled and none of the smartdv,* parameters vary
per board, I will drop this property (along with all other smartdv,*
properties) in v2.

>
> > +
> > +  smartdv,spmi-version:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      MIPI SPMI specification version used for transfers (0 for MIPI S=
PMI v1.0,
> > +      1 for MIPI SPMI v2.0).
>
> And why would that be board level configuration?
>
> > +
> > +  smartdv,arb-retry-limit:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Maximum number of times the master retries a command when losing=
 bus
> > +      arbitration.
> > +
> > +  smartdv,prescaler:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 0
> > +    description:
> > +      Clock divider value to generate SPMI SCL from the input core clo=
ck. Writing
> > +      1 divides the system clock by 2; more generally, a non-zero valu=
e n
> > +      divides the system clock by 2 * n.
> > +
> > +  smartdv,read-latency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Number of SPMI SCL clock cycles to pause during bus turnaround o=
n read
> > +      commands to allow the target device to fetch data.
> > +
> > +  smartdv,arb-scl-delay:
>
> Except Conor's comments, some of the properties here should use proper
> units.

As replied to Conor, all smartdv,* parameters do not vary per board on
LGA. In v2 I will drop all smartdv,* properties and the generic
"smartdv,spmi" compatible, move the LGA controller configuration into
of_device_id match data keyed off "google,lga-spmi", rename the binding
to google,lga-spmi.yaml, and drop patch 1/3 (vendor-prefixes.yaml) since
no "smartdv" prefix remains in DT.

Thanks,
Vamshi Gajjela
