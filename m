Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747714;
	b=4JXQKYmm8QQxDiKaBxQAnlzL4wFAOzI6SQ69qeEZVx0N5gosH+B/sp6EDME/1XeMckY3
	 1DHDNJiNnkdbziUm3KPFvwYqd3cpRofhmtS+zFTYOU27jpSDmOgBessiOGJs4+LoOXFXu
	 tWyW8X3PiteK+XuDNLdHg6TQUkx82AlPfjH/AwglwoJUTbcUGzTbQX6p5ghX/H5u0j1R2
	 vhcJhRczBN+9Mh7j5ErYyTcbZtIpzlBSc2yQvxxY+31ym3XuU8OrmnV4bz7CKWN8J6I+f
	 9Z9Kh4SUNnIDIBWElMfmeeVBVNBEYoRwdJzJ+3aC3n5RMAUykAGEHbU0fZxa+98G/Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747714;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=s7T3M0WgVLcc+Nb3njHO+7UDHxjTn/GApNJ1wnwNQVA=;
	b=ug/e2lZMAJWndDnwq9O1aqT3bivkG5xYW9Vl80Ehm0CrwCSN2wBvkg/PfXNby6E5yT2Z
	 K/Q3zmlpQfA5w/7pu4dzpCRTH98w88U1H6c0BC+uc9zUz34pSD68JRApRLAGGOqW3jmVj
	 pLXXT2SsowCmNX+/DEQdFhsV0GUAYMQdaFA2zUzCXic14yZr2xs5Km4JsyWjASZlSfHKV
	 t9RYb4TzjS5jmBeXXjsdzN4MvKeV+3SeXSTXbsO0aYAGlV5OccYqVXEPE+LT1i1gcZCKO
	 i4hQ3+64FPRX5D0Ea7WRnpyUHxwd9ppBueGNYYa5Kh4n4hegBPpoKX2jiZLW27hKDvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGPRr54o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1144606A33E;
	Sun, 15 Nov 2026 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGPRr54o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19341F000C6;
	Sun, 15 Nov 2026 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747714;
	bh=s7T3M0WgVLcc+Nb3njHO+7UDHxjTn/GApNJ1wnwNQVA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DGPRr54oSQfEiRYK9UXBfUM7+LIfwFjlsN1AlIF/bWDOMZqQP6T51f/04TpcPSYnn
	 CB9lfoGpdWiUT//lBwkYMFYhKmx+hPrwX5/jUTUaQ6bsEG88XcDPWuIkbYkxI2meKl
	 uDiND1lZ1dy4woqk21J5hJbF2vqB4rXYsHS4qc0bkMprhhG90lXqCpNGFIAO2nDgto
	 FI65dcY6HnUTK2GMTZmpNmkgSgH8QAkzM9rNyd8qNhEzloQlIl7Z/3ORoawh2xGOx/
	 koyTpAk2oDjMnLqmykkb86Bw8N3qMxCpp1MTAuox5lNRv0kmm+8v9yS8BqeSaKN+/z
	 yv6SHBHRuDHHw==
Subject:
 Re: [PATCH net-next v7 8/9] net: bcmgenet: allow the MTU to be changed
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sun, 15 Nov 2026 13:01:53 +0000
Message-ID: <179474771357.2199510.15722627746438398810@kernel.org>
In-Reply-To: <20261112-nb-genet-mtu-nn-v2-v7-8-43a5d90b3256@tipi-net.de>
References: <20261112-nb-genet-mtu-nn-v2-v7-8-43a5d90b3256@tipi-net.de>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The probe change raises dev->max_mtu for every version except
  v1 (bcmgenet.c:4433-4434, `if (!GENET_IS_V1(priv)) dev->max_mtu =…
- [Medium] net: bcmgenet: mismatched dma_unmap_page() in
  bcmgenet_free_tx_cb()
- [Low] bcmgenet_change_mtu()
  (drivers/net/ethernet/broadcom/genet/bcmgenet.c:3990) restarts the…

--

net: bcmgenet: allow the MTU to be changed

This commit sets dev->max_mtu for GENET v2 and later. The value comes from
the packet ready threshold and the page size. It also adds
bcmgenet_change_mtu(), which restarts the DMA datapath in place while the
PHY keeps running. MTU changes that stay at or below ETH_DATA_LEN skip the
restart.

Link: https://github.com/raspberrypi/linux/issues/5561

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 3cbffbc333dea..30ba77931c4f0 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> +static int bcmgenet_change_mtu(struct net_device *dev, int new_mtu)
> +{

[ ... ]

> +	/* The PHY stays up, hold its lock. A link event would otherwise take
> +	 * the MAC out of reset and enable it mid rewrite.
> +	 */
> +	mutex_lock(&dev->phydev->lock);
> +	bcmgenet_netif_stop(dev, false);

[ ... ]

> +	bcmgenet_hfb_restore(priv);
> +	bcmgenet_netif_start(dev, false);
> +	mutex_unlock(&dev->phydev->lock);
> +
> +	/* bcmgenet_netif_start() only restores the link interrupt */
> +	if (bcmgenet_has_mdio_intr(priv))
> +		bcmgenet_intrl2_0_writel(priv, UMAC_IRQ_MDIO_EVENT,
> +					 INTRL2_CPU_MASK_CLEAR);
> +
> +	/* Interrupts were off, so a latched link event is lost. Internal PHYs
> +	 * on v1-v4 are not polled either.
> +	 */
> +	phy_mac_interrupt(dev->phydev);

[Severity: Low]
Does this restart also lose a pending UMAC_IRQ_PHY_DET_R event?

Inside bcmgenet_netif_stop(), bcmgenet_intr_disable() clears the latched
INTRL2_0 status. After that, the bottom half is cancelled:

bcmgenet_netif_stop() {
    ...
	cancel_work_sync(&priv->bcmgenet_irq_work);
    ...
}

If the work was queued but had not run yet, its bits stay in
priv->irq0_stat and nothing queues the work again.

On v1-v3 with an internal PHY, bcmgenet_link_intr_enable() enables
UMAC_IRQ_PHY_DET_R. Only bcmgenet_irq_task() handles it:

	if (status & UMAC_IRQ_PHY_DET_R &&
	    priv->dev->phydev->autoneg != AUTONEG_ENABLE) {
		phy_init_hw(priv->dev->phydev);
		genphy_config_aneg(priv->dev->phydev);

This is the 40nm EPHY energy-detect workaround from commit 25382b991d25
("net: bcmgenet: reset 40nm EPHY on energy detect").

The link event is replayed with phy_mac_interrupt(), but the PHY_DET_R
event is not. If an energy-detect event lands in the restart window, which
includes the sleep in bcmgenet_dma_teardown(), or sits in the cancelled
work item, is the EPHY soft reset skipped until some unrelated isr0 event
queues the work again?

Before this patch, bcmgenet_netif_stop() was only followed by close/open
or suspend/resume, and both reinitialise the PHY.

Would it work to schedule bcmgenet_irq_work after bcmgenet_netif_start()
when priv->irq0_stat is non-zero? Another option is to replay the PHY_DET_R
handling the same way the link event is replayed.

The later patch "reassemble jumbo frames from status block fragments" does
not touch bcmgenet_change_mtu(), so this seems to remain at the end of the
series.

[ ... ]

> @@ -4345,8 +4425,14 @@ static int bcmgenet_probe(struct platform_device *pdev)
>  	/* Mii wait queue */
>  	init_waitqueue_head(&priv->wq);
>  	bcmgenet_hfb_init(priv);
> +
>  	priv->rx_buf_len = bcmgenet_rx_buf_len(dev->mtu);
>  	priv->tx_thld_len = bcmgenet_tx_pkt_rdy_thld(dev->mtu) * ENET_THLD_UNIT;
> +
> +	/* v1 cannot program the thresholds, so it stays at the default MTU */
> +	if (!GENET_IS_V1(priv))
> +		dev->max_mtu = ENET_MAX_MTU;

[Severity: Medium]
Has GENET v2 been confirmed to handle the larger thresholds this enables?

On v2, any MTU above ETH_DATA_LEN makes bcmgenet_tx_pkt_rdy_thld() return
ENET_THLD_MAX (0xf0, 3840 bytes). bcmgenet_set_mtu_regs() then programs
that value, together with a larger RBUF_PKT_RDY_THLD and
UMAC_MAX_FRAME_LEN.

init_umac() only programs the buffer sizing register on v3 and later:

	if (!GENET_IS_V1(priv) && !GENET_IS_V2(priv))
		bcmgenet_rbuf_writel(priv, 1, RBUF_TBUF_SIZE_CTRL);

So v2 keeps whatever RBUF/TBUF partitioning it has at reset. Its RBUF
register layout also differs from v3 and later, for example
RBUF_OVFL_CNT_V2 versus RBUF_OVFL_CNT_V3PLUS.

The commit message only explains why v1 is excluded.

What if the v2 TBUF cannot buffer up to the 3840 byte threshold, or the v2
RBUF cannot hold the larger frames? Large-frame TX could then stall, and
the earlier patch "split frames that end just past the transmit threshold"
shows this can leave TX DMA unable to halt. RX could also overflow.

The last patch in the series raises ENET_MAX_MTU for v2 to 16347 and keeps
the 0xf0 TX threshold. Its RTL confirmation covers only RX frame splitting.

Should max_mtu be limited to the versions known to work until v2 is
confirmed on hardware?

>  	INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);

[ ... ]

> @@ -3981,6 +3987,79 @@ static int bcmgenet_change_carrier(struct net_device *dev, bool new_carrier)
>  	return 0;
>  }
>  
> +static int bcmgenet_change_mtu(struct net_device *dev, int new_mtu)
> +{
> +	struct bcmgenet_priv *priv = netdev_priv(dev);
> +	unsigned int old_mtu = dev->mtu;
> +	struct bcmgenet_dma_set set;
> +	int ret;
> +
> +	/* Below ETH_DATA_LEN everything is floored, so there is nothing to
> +	 * reprogram. Same when a failed resume left the datapath down.
> +	 */
> +	if (!netif_running(dev) || !priv->tx_cbs ||
> +	    max_t(unsigned int, old_mtu, ETH_DATA_LEN) ==
> +	    max_t(unsigned int, new_mtu, ETH_DATA_LEN)) {
> +		WRITE_ONCE(dev->mtu, new_mtu);
> +		priv->rx_buf_len = bcmgenet_rx_buf_len(new_mtu);
> +		return 0;
> +	}
> +
> +	ret = bcmgenet_alloc_dma(priv, bcmgenet_rx_buf_len(new_mtu), &set);
> +	if (ret)
> +		return ret;
> +
> +	/* The watchdog trips on an idle queue once the rings are gone */
> +	netif_device_detach(dev);
> +
> +	/* The PHY stays up, hold its lock. A link event would otherwise take
> +	 * the MAC out of reset and enable it mid rewrite.
> +	 */
> +	mutex_lock(&dev->phydev->lock);
> +	bcmgenet_netif_stop(dev, false);
> +
> +	WRITE_ONCE(dev->mtu, new_mtu);
> +	priv->rx_buf_len = bcmgenet_rx_buf_len(new_mtu);
> +	bcmgenet_set_mtu_regs(priv, new_mtu);
> +
> +	ret = bcmgenet_init_dma(priv, true, &set);
> +	if (ret) {
> +		/* The datapath is gone, do not leave the interface up */
> +		netdev_err(dev, "failed to initialize DMA, closing\n");
> +		WRITE_ONCE(dev->mtu, old_mtu);
> +		priv->rx_buf_len = bcmgenet_rx_buf_len(old_mtu);
> +		mutex_unlock(&dev->phydev->lock);
> +		/* bcmgenet_close() attaches the device again */
> +		netif_close(dev);
> +		return ret;
> +	}
> +
> +	bcmgenet_hfb_restore(priv);
> +	bcmgenet_netif_start(dev, false);
> +	mutex_unlock(&dev->phydev->lock);
> +
> +	/* bcmgenet_netif_start() only restores the link interrupt */
> +	if (bcmgenet_has_mdio_intr(priv))
> +		bcmgenet_intrl2_0_writel(priv, UMAC_IRQ_MDIO_EVENT,
> +					 INTRL2_CPU_MASK_CLEAR);
> +
> +	/* Interrupts were off, so a latched link event is lost. Internal PHYs
> +	 * on v1-v4 are not polled either.
> +	 */
> +	phy_mac_interrupt(dev->phydev);
> +
> +	netif_device_attach(dev);
> +
> +	/* Filter updates that came in while the device was detached got
> +	 * dropped. An IPv6 join does not hold RTNL.
> +	 */
> +	netif_addr_lock_bh(dev);
> +	bcmgenet_set_rx_mode(dev);
> +	netif_addr_unlock_bh(dev);
> +
> +	return 0;
> +}
> +
>  static const struct net_device_ops bcmgenet_netdev_ops = {
>  	.ndo_open		= bcmgenet_open,
>  	.ndo_stop		= bcmgenet_close,

[Severity: Medium]
Once this lets frames grow past priv->tx_thld_len, does the threshold
split in bcmgenet_xmit() release the head buffer with the wrong DMA API
call?

For a linear skb, skb_headlen() already covers priv->tx_thld_len. The
covered < priv->tx_thld_len loop in bcmgenet_xmit() then never runs,
so split_i stays 0. On the first descriptor, GENET_CB(skb)->first_cb is
set to that control block and skb->data is mapped with
dma_map_single(). Because i == split_i, the same control block also
becomes GENET_CB(skb)->split_cb. Its dma_addr and dma_len are cleared,
and the mapping passes to the next control block through
split_mapping.

bcmgenet_free_tx_cb() then does:

	if (cb != GENET_CB(skb)->split_cb) {
		if (cb == GENET_CB(skb)->first_cb)
			dma_unmap_single(...);
		else
			dma_unmap_page(...);

The first control block is skipped because it is split_cb. The
continuation control block now owns the dma_map_single() mapping, but
it is not first_cb, so it gets dma_unmap_page(). TX completion, ring
reclaim and the out_unmap_frags unwind all take this path.

On most platforms both calls end up doing the same work. Still, the
mapping type mismatch breaks the DMA API contract, and
CONFIG_DMA_API_DEBUG will complain about it for these frames.

At the default MTU the split window does not appear to be reachable. It
looks like bcmgenet_change_mtu() and the larger ENET_MAX_MTU are what
expose it. The code itself comes from the earlier patch "split frames
that end just past the transmit threshold", so the fix probably belongs
there.

What is the preferred way to track this? One option is to record on
the control block that owns the mapping whether it came from
dma_map_single(), instead of comparing against first_cb. Another is to
move first_cb to the continuation descriptor when split_i is 0.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-nb-genet-mtu-nn-v2-v7-0-43a5d90b3256%40tipi-net.de
