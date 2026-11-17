Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881889;
	b=ZV3kDlzzEwSo6b6fh4a8iQy77nh/0PkqysFMtR9N2eb/hc1s+uypuG6cMJ9K+f8rIDWR
	 r2t20NLpuaOm3zsWLfFbUJ+WMQSU4xAXvIwSHYezC6GdJcw/6Zn72GNaRfU42NSN3ufMX
	 mN6S8RV3k4WOVxOMpV1ykbnHMzrsC/tevIzLWDs6Mxhe27P3ORfxLCc6Z4msn7n+Pc6dH
	 nQ5Ka/MQlY3u4FRPmUCf04B6MRrWhkFbgSUvzQuriJcG6OvD1f5GtxmNY50rJUdaKWWsO
	 bTOkMD0lhO1yH5OCXtY0SY4TqGuAM+uYbKpQKjmx1ySvvEhtRrXPlS/A6ykzRMM4V4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881889;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mppN7GntlOCaFRrXViro60hi5hqTY4zzMWa9bIunJD8=;
	b=2DDvY4jz9lekHE8E6uXnMxVPBhyvDKhfp79ooljHXfOKB7WOGvvp/QbIWC7zjaico4Kk
	 4sUsL7Fs5UF+SnD6xiVX8aF5nP+K/nqq8uYY1wNhtx3Gngl9LFOZvdjW+8XmjODuQYM89
	 JYFLJS2xtXCnWxhUfh87dAvQoOJM4wb6avhN/n5WwjkFKMSS7hn2EDx5zYkJFa+WjShUZ
	 a7pWgJJBXiiqk5jXRO6YFvehARq93vSbCKCv3N4p61tSUlgNOgT46+AED3ATT3HB+W/Hq
	 l6ZkOwu6LT6h+85oOBbQVzZvNRGdzj0xq3w608BE243YDSVj/tTLU+AD2Gio+hgdowg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbORpJKA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC94606A323;
	Tue, 17 Nov 2026 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbORpJKA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2F81F000C4;
	Tue, 17 Nov 2026 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881888;
	bh=mppN7GntlOCaFRrXViro60hi5hqTY4zzMWa9bIunJD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XbORpJKAPQt4CDN9QrCWjYpRfqRD8LErIUSZKaEI58Zb4TdDPTRFC9KYxd5QZdpSa
	 AZrbetMV3gqnmzO+Uz4YGKIlbq5Id50VvYlzgualg5RdmJebvDg/8MNlx96Y6En6XA
	 uJEf33ubcqG5S3eGteHZG9zuSXZU6Q3t7QRH+Bv3naJU4Sfi7YhoRB4WZPEez0Bgm7
	 GjouutnMhwvLysKabKJo9QMrgrPbWLn0ESTQ2cu5JMTeyzq/mZd0XV0v0tPxzFVSdI
	 dwRqWVsBmdW4ZrFUc4m+33M28m/4M3P+VC2qv/DN9M+jqtwbdr1H0e8l42IzuynpbE
	 BLOG0tgBcgOrA==
From: Jakub Kicinski <kuba@kernel.org>
To: arouhi@sitime.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	jiri@resnulli.us,
	vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	ivecera@redhat.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v15 03/13] dt-bindings: dpll: add SiTime SiT95316 clock generator
Date: Mon, 16 Nov 2026 18:18:06 -0800
Message-ID: <20261117021806.2220034-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-4-arouhi@sitime.com>
References: <20261110202607.55744-4-arouhi@sitime.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dt-bindings: dpll: add SiTime SiT95316 clock generator

This adds a YAML binding for the SiTime SiT95316/SiT95317 I2C DPLL clock
generators. It covers the XO, reset and interrupt lines, the supplies, and
the input and output pins, building on dpll-device.yaml. It also adds a
MAINTAINERS entry for the binding.

> diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml
> new file mode 100644
> index 0000000000000..5356a73a80620
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml
> @@ -0,0 +1,214 @@

[ ... ]

> +  Pin numbering.  An input pin's reg is its lane: 2k is INkP and 2k + 1
> +  is INkN, 0 to 7.  A pair the loaded configuration runs differential is
> +  one input, described at 2k.  An output pin's reg is its physical output
> +  OUTn, 0 to 11; the SiT95317 bonds out the die's outputs 0, 3, 4, 5, 7, 8,
> +  9 and 11, which its datasheet names OUT0 to OUT7 in that order.

[ ... ]

> +  input-pins:
> +    type: object
> +    patternProperties:
> +      "^pin@[0-9a-f]+$":
> +        type: object
> +        properties:
> +          reg:
> +            maximum: 7
> +
> +          supported-frequencies-hz:
> +            maxItems: 1
> +            description:
> +              The rate wired to the input, in Hz, as a single entry.  An
> +              input runs at the rate the board feeds it and has no
> +              frequency to select, so that entry is what the pin reports
> +              as its frequency.

[Severity: Low]
Does maxItems: 1 actually limit this to a single rate?

dpll-pin.yaml gives supported-frequencies-hz no explicit type, so the type
comes from the dtschema -hz unit-suffix rule. If that rule makes it a uint32
matrix, a top-level maxItems only counts bracket groups. A list written the
way microchip,zl30731.yaml writes one would then count as a single group and
pass:

    supported-frequencies-hz = <10000000 25000000>;

This depends on how dtschema types -hz properties, so it may not apply.

If it does, the driver later in the series takes freqs[0] as the input's rate.
It still advertises every listed value as a supported frequency, even though
sit9531x_dpll_input_pin_ops has no .frequency_set.

Would limiting the inner dimension (for example items: [ maxItems: 1 ]) or
giving an explicit shape guarantee a single value?

> +
> +patternProperties:
> +  "^vddo([0-9]|1[01]|0_1|10_11)-supply$":
> +    description: |
> +      Supply of an output driver, named after its VDDO pin.  The SiT95317
> +      has one per output, VDDO0 to VDDO7, numbered as that part's
> +      datasheet numbers its outputs; in the pin numbering of this binding
> +      those are outputs 0, 3, 4, 5, 7, 8, 9 and 11, in that order.  The
> +      SiT95316 has VDDO0_1, VDDO2 to VDDO9 and VDDO10_11, the two shared
> +      pins each powering the pair of outputs they are named after.

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          const: sitime,sit95317
> +    then:
> +      properties:
> +        output-pins:
> +          patternProperties:
> +            "^pin@[0-9a-f]+$":
> +              properties:
> +                reg:
> +                  enum: [0, 3, 4, 5, 7, 8, 9, 11]

[Severity: Low]
On the SiT95317, don't the two numberings in this node collide?

Output pin reg is the die output index. The vddoN-supply names follow the
SiT95317 datasheet numbering, VDDO0 to VDDO7.

So output-pins/pin@3 is datasheet OUT1. But vddo3-supply powers datasheet
OUT3, which is die output 5. The same thing happens for 4/7, 5/8 and 7/11.

One supply name also maps to different outputs on the two parts. vddo3 feeds
reg 3 on the SiT95316 but reg 5 on the SiT95317.

This enum accepts 0, 3, 4, 5 and 7, which are also valid datasheet output
numbers. A board DT that numbers SiT95317 output pins by datasheet OUTn would
pass validation for five of the eight outputs. Its label, frequency and
enable state would then describe a different physical output. Only datasheet
OUT1, OUT2 and OUT6 would be rejected.

The driver does not enable the supplies today. A later change that looks up
per-output supplies by pin reg would work on the SiT95316 but switch the wrong
output driver on the SiT95317.

Could one numbering be used for both reg and the supply names on the
SiT95317?

[ ... ]

> +            input-pins {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                /* IN0P and IN0N: pair 0 runs single-ended */
> +                pin@0 {
> +                    reg = <0>;
> +                    label = "clkin0";
> +                    connection-type = "ext";
> +                    supported-frequencies-hz = <10000000>;

[Severity: Medium]
Should the cell width of supported-frequencies-hz be fixed here before this
becomes ABI?

This example uses 32-bit cells. The only other in-tree DPLL binding that
uses the same dpll-pin.yaml property, microchip,zl30731.yaml, uses 64-bit
cells:

    supported-frequencies-hz = /bits/ 64 <10000 10000000>;

Its consumer, zl3073x_pin_props_get() in drivers/dpll/zl3073x/prop.c, reads
the property with fwnode_property_count_u64(). dpll-pin.yaml gives the
property no type, and this binding does not say which width a SiT9531x node
has to use.

The SiT9531x driver added later in this series reads it as u32:

drivers/dpll/sit9531x/prop.c:
	/* A -hz property is 32-bit; no rate of this part needs more. */
	num_freqs = fwnode_property_count_u32(props->fwnode,
					      "supported-frequencies-hz");

Suppose a SiT9531x node is written the way zl30731.yaml does it:

    supported-frequencies-hz = /bits/ 64 <10000000>;

The u32 count is then 2, and fwnode_property_read_u32_array() returns
{0, 10000000}, because the high word comes first.

With that input, curr_freq = freqs[0] is 0 and the reference frequency is
never seeded. sit9531x_dpll_input_pin_frequency_get() then reports 0 Hz, and
the pin also advertises a 0 Hz supported frequency next to the real one.

Output pins have no item limit on this property, so that encoding would pass
dt_binding_check there too.
