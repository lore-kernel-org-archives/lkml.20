Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C743785D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197818; cv=none; b=es2ZtXPkWvKdU9F6Zq8m8opLa+HiCLi/io6FDFb7FJJGA6nXqmdRXOlfPYa+qfsQBt3EtatmWnP6NB7S+ZtzJqNkXJ5amwOTbp50LP2wPv9l4QZz8g0WeeBnJ1CxfhCswHmhPLE4fRKIgoKzFH8wwvOzCW8VA4X7KWvK52BVMTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197818; c=relaxed/simple;
	bh=/wO7E5QKaC15lAhQpA1j94hiJjjlZvvf10RtNmDaFJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONwONFX3pX9Q1N3xXwcI40CcqlGQX10odOC9XbjtYsraqCCHXj56agjccA2YZQKgt5miSU4W4+CeZpignQyag/rPcxYFT5pSbXoog3VZsuaan0KfAbQlzB0eSq2Y284vBhQ2gGCbpapxp0zk1u041WjiGxlGsdjJjCip6GgPeNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bai50qPi; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bai50qPi"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso411478a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197815; x=1788802615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+OTxlGaSoeTcGnz71CmZviuhIa8naVJEy7RHcu28UE=;
        b=bai50qPi4jTkYF9ttGPHkK6TrqiTkn6sJDFGf3AdGJ/ELU7bOG+eoJBYbFh2pvr935
         jGL6XZx9P4RvPLNVu1pC9S0X36IM2nTTFBgE8ctzjKX/HBvPcu3reeAyQ703FKFxYQ+g
         Bz7D5US8BAVQwKZQ61zkViyHazQ8ArFoaSBytezckS0rOCIWD1wFr4MnGokaqWDOzsxQ
         tYzZAM/y1Of+FrCZJmP0IFByyL1tyyhp4pCptL+HKgVI8ULWld1z8gKUGzfPBlwgH9Di
         7HYQb4+kLryvWrusZMD9ypZfmTScHFim/ZF7SSauRalBhwItMU+85AWGdxhXUonBHcO/
         WqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197815; x=1788802615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+OTxlGaSoeTcGnz71CmZviuhIa8naVJEy7RHcu28UE=;
        b=pXVRxG7bzu24pgawwPhxHhRXOW6tInbtzpHGjxD3YoR2SaJmArC8klc7i4XQhDKI79
         HADqTujRst9NyL2ZcFWT6m93WlEwyyFM7IsQsiyqZceor6pJ8nmEIiOYOa0pLRaTDeDn
         tFP/dbif2QsCzAHXuB8GFNWiovFAG8jpjKj7v3wTA37ZMDz89j+wilqiTGy0aW14IAAx
         F+w5axth0TDDGauK53IT/2FfGXW82X2en9zv2Fc5XFVGvQlDp5erfATqLZiRDvL3eIYA
         voQ2Kp42Uw7gE3HQOMiwJv54qLYAcvP/gNuO/ROExVCcbvoV0mwNuvYWuMPzPvl6Ej2G
         pbdw==
X-Forwarded-Encrypted: i=1; AKwUvBzhA7L0EQwKI0WTL6i56BDKe8NoUwWV/+Fu+AhOYns8Iqe5omD5kHzVIsKaWVQsXrzLNB8pocZs5L4gwrE=@vger.kernel.org
X-Gm-Message-State: AFuF++ljgVd2iqCd0TIzLo3wwigglyyVCgRi+AfsqXq8EX8zOgxkRWV+
	BEoJhz/IQUZVXGTxxQympN1VkM4If5IZsS6L9OwC7A2nM4b37uLlYzPO
X-Gm-Gg: AYBFou3f7pf0WktYwQsILM+tGiBCa7ecL/PN0LNnoPdUjbzPPR6TGn9jU4YGMQgEuDo
	F8B389qZB0hPvocPAHgJ4NcthQ9EG9Mc/7NLP+rW2NlJXaSl3B0XRU3tR0N2c+yNIi20OzwGRLc
	9eFLVUFanUbwfQKrtsEXik66C4gG0LYctrSSUqJgJ8WKMhfGUouQG+AOybgfPNFC6pUsGveQJQD
	OTkLe42rxs2pIBFDtnTHBgGIcIozF+t49P95Rgbi5GSQjzcgyyuj9ovbYGyBvWoR/2hUwf/l9u4
	DA7yL+6zmEzhp0+iMhq9L3Ee3U/1XM+xz3hpnQDsh01Dcs8fW0K9j1AhEMgaV01bjv0QidPPRGt
	6rK0vvA0wLfzl7hfCmupAIXq680OK3iQcOldpxO74InzJ9oUxU1f036wOM03/FQPj24RT5oCMRB
	70n7OF91o/Jx7iqkkzsLJF01CPjnvKInO00QwhP3XCnlKOhOCVeWZP2AmcPGDumVhugW7c8drIy
	wKKEQ==
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr3439777a91.6.1788197814521;
        Mon, 31 Aug 2026 10:36:54 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.196.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a661a0ddsm4840917a91.3.2026.08.31.10.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:36:54 -0700 (PDT)
Date: Mon, 31 Aug 2026 21:36:47 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <apW7r6IdVx9Cmk4G@DESKTOP-TIT0J8O.localdomain>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
 <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
 <20260831-sibling-isolation-3849a5e4845f@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-sibling-isolation-3849a5e4845f@spud>

On Mon, Aug 31, 2026 at 05:57:59PM +0100, Conor Dooley wrote:
> On Sat, Aug 29, 2026 at 03:47:00PM +0400, Ahmed Naseef wrote:
> > On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
> > > On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> > > > Add the binding for the pin controller found on the EcoNet EN7528 MIPS
> > > > SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
> > > > pin configuration registers have a different layout, so it gets its own
> > > > compatible.
> > > > 
> > > > The CHIP SCU holding those registers is referenced by the airoha,chip-scu
> > > > phandle.
> > > > 
> > > > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > > > ---
> > > >  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
> > > >  1 file changed, 190 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..3ce1a5309d09
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > @@ -0,0 +1,190 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: EcoNet EN7528 Pin Controller
> > > > +
> > > > +maintainers:
> > > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > > +
> > > > +description:
> > > > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > > > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > > > +  registers have a different layout.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: econet,en7528-pinctrl
> > > > +
> > > > +  airoha,chip-scu:
> > > > +    description: phandle to the chip SCU syscon
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +  '#gpio-cells':
> > > > +    const: 2
> > > > +
> > > > +  gpio-ranges:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  '#interrupt-cells':
> > > > +    const: 2
> > > > +
> > > > +patternProperties:
> > > > +  '-pins$':
> > > > +    type: object
> > > > +
> > > > +    patternProperties:
> > > > +      '^mux(-|$)':
> > > > +        type: object
> > > > +
> > > > +        description:
> > > > +          pinmux configuration nodes.
> > > > +
> > > > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > > > +
> > > > +        properties:
> > > > +          function:
> > > > +            description:
> > > > +              A string containing the name of the function to mux to the group.
> > > > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > > > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > > > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> > > > +
> > > > +          groups:
> > > > +            description:
> > > > +              An array of strings. Each string contains the name of a group.
> > > > +            items:
> > > > +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
> > > > +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
> > > > +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
> > > > +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
> > > > +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
> > > > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
> > > > +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
> > > > +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> > > > +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
> > > > +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> > > > +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> > > > +                     pcie_reset0, pcie_reset1]
> > > > +
> > > > +        required:
> > > > +          - function
> > > > +          - groups
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +      '^conf(-|$)':
> > > 
> > > Why is this needed? Why can you not tell from the group which pins the
> > > config applies to?
> > 
> > Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
> > group at all.
> 
> Why's that? Are they just fixed output pins?

Fixed-function :  the dedicated I2C and UART pads. The only registers
they have are bias and drive strength, there is no mux and no GPIO
mode.

> 
> > The spi_cs0/clk/mosi/miso pads are only in pnand, which is
> > 17 pins wide, so no group names them individually either.
> 
> That's easily resolved by breaking up pnand though.
> 

Not as mux groups: pnand is a single register bit, so muxing a
sub-group would still switch all 17 pads while pinctrl only claims the
subset. As config aliases they would add nothing over pins.

> Devils advocate thing here might be to say that the dedicated
> configuration node should only be for the things that are fixed outputs,
> and the muxable ones should get their config from a combined
> pinmux/pincfg node. Personally I think that presents a nicer interface,
> where someone doesn't have to go figure out what pins are in the group
> they just assigned a function to to also set the config properties for
> it.

The driver would take that as-is (it uses the generic dt_node_to_map,
which accepts config properties next to function/groups). I kept the
split mux/conf shape to match the other four Airoha bindings on this
driver. If you prefer the combined form I would rather do it for the
whole family as a follow-up than have en7528 be the odd one out - but
can switch this one now if you want.

Ahmed

> 
> Cheers,
> Conor.
> 
> > > > +        type: object
> > > > +
> > > > +        description:
> > > > +          pinconf configuration nodes.
> > > > +
> > > > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +
> > > > +        properties:
> > > > +          pins:
> > > > +            description:
> > > > +              An array of strings. Each string contains the name of a pin.
> > > > +            items:
> > > > +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> > > > +                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> > > > +                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > > > +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> > > > +                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> > > > +                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> > > > +                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
> > > > +                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
> > > > +                     spi_mosi, spi_miso]
> > > > +            minItems: 1
> > > > +            maxItems: 50
> > > > +
> > > > +          bias-disable: true
> > > > +
> > > > +          bias-pull-up: true
> > > > +
> > > > +          bias-pull-down: true
> > > > +
> > > > +          input-enable: true
> > > > +
> > > > +          output-enable: true
> > > > +
> > > > +          output-low: true
> > > > +
> > > > +          output-high: true
> > > > +
> > > > +          drive-strength:
> > > > +            description:
> > > > +              Selects the drive strength for the pin, in mA.
> > > > +            enum: [2, 4]
> > > > +
> > > > +        required:
> > > > +          - pins
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - airoha,chip-scu
> > > > +  - interrupts
> > > > +  - gpio-controller
> > > > +  - gpio-ranges
> > > > +  - "#gpio-cells"
> > > > +  - interrupt-controller
> > > > +  - "#interrupt-cells"
> > > > +
> > > > +allOf:
> > > > +  - $ref: pinctrl.yaml#
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +    pinctrl {
> > > > +      compatible = "econet,en7528-pinctrl";
> > > > +
> > > > +      airoha,chip-scu = <&chip_scu>;
> > > > +
> > > > +      interrupt-parent = <&gic>;
> > > > +      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> > > > +
> > > > +      gpio-controller;
> > > > +      #gpio-cells = <2>;
> > > > +
> > > > +      interrupt-controller;
> > > > +      #interrupt-cells = <2>;
> > > > +
> > > > +      gpio-ranges = <&pinctrl 0 0 42>;
> > > > +
> > > > +      uart2-pins {
> > > > +        mux {
> > > > +          function = "uart";
> > > > +          groups = "uart2";
> > > > +        };
> > > > +
> > > > +        conf {
> > > > +          pins = "gpio28", "gpio29";
> > > > +          bias-pull-up;
> > > > +        };
> > > > +      };
> > > > +
> > > > +      pwm-pins {
> > > > +        mux {
> > > > +          function = "pwm";
> > > > +          groups = "gpio30";
> > > > +        };
> > > > +      };
> > > > +    };
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> > 


