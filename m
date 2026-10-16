Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F1254707F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154899; cv=pass; b=RA1gRo22XXx7XNTcIA9Vn5LpIqMdgTTS0zDtDpa8l0w89B/jHAovhkji9KQzfPSK08UwRccxD5Q0TBIjTTdo0q2imdbc2SH6TWWABch7Ms7lAw9NzRrCrYOBTGUajIxGvWIGN57pI+7pdQtP1CzfVL+liQyE3nNN4qNr2ssEk/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154899; c=relaxed/simple;
	bh=of8ZV/kCyQQV+q31+bi/0MLLfWXyjaVnFi/w7NTjqrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPZDoUZCcGFboxlGHH0wuHypafhv2KkmvR0Tz7zxNCDINxn8TNkZOFg+B5H3kCDa2NmVUZ4B9hY71Ul06ed5RegmlEwYv/Uevu+LpdJkO+aZ0H/4Kz6CmtTkeT2lthCDlOpIFHOzwrmdi+xGRU1a4n/Vga2Y5Ta9ktp3Uf+apCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0zDBoyr; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0zDBoyr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so45459085e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792154896; cv=none;
        d=google.com; s=arc-20260327;
        b=dvqWcKv9Cn84oAnNlLuqPbiyME+cOqW7Na0u2ZM3LpruSiSgO6q3tZ1GHzUlHvH9+T
         I9mucauPYEwrzG3luZMmWn6lt33lsNIf8iHnmnOlfpMlI5IK9ATHBSi96y57mLPtAJTq
         S+njdLQ6tnlVhgVngbocBQFO4V74EJA6RGOrs1NvueLtO57AQ9bcu+gftrNcEDAZuvkj
         KOlAhYjj043s3AR+LMKV65+wmYDcALGcgl3AJoMEI76oxtgkwzqPoqG4aT9o6LfJqEde
         QxSG94MvQPtgSH6a0hw6OXcsSbRZ1Vc4erB/RU4jgclmlr7xtwQUiB8aNJJD2zPG0l7o
         JGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        fh=swl/aapXRMioPJOOHh59e9JafLCOeyD4vopICyW7h1I=;
        b=btU1LTe7f/OYfAq3SeQD9ZyI1VSul4gis3xZIRcQpuMGO4b+pdwQ9spc5X7zrpIn6N
         aTYzkHnyL6CemXSyeBCZWLBGNCVllcMFv/gye9aM+naNcWhJfVbiXgy1bYoG7Edhy7Lr
         i/NPCYKS8vtE65BKp2VlzVOSqnzi7aJ0AvL/hyOCB48xhjoH7qJWXVbAnJqut1K1pOnv
         YlaIym7gL58G77ZC6IgdY/tZBqYrCSaTcHHzKpS8xLEjoBGfkAu2urpFsYinqxqlLmkn
         suQjmtRu1VBNKwlLxLRHOKqyBcOdkl1uSqd7OsGay9n4zu3qCxltd87mYj3SOmIJMjPm
         C/dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154896; x=1792759696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        b=K0zDBoyrzl/q1EAk3uVtoc1ebVFR3/THUnMTEI9b6vlCL5yjmjGyhYSLlrkaG5YfSf
         gBgs/NHeyBedyPzeF9owAhfYRkpPc1SRUKb3Y/MjmKyrosRWPotac/HpJt8qJ/iesLkm
         ou+Pi1etlHnEm4YTWLzHXZNaxGdWgzMJzELFQANSqkN9k04Wn2pYUTupHN8+3phRPovn
         9TVk5Rqn8mMo4Rt7SRCNzeal5WSe74UKiLIPVJqsUojx9Wp1GJPvEzqPbUUJy2+YaC0Q
         YeknZmNGIy+7Xu9b3OX1I5IxPxgG+vDmKhiZSgMnyYNPLeeqpXE0c3KCLN0wIicJKJN+
         njyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154896; x=1792759696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        b=AIEN0sBMqEcevQt4Bvacs9mqSTmFbCWBu7dlEzW2pThB/NMKlHf8cM4c5UKyuiwqQP
         n23DXHQdSgwdi2ow+V7GtTNIVK28TxSRX7djD9EC4tsthbW/doe/508G32htzIVrharZ
         IH9/vUaL9YtuzenSMbSHdKMnhV3SxccwQ3Cd9gQX81atGL+vR1E46IHTwPFstMkpMNcf
         b8r5ZYdczN0z7fGIIgRlSYINsFUKCTwNfLbGPVYKTWkvLZyLIAli5lkr0oIR2vK3uiCp
         RWlgh5Dj+/xOhm8iPLOqpPjP1XTu72x643RtfPg/+gZSMMaY+pFfclQdlRyK9vf6nVK1
         qEbg==
X-Forwarded-Encrypted: i=1; AKwUvBxDGvxydZ/S0O+AKncIsghKSZmpwRMaawUOFaN0iTxX3owVijHuqNGSfLrs2iQnrnURpfSKwL8QlzUA+z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqB5yZjk/mJCKv0+RUu1KQVm2sAl+G8a28ZlItwryNNUuKx1NL
	cstPHDcK88lej4sWRYUy0DBp+EuNUaKrE/OQsUePOhgUYwZ2QBIWF1Iv74lIjuoarJWJIVvX8RU
	t1MZcOdFbKAvhWYWSNi+Ewz5WtGHSz5M=
X-Gm-Gg: AYBFou2s6eFflGeZVk+0b3Qos+3y26VQjSZ6nBb4Gugxqd37AyPaYJGbatKxZy2ynrO
	pkMyDBVhZI7J6hSq7NxgG+QsD4cRbFJSJ1bMTT8z3PfNTb9FrqYe48quqat+yEOZhh4lemf4cT3
	w/gwG/a2GUdc9EBQNsAu1BX0K5HxsgwTdbl5GsZqJBgtKlWslKsJeLBdpN7ji8fsFn4SKS6Um4f
	HSXRP3xH0ovbYJZDeyFxK/v1q1dlHX4VuCfEFOOXjxQg/BdJBAR0ZQAmYdgz0Oq6Ked/QjcTC+w
	IVuDUCuB1aEsvpS4rzUmOLCnbWPWGdD+ibxTmDNk2YRU+4S32wuKNTWjIrjigKyQXk1D8hwRzZ7
	T5AFxI3XGc96pZEahnlIVQI2j50i0ZcsxedaVt+q2VKSLMpJPf/rst3oh68R81Sn0REY8PgEnaI
	A=
X-Received: by 2002:a05:600c:8b30:b0:4a1:d492:1604 with SMTP id
 5b1f17b1804b1-4a1d49217abmr8476215e9.11.1792154895917; Fri, 16 Oct 2026
 05:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 Oct 2026 13:47:48 +0100
X-Gm-Features: AclHuK8lvl444VKeNoxNELwm6dJ26rZofEbdCjP1xmIlQpJFpVbMZ5iIywezxjA
Message-ID: <CA+V-a8vFf-4e3k1wUeDTjHMx1rb27WMrnsVn6OuijHA0ACzpHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] media: dt-bindings: convert ovti,ov2659.txt to
 yaml format
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 8:41=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Convert the OmniVision OV2659 camera sensor binding from plain text to
> YAML schema format.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Chagne in v4
> - update MAINTAINER files
>
> change in v3
> - update subject.
>
> change in v2
> - drop rob's review by because use new file
> - use new file ovti,2659 according to sakari's feedback
> - v1 (2025) https://lore.kernel.org/imx/aPdHqCWNdmVkch7S@valkosipuli.reti=
isi.eu/
> ---
>  .../bindings/media/i2c/ovti,ov2659.txt        | 47 ---------
>  .../bindings/media/i2c/ovti,ov2659.yaml       | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 96 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov26=
59.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov26=
59.yaml
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt =
b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> deleted file mode 100644
> index 92989a619f292..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -* OV2659 1/5-Inch 2Mp SOC Camera
> -
> -The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array siz=
e of
> -1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supp=
orts
> -multiple resolutions output, such as UXGA, SVGA, 720p. It also can suppo=
rt
> -YUV422, RGB565/555 or raw RGB output formats.
> -
> -Required Properties:
> -- compatible: Must be "ovti,ov2659"
> -- reg: I2C slave address
> -- clocks: reference to the xvclk input clock.
> -- clock-names: should be "xvclk".
> -- link-frequencies: target pixel clock frequency.
> -
> -Optional Properties:
> -- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if a=
ny.
> -  Active high with internal pull down resistor.
> -- reset-gpios: reference to the GPIO connected to the resetb pin, if any=
.
> -  Active low with internal pull up resistor.
> -
> -For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -       i2c0@1c22000 {
> -               ...
> -               ...
> -                ov2659@30 {
> -                       compatible =3D "ovti,ov2659";
> -                       reg =3D <0x30>;
> -
> -                       clocks =3D <&clk_ov2659 0>;
> -                       clock-names =3D "xvclk";
> -
> -                       powerdown-gpios =3D <&gpio6 14 GPIO_ACTIVE_HIGH>;
> -                       reset-gpios =3D <&gpio6 15 GPIO_ACTIVE_LOW>;
> -
> -                       port {
> -                               ov2659_0: endpoint {
> -                                       remote-endpoint =3D <&vpfe_ep>;
> -                                       link-frequencies =3D /bits/ 64 <7=
0000000>;
> -                               };
> -                       };
> -               };
> -               ...
> -       };
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
> new file mode 100644
> index 0000000000000..926e5cd966b8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2659.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV2659 1/5-Inch 2Mp SOC Camera
> +
> +maintainers:
> +  - Frank Li <Frank.Li@kernel.org>
> +
> +description:
> +  The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array s=
ize of
> +  1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor su=
pports
> +  multiple resolutions output, such as UXGA, SVGA, 720p. It also can sup=
port
> +  YUV422, RGB565/555 or raw RGB output formats.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov2659
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xvclk
> +
> +  powerdown-gpios:
> +    description:
> +      Reference to the GPIO connected to the pwdn pin, if any.
> +      Active high with internal pull down resistor.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the resetb pin, if any.
> +      Active low with internal pull up resistor.
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          link-frequencies:
> +            description: Target pixel clock frequency.
> +            maxItems: 1
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@30 {
> +            compatible =3D "ovti,ov2659";
> +            reg =3D <0x30>;
> +
> +            clocks =3D <&clk_ov2659 0>;
> +            clock-names =3D "xvclk";
> +
> +            powerdown-gpios =3D <&gpio6 14 GPIO_ACTIVE_HIGH>;
> +            reset-gpios =3D <&gpio6 15 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint =3D <&vpfe_ep>;
> +                    link-frequencies =3D /bits/ 64 <70000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe10d29b7657b..585bd3344a9e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20591,7 +20591,7 @@ S:      Maintained
>  W:     https://linuxtv.org
>  Q:     http://patchwork.linuxtv.org/project/linux-media/list/
>  T:     git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
> -F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
>  F:     drivers/media/i2c/ov2659.c
>  F:     include/media/i2c/ov2659.h
>
> --
> 2.43.0
>
