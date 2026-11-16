Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837260;
	b=0/RaHjrZEiV59nUoMKrq6LAEd2HA3oraO0sW5Cw5bWZhpsim6ma/3DHbMDLp5RcLOVfa
	 Y6ZSAKaioo2cD6H+MnAPYODZkDFoL2RZdH0YAGgyTVxYAcp7KIHG/h9s36qxyyn7fBQDl
	 JE/QN3wXvYTTAd4j2Mmm31dwL9qPt0GnQ96jrF5q2b73SKSHRiVtATLjBuCXcasbbGw77
	 Z/LGzv7/KhO2mRVXlHBpdycBMEVMj70qDZaAq7NEs90ShHjQWCDH6YHrzwkdBa3bk6c/A
	 mrOxbsPGegoKeLZkEzAe2T8y7p6L2FROGu9zTdVJBmucHHEJb2z4rJFF5y/JxeCizyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837260;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IBwukY/r+IGKOm3eM3vnEQdz+20coeHnLkhhg8wFB+M=;
	b=hXqw9UN6mxUuWiTu5RIOL6tDZZBjyduzC9h7IZwoNNLObLoMUqava2HzZNKNOPzQuc+L
	 9u3JpfOnG6rqSsAZysIc42aWl0MqgC6cvQ8bmbwo5TfgRhdTxycewBFXfiW29amAoY6O7
	 el72B9lKsBfhAYq710WnUpoF6T8Rb+dgGX+u07iqCsltFFzTUo26pBrSmvWVxU0mL98S9
	 ge5GJID5uwqDacAL2ghvLVnICKHNbRiE5NRq31lb2lcDKQMGJvdHwDH8uTqdUs2cb82As
	 w0wT+/DjE6QCuoy4rwLp/Pi2wUYww5sIIjMXNb9q9veZEzJ459Cbux2RJ/UJs6hitRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YImBXWZn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76759606A896;
	Mon, 16 Nov 2026 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YImBXWZn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309571F000D2;
	Mon, 16 Nov 2026 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837260;
	bh=IBwukY/r+IGKOm3eM3vnEQdz+20coeHnLkhhg8wFB+M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YImBXWZn7iW3UB8QJE9GUValVJCstUCk/uAF2fV4xbigc1CsOCV0fa4d54P6MbKLA
	 Xa48hbh905+1EDP4l/fvutPT3DRr1M0qW7lKnsbMfR/85kON3prOb+d0J/CvAFckLz
	 rPX4FtJ0LLqAg3mCvFFSGszCZL+H+a+wQW4afXatQPbf6bR37lvr0TJs9yzv9PX9ji
	 yYGCX7y2ZhPF2exJkaLzsTRQ3LG/GDLaJxdHB3Lrl5Xhxi4ThVuP5LmyqaPl160Ncd
	 LDfKJCsXL90BSRh5AxBLVIGH/EbbSSw4XjIRbS2/n1QmvNuZhmJ2V+Cnh80FC/v6y5
	 3lF+5Eds1ge/A==
Subject:
 Re: [PATCH net-next v6 4/7] net: ftgmac100: Enable AST2700 RMII support
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 16 Nov 2026 13:54:18 +0000
Message-ID: <179483725870.3136.8874681109854026253@kernel.org>
In-Reply-To: <20261112-support_ast2700-v6-4-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-4-238020bf46cf@aspeedtech.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message and the new comment in ftgmac100_start_hw()
  (drivers/net/ethernet/faraday/ftgmac100.c:362-367) say an opened…
- [Medium] On AST2700, the patch moves the RMII/RGMII interface select
  into a MACCR bit (FTGMAC100_MACCR_RMII_ENABLE, BIT(20)).

--

net: ftgmac100: Enable AST2700 RMII support

This commit adds a FTGMAC100_QUIRK_RMII_ENABLE match-data quirk for
AST2700. When the attached PHY uses RMII, ftgmac100_start_hw() now sets
the new FTGMAC100_MACCR_RMII_ENABLE bit. The commit message says phydev is
always populated once the device is opened.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 67b1fa464a421..9b7becb017262 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c

[ ... ]

> @@ -355,6 +359,12 @@ static void ftgmac100_init_hw(struct ftgmac100 *priv)
>  static void ftgmac100_start_hw(struct ftgmac100 *priv)
>  {
>  	u32 maccr = ioread32(priv->base + FTGMAC100_OFFSET_MACCR);
> +	/*
> +	 * Only reached once the device is open, so a phy_device is already
> +	 * attached: a discrete PHY via "phy-handle", a "fixed-link" node, or
> +	 * NC-SI's internal fixed 100M PHY.
> +	 */
> +	struct phy_device *phydev = priv->netdev->phydev;
>  
>  	/* Keep the original GMAC and FAST bits */
>  	maccr &= (FTGMAC100_MACCR_FAST_MODE | FTGMAC100_MACCR_GIGA_MODE);

[ ... ]

> @@ -383,6 +393,11 @@ static void ftgmac100_start_hw(struct ftgmac100 *priv)
>  	if (priv->netdev->features & NETIF_F_HW_VLAN_CTAG_RX)
>  		maccr |= FTGMAC100_MACCR_RM_VLAN;
>  
> +	if ((priv->quirks & FTGMAC100_QUIRK_RMII_ENABLE) &&
> +	    phydev->interface == PHY_INTERFACE_MODE_RMII) {

[Severity: Medium]

Do the comment above and the commit message describe an invariant that
always holds? The commit message says:

  ftgmac100_probe_dt() always attaches a phy_device before
  register_netdev() can succeed -- via a discrete PHY ("phy-handle"), a
  "fixed-link" node, or NC-SI's internal fixed 100Mbit PHY

In ftgmac100_probe_dt(), if the node has an "mdio" child but no
phy-handle, fixed-link or use-ncsi, no PHY gets connected:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe_dt() {
    ...
	if (!ftgmac100_has_child_node(np, "mdio")) {
		...
		err = ftgmac100_mii_probe(netdev);
		...
	}

	return 0;
}

AST2700 does not call ftgmac100_setup_mdio(), and ftgmac100_probe() never
checks netdev->phydev before register_netdev().

The binding in faraday,ftgmac100.yaml allows an mdio child for every
compatible. For aspeed,ast2700-mac it requires only phy-mode, not
phy-handle, so this layout passes schema validation.

The rest of the driver treats a NULL phydev as valid. ftgmac100_open()
does this:

	if (netdev->phydev) {
		/* If we have a PHY, start polling */
		phy_start(netdev->phydev);
	}

ftgmac100_reset() and ftgmac100_stop() have similar checks.

With such a DT, can phydev be NULL here on AST2700? The
FTGMAC100_QUIRK_RMII_ENABLE quirk is always set for that compatible, so
the NULL phydev would be dereferenced on every open.

The commit message cites ftgmac100_reset_and_config_mac() as precedent.
That check has the same unguarded dereference:

	if (priv->is_aspeed && priv->netdev->phydev->interface == PHY_INTERFACE_MODE_RMII) {

It runs first in both ftgmac100_open() and ftgmac100_reset(). Today it
would oops before ftgmac100_start_hw() is reached, and once it is guarded
this new site would be the next oops. None of the later patches in the
series seem to change either site.

Could this check phydev && phydev->interface == PHY_INTERFACE_MODE_RMII,
and could ftgmac100_reset_and_config_mac() get the same guard? Failing
probe on Aspeed parts with no PHY attached would also work. Either way,
the comment and commit message could then be corrected.

> +		maccr |= FTGMAC100_MACCR_RMII_ENABLE;
> +	}
> +
>  	/* Hit the HW */
>  	iowrite32(maccr, priv->base + FTGMAC100_OFFSET_MACCR);
>  }

[Severity: Medium]

Should FTGMAC100_MACCR_RMII_ENABLE also go into the other MACCR writes?
This is the only place the interface-select bit gets set. It is the same
write that enables TXDMA/RXDMA/TXMAC/RXMAC.

ftgmac100_reset_and_config_mac() builds maccr from cur_speed only and
passes it to ftgmac100_reset_mac(), which issues SW_RST with it:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_reset_mac() {
	/* NOTE: reset clears all registers */
	iowrite32(maccr, priv->base + FTGMAC100_OFFSET_MACCR);
	iowrite32(maccr | FTGMAC100_MACCR_SW_RST,
		  priv->base + FTGMAC100_OFFSET_MACCR);
    ...
}

ftgmac100_stop_hw() writes 0:

	iowrite32(0, priv->base + FTGMAC100_OFFSET_MACCR);

On an AST2700 RMII or NC-SI port, every SW_RST therefore runs with RGMII
selected. That covers open, reset_task after adjust_link, tx_timeout and
ring resize. Every stop or reset also switches the port back to RGMII.

The driver passes FAST_MODE/GIGA_MODE into the pre-reset MACCR write on
purpose and keeps them in ftgmac100_start_hw(). That suggests mode bits
are expected to be set before SW_RST.

This is speculative without AST2700 MACCR documentation. RMII uses the
50MHz REF_CLK and RGMII uses RXC/TXC. If SW_RST completion or clock-domain
sync depends on the selected interface, could the reset time out with
"Hardware reset failed"? Or could the MAC start with its state synced to
the wrong clock?

Would it be safer to fold RMII_ENABLE into the maccr passed to
ftgmac100_reset_mac() and into the value ftgmac100_stop_hw() writes?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-support_ast2700-v6-0-238020bf46cf%40aspeedtech.com
