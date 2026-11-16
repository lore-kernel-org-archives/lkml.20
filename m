Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837255;
	b=Fla5NfkyGFAkSlDX03bG+cPN5+gGNDumt/cRode5mMvRwFmUOUZr28S9Y6bNDgIyTrU1
	 AiC3GbsZ2eBTPkMnAvSxGudSAAqeCJVB/C/GLuNDSNxi7Q32m7NTjywYRzLspwOGOISg0
	 mR+gN1Zh44w+qFrjOkmzsgT/IOy9yianN2qdvctZF6gJ9U7gIZNx1nXo90G1WeHy7hLVC
	 Ln4RT7jDH4CcPHW3xe3jdMDohw+od+CCgouTd/DXXt4KAonir3XjPXRnMdbv9pHsF2KbP
	 Fk+NremLzD39pDDbJlYq6skqhYSdhouHJOIKGlag7TrQE6eW6e/b4CghEhMLu0xbXvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837255;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=piDbQg70MdTVyvXIgTNooCp32jw03L/Gi/nTYGyza6Q=;
	b=FLqMvwIgYjDvrm5+gmTJKle3nRyvPVQ9Z5iHsYayr+PN/JXAQqO8V93O0IyAEwy5GISq
	 mkNaDQS8xTTgAEFEMYKf5rXWJi6BY/XLrieN96jPWkPZb36elwxoqAFBriMKV1oHhj/02
	 WcqJtRDaGcBmMtJLSLIUdgHTLbVkTPd/uT5uFDCwfuGSpyRJNrD4IahmKNyKAzkCHqsgI
	 cuPA9IE70dI80C4N6ElP+Qrr88M1XsP+6zs3Sra4dAOEoFpCErrYBXrmnct/yQvO8Mjbw
	 fcj7/F0xp7GMyuxo7pqvC4rdocCCWPUixeyajiqp95xkRDUq8eYTeuOk5mcRxhpf+bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T33TbsUL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCAC606A336;
	Mon, 16 Nov 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T33TbsUL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A081F000C5;
	Mon, 16 Nov 2026 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837255;
	bh=piDbQg70MdTVyvXIgTNooCp32jw03L/Gi/nTYGyza6Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T33TbsULrhO+vL87c9B85MQcasW0HVHsGajItirVSo5n2kM7nf3S//1ygCMjFyQuf
	 etrK6LwZokgij4hA++LTTXKW8Okch7d4A3wqSkABcraELcw2QvAsKZNAsKZlgAcAY6
	 /MwAQazYuMDPX2nQmnFHZrVBOYBHQb0EbgZzX68UQTALFGg408Tzg02BSdoENhEEFO
	 GIQVbfmQresKUpik+ZHUmJm7bMSGG3P0wPXBF1qis2cSLz2B8+/AG3FbyPEoqD/LEP
	 UwboqoGH8qCcmkjMyZbuwspvCFEESTHpr346YcsEfDknYk4FYDwnWmFWWJOBhcQGT8
	 ihiR5mJR2T83A==
Subject: Re: [PATCH net-next v6 1/7] dt-bindings: net: ftgmac100: Make Aspeed
 compatibles standalone
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 16 Nov 2026 13:54:13 +0000
Message-ID: <179483725399.3136.620008593469473601@kernel.org>
In-Reply-To: <20261112-support_ast2700-v6-1-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-1-238020bf46cf@aspeedtech.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] One of the new allOf conditionals in faraday,ftgmac100.yaml is
  vacuously true.
- [Low] The commit message justifies the change partly with a false
  claim.
- [Low] After this patch, properties/compatible is an enum of single
  strings, so a two-string compatible list is invalid.
- [Low] The patch adds `clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>;` to
  the binding example `ethernet@1e660000`, an aspeed,ast2500-mac node…
- [Low] For the plain faraday,ftgmac100 compatible, the new conditional
  (lines 118-130) sets `clocks: false` and `clock-names: false`.

--

dt-bindings: net: ftgmac100: Make Aspeed compatibles standalone

This patch turns the aspeed,ast2400-mac, aspeed,ast2500-mac and
aspeed,ast2600-mac compatibles into standalone strings, so they no longer
need the faraday,ftgmac100 fallback. It also adds per-compatible limits on
clocks and clock-names. The examples now drop the fallback and list a MAC
clock.

> The aspeed,ast2400-mac, aspeed,ast2500-mac, and aspeed,ast2600-mac
> compatibles are currently only valid when paired with the generic
> "faraday,ftgmac100" fallback: if a node ever bound through the
> generic entry alone, ftgmac100_probe() would set
> rxdes0_edorr_mask/txdes0_edotr_mask to BIT(15) instead of the Aspeed
> BIT(30), skip Aspeed clock setup, and leave the DMA mask too narrow.

[Severity: Low]
Is the "leave the DMA mask too narrow" part accurate? At this commit,
drivers/net/ethernet/faraday/ftgmac100.c does not seem to contain any
dma_set_mask*() or DMA_BIT_MASK() call. That would mean the generic and
Aspeed entries get the same DMA mask.

Later in the series, the only DMA mask code is
dma_set_mask_and_coherent(..., DMA_BIT_MASK(35)), gated by
FTGMAC100_QUIRK_DMA_35BIT. Only ftgmac100_match_data_ast2700 sets that
quirk, so it doesn't cover ast2400/2500/2600 either.

Also, ftgmac100_probe() uses of_device_get_match_data(), which picks the
best match by position in the compatible list:

    match_data = of_device_get_match_data(&pdev->dev);

So a node with "aspeed,ast2500-mac", "faraday,ftgmac100" always gets the
AST2500 match data and never the generic entry. The note below the cut
seems to say the same thing.

Could the commit message give the actual reason, that the Aspeed MACs
differ from the generic Faraday programming model (EDORR/EDOTR at BIT(30),
Aspeed clock setup), and drop the DMA mask claim?

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf6..9d352e3686aaf 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -11,14 +11,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    oneOf:
> -      - const: faraday,ftgmac100
> -      - items:
> -          - enum:
> -              - aspeed,ast2400-mac
> -              - aspeed,ast2500-mac
> -              - aspeed,ast2600-mac
> -          - const: faraday,ftgmac100
> +    enum:
> +      - faraday,ftgmac100
> +      - aspeed,ast2400-mac
> +      - aspeed,ast2500-mac
> +      - aspeed,ast2600-mac

[Severity: Low]
Now that compatible is an enum of single strings, the two-string form no
longer validates. All of the in-tree MAC nodes still use it:

arch/arm/boot/dts/aspeed/aspeed-g4.dtsi (mac0, mac1):
    compatible = "aspeed,ast2400-mac", "faraday,ftgmac100";

arch/arm/boot/dts/aspeed/aspeed-g5.dtsi (mac0, mac1):
    compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";

arch/arm/boot/dts/aspeed/aspeed-g6.dtsi (mac0..mac3):
    compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";

Won't dtbs_check warn on every Aspeed board DTS that includes these files
as soon as this lands? The note below the cut says the dtsi update will go
through a separate tree, but nothing in this series touches arch/.

Would it make sense to keep the old pairing as a deprecated oneOf
alternative, so existing DTs keep validating until the dtsi change lands?

[ ... ]

> @@ -88,22 +85,76 @@ allOf:
>      else:
>        properties:
>          resets: false

[ ... ]

> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - aspeed,ast2400-mac
> +                - aspeed,ast2500-mac
> +                - aspeed,ast2600-mac
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false

[Severity: Low]
Should the generic faraday,ftgmac100 compatible forbid clocks altogether?
Before this patch, clocks were optional for every compatible, and the
binding describes the first clock as:

  clocks:
    minItems: 1
    items:
      - description: MAC IP clock

FTGMAC100 is a licensable IP block, so a non-Aspeed integration would
still normally have a MAC/bus clock input. The driver only calls
ftgmac100_setup_clk() when priv->is_aspeed, but that doesn't mean the
hardware has no clock.

With this change, a generic-compatible node that used to validate with a
clocks property now fails. The commit message says "the plain
faraday,ftgmac100 compatible takes none", but doesn't explain why the IP
clock input is forbidden rather than left optional.

> +  - if:
> +      properties:
> +        clocks:
> +          minItems: 2
> +    then:
> +      required:
> +        - clock-names

[Severity: Medium]
Does this if also match nodes that have no clocks property at all?
properties only checks keys that are present, so a node without clocks
satisfies the if, and clock-names becomes required.

Combined with the block above, which sets clocks: false and
clock-names: false for non-Aspeed compatibles, a plain faraday,ftgmac100
node can't pass either way:

  - without clock-names: "'clock-names' is a required property"
  - with clock-names: "False schema does not allow"

The compatible is still in the top-level enum, and it is still in
ftgmac100_of_match[]:

    { .compatible = "faraday,ftgmac100",
      .data = &ftgmac100_match_data_faraday },

An Aspeed node that leaves out clocks would also get an extra clock-names
error on top of the missing-clocks error.

dt_binding_check won't catch this, because both examples are
aspeed,ast2500-mac nodes with exactly one clock.

Would putting the presence check inside the if, as in the presence-based
conditionals in Documentation/devicetree/bindings/example-schema.yaml,
match the commit message's "Require clock-names whenever two clocks are
listed"? For example:

  - if:
      properties:
        clocks:
          minItems: 2
      required:
        - clocks
    then:
      required:
        - clock-names

>  
>  unevaluatedProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +
>      ethernet@1e660000 {
> -        compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";
> +        compatible = "aspeed,ast2500-mac";
>          reg = <0x1e660000 0x180>;
>          interrupts = <2>;
> +        clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>;
>          use-ncsi;
>      };

[Severity: Low]
This example node uses use-ncsi, which runs over RMII, but it only lists
the MAC clock. Should it also list the MAC1 RCLK gate, along with
clock-names?

In ftgmac100_setup_clk(), RCLK is only enabled when the DT names it:

    /* RCLK is for RMII, typically used for NCSI. Optional because it's not
     * necessary if it's the AST2400 MAC, or the MAC is configured for
     * RGMII, or the controller is not an ASPEED-based controller.
     */
    priv->rclk = devm_clk_get_optional_enabled(priv->dev, "RCLK");

On AST2500, aspeed_clk_probe() registers mac1rclk as a plain gate:

    /* RMII1 50MHz (RCLK) output enable */
    hw = clk_hw_register_gate(dev, "mac1rclk", "mac12rclk", 0,
            scu_base + ASPEED_MAC_CLK_DLY, 29, 0,

If nothing claims that gate, can clk_disable_unused() turn off the RMII
reference clock? On a board whose DT was copied from this example, that
would take the NC-SI link down.

The new ast2500/ast2600 rule only asks for minItems: 1, so such a DT would
pass dtbs_check. The in-tree AST2500/AST2600 NC-SI boards (romulus,
witherspoon, tacoma, mtjade, ethanolx, ...) all list both MACCLK and RCLK
with clock-names.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-support_ast2700-v6-0-238020bf46cf%40aspeedtech.com
