Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667932;
	b=dSzrCSYpBa0LHJzC8+CAKhcJ/Xk2PTZ3YpPu6OfOB/11LxiHbEsjankT9ydYnp9sVjEg
	 dRJYbXCUzdw5iJvvofZr++LtwxLJ9AlPc4D9dCR8Wk6GeenyYQDY1C7dT+KAhYiN7yXD8
	 obvjjphM5doaD4PEaQ+BEL6Yb/6bqi8wVGE+eeOyJVTqDIf+xFPgAB5zIFAJrJ4MN2na1
	 eRoXDIrFwy5WqniBisiHqQziMS+99V+QvWI02g6vvoxyDnNoJ00UpzwFM5uPggDJsGq9y
	 CM/bhQZ+lfW2lPg5aaYRIbdxLAXoJjkVXRfQw0QOSL1ZP6xpgDel1s4JpHt59Lba7OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667932;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=W3xEgi7pAw7VSug/3hk2ygDQeJ/sXVksVW02IlMeiao=;
	b=a87ViB4ATZP3YP6gO2x3A6ZL7Row7DBzrZ3KPNOb/JpXLcDxk6Mxn7nfjHynQgnDUeWJ
	 T25r4bm2DWzgtQR9yPxGK+yfBpjTlIFJO+5H8+uLmQV9ilVpB0nHOdUE87Ln7UvGqkxM6
	 IKiJ8U16Nscm3loRwTB85DmVAaOjCFh//B8kAWKo6V6QbZwIC0AtMmj1hVUh4zQ5QDqWW
	 WUrP15+bbQYOtEnTdEpbNd9VVKJxkdinQNVqjjx/AP7QwzhjJYpCo/giwlPsi4F2GbusJ
	 9+sQwrEAYLXyvjbysMWxyz6bxx15WD2ChfWdHHfGO9sJC2nMsPrZH8AJJey78qPvfvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHPz73Gl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA1606A329;
	Sat, 14 Nov 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHPz73Gl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02C71F000C4;
	Sat, 14 Nov 2026 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667931;
	bh=W3xEgi7pAw7VSug/3hk2ygDQeJ/sXVksVW02IlMeiao=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EHPz73GlxNbxMz9o783niMGZ3LrsdcOuBVVDlg3NwdetRdjYD15P7wUarr1oKaLnC
	 4EaCqgleA7Q/TzLEJNH8xCPSfViZlzfCyNtJ5FHyAg0bKnY6exH4WczOOSVI2fQj48
	 p6ulAjEqTLA6OFsuksr4DXnuqtoF/7cCS9LvuQrWvK6KMb8n1fufve7OlfpcIU9UEZ
	 IcFXDhMu/AeKq4rX2LN4AqiHCjq4jr4+m29HsA/ZDh7v1h0b8/q1RP8ftM40+H5F34
	 odTJFvB0B90aieXkldgV+HZVbCkZCV3wQiC02NnXlcCNSErvaUEuF5Voz+gX13prop
	 NaNyFuaWL470Q==
Subject: Re: [PATCH net-next v5 02/10] dt-bindings: net: mediatek-dwmac:
 deprecate rx/tx delay vendor properties
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
Date: Sat, 14 Nov 2026 14:52:10 +0000
Message-ID: <179466793025.2199510.11414301976434592965@kernel.org>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-2-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-2-7d99d6292962@collabora.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In Documentation/devicetree/bindings/net/mediatek-dwmac.yaml,
  'deprecated: true' is set on both mediatek,tx-delay-ps (line 83) and…
- [Low] Several leftovers in the migration this patch starts.

--

dt-bindings: net: mediatek-dwmac: deprecate rx/tx delay vendor properties

This commit marks mediatek,rx-delay-ps and mediatek,tx-delay-ps as
deprecated in the MediaTek dwmac binding. It also adds description text
pointing users to the standard rx-internal-delay-ps and
tx-internal-delay-ps properties.

> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 14f9683f20fea..9562406166387 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -80,6 +80,7 @@ properties:
>        interface and timing delay.
>  
>    mediatek,tx-delay-ps:
> +    deprecated: true

[Severity: Medium]
This deprecated: true applies to every phy-mode, and the same is true for
mediatek,rx-delay-ps below. The standard replacement only exists for
RGMII, though.

In ethernet-controller.yaml, rx-internal-delay-ps and tx-internal-delay-ps
are only defined inside an if/then that matches the rgmii* modes:

  - if:
      properties:
        phy-mode:
          contains:
            enum:
              - rgmii
              - rgmii-rxid
              - rgmii-txid
              - rgmii-id
    then:
      properties:
        rx-internal-delay-ps:
        ...

This binding sets unevaluatedProperties: false. So a node with
phy-mode = "rmii" or "mii" that uses tx-internal-delay-ps or
rx-internal-delay-ps would fail schema validation.

The descriptions here still document the MII/RMII ranges (MT2712 in
steps of 550, MT8188/MT8195 in steps of 290). At the end of the series,
get_delay_stage() in dwmac-mediatek.c still takes the MII/RMII delay
only from the vendor values:

	} else {
		/* MII/RMII case */
		delay_stage_div = plat->variant->mii_delay_stage_div;
		rx_delay_conf_val = mac_delay->rx_delay;
		tx_delay_conf_val = mac_delay->tx_delay;

The later commit "net: stmmac: mediatek: use standard internal delay
properties" in this series also says "There is no equivalent standard
properties for RMII and MII case at the moment."

Doesn't this leave MII/RMII boards that need a MAC delay with only a
deprecated property and no compliant alternative?

The new description text limits the deprecation to RGMII ("for RGMII TX
internal delays"), but the unconditional deprecated: true says
otherwise. Could the deprecation be limited to the rgmii* phy-modes with
an if/then, or the MII/RMII use be kept non-deprecated?

The commit message also says the vendor properties "duplicate standard
properties from generic Ethernet controller bindings". That doesn't seem
to be true for MII/RMII.

>      description:
>        The internal TX clock delay (provided by this driver) in picoseconds.
>        For MT2712 RGMII interface, Allowed value need to be a multiple of 170,

[ ... ]

>        For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
>        or will round down. Range 0~31*290.
> +      Deprecated, this property should not used anymore for RGMII TX internal delays,
> +      the standard tx-internal-delay-ps property should be used instead.

[Severity: Low]
This isn't a bug, but "should not used anymore" is missing "be". The
same typo is in the new mediatek,rx-delay-ps text.

The example at the end of this binding still uses the deprecated
property, in exactly the RGMII case this text says to avoid:

        phy-mode = "rgmii-rxid";
        ...
        mediatek,tx-delay-ps = <1530>;

Should the example be converted too? It isn't updated later in the
series either.

Four in-tree DTS files also still use the deprecated property:

  arch/arm64/boot/dts/mediatek/mt2712-evb.dts (1530)
  arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi (30)
  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi (2030)
  arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts (2030)

Two of these use 2030 ps as the full RGMII TX delay. However,
ethernet-controller.yaml describes the MAC-node internal delay
properties as fine tuning:

  # Sometimes there is a need to fine tune the delays. Often the MAC or
  # PHY can perform this fine tuning. In the MAC node, the Device Tree
  # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
  # be used to indicate fine tuning performed by the MAC. The values
  # expected here are small.

Given that, are the vendor properties really plain duplicates of the
standard ones, as the commit message says? Converting the mt8395 boards
looks like it would also mean revisiting phy-mode, not just renaming the
property.

>  
>    mediatek,rx-delay-ps:
> +    deprecated: true
>      description:
>        The internal RX clock delay (provided by this driver) in picoseconds.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962%40collabora.com
