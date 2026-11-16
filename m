Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837051;
	b=fjzjoIKVge56ltIU4aJsPdNS9VHU1hd0BkNs+UAAtD1br0J/5NYCWPMELJ2TjpaAJfl2
	 C4/t8ukdRILYv58y+b9pkEa/Uqgrtb5Shi+nAKpjCOeoTDKi56dagYoudrq1oxekUIQ5V
	 itdLddGQHyXbUQPElNAe+HEE8KVIREZ4V1KBmwkJsLyJgwwEarG6Sk3DjVYsFaOwPr5lo
	 y8jAsMUqiEvYBOVrMzOcT0l5TOgk7DXOq19QfD1RdwmOTkZfnLlXV00PLkTNQsPrSch0s
	 VRFNOOtR9mavqvFJI95IddRBd80KegxNCnn7Z37nri6eOmnNQQ9YNOnsPn69tL4hRlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837051;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EeDl7bbI7LCiKb5h7E9ZI6fEwc5/yvL/KpqTYXXHOMw=;
	b=uiCCWV/2uNVJB2S/qgsugFndMCYBZbWsMyMprrd0KERQThkXavQTaPQMhwDpCAsXq9ob
	 2ifPrCWyHlKzAj8FeYdBi/uGb+mfDR5mH8fk1/xt91jjP8EHMKOv7q2DZvZD5j7HStgc8
	 pblwVrbi92WBlhb2yTwhkMFZE0VkVm4aBWckaXsL4OEbsqxXKG1/7hBv6Xd6lE8+dNkUj
	 8H3vr5CoYnWufdQpJnWbS4tPErvybXLboVrrOg9vYx7W8tWnpSNOjTgk/gk9dvMVQKJoh
	 pwQZqyiDxushwLEiLLIoKVAXfFIYILs/8ouJAQ3Rd0msBGcfeFn9BhY11RsA4L7JnKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj4HjDXH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D060A262A;
	Mon, 16 Nov 2026 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj4HjDXH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDD31F0182D;
	Mon, 16 Nov 2026 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837051;
	bh=EeDl7bbI7LCiKb5h7E9ZI6fEwc5/yvL/KpqTYXXHOMw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Oj4HjDXHhFsZ5UxPZYFtazBHZTpjYPeQRgPrAt3SO/FK0/ZD+/oHcw2KdHoKs8NUe
	 Uyl11iJBxfwXcYT4uVhg1r9XqE2Ht2cMTSxHbXkoi72Sj7dpquUyBPL/swBFYiH+Ys
	 evNFkf35AZ1vXhtF9WFfUS0JevDdAt9dB9843g2MT7ed7SS54fyLDYNrOYNkH6h87C
	 xIReujsr6tv3O2+WHx9VZCJiubBd1WAbqFW0Efosx4fXqYkeNntLaqBijkg5qCRfl4
	 e/P4Ax6xqR5HBYnRfmK4/lSrYV5nhDji5WaolbbPwGyG4EswO4d4BRinfHzLsxDFjA
	 yDK+7AzR3xxpQ==
Subject: Re: [PATCH net v2 11/12] net: au1000: keep the MAC stopped until the
 PHY link is ready
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org, jeff@garzik.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Mon, 16 Nov 2026 13:50:49 +0000
Message-ID: <179483704995.3136.5707920157509018990@kernel.org>
In-Reply-To: <20261112045301.3669532-12-f.fainelli@gmail.com>
References: <20261112045301.3669532-12-f.fainelli@gmail.com>
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

- [Low] The commit message and comments in this patch don't match the
  code.

--

net: au1000: keep the MAC stopped until the PHY link is ready

This patch stops the MAC when the PHY reports link-down. On open, it now
calls phy_resume() before au1000_init(). It also keeps MAC RX/TX disabled
in au1000_init() until au1000_adjust_link() has seen a link-up.

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index 8b7a88ceb3c5e..d60430a3795ed 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c

[ ... ]

> @@ -691,8 +692,8 @@ static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
>   * When the device powers up, the clocks are disabled and the
>   * mac is in reset state.  When the interface is closed, we
>   * do the same -- reset the device and disable the clocks to
> - * conserve power. Thus, whenever au1000_init() is called,
> - * the device should already be in reset state.
> + * conserve power. The device must be stopped before au1000_init() is
> + * called, but may be out of reset for MDIO accesses while resuming the PHY.
>   */
>  static int au1000_init(struct net_device *dev)
>  {

[ ... ]

> @@ -928,11 +934,25 @@ static int au1000_open(struct net_device *dev)
>  		return retval;
>  	}
>  

[ ... ]

> +	/* Restore the MII clocks without starting the PHY state machine. */
> +	if (dev->phydev) {
> +		retval = phy_resume(dev->phydev);
> +		if (retval)
> +			goto err_reset;
> +	}
> +
>  	retval = au1000_init(dev);
>  	if (retval) {
>  		netdev_err(dev, "error in au1000_init\n");
> -		free_irq(dev->irq, dev);
> -		return retval;
> +		if (dev->phydev)
> +			phy_suspend(dev->phydev);
> +		goto err_reset;
>  	}

[Severity: Low]

Can this error branch in au1000_open() ever run? au1000_init() has only
one return statement:

drivers/net/ethernet/amd/au1000_eth.c:au1000_init() {
	...
	spin_unlock_irqrestore(&aup->lock, flags);
	netif_addr_unlock_bh(dev);
	return 0;
}

au1000_enable_mac() returns void, so nothing in au1000_init() can fail.
That makes the new phy_suspend() rollback look like dead code, even
though the commit message describes it as:

    if initialization fails, suspend the PHY again before cleanup.

The commit message also says:

    Initialize the MAC before phy_start() so the PHY worker cannot access
    MDIO or enable traffic during setup.

Didn't au1000_open() already call au1000_init() before phy_start() before
this patch? The diff shows that order as unchanged context.

The actual changes seem to be the new phy_resume() call before
au1000_init(), and making RX/TX depend on aup->old_link. Could the commit
message describe those changes instead?

Separately, the au1000_init() header comment now says the device "may be
out of reset for MDIO accesses while resuming the PHY". The comment in
au1000_probe() was not changed and still says:

	/*
	 * The boot code uses the ethernet controller, so reset it to start
	 * fresh.  au1000_init() expects that the device is in reset state.
	 */

Should these two comments be reconciled? They now give conflicting
preconditions for au1000_init(). Neither is strictly accurate, because
au1000_init() always forces a reset itself through
au1000_enable_mac(dev, 1).

>  
>  	if (dev->phydev)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112045301.3669532-1-f.fainelli%40gmail.com
