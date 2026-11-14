Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667933;
	b=QBCl5nuz43cst9iLdvv8RBqNQQVW8b97BNdzdoUVUoqnA3Hk8MdVyzZ9/l6oGTtRPcuw
	 SWR97ErEGilrv5X/305zIGefIuFoEjnQNq5u7vJKOgUs55EBgD2jrToMIftV7GimlhFmo
	 ahSz9wBWJul05u78SaXqrOhSdURLgPAwpQgbcH9j18rA0QBtUmTQaQ0j6+JL8cjWnuAVP
	 6cOOFhY/TZXKBfVZyHTd12Dbg5rgT92mqjzR6vPDr6xT4VuZDpr7dJO0cbqBEJ8WBVA42
	 sy3dTr6+44DRlUr5XFC4M6micwyJ6yrZ4BrUJ9FgQ+7b8bEWbsZxH3xIJokug7yxFAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667933;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xVGo4n8kANG+d9df7pyjbNiLNk7bdG6h6VAwEv6uVzM=;
	b=BIIiLNbmXFH0fU5S+qwAlvO7qaeZ/XUrWRml85AZYaHv9EL9wOWBNNBJ3NSF/hcEE92M
	 FY3Bs2YtFth66lRqlya4lEqIX+Yil+E/qTzDFafcQ/WS06dHvUWu7Izvg6p3U3lHHscAQ
	 0iw+BBmVFY3vQ3nEyk7bhF4lQy0x4VbVAD23niB6z9JhL0wHwkn2RXgVf/SsY5SBThy0r
	 rPW8eBS7blvtCeJII4C9VUHFfOx7Iig3MGcffU8oA5B/gLIgchXmYFPMkKJanw4pKYZVd
	 FxYXTeUh+1VnFFYknbxAQ+62lXYzBOki+xsPPLmEu22LXqpfv0kavcnuFSucnWEBMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpD4pmK5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DEF606A889;
	Sat, 14 Nov 2026 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpD4pmK5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A7D1F000C5;
	Sat, 14 Nov 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667933;
	bh=xVGo4n8kANG+d9df7pyjbNiLNk7bdG6h6VAwEv6uVzM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PpD4pmK57h1+iemKNBgqZYbMnTEPuJZ8EZThjqZ+TMf/YrSPbQ4d5wGd8XoZ6kGjR
	 /69pmAhVH6MfKK1f4UqHVDgy0dfGgcDTYcpQ7DvyYntWkqBvlVdR+BjOQdTXgnquz1
	 R30shb3G28o41pkxNOmU0VNZKbz0MN+vhDjghJwS/Yf0xyJ1RRowtdswLQSFpKpF9B
	 5WoovcgdmTtioxkmFauu+yY9hmJqfpLcVQawslJv5hVqbJ0WL+hbxnxkB3CNKyGKW/
	 tZmeP7MtJe0vA88WA0XYJz6o0HKeZs5j22dFwesuigwu3rntt+wNMeWBaoKkVtJr0F
	 geFBG+P6HcMVg==
Subject: Re: [PATCH net-next v5 03/10] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
From: netdev-bot+sashiko@kernel.org
To: louisalexis.eyraud@collabora.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, edumazet@kernel.org, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sat, 14 Nov 2026 14:52:12 +0000
Message-ID: <179466793200.2199510.8648958877429402751@kernel.org>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-3-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-3-7d99d6292962@collabora.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new compatible `mediatek,mt8189-gmac` is added to the
  binding, but the descriptions of `mediatek,tx-delay-ps` and…

--

dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC

This patch adds the mediatek,mt8189-gmac compatible to the MediaTek DWMAC
binding and lowers the clocks/clock-names minItems to 4. It also adds
allOf conditionals that keep 5 clocks for MT2712/MT8188/MT8195, allow at
most 4 for MT8189, and disallow mediatek,rmii-clk-from-mac on MT8189.

> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 9562406166387..0fc2eed066464 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

[ ... ]

> @@ -153,6 +152,39 @@ required:
>    - phy-mode
>    - mediatek,pericfg
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8189-gmac
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +
> +        mediatek,rmii-clk-from-mac: false

[Severity: Low]

This block only disallows mediatek,rmii-clk-from-mac for MT8189, so
mediatek,tx-delay-ps and mediatek,rx-delay-ps are still allowed there.
Should their descriptions also cover the new compatible?

At the moment they only describe MT2712 and MT8188/MT8195:

  mediatek,tx-delay-ps:
    ...
      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
      or will round down. Range 0~31*290.

The mediatek,rx-delay-ps description has the same text.

The later patch in this series, "net: stmmac: mediatek: add support for
MT8189 SoC", uses a different step size and maximum for MT8189:

  #define MT8189_MII_DLY_STAGE_DIV	180  /* 180ps per stage */
  #define MT8189_MII_DELAY_MAX		5760 /* 32 x 180ps */

For MII/RMII, these vendor properties are the only way to set the internal
delays. mediatek_dwmac_config_dt() reads the standard *-internal-delay-ps
properties only for RGMII.

Suppose a value is picked using the documented 290 ps step. The driver will
then program value / 180 stages instead of value / 290. Any value of 5760 ps
or more (for example 20 * 290 = 5800) is rejected with -EINVAL:

  of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps);
  if (tx_delay_ps >= plat->variant->mii_delay_max) {

and probe fails.

Setting mediatek,tx-delay-ps: false for MT8189 would not be the right fix,
because it would remove the only way to configure MII/RMII delays on MT8189.

Could both descriptions get an MT8189 line with the 180 ps step and the
0~31*180 range instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962%40collabora.com
