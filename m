Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837050;
	b=ge3tyyVcT+JhLfvVCYRApiGzY39vzzfx094KpmV4lUdGg9oGJwse08yivr70Mn2BFQhw
	 QToEqDnlaU1WSUVfRDhV+kCyV6X9dsJCo8TMDmSV7Yb5hvYY5dk7gZq9gI9vnQl+pS+FZ
	 HUVgW8eztIVwhLOoZpwEBe7SvtmEDhz7XL6dabQaOjckwOBJgzrCz/hexkOZLnER/tXu+
	 LGtOVYGNuYITIQLohVY2MZhfkqdakM7AKaAOudEs1cF/c4NmvRjHP9v0HUcJSkZXZvkkG
	 arwumO2qIjfx+GUS49qzyeJZIbHsX/fX8fjo/Y0c7PRpJyANP0SlpgebhK2xC6JZNsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837050;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LVz5mUCm5WEeoAL0Bw5uctiuDrK+oeS2W5aeRJYYK+M=;
	b=UexT9k7gbS1OsrUczN0LUBxKsX4O9fHDgcEb8nmizAO+Ma8Xq6+izXCyA20GXMlRylsF
	 qi6uEqmJWjZ1tZZQMhpcMdtk1rl2HLDiGLkbEo8zwWiWrBE1+EfglFuZ8+y+wfLAECrs0
	 SyuKguoJ0v+uvoR3yWscygIJ0kKL44uyIwVSRUQ1QHwyVYPhNfiIaJ1PTr18RIv03rNRY
	 AzEA9sosJBQKgCtualdSNn5r8/Lgq8i3jNFIwCmLNk3LcuudepM2htbNwHclqF7ms2pRr
	 Lmk4aK6IYG0Ca1f+pAHFQ1Oi2dYWgrToKGW0sUaJEAu32alLiTERpJZdWy84nZbqD0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWY85mvC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B602606A884;
	Mon, 16 Nov 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWY85mvC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941B21F01821;
	Mon, 16 Nov 2026 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837049;
	bh=LVz5mUCm5WEeoAL0Bw5uctiuDrK+oeS2W5aeRJYYK+M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KWY85mvCaXAjsH+NDQE9EI0nh5+7kxtEyJ9+nlDpboY3USL+cXfcr7YN3zcre90/x
	 EJig/+UoT24V0BOxqKuIsKXS/f70edfdZQ2nL3UijiDaXckvUxDqa/y0d0BlMK09NU
	 MVqq3Fp9SepW337AQu6MrwGgUXpbsVbxzye4vNA5MVvFCGZo0pmCiW8BQho2krLYKj
	 PRBw7N4GRd0IYJO/VinlJhVA5YNefJuuwdZdeRTcCn5A2F6HFkpGkakLjGBaMNCsli
	 vHDtB5jzIW9+W/jQsiyE1y/f9XlSB0RJ/lofOKQtdDeQ/vfYq+0EGNGBe35lMpELf+
	 lTOqtr/9l+i0g==
Subject: Re: [PATCH net v2 10/12] net: phy: smsc: wait for LAN83C183
 power-down recovery
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org, jeff@garzik.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Mon, 16 Nov 2026 13:50:48 +0000
Message-ID: <179483704808.3136.15887744025770615688@kernel.org>
In-Reply-To: <20261112045301.3669532-11-f.fainelli@gmail.com>
References: <20261112045301.3669532-11-f.fainelli@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In this commit, the new 500 ms wait in lan83c183_resume()
  (drivers/net/phy/smsc.c) runs only after the Au1000 MAC has already…

Pre-existing issues:
- [Low] After this patch, the SMSC_PHY Kconfig help text
  (drivers/net/phy/Kconfig:424) reads "Currently supports the LAN83C183,…

--

net: phy: smsc: wait for LAN83C183 power-down recovery

This patch adds a LAN83C183 entry to the SMSC PHY driver. Its resume
callback clears BMCR_PDOWN and sleeps for 500 ms, but only if the bit
was actually set. The aim is to let the MII clocks recover before the
Au1000 MAC starts when the MTX-1 interface is reopened.

Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44

> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 30e9d22c8d1a3..10466b2574eb4 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -421,7 +421,7 @@ config SMSC_PHY
>  	tristate "SMSC PHYs"
>  	select CRC16
>  	help
> -	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
> +	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs

[Severity: Low]
This isn't a bug introduced by this patch, but the help text still
names only some of the PHYs that smsc_tbl[] in drivers/net/phy/smsc.c
binds. It leaves out the LAN911x internal PHY, the LAN8710/LAN8720,
the LAN8740 and the LAN8741/LAN8742.

Could the list be completed while this line is being changed anyway?

> diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
> index 48487149c2252..c3b51afd4b1e5 100644
> --- a/drivers/net/phy/smsc.c
> +++ b/drivers/net/phy/smsc.c

[ ... ]

> @@ -684,8 +685,32 @@ int smsc_phy_probe(struct phy_device *phydev)
>  }
>  EXPORT_SYMBOL_GPL(smsc_phy_probe);
>  
> +static int lan83c183_resume(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The PHY needs up to 500 ms to restore operation after power-down. */
> +	if (ret)
> +		msleep(500);

[Severity: Medium]
The commit message says:

  Starting the Au1000 MAC before the MII clocks recover can hang the
  MTX-1 when reopening its interface.

Does this patch alone prevent that ordering? au1000_open() starts the
MAC before it calls phy_start():

drivers/net/ethernet/amd/au1000_eth.c:au1000_open() {
    ...
	retval = au1000_init(dev);
    ...
	if (dev->phydev)
		phy_start(dev->phydev);

	netif_start_queue(dev);
    ...
}

and au1000_init() already sets the RX/TX enable bits:

drivers/net/ethernet/amd/au1000_eth.c:au1000_init() {
    ...
	control = MAC_RX_ENABLE | MAC_TX_ENABLE;
    ...
	writel(control, &aup->mac->control);
    ...
}

Suppose a close has run au1000_close()->phy_stop()->phy_suspend()->
genphy_suspend(), which sets BMCR_PDOWN. The reopen then appears to go
like this:

au1000_open()
  au1000_init()          <- MAC RX/TX enabled, PHY still powered down
  phy_start()
    __phy_resume()
      lan83c183_resume()
        clear BMCR_PDOWN
        msleep(500)

If so, the 500 ms wait only delays the PHY state machine and
netif_start_queue(). The MAC has already started by then.

The close path has the same ordering in reverse. au1000_close() calls
phy_stop() before au1000_reset_mac_unlocked(), so the PHY powers down
while the MAC is still running.

The next patch in the series, "net: au1000: keep the MAC stopped until
the PHY link is ready", seems to fix this. It calls phy_resume() before
au1000_init() and enables RX/TX only after au1000_adjust_link() has
seen link up. It also calls au1000_hard_stop() on link down. In the
PHY_HALTED path, phy_link_down() runs before phy_suspend(), so the MAC
stops before the PHY powers down.

Can the MTX-1 reopen hang still happen when bisecting to this commit
alone? If so, could the commit message mention that it depends on the
au1000 change, or could the two patches be reordered?

> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112045301.3669532-1-f.fainelli%40gmail.com
