Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.106
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794841727;
	b=vVLrZYgpgfN7Pdrzjqm0hgeIK4UG5rNzeQvBgA3frfa8qMgcJFUeZcT16ONKzEB1unEk
	 1utgcVkDIDj+SoHhaZCXK88/Ltq9qz10EJjCt+HjBYIABNujr06rvUs5zWU+YUW3kEZjP
	 Jfu7j6MA7N/b0csvtb1WVA6bIFQXyg/EQoOfX8X0FPi9GHtYmHpSRa22OuoV0DOLHLuMJ
	 Kv8Od513OU81YMKeJDyRk8Ez/U5isGsINommF2dh0PL5bG8mba3QO0djpu9inbuMb8AP4
	 1NJKF/uPmfazcFhEKo/wc1Su/qXx5rXdLNXk3YsKr6cD3778un/dt+9C4FT6n5m7Tuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841727;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=JXxer9312lUes1uPEthIt/zA7zOoYQciak50LQ/EmJU=;
	b=nsqZX8qFQg/D0XsWmltqHXlkIKfw6jt4hSwXf5rtfzU4qr0lj8wM9fOMZKf3Y0Tno3CS
	 zPoV9axS4tnIrkGbQkt+EfCEuLHJnZw294zJz/4OLEhbnRkYyWqKit08Q2VvJl2WRlamO
	 8p3FQTlbyaePuuvJOzVx37O9FJ23bTy4yughNJZ2H99H5j//IhXdARvIUGS0dhhoACpvK
	 GL8rjc5g87q2dGu1q0aTBf9WwSxMgeRDXTi7ct8YyCY3yKSadeQRbhVa5mnksDNgJnzk1
	 vl/+ZJ/cS0kv7QHbNW+o4IYzVuza1tEtw4QVLjvqcprdOvcNIj9opTfA9fa1ksXGQ/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=Tk5pXY4F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.106
Received: from sender6-pp-e106.zoho.com (sender6-pp-e106.zoho.com [165.173.180.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3D606A323;
	Mon, 16 Nov 2026 15:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA3D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=Tk5pXY4F
ARC-Seal: i=1; a=rsa-sha256; t=1794841694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BzpH94cLLOjGwhwfgTTHv7LjnpmLKSqu2YTtvc0fQSCUNt7dz/ZXgK7toX660HVWehuE3EexqCCUE7uoMF/fjBjddwPRLeUp7dxAdqpfPX1yEBnHiN22rTpUQfIcE1Z/bFsVL148eIWVE6M+hHg/6PnGw4xI15T1CrWyrAdXAS4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794841694; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JXxer9312lUes1uPEthIt/zA7zOoYQciak50LQ/EmJU=; 
	b=eaFfid7HVB7PYL6Cik23pwC7kNp33JsrxkBPiLVyP1vXO2tBVyOB3jbnlgwkdyVY/aeUj1kt4SaOar3j+LfmX70lTekhexl+SFqdFWzT3Kr8QkJz2KYllr5QZKO/CWXBimmFvyLL3SeSTP62MJ/nn5V7SUnRYQ2dbZvnI9+doJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=Tk5pXY4Fv3AeuEZKVPXepAzf3V2n9Dox6joh8JbYhe4g6AH0zGO1A8olxmI5tRbwAzUrbnvAJmgKCMgu3J/Gro488PXyb4XBGA2DfXno0Ok9ijf85BLNjcMsbcpzotyVyGQgPgXG7tlV9BPxmO6pYY+zTsvoPB1vzPZcQVApUEU=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=JXxer9312lUes1uPEthIt/zA7zOoYQciak50LQ/EmJU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794841692688863.2907198387729;
	Mon, 16 Nov 2026 07:08:12 -0800 (PST)
Date: Mon, 16 Nov 2026 15:08:06 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>, me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
Message-ID: <avscVrGbi7mFicuz@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116091757.1656602-3-magnusleatti@kernelriot.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External

On Mon, Nov 16, 2026 at 06:17:57AM -0300, Magnus Leatti wrote:
> The driver reports "Supports Wake-on: ug" and accepts "wol g", but a
> YT6801 in S5 ignores magic packets. At power-off stmmac_suspend() arms
> the PMT register, but the chip's out-of-band WoL block stays disabled
> as motorcomm_init() leaves it, the packet wake bit in WOL_CTRL is clear
> and PME is turned off.
> 
> When powering off with Wake-on-LAN set, the interface up and wakeup
> enabled for the device, keep PME enabled and arm the chip after
> stmmac_suspend():
> 
>  - Enable OOB WoL. Without it the chip does not wake.
>  - Write the MAC address in use to the first address filter again.
>    Enabling OOB WoL reloads the factory address there. Without the
>    rewrite the chip wakes on the factory address and ignores the one
>    in use. The rewrite follows a 2 ms wait, as in the vendor driver:
>    without the wait the reload lands after the rewrite.
>  - Set the packet wake enable bit in WOL_CTRL. Without it the chip
>    does not wake.
> 
> The sequence follows the vendor driver, with two differences. The
> vendor also sets bit 9 of LPW_CTRL. The chip wakes without it, so it is
> left alone. The vendor puts the function in D3hot. Here it stays in D0.
> With MAC Wake-on-LAN phylink keeps the PHY running and phylib keeps
> polling it until power is removed. In D3hot the MDIO registers read as
> all-ones, the poll fails with -EBUSY and phylib warns from
> phy_error_precise(). That warning was seen 111 ms after entering D3hot
> on a normal power-off.
> 
> The PHY is left at the negotiated speed. Reboot and kexec are not
> armed: OOB WoL can only be disabled again by a chip reset, so it is
> enabled only when powering off, and the next probe resets the chip. If
> the interface is down at power-off, the system does not wake.
> 
> Suspend is not changed. Hibernation that powers off through the
> shutdown path arms the chip the same way. Neither was tested.
> 
> Tested on a Celeron N3350 mini PC, magic packets sent from another host
> 75 s after power-off:
> 
>   net-next  wol g                         no wake, 3 of 3
>   patched   wol g                         wake, 8 of 8 (28-31 s to ping)
>   patched   wol u                         wake on unicast, 1 of 1
>   patched   wol d                         no wake, 3 of 3
>   patched   wol g, interface down         no wake, 1 of 1
>   patched   wol g, power/wakeup disabled  no wake, 1 of 1
>   patched   wol g, reboot                 reboots, link back, 3 of 3
> 
> The kernel log of each of these shutdowns, read back after the next
> boot, shows no warning from the shutdown path.
> 
> A second board, a PSJ8500-N97 mini PC (Intel N97), behaves the same.
> 
> Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 68 ++++++++++++++++++-
>  1 file changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 1e142ad39e33..034547ad1e98 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c

[...]

> @@ -204,9 +207,51 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
>  	return 0;
>  }
>  
> +/*
> + * Arm the chip to wake the system from S5. stmmac_suspend() has already
> + * programmed the PMT register of the GMAC. The rest lives in the wrapper.
> + */
> +static void motorcomm_arm_s5_wake(struct net_device *ndev)
> +{
> +	struct stmmac_priv *spriv = netdev_priv(ndev);
> +	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
> +	u32 reg;
> +
> +	/*
> +	 * motorcomm_init() disables OOB WoL right after the chip reset, as
> +	 * normal operation requires. With it disabled the chip ignores wake
> +	 * packets once the system is off. Once it has been enabled, only a
> +	 * chip reset disables it again, so enable it only when powering off.
> +	 */
> +	reg = readl(priv->base + OOB_WOL_CTRL);
> +	reg &= ~OOB_WOL_CTRL_DIS;
> +	writel(reg, priv->base + OOB_WOL_CTRL);
> +
> +	/*
> +	 * Enabling OOB WoL reloads the address from eFuse into the first
> +	 * MAC address filter. Write the address in use again, or the chip
> +	 * wakes on the factory address only. The reload is not immediate:
> +	 * without the wait, taken from the vendor driver, it overwrites
> +	 * the address written here.
> +	 */
> +	usleep_range(2000, 3000);
> +
> +	rtnl_lock();
> +	phylink_rx_clk_stop_block(spriv->phylink);
> +	stmmac_set_umac_addr(spriv, spriv->hw, ndev->dev_addr, 0);

Does the chip automatically enables WoL and loads MAC from eFuse on
power-on? If so, the driver's WoL behavior would vary if the software
alternates the NIC's MAC address, depending whether it's a cold boot or
a warm one.

Please confirm the chip's behavior on reset.

> +	phylink_rx_clk_stop_unblock(spriv->phylink);
> +	rtnl_unlock();
> +
> +	reg = readl(priv->base + WOL_CTRL);
> +	reg |= WOL_CTRL_PKT_EN;
> +	writel(reg, priv->base + WOL_CTRL);
> +}

[...]

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.
