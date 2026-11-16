Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802350;
	b=Y/5GSKJtsKxyJF14omZUganPMv/93nClSVAur90ZWCTEi5nAHsdiWWVPQM8y8e+/pc/g
	 ofC+0WopQ8OHjnKui73tcyQElmo2896JjczYMPLGRjNwy/q+O8cQ/BRhj/suSRqLCrhLY
	 siSaHsHzYRTecrDq+m8Jzl7rGZdI0gbnUOEzcowEhpr7UNV5RLDd8r/7ZvyUVO+7C7TFY
	 r6TNRkYhlIJPKDEqX+nfgXM0lX6FeoVX9wG0ofdGJ7JladY4wQOheUvxDhLAK20Hv8t4H
	 KBxeBPMYx9RRD0aOhVTsxjjpYgkNYTiI4lDGqI0FjlYyOnICce31aeooU8or5glqcwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802350;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=z43ShnxhdTQlmAVIYN6u8onm/dAqvyjq3drmtJzx7RE=;
	b=YUCK1zv3hbI7zL98zXQF3YmXei/FolBzSowh1zMxNj8VxRA5tGo9OIbytciuX/I6aQ52
	 7UrhwUHuA6ort5MbzcfaEVuADD2GyGQimsALNeX6N5bQ6r4UGLjfnhx/f+lHSQzkF8pRy
	 yXBovyYUJWvER0Xu5LM+1x4m/qENlnAo1uBeHd6ZqFg4w5LejZuz6hsW2dHNokJM+chus
	 DyKAH9bhelFD40VGe/DZOROjFIRjYfbhHiFciKGxtz+0ZFvBg8kmkq78HfFgGhRqmznX1
	 ed6L/8xrcGBFceuPX5ol7ckjDYGTWOxlltkZclbTghHOaWprx2pjALJJ7XyPZ3b3W3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMK44TzT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE663606A334;
	Mon, 16 Nov 2026 04:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMK44TzT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C841F000C4;
	Mon, 16 Nov 2026 04:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802350;
	bh=z43ShnxhdTQlmAVIYN6u8onm/dAqvyjq3drmtJzx7RE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eMK44TzTHFFW249bFRbScEPdDYnDxGs+KYfnDtY8touTDXVD9l6yqHddvuib7N4Og
	 gHMCmEFFse5NO+AIm8P2RQ4SmeMWt92ooTHGI0gkFRrcEWQUhspOoL4Jea5vXAeCm0
	 8nAThNwW1m9mI6k0psrNzc6wgqLjsBjNRUYxFXqd+OAYr2O8bDy0RlU/5RE96BAAKN
	 mIv0CY76/CVOyvVidaFcc+SC1jUp1l0/tQotJJ/bBEoV62PkwvJY7JuylZbnBaIi5C
	 aYj9+YQvWHb0/aBfV2hKhosnmm1A3ptZeyFNBG/Ci++ZokOwMcuydjrqMBtHFZT192
	 vgzoIUaodOTNA==
Subject: Re: [PATCH net-next v5 3/6] net: xilinx: axienet: Propagate device
 reset failure from ndo_open
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:29 +0000
Message-ID: <179480234928.3136.4433132760561916489@kernel.org>
In-Reply-To: <20261114182947.2908628-4-suraj.gupta2@amd.com>
References: <20261114182947.2908628-4-suraj.gupta2@amd.com>
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

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch fixes user-visible bugs in existing kernels but has
  no Fixes: tag, and it is sent as the third patch of an XXV feature…
- [Medium] net: xilinx: axienet: u32 stats underflow on
  __axienet_device_reset() failure
- [Medium] net: xilinx: axienet: leaked legacy DMA rings and active DMA
  on open failure
- [Low] The commit message presents the resume/stop changes as a side
  effect of the new reset check.
- [Low] The comment added to axienet_stop() justifies the datapath_up
  guard with "axienet_resume() calls ndo_open directly, so unlike the…

--

net: xilinx: axienet: Propagate device reset failure from ndo_open

With this patch, axienet_open() now returns the error from
axienet_device_reset(). A new datapath_up flag makes axienet_stop() a
no-op when ndo_open did not complete. axienet_resume() now propagates
the open failure and calls netif_close() before it reattaches the device.
The patch also clears reset_in_progress on the error path of
__axienet_device_reset().

> That makes a failed ndo_open reachable, which matters for axienet_resume():
> it calls ndo_open directly, so unlike the netdev core it leaves the device
> running when open fails.

[Severity: Low]
Is this description accurate? Before this patch, axienet_open() could
already fail without the reset being involved:

  - phylink_fwnode_phy_connect() failure returns directly
  - request_irq(lp->eth_irq) failure on the dmaengine path goes to err_phy
  - axienet_init_dmaengine() failure (dma_request_chan() or the ring
    allocations) goes to err_free_eth_irq
  - request_irq() failures inside axienet_init_legacy_dma() go to
    err_phy, after napi_disable()

Since a3de357b087e ("net: axiemac: add PM callbacks to support
suspend/resume"), axienet_resume() has ignored the axienet_open() return
value and always called netif_device_attach(). The device stayed IFF_UP
after any of those failures.

A later ndo_stop then ran the full teardown. On the legacy path that is
napi_disable() on an already disabled NAPI with RTNL held, plus
free_irq() on IRQs that were never requested. On the dmaengine path it is
dma_release_channel() on released channels and a second kfree() of
tx_skb_ring/rx_skb_ring.

Could the commit message describe these as existing bugs, rather than as
a consequence of the new reset check?

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 125ad3dbf6aa9..a553150faa89b 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -1834,6 +1851,16 @@ static int axienet_stop(struct net_device *ndev)
>  	struct axienet_local *lp = netdev_priv(ndev);
>  	int i;
>  
> +	/* axienet_resume() calls ndo_open directly, so unlike the netdev core
> +	 * it can leave the device running after a failed open. Tearing down
> +	 * below would then stop a phylink that open already stopped and
> +	 * disconnected, and free interrupts it never requested.
> +	 */
> +	if (!lp->datapath_up)
> +		return 0;

[Severity: Low]
This comment says axienet_resume() can leave the device running after a
failed open. The same patch changes axienet_resume() to call
netif_close() on that failure.

Isn't that netif_close() call the path that actually reaches
axienet_stop() with datapath_up == false?

axienet_resume()
  axienet_open()            <- fails
  netif_close()
    netif_close_many()
      __dev_close_many()
        ops->ndo_stop()     -> axienet_stop()

The device is still IFF_UP at this point, because axienet_suspend()
calls axienet_stop() directly.

Could the comment describe the netif_close() path instead, so the guard
is not later mistaken for dead code and removed?

> +
> +	lp->datapath_up = false;
> +

[ ... ]

> @@ -3419,17 +3446,26 @@ static int axienet_suspend(struct device *dev)
>  static int axienet_resume(struct device *dev)
>  {
>  	struct net_device *ndev = dev_get_drvdata(dev);
> +	int ret;
>  
>  	if (!netif_running(ndev))
>  		return 0;
>  
>  	rtnl_lock();
> -	axienet_open(ndev);
> -	rtnl_unlock();
> -
> +	ret = axienet_open(ndev);
> +	if (ret) {
> +		netdev_err(ndev, "failed to reopen device on resume: %d\n", ret);
> +		/* Drop IFF_UP before reattaching, so that the interface can be
> +		 * brought up again once whatever made open fail is resolved.
> +		 * Reattaching while still up would also let the stack transmit
> +		 * on the datapath open has already torn down.
> +		 */
> +		netif_close(ndev);
> +	}
>  	netif_device_attach(ndev);
> +	rtnl_unlock();
>  
> -	return 0;
> +	return ret;
>  }

[Severity: Medium]
Does this leave the legacy DMA rings allocated and the DMA running
when open fails after the reset?

On the non-dmaengine path, axienet_device_reset() calls
axienet_dma_bd_init(). That allocates lp->tx_bd_v and lp->rx_bd_v
with dma_alloc_coherent(), allocates and maps lp->rx_bd_num RX skbs,
and starts both DMA channels. axienet_device_reset() then runs
mac_init() and enables XAE_OPTION_TXEN | XAE_OPTION_RXEN.

None of the failure exits that follow undo that:

  - mac_init() failing inside axienet_device_reset(), which this
    patch turns into an open failure
  - phylink_fwnode_phy_connect() failing, which returns directly
  - axienet_init_legacy_dma() failing, which goes to err_phy

err_phy only cancels the work items and stops and disconnects
phylink. Nothing calls axienet_dma_stop() or axienet_dma_bd_release(),
and TXEN and RXEN stay set.

With the new datapath_up guard, axienet_stop() will not clean this up
either. That includes the case where it is reached through
netif_close() in axienet_resume():

axienet_resume()
  axienet_open()            <- fails after axienet_dma_bd_init()
  netif_close()
    axienet_stop()          <- datapath_up == false, returns 0

The descriptor rings and the mapped RX skbs are therefore never
freed, and the DMA engine and the MAC keep running while the
interface is down. The next axienet_open() calls
axienet_dma_bd_init() again and overwrites lp->tx_bd_v and
lp->rx_bd_v, which leaks the previous rings.

Should the error paths in axienet_open() unwind axienet_device_reset()
on the legacy path, by stopping the DMA and calling
axienet_dma_bd_release()? Then datapath_up == false would really mean
there is nothing left to tear down.

[Severity: Medium]
This fixes bugs that exist in released kernels. Should it carry Fixes:
tags and go to net as a standalone fix, instead of being the third patch
of the XXV feature series?

The reset return value being overwritten by the
phylink_fwnode_phy_connect() result goes back at least to:

Fixes: 6b1b40f704fc ("net: axienet: Preparatory changes for dmaengine support")

The resume handling that leaves the device IFF_UP after a failed reopen
comes from:

Fixes: a3de357b087e ("net: axiemac: add PM callbacks to support suspend/resume")

Without a Fixes: tag, the stable tooling will not pick up the
datapath_up guard or the netif_close() handling here. In stable kernels,
an ifdown after a failed resume can then hang in napi_disable() with
RTNL held on the legacy DMA path. On the dmaengine path it can release
the DMA channels again and free tx_skb_ring/rx_skb_ring a second time.

[ ... ]

> @@ -702,6 +702,17 @@ static int __axienet_device_reset(struct axienet_local *lp)
>  	}
>  
>  out:
> +	/* On failure the block above is skipped, so clear the flag here.
> +	 * axienet_open() now returns on a reset error without scheduling the
> +	 * statistics work that used to clear it, which would otherwise leave
> +	 * axienet_stat() returning the frozen base until a reset succeeds.
> +	 */
> +	if (ret && (lp->features & XAE_FEATURE_STATS)) {
> +		write_seqcount_begin(&lp->hw_stats_seqcount);
> +		lp->reset_in_progress = false;
> +		write_seqcount_end(&lp->hw_stats_seqcount);
> +	}
> +
>  	mutex_unlock(&lp->stats_lock);
>  	return ret;
>  }

[Severity: Medium]
Does clearing reset_in_progress here leave hw_last_counter[] stale?

At the top of this function, axienet_stats_update(lp, true) stores
the pre-reset counter values in lp->hw_last_counter[] and sets
lp->reset_in_progress. The XAXIDMA_CR_RESET_MASK write that follows
resets the Ethernet core along with the DMA, which zeroes the
statistics counters. On either timeout, the goto out skips the loop
that folds the reset into hw_stat_base[] and reloads
hw_last_counter[].

With reset_in_progress now cleared, axienet_stat() computes

  lp->hw_stat_base[stat] + (counter - lp->hw_last_counter[stat])

where counter is the u32 read back from the core. That value is 0
after the reset. If the DMA reset poll is the one that timed out, it
is whatever the core returns while still held in reset.

For every counter that was non-zero before the reset, the u32
subtraction wraps. ndo_get_stats64 and the ethtool stats then report
values close to 2^32 too high. The next axienet_stats_update(), from
the stats work or the next reset, adds the same wrapped delta into
hw_stat_base[], so the error becomes permanent.

The statistics work this replaces would have hit the same wrap
through axienet_stats_update(lp, false). This patch makes it the
explicit outcome of a failed reset, though.

Should the error path resynchronise hw_last_counter[] from the
hardware when the counters are readable? Or is keeping the frozen
base the safer choice when the core may not have come out of reset?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com
