Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857047;
	b=1wEG/Azd+OubK9QjBmCEEtYXBVOqBBHs5VMrYaVp5Yhr6+MRDgbXoB8wzc4N1b+2NAFL
	 3OV4Iy/llX/GQHUiuqPr9St767b+BvY4XFPMyCAhOtd3UyD9TkLM6I/EjCIsvOEBUf6tq
	 5LszBJVzVWCXgbv+A/v1c5lbCXjvoVxd7xR+P/3WqU5nQDi6IKhPcVpgh1XwtVzNQjbzv
	 aDvqn1Ao6sVg3z9EOfyMcmK3yt6VXjUqDb0MEh1aiNDo8cqtkEfTx28fAgM+wutz5VJLy
	 cSYVqNI/Oo0GcPSs3ir8fegE0JOaeVInT6jBVRFVtesg1c3pBRWubDPlcv6cxOdbhYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857047;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=B/UNoClSHX853aynsyAH0lzmqdVObyKe2mic7O4QnJA=;
	b=X4NpeBDgWJsb47Gw/PbBtRKvZZm3FbGK6umxCJVFawShzAj3WMlxcNVcLv020LU8kQCL
	 9Y8c9vEseLLEA38DXCCkH1/PNjcCOSJx4D9rkFraSHW4DiVTXqTAVN799DOlK6FzRMG+t
	 Pfzs9Xb9BU0ExOVntWyfD5S66iRgP3DuQXD5vxb+QWc9epCryEtPO8RTN6U3SNBDNoW9O
	 zpJae+TC0AWsUK1HP+TJnR/1gDU38GJkrmFOmJqUFqgvc2eCNLUReBG9qWHaX5UCc4sUG
	 Iz6uY9V8w2HhwLvbOCcwxIsYDI2DlPOYVcPglNK9jqC6gWa7KoDO3SV64BmXepuHm9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0HnLTg4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90081606A31C;
	Mon, 16 Nov 2026 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0HnLTg4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2581F000C4;
	Mon, 16 Nov 2026 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857047;
	bh=B/UNoClSHX853aynsyAH0lzmqdVObyKe2mic7O4QnJA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d0HnLTg4UYS+02ZceRAq1SAzNv9teK0zSpw1hF4LeP1EhlGqen++8v6PBXbecHSFw
	 3tfT/JdKK2HfqN943WW7ERohLvHPz2k35pwbnEyR6oJa0XdSaa4A95ob9ukCjNnEIJ
	 x1F1WPV4mN91DUB0iw+d5HLKxZZCkOPCvfayhB96LAPrDkFrgZLplx8yVsmU1UuDSx
	 SBWZVN0zkFHNKTLqn89qNTrKHtsdj6TXWpaw8p867+kv6M3VwJ3bPv27WPjGtmLK7O
	 OaZVOSiP2QLdEg8SgaSladmfoIDBPbfWP7FLasxyAJ884pZBY+4x7u/NXBbere48+K
	 gBOugeETJ/5QQ==
Subject: Re: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 19:24:05 +0000
Message-ID: <179485704584.3136.17355463997361048256@kernel.org>
In-Reply-To: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
References: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch only sets the internal-PHY data-path bits when it
  finds the internal PHY through the MAC's "phy-handle" property.

--

net: mdio: mux-meson-g12a: keep the MAC data path when switching MDIO

With this change, switching to the internal MDIO bus no longer sets
USE_INTERNAL and RX_CLK_EPHY in ETH_PHY_CNTL2 unconditionally. Those two
bits route the MAC data path and RX clock to the internal PHY. They are
now set only when the MAC's phy-handle points at a PHY on the internal
mux bus. The aim is to stop external-PHY boards from losing RX after
suspend/resume, when phylib touches the unattached internal PHY.

> diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
> index 71c44385489d4..ed688d48eaf08 100644
> --- a/drivers/net/mdio/mdio-mux-meson-g12a.c
> +++ b/drivers/net/mdio/mdio-mux-meson-g12a.c

[ ... ]

> @@ -169,10 +171,11 @@ static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
>  		PHY_CNTL1_CLK_EN |
>  		PHY_CNTL1_CLKFREQ;
>  	writel(value, priv->regs + ETH_PHY_CNTL1);
> -	writel(PHY_CNTL2_USE_INTERNAL |
> -	       PHY_CNTL2_SMI_SRC_MAC |
> -	       PHY_CNTL2_RX_CLK_EPHY,
> -	       priv->regs + ETH_PHY_CNTL2);
> +
> +	cntl2 = PHY_CNTL2_SMI_SRC_MAC;
> +	if (priv->mac_uses_internal_phy)
> +		cntl2 |= PHY_CNTL2_USE_INTERNAL | PHY_CNTL2_RX_CLK_EPHY;
> +	writel(cntl2, priv->regs + ETH_PHY_CNTL2);

[ ... ]

> @@ -301,6 +304,41 @@ static int g12a_ephy_glue_clk_register(struct device *dev)
>  	return 0;
>  }
>  
> +/* Like dwmac-rk: the PHY named by the MAC's phy-handle decides the data path */
> +static bool g12a_mac_uses_internal_phy(struct device_node *mux_np)
> +{
> +	struct device_node *parent_bus, *mac, *phy, *phy_bus, *mux;
> +	bool internal = false;
> +	u32 reg;
> +
> +	parent_bus = of_parse_phandle(mux_np, "mdio-parent-bus", 0);
> +	if (!parent_bus)
> +		return false;
> +
> +	mac = of_get_parent(parent_bus);
> +	of_node_put(parent_bus);
> +	if (!mac)
> +		return false;
> +
> +	phy = of_parse_phandle(mac, "phy-handle", 0);

[Severity: Medium]
Can this check pick a different PHY from the one stmmac actually
attaches?

Only "phy-handle" is read here. stmmac_init_phy() and
phylink_fwnode_phy_connect() find the PHY through fwnode_get_phy_node().
On DT, that function also falls back to the legacy "phy" and
"phy-device" properties:

drivers/net/phy/phy_device.c:fwnode_get_phy_node() {
	...
	phy_node = fwnode_find_reference(fwnode, "phy-handle", 0);
	if (!IS_ERR(phy_node) || is_acpi_node(fwnode))
		return phy_node;
	phy_node = fwnode_find_reference(fwnode, "phy", 0);
	if (!IS_ERR(phy_node))
		return phy_node;
	return fwnode_find_reference(fwnode, "phy-device", 0);
}

ethernet-controller.yaml still lists both names as deprecated aliases of
phy-handle.

Take a DT such as:

  &ethmac { phy = <&internal_ephy>; phy-mode = "rmii"; };

Before this patch, stmmac attached internal_ephy, and every switch to the
internal bus wrote USE_INTERNAL | SMI_SRC_MAC | RX_CLK_EPHY.

After this patch, g12a_mdio_mux_probe() sets mac_uses_internal_phy to
false. stmmac still attaches the EPHY over MDIO, but
g12a_enable_internal_mdio() writes only SMI_SRC_MAC. The MAC data path
and RX clock then stay on the external pins. Would RX on such a board
stop working, even though the link can come up?

Every in-tree internal-PHY DT (sei510, u200, fbx8am, sei610,
sm1-a95xf3-air, sm1-x96-air, s4-aq222, s4-vim1s, c3 boards) appears to
use phy-handle. So this would only hit out-of-tree or
bootloader-supplied DTs that use the deprecated names.

The comment refers to dwmac-rk. dwmac-rk has read only phy-handle from
the start, though, so it never broke a working setup. Here a setup that
used to work would break.

Would fwnode_get_phy_node(of_fwnode_handle(mac)), or the same
three-property fallback, keep the mux in step with the PHY stmmac
attaches?

> +	of_node_put(mac);
> +	if (!phy)
> +		return false;

[ ... ]

> @@ -313,6 +351,7 @@ static int g12a_mdio_mux_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	platform_set_drvdata(pdev, priv);
> +	priv->mac_uses_internal_phy = g12a_mac_uses_internal_phy(dev->of_node);
>  
>  	priv->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->regs))

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-g12a-mux-data-path-v1-1-011dad738698%40iav.lv
