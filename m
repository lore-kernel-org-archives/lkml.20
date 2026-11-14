Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700762;
	b=4jwDx2Xv8er17lXdArN8Ls8eEcWvv/T1ukEEdsTQkPTe81ihl9m+8WpgTyCInV+jNr08
	 W7bsb2Q6uYs5Uxx50W3jHa79RcmcN8vujWpth3WVIgLmF1OGX0SFDix+Gn6ti8102aJOJ
	 d5qVaqRducCnp/SvjwboRCu5baYJxC3U3PZn0ZavWes1wkcB/WvHLYv10Ldf2Cy1M2AaV
	 52lk8JEmpDG9bGXUlUKZTowdMUOUN5anQSmCFc0IeO5mZO5tiE3ZgTeAfPYXflO6IM2wr
	 1eTRPlGbjA1MvLuDlFvL7a9c36wpJMgf8WJpU2x7yf0aDxviyqi4c3FUVoC/M78GblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700762;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nG1w6A1hsSv+6HSXqZDnvdFJiy4dew0fqW8CJFaNN5U=;
	b=A+Dgm+7be3aBhTa36HjlNAdqygvqYG1gx8733kedV32Ud5AcBcGLhWAuFhzKci+dW0a8
	 JUNH69aSPUkn7/X/NzwYKDpXo5vxN58eovUar1TpKQdP8WdeepSVB62KHYT7CoAPV49xt
	 3LDPdXsBB7KEYAMsgTxu+kx5Exr/FfCHjiRuHPpRkjJXBUfCdqWRZW0xuE9XRHR6oMmQK
	 jhBUxecYPQxBQNbuqc/QM1snegjJTxYi6DZ5MTmr/XZHARAo2hS1wQWvxYj7vdAK4ZfIJ
	 q1+dd0KwdW5NHUQHmfP++NkftExvtFfVFYSVWL9rn0rNAYm4iw/xndKufuKXELeVZdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+rmlvnH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C3606A33D;
	Sat, 14 Nov 2026 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+rmlvnH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289B01F000C4;
	Sat, 14 Nov 2026 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794700761;
	bh=nG1w6A1hsSv+6HSXqZDnvdFJiy4dew0fqW8CJFaNN5U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G+rmlvnHDifDWrwvV0m6tN51uQTP+9SsdvrkJ4JEn1eY3AHP4RF90ubqw+REKDF9Q
	 8gVzrYQAa86pY4/+2bZ6xHC6r1wm4j6bof8XXaTWxZgJtKfVj5Ln7nJJ9+z4o6gerR
	 TVVnnSkc9o7CL5dBrRQ0OZ+D+cjKi/0WtusfTk38yBFvSXGE2zqxRnFoFtGqTfp8LQ
	 ZleIVlKK6fAWAdk6TJOXzUqozQQzvHXfAZk81Z4UCQXPyA7ZTlKaZYrBnPhha+w1c0
	 s4DnBeAjtHRETE0cam+l+q5Qw0qn5cbXBEcVwBL1700Np6KBPXjLshoLr5/EzVb1w9
	 aNvsyCBlHBTjg==
Subject: Re: [PATCH net v3 3/7] net: bcm4908_enet: release the TX ring on stop
From: netdev-bot+sashiko@kernel.org
To: kudzo51@gmail.com
Cc: netdev@vger.kernel.org, f.fainelli@gmail.com,
 florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Sat, 14 Nov 2026 23:59:20 +0000
Message-ID: <179470076069.2199510.1686262935220583765@kernel.org>
In-Reply-To: <20261113235847.517308-4-kudzo51@gmail.com>
References: <20261113235847.517308-4-kudzo51@gmail.com>
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

Critical: 0 · High: 0 (3) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch does not fix the TX skb leak when the TX channel
  times out, and on that path it leaves the hardware running.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it makes the
  new TX-ring release in bcm4908_enet_stop() unreachable when the DT has…
- [High] This problem wasn't introduced by this patch, but the patch
  applies the 'do not free buffers the DMA may still use' reasoning only…
- [High] This problem wasn't introduced by this patch, but the patch now
  depends on the code it bypasses.

--

net: bcm4908_enet: release the TX ring on stop

This patch makes bcm4908_enet_stop() wait for the TX DMA channel to stop
and then unmap and free the skbs left in the TX ring. If the channel does
not stop in time, the free is skipped. It also clears the TX descriptors
in bcm4908_enet_dma_ring_init(), drops the OWN check from
bcm4908_enet_start_xmit(), and fixes the RX timeout warning text.

> diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
> index b1738d954b91a..bb42b6ecde16a 100644
> --- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c

[ ... ]

> @@ -313,6 +314,11 @@ static void bcm4908_enet_dma_ring_init(struct bcm4908_enet *enet,
>  	enet_write(enet, ring->st_ram_block + ENET_DMA_CH_STATE_RAM_BASE_DESC_PTR,
>  		   (uint32_t)ring->dma_addr);
>  
> +	/* A descriptor the stopped DMA never completed still carries OWN */
> +	if (ring->is_tx)
> +		memset(ring->buf_desc, 0,
> +		       ring->length * sizeof(*ring->buf_desc));
> +
>  	ring->read_idx = 0;
>  	ring->write_idx = 0;
>  }

[Severity: High]
This is a pre-existing issue, but the TX descriptor clear and index reset
added here only run if bcm4908_enet_dma_init() gets through the RX buffer
allocation loop:

bcm4908_enet_dma_init() {
	for (i = 0; i < rx_ring->length; i++) {
		err = bcm4908_enet_dma_alloc_rx_buf(enet, i);
		if (err) {
			dev_err(dev, "Failed to alloc RX buffer: %d\n", err);
			bcm4908_enet_dma_uninit(enet);
			return err;
		}
	}

	bcm4908_enet_dma_ring_init(enet, &enet->tx_ring);
	bcm4908_enet_dma_ring_init(enet, &enet->rx_ring);
	...
}

bcm4908_enet_open() ignores that return value:

	bcm4908_enet_dma_reset(enet);
	bcm4908_enet_dma_init(enet);

	enet_umac_set(enet, UMAC_CMD, CMD_TX_EN | CMD_RX_EN);

	enet_set(enet, ENET_DMA_CONTROLLER_CFG, ENET_DMA_CTRL_CFG_MASTER_EN);

If napi_alloc_frag() or dma_map_single() fails for any RX slot, the
interface still comes up with MASTER_EN set and the RX channel enabled.
bcm4908_enet_dma_reset() has just set ENET_DMA_CH_STATE_RAM_BASE_DESC_PTR
to 0, and nothing programs it again. ndo_open still returns 0.

The OWN check is now removed from bcm4908_enet_start_xmit(), so this
memset is the only thing that stops start_xmit() from reusing a
descriptor that still has OWN set. After an earlier timed-out stop,
wouldn't the stale read_idx/write_idx and OWN descriptors survive this
path?

Should bcm4908_enet_open() check the result of bcm4908_enet_dma_init()
and unwind on failure?

[ ... ]

> @@ -509,8 +546,10 @@ static int bcm4908_enet_stop(struct net_device *netdev)
>  	netdev_reset_queue(netdev);

[Severity: High]
This isn't a bug introduced by this patch, but can the new TX clean be
reached when the DT has no "tx" interrupt?

The binding allows a single interrupt (minItems: 1). In that case
enet->irq_tx is negative and bcm4908_enet_open() skips the TX
napi_enable():

	if (enet->irq_tx > 0) {
		napi_enable(&tx_ring->napi);
		...
	}

bcm4908_enet_stop() calls napi_disable(&tx_ring->napi) unconditionally,
just above this hunk. netif_napi_add_weight_locked() sets
NAPI_STATE_SCHED and NAPI_STATE_NPSVC, and only napi_enable() clears
them. So napi_disable_locked() would loop forever:

	while (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
		usleep_range(20, 200);
		val = READ_ONCE(n->state);
	}

That hangs ndo_stop with RTNL held, before bcm4908_enet_tx_ring_clean()
is reached.

The same configuration also breaks TX. The irq_tx < 0 branch in
bcm4908_enet_start_xmit() calls napi_schedule() on a NAPI that still has
SCHED set. napi_schedule_prep() then fails, so bcm4908_enet_poll_tx()
never runs. After 199 frames the queue stops and nothing wakes it.

>  
>  	bcm4908_enet_dma_rx_ring_disable(enet, &enet->rx_ring);
> -	bcm4908_enet_dma_tx_ring_disable(enet, &enet->tx_ring);
>  
> +	/* Leave the TX buffers alone if the channel may still read them */
> +	if (!bcm4908_enet_dma_tx_ring_disable(enet, &enet->tx_ring))
> +		bcm4908_enet_tx_ring_clean(enet);

[Severity: Medium]
What happens to the skbs between read_idx and write_idx when
bcm4908_enet_dma_tx_ring_disable() times out?

On that path bcm4908_enet_tx_ring_clean() is skipped and nothing else is
done to the hardware. The TX subchannel is not reset through
ENET_DMA_CTRL_CHANNEL_RESET, and both ENET_DMA_CTRL_CFG_MASTER_EN and
UMAC CMD_TX_EN stay set.

Nothing frees those slots later either. On the next open,
bcm4908_enet_dma_reset() clears MASTER_EN, and
bcm4908_enet_dma_ring_init() resets the channel, clears the descriptors
and zeroes the indexes. None of that unmaps or frees what is left in
tx_ring->slots[].

Doesn't that leak the skbs, their DMA_TO_DEVICE mappings and the socket
memory they hold? The commit message says this leak is fixed.

If the device is unbound instead, the path is bcm4908_enet_remove() ->
unregister_netdev() -> bcm4908_enet_stop(), then
bcm4908_enet_dma_free(). That kfree()s tx_ring->slots without freeing
the skbs. It also calls dma_free_coherent() on the TX descriptor ring,
although the TX channel was never confirmed stopped or reset.

The comment reads as if the free is only postponed. Could the timeout
path force the channel idle first (reset the TX subchannel and/or clear
MASTER_EN, as ring_init() and dma_reset() do) and then clean the ring?

>  	bcm4908_enet_dma_uninit(enet);

[Severity: High]
This is a pre-existing issue, but doesn't the same reasoning apply to RX?
There the device writes into the buffers.

bcm4908_enet_dma_rx_ring_disable() returns void and only warns on
timeout. bcm4908_enet_dma_uninit() is then called unconditionally:

bcm4908_enet_dma_uninit() {
	...
		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_FROM_DEVICE);
		skb_free_frag(slot->buf);
		slot->buf = NULL;
	...
}

The RX descriptors still have DMA_CTL_STATUS_OWN and the buffer bus
address set by bcm4908_enet_dma_alloc_rx_buf(), and MASTER_EN is not
cleared.

If the RX channel has not stopped, can received frames be DMA-written
into pages that have already gone back to the page allocator?

Later patches in this series only change the unmap size in
bcm4908_enet_dma_uninit() and do not add a guard here.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113235847.517308-1-kudzo51%40gmail.com
