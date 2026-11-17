Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927917;
	b=ftbvSUvzalHs/5kWJH8eZlX5Z7+GOfpqvw0MDGRu0dbaq0H9RfavYdja08mR8G6GMmQp
	 QtjhG/RL8JSNb5E+ljYx7PMHNniSITwukK5UE4mQevcByhLw3nUFMSM5fpECKP2kwII5u
	 YWPAR0goWbJJtCaonlR/IFHOqnxY30ptQv56JnNUbWpqjSoK4pXLcpHsss/CYGQqrM6Cr
	 T7h9mcmiNj9isx2zIJWEe2KzyD6RGCrO/3Zp6XJ6r4mJThGw03XT5dAUr6pKjeac74obu
	 HXaSiXz1cRZLWGQ2v9uE9/9plsWRVp0WGN4lEmkC6UU7O8XOUFtldk1sxSpUVM0NK8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927917;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kYIE5VNnbQ+YnXDO5z0Y3CG0xrUv+I2tGXAYdynU3Cs=;
	b=jLEVtvCg8QuvXE5mRxizd6ZJUgB4j01ATqKWAnsEOjHiwbzS3w4vRUFEW3L2S2UMtP0H
	 5YkcCg4pGRbF+C5sf1E52C0oexZgYQhqxKEn2Z231lF3wTp7clqTMMo8M7X3WGIJnHsF+
	 4tzb/xj+L6J14kK1XyA9N9v0GVbQzMengUZRhdHfGXudU0Y6TCJVNMs6MilxvM5JCKPkW
	 7SYi044OsNh/xCAMq7SNOuPJXZHITZvIVlDIfkJzldePgglJz7driUSnBe4sIRD5L7xit
	 X4/9r2WnJYfRyiKMNQl86P+Zeb5yabS5jE3e9zdTGQAbI/wxjdsmekkj4EwkwVgSVQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hjWGXiWq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC1606A333;
	Tue, 17 Nov 2026 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hjWGXiWq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFDE1F000C8;
	Tue, 17 Nov 2026 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927917;
	bh=kYIE5VNnbQ+YnXDO5z0Y3CG0xrUv+I2tGXAYdynU3Cs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hjWGXiWqosiyJtmJ/dZwoUa7ZwYet8eRQ6CWDXgdjOLSjgEXMzTYNMJQh2EItdolB
	 w/K7F+OngXpx0NQOnb2jKWu0J1FpHO3GJ330R+VgwDemofQyeP9/Xhj1AvfQacbgX1
	 pOFJ5eDqd3i4Rsl4a+BTO01qPNV7NvXYTSFPtpCH8CVMrZSYWmdqecDEn3aqUMHDAu
	 tVoWfRoNWOxoYkEBdf0g1htQFJNjZE8Wv80i9H8NVsqhHhnNc3tqTmISe15/4UJmgb
	 0S1tuGWR3+//lxwr1y7rDae/DfcTP4hIDOch1AyVGizw87Kr+04X9qpmSliEhxkCly
	 dQ7VH/F7IvNHQ==
Subject: Re: [PATCH net-next v6 2/3] net: ti: icssm-prueth: Add priority based
 RX IRQ handlers
From: netdev-bot+sashiko@kernel.org
To: saivarun@couthit.com
Cc: danishanwar@ti.com, parvathi@couthit.com, rogerq@kernel.org,
 pmohan@couthit.com, vadim.fedorenko@linux.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 afd@ti.com, basharath@couthit.com, arnd@arndb.de, haokexin@gmail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratheesh@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, j-rameshbabu@ti.com, m-malladi@ti.com,
 rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Date: Tue, 17 Nov 2026 15:05:15 +0000
Message-ID: <179492791525.3136.15457759888913099834@kernel.org>
In-Reply-To: <20261113143127.282466-3-saivarun@couthit.com>
References: <20261113143127.282466-3-saivarun@couthit.com>
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 4 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the timer and link-up handlers 'only
  wake the queue on a started port' and that 'TX must not be restarted…
- [Medium] icssm_prueth_common_emac_rx_packets() reads emac_configured
  once per poll into port0_configured/port1_configured.
- [Medium] In the new shared HP/LP RX path,
  icssm_prueth_common_emac_rx_packets() returns early ('if (ret) return…
- [Medium] net: ti: icssm-prueth: of_irq_get_byname() check misses 0 in
  probe
- [Low] The patch fixes a TX-teardown bug that already exists in the
  tree, but the fix is buried in a feature commit with no Fixes: tag.
- [Low] fw_offsets_v1_0 sets .iep_wrap = NSEC_PER_SEC, and its comment
  says the v1.0 32-bit IEP counter 'resets the counter every one second'.
- [Low] The loop in icssm_prueth_common_emac_rx_packets() runs while
  either queue is non-empty, and it re-reads the hardware wr_ptr of any…
- [Low] icssm_emac_adjust_link() now wakes the TX queue only if
  '(prueth->emac_configured & BIT(emac->port_id))', and it reads that…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  extends it to the new shared resources.

--

net: ti: icssm-prueth: Add priority based RX IRQ handlers

This commit adds shared high and low priority RX interrupts and NAPI
instances for switch, HSR and PRP modes. Frames from the two PRU ports are
ordered by their IEP arrival timestamps. It also converts the per-port
stats to atomic64_t, adds a firmware revision field that selects the IEP
wrap value, and reorders TX teardown in icssm_emac_ndo_stop().

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index 4f631dcc4d509..0536b0965c222 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> @@ -44,6 +44,21 @@
>  #define NETIF_PRUETH_LRE_OFFLOAD_FEATURES       (NETIF_F_HW_HSR_FWD | \
>  						 NETIF_F_HW_HSR_TAG_RM)
>  
> +/* ICSSM (v2.1) - supports 64-bit IEP counter.
> + * Firmware stores packet timestamps using lower 32 bits
> + * which wraps at 0xffffffff.
> + */
> +static const struct prueth_fw_offsets fw_offsets_v2_1 = {
> +	.iep_wrap = 0xffffffff,
> +};
> +
> +/* ICSSM (v1.0) - supports 32-bit IEP counter, which resets the
> + * counter every one second (nanosecond resolution).
> + */
> +static const struct prueth_fw_offsets fw_offsets_v1_0 = {
> +	.iep_wrap = NSEC_PER_SEC,
> +};

[Severity: Low]
Where does the one second reset get configured? icssm_emac_ndo_open()
calls icss_iep_init(prueth->iep, NULL, NULL, 0). With cycle_time_ns == 0,
icss_iep_init() takes the plain enable path:

    if (cycle_time_ns)
        icss_iep_enable_shadow_mode(iep);
    else
        icss_iep_enable(iep);
    icss_iep_settime(iep, ktime_get_real_ns());

Only the shadow mode path sets IEP_CMP_CFG_CMP0_RST_CNT_EN and programs
CMP0. The am335x/am437x IEP plat_data also has .flags = 0. Unless the
v1.0 PRU firmware reprograms CMP0 itself, the 32-bit counter would run
free and wrap at 2^32 ns (about 4.29s).

In that case, when both queues are non-empty,
icssm_prueth_common_emac_rx_packets() would treat any real timestamp
difference between 500ms and 2^31 ns as a wrap. It would then deliver
the later frame first.

Should v1.0 use the same 0xffffffff value as v2.1, or does the v1.0
firmware set up the reset on its own?

[ ... ]

> @@ -464,7 +481,8 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
>  
>  	if (emac->link) {
>  	       /* reactivate the transmit queue if it is stopped */
> -		if (netif_running(ndev) && netif_queue_stopped(ndev))
> +		if (netif_running(ndev) && netif_queue_stopped(ndev) &&
> +		    (prueth->emac_configured & BIT(emac->port_id)))
>  			netif_wake_queue(ndev);

[Severity: Low]
This reads emac_configured under emac->lock. However,
icssm_emac_ndo_stop() clears the bit without taking emac->lock, and it
only calls phy_stop() after netif_tx_disable() and hrtimer_cancel().
Could this interleaving happen?

phylib state machine            change_mode()->ndo_stop()
icssm_emac_adjust_link()
  sees bit set, queue stopped
                                emac_configured &= ~BIT(port_id)
                                netif_tx_disable(ndev)
                                hrtimer_cancel(&emac->tx_hrtimer)
  netif_wake_queue(ndev)
                                phy_stop(emac->phydev)

If so, the queue stays awake until phy_stop()'s link-down callback stops
it again. An xmit in that window could re-arm tx_hrtimer after
hrtimer_cancel() has already returned.

[ ... ]

> @@ -1126,11 +1157,28 @@ static int icssm_emac_ndo_stop(struct net_device *ndev)
>  	/* disable the mac port */
>  	icssm_prueth_port_enable(emac, false);
>  
> +	/* Stop TX first. netif_tx_disable() also waits for an xmit that is
> +	 * already running. Then cancel any tx_hrtimer that xmit may have
> +	 * armed.
> +	 */
> +	netif_tx_disable(ndev);
> +	hrtimer_cancel(&emac->tx_hrtimer);

[Severity: Low]
This isn't a bug, but this part of the patch looks like a fix for an
existing problem. It covers three changes:

  - netif_tx_disable() before hrtimer_cancel()
  - the emac_configured checks in icssm_emac_tx_timer_callback() and
    icssm_emac_adjust_link()
  - moving the emac_configured assignment in icssm_emac_ndo_open()

Before this patch, icssm_emac_ndo_stop() never stopped the TX queue, and
the timer callback woke the queue unconditionally. This matters because
icssm_prueth_change_mode() calls ndo_stop()/ndo_open() while the netdev
stays running. icssm_prueth_change_mode() was added by commit
eca327ae9aa6.

None of this depends on the priority IRQ rework. Would it make sense to
split it into a separate patch with a Fixes: eca327ae9aa6 tag, so stable
trees can pick it up?

>  
>  	/* stop PHY */
>  	phy_stop(emac->phydev);
>  
> -	napi_disable(&emac->napi);
> -	hrtimer_cancel(&emac->tx_hrtimer);
> +	if (PRUETH_IS_EMAC(prueth)) {
> +		napi_disable(&emac->napi);
> +		free_irq(emac->rx_irq, ndev);
> +	} else {
> +		if (!prueth->emac_configured &&
> +		    (PRUETH_IS_SWITCH(prueth) || prueth_is_lre(prueth))) {
> +			napi_disable(&prueth->napi_lpq);
> +			napi_disable(&prueth->napi_hpq);
> +		}
> +		/* Free IRQs on last port before halting PRU */
> +		icssm_prueth_common_free_irqs(emac);
> +	}

[Severity: High]
This is a pre-existing issue, but this patch extends it to the new shared
NAPIs and IRQs. What happens here if an earlier ndo_open() call from
icssm_prueth_change_mode() or icssm_prueth_resume() failed?

Both callers return the error, and the netdev stays netif_running():

icssm_prueth_change_mode() {
    ...
		ret = ndev->netdev_ops->ndo_open(ndev);
		if (ret < 0) {
			netdev_err(ndev, "failed to start: %d", ret);
			return ret;
		}
    ...
}

ndo_open() can fail in two ways here:

  - icssm_prueth_sw_boot_prus() fails, for example because the
    switch/HSR/PRP firmware file is missing. napi_hpq and napi_lpq are
    then never enabled.
  - icssm_prueth_common_request_irqs() fails. Its error path disables
    them again.

Either way, emac_configured stays 0 and the rx_hp/rx_lp IRQs are not
held.

Later, dev_close or unregister_netdev() calls icssm_emac_ndo_stop(). It
decides only from !prueth->emac_configured, so it calls napi_disable() on
a NAPI that is already disabled.

Wouldn't napi_disable_locked() then spin forever with RTNL held? A
disabled NAPI keeps NAPIF_STATE_SCHED and NAPIF_STATE_NPSVC set.

If that loop were ever passed, icssm_prueth_common_free_irqs() would free
IRQs that were never requested. The PRU shutdown and icss_iep_exit()
would also run a second time.

Before this patch, the same problem existed for emac->napi and
emac->rx_irq.

[ ... ]

> @@ -1684,6 +1729,11 @@ static enum hrtimer_restart icssm_emac_tx_timer_callback(struct hrtimer *timer)
>  {
>  	struct prueth_emac *emac =
>  			container_of(timer, struct prueth_emac, tx_hrtimer);
> +	struct prueth *prueth = emac->prueth;
> +
> +	/* Don't restart TX on a port that ndo_stop() is tearing down */
> +	if (!(READ_ONCE(prueth->emac_configured) & BIT(emac->port_id)))
> +		return HRTIMER_NORESTART;
>  
>  	if (netif_queue_stopped(emac->ndev))
>  		netif_wake_queue(emac->ndev);

[Severity: Medium]
The commit message says "the timer and link-up handlers only wake the
queue on a started port". Is this check enough to guarantee that?

The check and the wake are not atomic with respect to
icssm_emac_ndo_stop(). That function clears the bit with a plain
read-modify-write and calls netif_tx_disable() before hrtimer_cancel():

CPU1 (tx_hrtimer callback)      CPU2 (change_mode()->ndo_stop())
reads bit as set
                                emac_configured &= ~BIT(port_id)
                                netif_tx_disable(ndev)
netif_wake_queue()
                                hrtimer_cancel() waits, returns

In the change_mode path the qdisc stays active. So
icssm_emac_ndo_start_xmit() could then write into the PRU TX queues at
two bad moments:

  - while the PRUs are shut down
  - while the following ndo_open() clears shared RAM/OCMC in
    icssm_prueth_hostinit()

On -ENOBUFS, xmit could also re-arm tx_hrtimer after hrtimer_cancel() has
returned.

The plain "|=" and "&= ~" writes racing with READ_ONCE() readers in
hardirq context also look like a data race KCSAN would report.

Would any of these close the window?

  - clear the bit with WRITE_ONCE()
  - call hrtimer_cancel() before netif_tx_disable() (and again after)
  - do the check and the wake under a lock that ndo_stop() also takes

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> new file mode 100644
> index 0000000000000..992fadc1521f9
> --- /dev/null
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> @@ -0,0 +1,337 @@

[ ... ]

> +	port0_configured = READ_ONCE(prueth->emac_configured) &
> +			   BIT(emac->port_id);
> +	port1_configured = other_emac &&
> +			   (READ_ONCE(prueth->emac_configured) &
> +			    BIT(other_emac->port_id));

[Severity: Medium]
This snapshot is taken once per poll and then gates the whole loop, up to
the full budget. It covers access to rx_queue_descs, the rd_ptr writes,
BD zeroing, and icssm_emac_rx_packet()->netif_receive_skb() on that
port's netdev.

When one port is stopped while the peer stays up, icssm_emac_ndo_stop()
clears the bit. It does not disable or synchronise napi_hpq/napi_lpq,
because it only does that once emac_configured reaches 0.

Can a poll already running on another CPU keep dequeuing the stopped
port's host queue after ndo_stop() has returned? If so, it would:

  - deliver skbs to a netdev that is down
  - update that port's stats
  - in switch mode, do FDB learning for the stopped port

On the open side, rx_queue_descs is published only by a plain
"emac_configured |= BIT(...)" in icssm_emac_ndo_open(). Here it is read
back through READ_ONCE() plus a control dependency, which does not order
the later load of emac->rx_queue_descs.

Should the single-port stop path wait for an in-flight hpq/lpq poll
rather than relying on the flag?

[ ... ]

> +		if ((*pkt_info_p).length < EMAC_MIN_PKTLEN) {
> +			/* Undersized frame: firmware should have filtered
> +			 * it, so the read pointer can't be trusted. Drop
> +			 * everything pending in this queue by moving the
> +			 * read pointer to the write pointer.
> +			 */
> +			update_rd_ptr = *bd_wr_ptr_p;
> +			atomic64_inc(&emac_p->stats.rx_length_errors);
> +		} else if ((*pkt_info_p).length > EMAC_MAX_FRM_SUPPORT) {
> +			/* Oversized frame: same handling as above */
> +			update_rd_ptr = *bd_wr_ptr_p;
> +			atomic64_inc(&emac_p->stats.rx_length_errors);
> +		} else {
> +			update_rd_ptr = *bd_rd_ptr_p;
> +			ret = icssm_emac_rx_packet(emac_p, &update_rd_ptr,
> +						   pkt_info_p, rxqueue_p);
> +			if (ret)
> +				return used;

[Severity: Medium]
Can RX on this priority stall here? If icssm_emac_rx_packet() fails, for
example because netdev_alloc_skb_ip_align() returns NULL, frames are
still pending behind rd_ptr.

The poll callbacks then see num_rx_packets < budget, complete NAPI and
unmask the IRQ:

    if (num_rx_packets < budget && napi_complete_done(napi, num_rx_packets))
        enable_irq(prueth->rx_hpq_irq);

The rx_hp/rx_lp lines are PRUSS INTC system events. pruss_intc_irq_ack()
writes PRU_INTC_SICR when the IRQ is handled, which clears the latched
status. So nothing signals the pending frames again until the firmware
raises a new event for a later frame on the same priority. Until then
the frames stay in OCMC and the queue can overflow.

[ ... ]

> +		port0_q_empty = (bd_rd_ptr == bd_wr_ptr) ? 1 : 0;
> +		if (port0_q_empty && port0_configured) {
> +			bd_wr_ptr = readw(&queue_desc->wr_ptr);
> +			port0_q_empty = (bd_rd_ptr == bd_wr_ptr) ? 1 : 0;
> +		}
> +		port1_q_empty = (bd_rd_ptr_o == bd_wr_ptr_o) ? 1 : 0;
> +		if (port1_q_empty && port1_configured) {
> +			bd_wr_ptr_o = readw(&queue_desc_o->wr_ptr);
> +			port1_q_empty = (bd_rd_ptr_o == bd_wr_ptr_o) ? 1 : 0;
> +		}
> +
> +		if (used >= quota)
> +			return used;

[Severity: Low]
Is this loop bounded by the NAPI budget? Only frames delivered by
icssm_emac_rx_packet() increment used. The undersized and oversized
branches above only move rd_ptr to wr_ptr and bump rx_length_errors.

The hardware wr_ptr is also re-read on every pass. So while firmware
keeps producing BDs with an invalid length, used >= quota is never
reached and the loop keeps running in softirq context.

icssm_emac_rx_packets() in the EMAC path takes one wr_ptr snapshot per
queue, so it is bounded by the queue size. Should dropped frames count
toward quota here as well?

[ ... ]

> @@ -2293,6 +2374,41 @@ static int icssm_prueth_probe(struct platform_device *pdev)
>  	if (has_lre && (!eth0_node || !eth1_node))
>  		has_lre = false;
>  
> +	/* Switch and LRE share HPQ/LPQ IRQs across both ports,
> +	 * allocate the shared priority structures once here
> +	 */
> +	if (prueth->fw_data->support_switch || has_lre) {
> +		prueth->hp = devm_kzalloc(dev,
> +					  sizeof(struct prueth_ndev_priority),
> +					  GFP_KERNEL);
> +		if (!prueth->hp) {
> +			ret = -ENOMEM;
> +			goto free_pool;
> +		}
> +		prueth->lp = devm_kzalloc(dev,
> +					  sizeof(struct prueth_ndev_priority),
> +					  GFP_KERNEL);
> +		if (!prueth->lp) {
> +			ret = -ENOMEM;
> +			goto free_pool;
> +		}
> +
> +		prueth->rx_lpq_irq = of_irq_get_byname(np, "rx_lp");
> +		if (prueth->rx_lpq_irq < 0) {
> +			ret = prueth->rx_lpq_irq;
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(prueth->dev, "could not get rx_lp irq\n");
> +			goto free_pool;
> +		}
> +		prueth->rx_hpq_irq = of_irq_get_byname(np, "rx_hp");
> +		if (prueth->rx_hpq_irq < 0) {
> +			ret = prueth->rx_hpq_irq;
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(prueth->dev, "could not get rx_hp irq\n");
> +			goto free_pool;
> +		}
> +	}
> +
>  	prueth->support_lre = has_lre;
>  	spin_lock_init(&prueth->addr_lock);
>  	/* setup netdev interfaces */

[Severity: Medium]
of_irq_get_byname() returns 0, not a negative errno, when the
interrupt is described in DT but the mapping in
irq_create_of_mapping() fails. Both checks here only test for < 0.
In that case probe succeeds silently and prueth->rx_lpq_irq or
prueth->rx_hpq_irq is left as 0.

The failure then only shows up much later. When the first port is
opened in switch, HSR or PRP mode, icssm_prueth_common_request_irqs()
calls request_irq() on IRQ 0. On the icssm_prueth_change_mode()
path, that means a bridge or HSR join fails while the ports are
being reopened. The only message is "unable to request RX HPQ IRQ",
which points away from the real cause in probe.

Could these be checked with <= 0, with 0 mapped to an error such as
-ENXIO? The lookup is done on dev->of_node of the platform device,
so platform_get_irq_byname() might be simpler. It never returns 0
and already prints an error for anything other than -EPROBE_DEFER.

The existing per-port emac->rx_irq lookup in
icssm_prueth_netdev_init() has the same < 0 check. It uses the
child eth_node, so it would need the explicit <= 0 check rather than
the platform helper.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113143127.282466-1-saivarun%40couthit.com
