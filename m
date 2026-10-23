Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792790984;
	b=QFT47KCvOQ1C6yhlt7uriAaabujedIk9CbrPIsk90wxFcjOMmOQYieGsfzFIOe+4o1cJ
	 e0dLPavAzP46iI5aMNkSRCiSbgBQN451Wq25LMQluZFO8svOKUKrL58w4mcPUHKv8Tf7q
	 G/rpIAHm9OwUsWUwC40xfnnozH8EUBm+2CW/Ulo4d97PC6rs2JRYN3b/ZcEL6xbTffuf9
	 wudoXFOsqDvYaUboglPubTIw/b12e6Qu/Lrq557NzHfnHiPJ46EHEMg970ux9Wv3DLRmq
	 XkEGgrK1VH9C0z9nB58aHNZGVM+eiJZa3rgMqaiQHFpC8IimYMlhyOgdq7C45dw2xew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
	b=e8CmzqDS3hb7haoi0yk6/GWxJ3jqVcvzZptXU8n03C3rFl7bOhdkgoTtALnQN5/8drNH
	 e2pMoG03M6PH8E4qnAjTZSr4z5I/SHn5wf3NJW7gSLtk2Z4o1atatnkd70FyG5KM9iVEY
	 z/qgu8sVy/WvYn45ElytpF0eyrAmCVzESHo8fEBtAPkoaCxWGrfU8XM+IemNzp4WMkhEv
	 bOsQDK2bi85sl1+2GJWbyineoRK8DCy/k0E1bJj/meEGg1am/ZgocqD/bOrPPAIquv54h
	 WCu+/s4yDZLM8RRbq0zZ5QKNYOJbOV1NZp3c1hscWefb/5StX7/l+V894KwDTsUPFRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfcjC1d1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5841606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5841606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfcjC1d1
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b056d58f2aso12690657b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792790983; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjsIyxAtBXfvdw46AETvuIWVo3ocGwlErYOHHz2mwlxGNHElvORUzVuVCjyB7vRB1G
         4MIH9UOh8FB06Mrf6sXGym41X+s/736duXSODO51vxP89rnILZ2owX/m2ALkUyQFsNOQ
         YM9W4cS582H0HjI4yvZYHv20MYRq07mzLNJSYiEtkKM4YljhOnr7xXfAZ3umu7Qx77zf
         4XJ4jv4OWENsnCr2TBV+U2TOzFjqC1pCLa8k/jRox4a4prtoEr02nul2YFCsQ/egZPEW
         hD9gzW+hhSjkUP6OG4vBkjaqiXNXhBYETMBMsnumewUCk/pCE9eU5ZpxBjpUX5/iJkqF
         Eaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
        fh=NF787aNHxlzGwgYK715gUUQ2ubv2bh/bjh7rDwjkPBY=;
        b=EihtiTb5kNgGct5tAyqbZOgyFkA00jqN1h8ph9HrlpmHa+PdQsOIzTwEk7/Uq0o+3L
         EGBtw4dw45Ef4bqQqAxb3NpVmd7n7ueXOO03NsD0fzNqwJghJQI2WgW6U7xKaO9kS5Mu
         4oKTN5z0F637r+2p9Oy0HSiN4zrmSnzK5L6yfNvZWYh5KrOHiggIRQaExinQ4mIrsA8F
         JZfZU7uoQIykyecp5Mhr90Z78JikNNyKiZznxVxWh87jwQH5cZBucZjNCZ0XmWEsa35M
         DxYMGcYmp5XzUHWPkC8CbtYrj6OANgL3BmL7ZxKknc2rYIQwSQFcKnEnwqhESUaI47wq
         OVng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792790983; x=1793395783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
        b=bfcjC1d1vWOT1pE9X7gNabyHtF99QX5dSLBV1xVK5YhE+PCKgQcMtacFiknvczljas
         pSbRQQ9f00apAwLTNHlvUICLRGZIUiHLO8ZQWR+ht4d+xEi4Ee1BfJDsQU16ahnkS88G
         uC4l5/cmHNgM95Gpkf2IrZNxEA2vsG73DTUts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790983; x=1793395783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
        b=YZgo1S1Xahzc40KWjeotzGB8RgZ8bOy4WdDVKf86Eox+lglhG+UYEckTuJqb2tjYiA
         4N9kOpGrRJxn8NuVbi7je3zSlsdPn8GDJXJVNKEQb9p1kxnyZVI3OfevDCpV/z95C4G4
         XbJk2xtJNGvdtTgYQbmNPMNcB6+FbpQGnpvy0mSYLtvvprAT6Kp6c9hRy/6Jp9bpNnEt
         rOUW2r7OH6ZNYJ1ug49Uf0x9s4kBLjIEXPiR6PHwCnMp+rh45aIN5gmwW8fgzhSPe9kb
         lQenjr+fNBgLNNicEkdvJhQ8QvxCbNZxDsalD6LgqFlKshwBu22NoEMR2gkHiUlFqAQN
         63sA==
X-Forwarded-Encrypted: i=1; AKwUvBwrIZfpl8r92K9B09aw53KYr9Ad4Smq/zMMVy+mcnLZXzYtvsTaxYJvSGOU98sZkq3ELK/iMuvwNdT9vzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs8xAoISOf6BEjgpDSiXX/fBc50ThZV+/WJBEMohLwdpp2JEl4
	4/33DKaTNkUNTA8osnrp3Iy71xYWZBQyuhJ2ZbI8tXgFI/pbqocGkQft6YJzJcIKbnD25HiXn38
	l+PscbfsMJ9loWvUfKnzx+T9E3gixoqtKSV9njY0L
X-Gm-Gg: AYBFou2KRw+HAyCVU0kmVKZOkhQgS40x7k5TsWxpZ8mLtMwSAZwNhOzW9mO2OFRHqUK
	Kob8lRjRtg5tEetc0DVJ0N3ipT47Oa3qlXkFpi9IjQC8UR3gRJ/lAADzxNvRO24RyqizLMHSEfs
	thjS7RLdqKOuvGoZrR9DU4oc2nlQ2T86fqngpJ0hrlKz3U6r9spKXwTbmwFU6HBZq30M2mDGpZw
	fjgKRE6Q4QFct5OfOzDUfbJzsyDf3V/Qvrp2/n7Hctp+duwQvwPJqxNzAhLUqJs0FhRyCdBSN5R
	99iWSNEb/LF1Yq4ZqEg3g8QAav8hOD7qNgOIUUiilEEiqcdp8JmQfrK/NF13YZvWLJmXywdGPEW
	qoX1Vnu8aC29TL72dLANAXD+wPdZqCvSWseTK45YX3RntTxL9Ju7n5P/S45gzCCszGQ==
X-Received: by 2002:a05:690c:6113:b0:8b0:9e11:b636 with SMTP id
 00721157ae682-8b166c28a62mr2850907b3.62.1792790982824; Fri, 23 Oct 2026
 14:29:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
 <20261019-send-upstream-v6-8-cb9ba4b3d6fa@chromium.org> <20261020-breach-aim-4a497c0089e6@spud>
In-Reply-To: <20261020-breach-aim-4a497c0089e6@spud>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 23 Oct 2026 14:29:31 -0700
X-Gm-Features: AclHuK_rDtmewSuhFWuooVP3bMSAuGCimyDmFSMqJ4WysgkfaBZ_lCNbaUs0JsA
Message-ID: <CAEe3GZHKKXTMGKTNKK2VxWJucCdTM1cTEQ1MWeN+CYzdkYb8xA@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] dt-bindings: input: Document hid-over-spi DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:57=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Oct 19, 2026 at 07:01:20PM +0000, Jingyuan Liang wrote:
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > The properties are common to HID over SPI.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
>
> Signoff chain is not right, since the nominal patch author is the last
> signoff.

Thanks! Will fix this in v7.

>
> > ---
> >  .../devicetree/bindings/input/hid-over-spi.yaml    | 130 +++++++++++++=
++++++++
> >  1 file changed, 130 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml =
b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > new file mode 100644
> > index 000000000000..2a5fa0868a09
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > @@ -0,0 +1,130 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HID over SPI Devices
> > +
> > +maintainers:
> > +  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > +  - Jiri Kosina <jkosina@suse.cz>
> > +  - Jingyuan Liang <jingyliang@chromium.org>
> > +
> > +description: |+
> > +  HID over SPI provides support for various Human Interface Devices ov=
er the
> > +  SPI bus. These devices can be for example touchpads, keyboards, touc=
h screens
> > +  or sensors.
> > +
> > +  The specification has been written by Microsoft and is currently ava=
ilable
> > +  here: https://www.microsoft.com/en-us/download/details.aspx?id=3D103=
325
> > +
> > +  The HID over SPI specification does not define fixed values for the
> > +  read/write opcodes and the input/output report addresses. The host
> > +  retrieves them from platform firmware (ACPI _DSM), and they differ
> > +  between devices. These properties provide the same values on Device
> > +  Tree systems, so devices that fully comply with the specification wo=
rk
> > +  with the "hid-over-spi" fallback compatible.
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - microsoft,g6-touch-digitizer
> > +      - const: hid-over-spi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier for the device's reset line. The HID over SPI
> > +      specification requires a dedicated, host-driven, active-low rese=
t
> > +      line. The line must be flagged with GPIO_ACTIVE_LOW.
> > +
> > +  vdd-supply:
> > +    description:
> > +      Regulator for the VDD supply voltage.
> > +
> > +  input-report-header-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Read Approval packet, listing an a=
ddress of
> > +      the input report header to be put on the SPI bus. This address h=
as 24
> > +      bits.
> > +
> > +  input-report-body-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Read Approval packet, listing an a=
ddress of
> > +      the input report body to be put on the SPI bus. This address has=
 24 bits.
> > +
> > +  output-report-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Output Report sent by the host, li=
sting an
> > +      address where the output report on the SPI bus is to be written =
to. This
> > +      address has 24 bits.
> > +
> > +  read-opcode:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Read Approval packets. 1 byte.
> > +
> > +  write-opcode:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Output Report packets. 1 byte.
>
> I still dunno why any of these properties exist, especially when there's
> a patch in my queue for another microsoft touch device on top of
> this series that does not use any of them.
>
> The commit message really needs to explain why these exist and why
> compatibles cannot be used to determine these things - as is done for
> the microsoft,romulus13-touchpad. If the very next device that appears
> seems to require a specific compatible and cannot use these properties
> to get across what's needed to the kernel it calls into question why
> the binding is designed like this.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.

Will drop these properties in v7.

Rob, since the binding changes, I'll drop your Reviewed-by from v7.

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reset-gpios
> > +  - vdd-supply
> > +  - input-report-header-address
> > +  - input-report-body-address
> > +  - output-report-address
> > +  - read-opcode
> > +  - write-opcode
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      hid@0 {
> > +        compatible =3D "microsoft,g6-touch-digitizer", "hid-over-spi";
> > +        reg =3D <0x0>;
> > +        interrupts-extended =3D <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios =3D <&gpio 27 GPIO_ACTIVE_LOW>;
> > +        vdd-supply =3D <&pm8350c_l3>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&ts_d6_int_bias>;
> > +        input-report-header-address =3D <0x1000>;
> > +        input-report-body-address =3D <0x1004>;
> > +        output-report-address =3D <0x2000>;
> > +        read-opcode =3D /bits/ 8 <0x0b>;
> > +        write-opcode =3D /bits/ 8 <0x02>;
> > +      };
> > +    };
> >
> > --
> > 2.56.0.212.g129ede20d9-goog
> >
