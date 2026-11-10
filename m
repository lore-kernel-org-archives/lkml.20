Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308921;
	b=z7QTHlwHhg37zahTBonE2Dqqk0bVuME91dUlFzzuAd3/8c5R54wlv+dtszUqAIsfsEwN
	 w5nv09oTV8u6VV8jgJkM90uaEsWHNBhWtD3ABQhcMs4lRbdZqcMbhaXhvPKPX+A+bBVvH
	 bg6dZe9lURKsS4EVhlqqILKz7pbHke981mR3IOejChShIOP9QKxne0sccpGJwJsFuC5Qk
	 /RqoSQ/IbB7wnej6xZjekGrGiwGivE7de57Fgd1HDYtH11otoWexZ0t8yBdCHkxSxN0Mt
	 +o9jIXuJHhENB17eLqPwYvDKukZbrm1Zsi2Xe+jW6OSQ40hHsb8evW7Z9WzD2RIwqlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
	b=auSHQ84nKYSvuyuP+WHGNx5cNC9JleC9H4g7obNcSWChkGweGf75+4Wx90xoBWMK0zGN
	 UPGxFtAvT7M3Wr4Wk2J+SDOBf9GxsckFaLO78UDCMGJ/EkWh4VB656xmnS/8vpsW9FLYi
	 bCmPDRCSMP+kXZeexWn+PSP/WDXDYeKxlGfbNFFiyw7Q/KgaiH9rHyMXxcEAjzG6I4wmi
	 JllASecYxMjLALh0T108n6qJ0UsaLAgKZwL0TfZSaX/IOukjqRgZv36lBv+amune/E80M
	 9hXMkD8sLs6zBRwb4StTyFgntSyqEoIqLHrOSJ/Fr2ApwidEyFD6xFIdRI3IMo2AyBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDC606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBDC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso2364410a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308919; cv=none;
        d=google.com; s=arc-20260327;
        b=b+IG84Gsqu+5ZsQk7ufrYFtQ/WfoJNFLpVkrbU+oqobMp/i7G/Iw2kvJ90CPHmTyEt
         a5ht4k0G6CiiZXd7iekyGfL3K0S58PN1SThprp2N5cY1hmzWSuTHWjoiDs/iVfI5V9/B
         GOYwH4i3ShPZw5torPVQQMG5LaDqV9pXZ0XIEo5M2/toRrSti0bUSOn2564Ry6cZlwJw
         8OOgrFu3ivW8uLVy3wp1bXd3GLPPUYzYAbKekx+ltwmTZlMvpFm3K1q1hyjjj9bVAE8t
         gOKJ1OLYdWMAVtNdAC+pc0yWRJgC/71xpxb4bm8dm+U9RAKK/AEYMGfcxDtb0jlpCdeg
         k8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        fh=4BAPy9A5Gk70sZhxToGGq7Uul2nxQKv7cD0ORxR5/hU=;
        b=GIFKtSYSHLuAWcHRD3Hi3Mn3m0Cl7ipGnpmoDbEyZIbbmiU2+YBRlaik24sgAg7J3A
         Cn/VE0ex++O30OgiK2DRUpZdCZHKOZPa5Yy9w60X/BkecaOP9MVaIqULeb/r1cD83gT/
         GkiT/Myspdmj21kfmdPxTh9ZiDOu+16FxErUzUL0M6aphSj29QSyojHp/ZfUA9RU2Vum
         St5ExvLqPPvtQavf7em9eIBbs9xdaOb3P4SuyFaC7Rgih+WEryMXqeWfhsZaIxoR6uL8
         GEgo1wKRoMLQQAZOVYqE8r9tLNeRKIWvpIWahdDYq4FvgWea4sLlwUMb0C12gQIPsQm4
         7ZqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794308919; x=1794913719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=ATKIgBb3COVMm0Tw1w7BDFap2wFE6VMsRLY2235EcBgQAjfRBai5tHoO3eoczAZeoI
         xPdVkX39CeT5yr1cYxHCog+l7w5Hwu7wkCc0QnKOYyetnIk62HwOV/jznD9K3sSLeJt0
         Z/Kzjl9Z3GVZIBudJbyaTUK0lUVTxZaDxnmta2GG+H3zek8cExt0msDIAvnFHFSwods/
         ObTfA9iFJRdlGC7NNUI576c2U+/dUHaVlleic9c45qwALBXEvrhV/qXUTrS8jNDd3IrV
         X5mjz0zyizKVWEbVILgr5V56bXtHj5pSivuh4rxQ17Y54pUph1yxkZB/nGpMZO62SgLM
         tsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308919; x=1794913719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=OFh/SmxmyAooNOJxjrT9oL/iBsee7KWaHC4S/pn9egq0c2rXKTSmuF3dgYBTjQswdL
         YU7lUaRnoO6JfxTsn1Ic+3JPdBYkrVXS+fnOdKcchbbt0LV8hC0jxxGGQrVctK/iomo6
         J5rca+ebP5wRAxmMRX+JbgGz46oezm5hr7kk9AMIXEsQ1N057zf7fTeliBESEHZ6rlLj
         fJCkMyZGFoAlqjNIRyz33p1yXIjAnOg7HyWagPJYi/S5gfP8X7qBiXB5wt/U7isnJwIQ
         9pWyb88bDy0aBKUppTAiIxTSTP7apxkyIabGIOQ7Ik+98F5bj8spDapVG6pKD/lUZcJI
         RNrw==
X-Forwarded-Encrypted: i=1; AL+hErFCc8n+LRTN4F+4yyk0n47nP7JmAKWFw44OdzMxLpgspGx+w8NbT5AdFRC6gnw651a4x+3FZaD9fsaLs+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fMeuaMmgt8VxCuv9nI5/rKY465r+dAXwFV0W67TdOTNdfB5SV
	72s5oDUxo4Ap5TZ6LP3NNjkoIVxxOI2bnGQv9P19JJsz97t8eOOZo4MvcQNmucDY2kiGnI5ZYxE
	Y7xiowcXYT7AJV/kmjLOJbqZx5Urkrv6nN3TeezXn/g==
X-Gm-Gg: AYBFou2Sv5bycyhw+4c31IZBKif8/fQZErtkxFxfo5UepdGWbb8qTPpHa8Djhi0+BJy
	8v3NfOdIcR5fHNs9guvsEEAr/GOkGMjvHS6ngTeEXC1KRGVDXcFHmqDPDsI2uBwjcOC+FoyZlVq
	wStZX2m0pMpBqAitkyHpkj4f/52O7zAoFu8fBvNK3pdiRAIeuI8ApYqF6YgXfpj4V4Uj7zHgYYI
	+A9MzNZulCyFW5hStcZOT3DaBKIZ8vPWO0wyfhfzP9X5dQvPZuutMf7Jg1VRK3zIjNZsgP3YiOO
	N9HHxHmcLOtqvRpIZy6w0jkl5er8iG0czVT3ick+NT2aaJ8sDfVIi0eZiwwrNziw807isMgaTrx
	iz0rtlR8xSdv5nsCgyxZFw5mwv+5ul+uGHSIDQCOf9xnca1R8zR+PSKwdQ82X03lN+Sbt2FJG+x
	a7K+2olvUX5+C7HD6wu2TI9BynYhg+uvOagSGfp6kY21NrMirvLOj2Ng==
X-Received: by 2002:a05:6402:1d54:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b7564f6f76mr2116289a12.31.1794308918607; Tue, 10 Nov 2026
 03:08:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261109-mulch-mountain-118fd114a797@spud>
In-Reply-To: <20261109-mulch-mountain-118fd114a797@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Nov 2026 12:08:27 +0100
X-Gm-Features: AclHuK8rAj1SvZu7uW13wrFXg8Ofz7g_PIsRsWgsTldu6tOuG_htfxW5SgQtu6M
Message-ID: <CA+HBbNGUig8q_U075xXc62opOvK7wz0er1c6ROxGnKYKTrwWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:14=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
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
>
> So, I think that this device has been modelled incorrectly from the
> outset. "devcpu_gcb" should probably be a syscon/simplemfd, as least
> going off of what I see in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb
> and the fact that we see silly offsets in the dts:
>                 reset: reset-controller@e201000c {
>                         reg =3D <0xe201000c 0x4>;
>                 };
>
>                 gpio: pinctrl@e20100d4 {
>                         reg =3D <0xe20100d4 0xd4>,
>                               <0xe2010370 0xa8>;
>                 };
>
>                 mdio0: mdio@e20101a8 {
>                         reg =3D <0xe20101a8 0x24>;
>                 };
>
>                 mdio1: mdio@e20101cc {
>                         reg =3D <0xe20101cc 0x24>;
>                 };
>
>                 sgpio: gpio@e2010230 {
>                         reg =3D <0xe2010230 0x118>;
>                 };
> That ship has sailed I think though, so I'm not going to ask you to
> rework this whole device.
>
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
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#pwm-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    fanctrl: fan-controller@e2010348 {
> > +        compatible =3D "microchip,lan9691-fan";
> > +        reg =3D <0xe2010348 0xc>;
>
> btw, how do I translate the addresses you have here to those in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb,fan_ctrl
> ? Or are you looking at a register map in a different form?

Hi Conor,
Microchip has cml-utils, which allows exporting the registers and
masks automatically, its part of the public SDK.

Or you can get the address from the register map you linked, its just
posted as word addresses, so multiply by 4.
So for DEVCPU_GCB:FAN_CTRL
- default offset: 0x38800000
- DEVCPU_GCB target offset: 0x4000
- FAN_CTRL base =3D 0xd2

And you get:
(0x38800000 + 0x4000 + 0xd2) =C3=97 4 =3D 0xe2010348

Or you can just task your LLM agent to do the math since its quite annoying=
.

Regards,
Robert

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
> Cheers,
> Conor.
>
> > +        clocks =3D <&sys_clk>;
> > +        #pwm-cells =3D <2>;
> > +
> > +        fan {
> > +            pwms =3D <&fanctrl 40000 PWM_POLARITY_INVERTED>;
> > +            cooling-levels =3D <0 128 192 255>;
> > +            #cooling-cells =3D <2>;
> > +        };
> > +    };
> > --
> > 2.56.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
