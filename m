Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795779;
	b=Z4U1ZjZbl+4AOSl+GAtxFGDwo+z1cKbo6IDVkm95p1DAXvl27Em2mjucUCrt9aBLcGCX
	 63lsvLzaWPVNa4YXTFkzWNFbW5D1atwOkHTiQ6o+INAZFOtMPoyQWH0RNt6gx0UIqQeci
	 iAIiuc/lGN05NwkOiST1XNKuy+kEduLfqgGOhpewwt4mkpzzc/WvNu8v1lrI5wxtngPDK
	 Y/oicSAm/FnWiicwa0OEe76SYLgjgR+tv+atMXVOed81wnwySeLIvs4r1kqWjvGdW/fLd
	 8MdRbOZZbwrsJpRb4w1WtvdootW/Vyu2WgndOzgp7lxgI0cPcCyf/AjnEu5zF083IYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795779;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=H8v1n9Bkwfi2oQdq8IFxXuMktxhzrjIcOdZ4XCJh+I8=;
	b=dnWfG/R0EnlauxipLtPw7hfr1nSxEcOK7LACfxnDV11Q4skW+lALQ/7LwDzkj6yUlq3i
	 DI45cFukqCxxumURn8ml1XRNT6p+4cnun3sQUSCYuySpBZrH16dOH4KSXT01Pdnt4PQ2m
	 Ah5r6l8DmFEZaJteimazdSdlbRhtl/K3HYMKm1We/AM79qgkrpuyL2YGoIRXIcp3g6hTj
	 TClzaaD0oNmMxQum7QQpo66wsoYSRRicxC4pGvVUfJva1TFUY13uxMLMN04FQlpNPx6El
	 HEFrnNuYrjKjo118+fDQ9QC/Iy4QTlcGa552zJYaxJ+lv4nU3mSvcqG5KH+7fK1Oamw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VolphhWn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29071606A31C;
	Mon, 16 Nov 2026 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VolphhWn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CD11F000C5;
	Mon, 16 Nov 2026 02:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794795778;
	bh=H8v1n9Bkwfi2oQdq8IFxXuMktxhzrjIcOdZ4XCJh+I8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VolphhWnzeioav+c1Xc8VD5MPbdkZ4EJb2fyqE82O73RHyjWQGrTIO8s5m7lBK4Te
	 CyGboMJ0YGEqmsTCX1MDTzDO8Pv/0tULCh3A+NQhMH9FMzS4nRh5IqX9B3fsqhxUd0
	 pQefN9SQ05T+8XLFN5jjJjd1+pomiBznsOVUovlsJQMxpgG+FY8ZQELB874K/i22er
	 QTAqAH6yDz3kalGDtoG3YPJjY0MGFGYkt7Ihy2h7WEyXFCoz5p1LfU9QsEntvlVDLB
	 Bz00CWHnnXX19pCyDt3ey3iJhgoQm22px2cOqseMgbEgIdVfxVu518/ptspsvKavB5
	 kNVQuwL7nBrDw==
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
From: netdev-bot+sashiko@kernel.org
To: janislacis06@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 02:22:57 +0000
Message-ID: <179479577764.3136.18033299607451586926@kernel.org>
In-Reply-To: <20261114222744.535158-1-janislacis06@gmail.com>
References: <20261114222744.535158-1-janislacis06@gmail.com>
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

Critical: 0 · High: 0 (2) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch uses `budget_left > 0` in spl2sw_rx_poll() as the
  only sign that all work is done.
- [Low] The commit message says what changes but not what goes wrong
  today.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  spl2sw_remove() frees the descriptor rings and buffers before it…
- [High] This problem wasn't introduced by this patch, but
  spl2sw_rx_poll() leaves a broken ring slot behind when it fails to…

--

net: ethernet: sunplus: check budget before calling napi_complete_done()

This commit replaces napi_complete() with napi_complete_done() in the
spl2sw RX and TX poll functions. NAPI is only completed when budget_left
is greater than zero. The RX/TX interrupt is only unmasked when
napi_complete_done() returns true.

> Sunplus drivers currently do napi_complete() after each rx/tx poll is
> done without checking whether budget was exhausted or not. Interrupts
> are also unmasked before the call to napi_complete().

[Severity: Low]
Can the budget actually be exhausted here in normal operation?

spl2sw_probe() registers both NAPI instances with netif_napi_add(), so
they use NAPI_POLL_WEIGHT (64). spl2sw_rx_poll() handles at most
rx_desc_num[0] + rx_desc_num[1] = 32 descriptors per call, because the
inner loop is bounded by num < rx_count. spl2sw_tx_poll() holds tx_lock
and reclaims at most TX_DESC_NUM = 16 descriptors.

That means budget_left is always > 0 for polls from net_rx_action(). The
new check only changes anything for budget 0 (netpoll's poll_one_napi())
or a small busy-poll budget.

In those cases the old napi_complete() already did nothing, because
napi_complete_done() returns false right away when NAPIF_STATE_NPSVC or
NAPIF_STATE_IN_BUSY_POLL is set. The only visible effect of the old code
was that MAC_INT_RX/MAC_INT_TX got unmasked while netpoll or busy-poll
owned the instance.

Could the commit message describe that actual impact, so the Fixes: tag
and a stable backport can be judged?

> I do not have the hardware necessary, this patch is not tested on real
> hardware.

This note is in the commit body rather than below the --- line, so it
would end up in git history.

> diff --git a/drivers/net/ethernet/sunplus/spl2sw_int.c b/drivers/net/ethernet/sunplus/spl2sw_int.c
> index a37c9a4c281f0..1aada11429d4d 100644
> --- a/drivers/net/ethernet/sunplus/spl2sw_int.c
> +++ b/drivers/net/ethernet/sunplus/spl2sw_int.c
> @@ -125,13 +125,14 @@ int spl2sw_rx_poll(struct napi_struct *napi, int budget)
>  			h_desc = comm->rx_desc[queue] + rx_pos;
>  	}
>  
> -	spin_lock_irqsave(&comm->int_mask_lock, flags);
> -	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
> -	mask &= ~MAC_INT_RX;
> -	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
> -	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
> +	if (budget_left > 0 && napi_complete_done(napi, budget - budget_left)) {

[Severity: Medium]
Is budget_left > 0 enough to show that all RX work is done? Normal polls
never bring it to 0, but spl2sw_rx_poll() can still stop while completed
descriptors are pending.

The first case is the high-priority early break in the low-priority loop:

			if (queue == 1 && !(h_desc->cmd1 & RXD_OWN))
				break;

queue 1 is the last queue (RX_DESC_QUEUE_NUM == 2), so this goes straight
to the completion check while new high-priority packets are waiting.

The second case is a queue's inner loop stopping at the ring limit:

		for (num = 0; num < rx_count && budget_left; num++) {

Descriptors given back with RXD_OWN earlier in the loop may already have
been refilled by the hardware.

In both cases the poll returns less than budget, calls
napi_complete_done() and clears MAC_INT_RX in L2SW_SW_INT_MASK_0 while
work is still pending. Documentation/networking/napi.rst says a poll with
outstanding work should return exactly budget and not complete.

The cost depends on whether L2SW_SW_INT_STATUS_0 latches RX events while
masked. If it does, this costs an extra interrupt round-trip. If it
doesn't, the pending packets wait for the next RX event.

Would it work better to track these more-work conditions explicitly and
return budget in those cases, instead of relying on budget_left alone?

[Severity: High]
This isn't a bug introduced by this patch, but spl2sw_rx_poll() leaves a
broken ring slot behind when an RX buffer refill fails:

spl2sw_rx_poll() {
	...
			new_skb = netdev_alloc_skb(NULL, comm->rx_desc_buff_size);
			if (unlikely(!new_skb)) {
				desc->cmd2 = (rx_pos == comm->rx_desc_num[queue] - 1) ?
					     RXD_EOR : 0;
				sinfo->skb = NULL;
				sinfo->mapping = 0;
				desc->addr1 = 0;
				goto spl2sw_rx_poll_alloc_err;
			}
	...
}

The dma_mapping_error() branch does the same. Both jumps skip
desc->cmd1 = RXD_OWN, so cmd1 keeps the stale completed status the
hardware wrote, and nothing ever refills the slot.

After 15 more packets on that queue, rx_pos wraps back to this slot. The
RXD_OWN check doesn't stop the loop, and the stale status passes the
port, length and error checks:

			dma_unmap_single(&comm->pdev->dev, sinfo->mapping,
					 comm->rx_desc_buff_size, DMA_FROM_DEVICE);

			skb = sinfo->skb;
			skb_put(skb, pkg_len - 4); /* Minus FCS */

Can this call dma_unmap_single() on mapping 0 and then skb_put() on a
NULL skb in the NET_RX softirq?

There is also a second path. On a TX timeout, spl2sw_mac_soft_reset()
calls spl2sw_rx_descs_flush(), which gives the slot back to the hardware
with RXD_OWN set:

			rx_desc[j].addr1 = rx_skbinfo[j].mapping;

Could the hardware then DMA a received frame to bus address 0?

One fix would be to keep the old buffer in the ring and drop the packet
when the refill fails. Another would be to retry the refill on later
polls and never treat a slot without an skb as completed.

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but spl2sw_remove() frees the
rings that both poll functions use before it disables NAPI:

drivers/net/ethernet/sunplus/spl2sw_driver.c:spl2sw_remove() {
	...
	comm->enable = 0;
	spl2sw_mac_hw_stop(comm);
	spl2sw_descs_free(comm);

	/* Disable and delete napi. */
	napi_disable(&comm->rx_napi);
	netif_napi_del(&comm->rx_napi);
	napi_disable(&comm->tx_napi);
	netif_napi_del(&comm->tx_napi);
	...
}

spl2sw_descs_free() frees the RX skbs and rx_skb_info arrays, frees the
TX skbs in spl2sw_tx_descs_clean() without holding tx_lock, sets
comm->tx_desc and comm->rx_desc[i] to NULL and frees desc_base with
dma_free_coherent().

unregister_netdev() and spl2sw_mac_hw_stop() don't stop a NAPI instance
that is already scheduled. Only napi_disable() cancels the NAPI hrtimer.

With napi_defer_hard_irqs and gro_flush_timeout set,
napi_complete_done() keeps returning false and re-arms the timer.
napi_watchdog() then schedules the poll again with no interrupt needed.
Without those settings there is still a window if NAPI was scheduled just
before ndo_stop masked the interrupts.

If remove runs in that window, spl2sw_rx_poll() would do:

			desc = comm->rx_desc[queue] + rx_pos;
			cmd = desc->cmd1;

with a NULL comm->rx_desc[queue], and spl2sw_tx_poll() would read
comm->tx_desc[tx_done_pos].cmd1 the same way. A TX poll running at the
same time as spl2sw_tx_descs_clean() could also call dev_kfree_skb_irq()
on an skb that dev_kfree_skb_any() is already freeing.

This patch doesn't widen the window, since normal polls still complete
after one pass.

Should napi_disable() for both instances move before spl2sw_descs_free()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114222744.535158-1-janislacis06%40gmail.com
