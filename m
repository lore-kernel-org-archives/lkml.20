Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906954;
	b=xdPY4LUEctrRZl3t1aUF6lFLzKbONa2dZgygqsMpUfV5DM0nW0B7hKkr/Y5eh/WdugTZ
	 aDqOS0Xjffig7KFrW/2bbtG2Bk3codO0DV/mNs9fq2q8OS2iKuCxBuGFShJdbppnX94n7
	 NX2+BFItIMsHrtZ4nbnwoMxDS0OjqwmiAcqSz+cfK1To846u0lI6XVknEvg0faSZx73dj
	 Li84qNtWawtnE9m/6TnTo1ZM3Sd60+96DNmq+5ydxOni4lyPxvY7AaaBbP78sQuOtlNYh
	 8MoQMzBSCnYG7zkQB4Cy6gQWG31AisFclutrci0QJfE5mmw+AYfSWkSm8VZAnCRme2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906954;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PX2VvPQO8YKsW8EYaHPbFnPMhO0EfsOhGHaguUach5g=;
	b=cGTx+LuiigzehLw15FOnKyYZomKaaEWbl2ii1WkgMa2zU3K5HAxzgYRRMho+5zM5Pgh4
	 d5H1d9ydmrGqqVqxLhSAreoWdMdkiCB02Rv3chyxBpgMH9ST7aYYem6z45m075v7jLSPl
	 VWgUMubjvsO7KWpq9ELA4OCFbEQBTBMVnomX3xSRfRhpGZeHy5D2yodaDIhyy5lAhVXAx
	 vPUnjXOgi8C9aaJVIKUcQThjAIq5G57utGgAAOCYHkgvCES6uygR2a7gwZhQGzN35PFu0
	 tQztfQc7L7Yp6DhuM0a9soM4WyTP/cZigHNAoO0DfyNl4AWUiD0yVB8dx1wqP+X9qCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R0rkTW99;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692A0606A329;
	Tue, 17 Nov 2026 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R0rkTW99
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A651F000C4;
	Tue, 17 Nov 2026 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906954;
	bh=PX2VvPQO8YKsW8EYaHPbFnPMhO0EfsOhGHaguUach5g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=R0rkTW99bPmRAQ2whS7C3K2Hu03Up/r/qgqwgDP9MQ2GMSPib/TRGC04jte5aibLl
	 7hICu9PRgWCd1RdUgwGNjJzqxxPGMBEBfMH/zy5ysjbrZqYmlTPz0LakLuqbdDBa7d
	 mRJd+K5V4kMw9qedl/yYqQk/ScuWyew2l22QueIasEW/DkKluBSbTxWq7SXBOQniE7
	 HcrMqGzHhUPBhJktk1OdIqX1wwi5c0C1/w9VQNKe3NHykZ7oirdbMqBvIAueg3xZ8L
	 19jOfjt4cSP6EIOE0zfv2DlsBY7rscjuwIfl7vHfLWsqnnpBHAR5JKArhieMmS0QlC
	 Ork/DuyBlT0sQ==
Subject: Re: [PATCH net 1/4] net: b44: keep phylib ioctls outside the spinlock
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 michael.chan@broadcom.com, hauke@hauke-m.de, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 09:15:52 +0000
Message-ID: <179490695291.3136.15807458064775996761@kernel.org>
In-Reply-To: <20261113-submit-phy-mii-reset-v1-v1-1-02a55f352a91@gmail.com>
References: <20261113-submit-phy-mii-reset-v1-v1-1-02a55f352a91@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: b44 still makes sleeping phylib calls
  while holding a spinlock with IRQs off.
- [Medium] The commit message says 'External PHY register accesses are
  serialized by the MDIO bus mutex'.

--

net: b44: keep phylib ioctls outside the spinlock

With this patch, b44_ioctl() holds bp->lock only around
generic_mii_ioctl() for the internal PHY. The external PHY path now
calls phy_mii_ioctl() without the spinlock and relies on the MDIO bus
mutex for serialization.

> diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
> index f994636fbd5f1..e9f116dfaad99 100644
> --- a/drivers/net/ethernet/broadcom/b44.c
> +++ b/drivers/net/ethernet/broadcom/b44.c
> @@ -2126,14 +2126,14 @@ static int b44_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
>  	if (!netif_running(dev))
>  		goto out;
>  
> -	spin_lock_irq(&bp->lock);

[Severity: Medium]
The commit message says:

  External PHY register accesses are serialized by the MDIO bus mutex, as
  they already are when called from the PHY state machine.

Does that hold for b44? b44_mdio_read_phylib() and
b44_mdio_write_phylib() call __b44_readphy() and __b44_writephy(). Each
of those runs a multi-step sequence on Ethernet core registers:

drivers/net/ethernet/broadcom/b44.c:__b44_readphy() {
	bw32(bp, B44_EMAC_ISTAT, EMAC_INT_MII);
	bw32(bp, B44_MDIO_DATA, (MDIO_DATA_SB_START |
	...
	err = b44_wait_bit(bp, B44_EMAC_ISTAT, EMAC_INT_MII, 100, 0);
	*val = br32(bp, B44_MDIO_DATA) & MDIO_DATA_DATA;
	...
}

Two other paths touch the same hardware while holding only bp->lock,
without the mdio_lock:

b44_chip_reset() calls ssb_device_enable() and
ssb_pcicore_dev_irqvecs_enable(). On older SSB-PCI cores the second call
can switch the BAR0 window to the PCI core. b44_chip_reset() then
rewrites B44_MDIO_CTRL.

b44_setup_phy() calls b44_wap54g10_workaround() before the
B44_FLAG_EXTERNAL_PHY early return. That function does raw
__b44_readphy() and __b44_writephy() calls on PHY 0 and bypasses the
mii_bus.

Both paths can run without rtnl, from b44_tx_timeout() and from the RFO
and ISTAT_ERRORS recovery paths in b44_poll():

b44_tx_timeout()
    spin_lock_irq(&bp->lock);
    b44_halt(bp);
    b44_init_rings(bp);
    b44_init_hw(bp, B44_FULL_RESET);

Before this patch, the spin_lock_irq() in b44_ioctl() stopped a
SIOCGMIIREG or SIOCSMIIREG transaction from overlapping these paths.
Now the transaction runs under only rtnl and mdio_lock.

Can a TX timeout or NAPI error recovery interleave with the ioctl's MDIO
sequence? If so, the read could return a wrong value, b44_wait_bit()
could time out, or a SIOCSMIIREG write could be lost while
phy_mii_ioctl() still updates phydev->autoneg and advertising.

Also, ssb_pci_read32() checks bus->mapped_device and then calls
ioread32() with no lock in between. Could a concurrent window switch
send the MDIO register access to the PCI core's registers?

The PHY state machine already has this gap. This patch adds a path that
userspace can trigger. Would it make sense to serialize inside the b44
MDIO accessors instead, for example with a short
spin_lock_irqsave(&bp->lock) around the udelay-only sequence? That would
also mean dropping bp->lock in b44_set_link_ksettings().

>  	if (bp->flags & B44_FLAG_EXTERNAL_PHY) {
>  		BUG_ON(!dev->phydev);
>  		err = phy_mii_ioctl(dev->phydev, ifr, cmd);

[Severity: High]
Is this fix complete? On the external PHY path, b44_set_link_ksettings()
still calls into phylib with bp->lock held and interrupts disabled:

drivers/net/ethernet/broadcom/b44.c:b44_set_link_ksettings() {
	...
	if (bp->flags & B44_FLAG_EXTERNAL_PHY) {
		BUG_ON(!dev->phydev);
		spin_lock_irq(&bp->lock);
		if (netif_running(dev))
			b44_setup_phy(bp);

		ret = phy_ethtool_ksettings_set(dev->phydev, cmd);

		spin_unlock_irq(&bp->lock);

		return ret;
	}
	...
}

Once its argument checks pass, phy_ethtool_ksettings_set() calls
mutex_lock(&phydev->lock). It then calls phy_trigger_machine() or
_phy_start_aneg(), and the aneg path does MDIO I/O under the bus
mdio_lock.

An ordinary "ethtool -s <dev> speed 100 duplex full autoneg off" on a
b44 with B44_FLAG_EXTERNAL_PHY gets here. ethtool does a get before the
set, and b44_get_link_ksettings() fills phy_address from
phy_ethtool_ksettings_get(), so the phy_address check passes.

Doesn't this hit the same sleeping-in-atomic problem that the commit
message describes for phy_mii_ioctl()?

If phydev->lock is contended, for example by phy_state_machine(), the
task would schedule with bp->lock held and interrupts off. Then
b44_interrupt() or b44_timer() on that CPU could spin on bp->lock
forever.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91%40gmail.com
