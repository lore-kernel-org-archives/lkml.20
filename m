Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700761;
	b=QKw6FlL/dCq3jK8fAGdxeGEAgj89Wp2z9KJjL/X+VDk76exFehAGNlU9EcLCuuiHm3KJ
	 5T0z5uqjM7SNJQP0jabbUzRSkB3e5DDpPBrUAxuMeCEebe+baDVaumAbj/WUg8RpYA/qt
	 pK9kcQ/BUIx75c/UG1NyIZTqfGx/ko5Jax/ceq7XcalcEEDxpMGOORnaHIHcIv9ZfZxyk
	 bIxIpRaTqVz1SqKcgHq1BDO2DL6jrW3JIjBSBJjUMYE84H9C//+n1fGvU/+1wPcQEacMO
	 36+NsieY5ZGvSDhuAqiFPms64n7wkXrM6B3NNdX/sV/Vqn2ybhvI4AyjkFg0QfKjW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700761;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1//nYzv/qOAjL6VO4zOzNwURg0Vr7a2QvDbvojCkm+8=;
	b=BBn0N76SYcycuqhBvs4IzmbFgNJZhUlskuqAywp7B9nCeUh3Uy3+g0z875SP49esM6wd
	 LJrhi9dBIX3PDstYo7xE8NGjMSPUroQAufRCoQoLz6BOxAjaQySKxNPrAzrbGyzI8+bMq
	 B6VqNgt2y05HVpqW67V8nFEbQ3aAhjoKEw6g8yqZovSn9cUjIr1mj/7Y810auwFph+xg5
	 9k8JA/G/XM1MSCvt3NrMXlt7QigtuDGbVer75h3M4qFwgHQ1ewxjeJaL9uOPL+U/KTWd5
	 JBq5zNfN6dtRMZ7Exr49dYV1NJvaw0POsi2MJOsb433bQIk4Q4K8CqcjKSZwevvDYPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hzVjX/PD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD2606A32C;
	Sat, 14 Nov 2026 23:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzVjX/PD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E601F1F000C4;
	Sat, 14 Nov 2026 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794700760;
	bh=1//nYzv/qOAjL6VO4zOzNwURg0Vr7a2QvDbvojCkm+8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hzVjX/PD+PH9i3d+t0cTR0nbyhLrEvDxT0pDsW0ER/XefIx1eVbWGDd5cNnjO3IzW
	 XE+nZ4upsj1xtjmqvqbjquP4k4+LUgVAXVhhn9CVYFChFAMGiux1SL+PjkhYnPAc67
	 e1M+57BdJh7HiLGscPG2yySPNL+WdCONOMCVSUWTtY6zzHLk2vej27HAOvl2dD014i
	 E8b3eqa+QVIKyqGZJbcRCIwxMJ0ar0BiJs6CMdk8MaY5w+IGUWL4hORUG3rC+ckxpd
	 YCqX/g0eZqFmLOdg0dW7uWAW4F8S6mB944SuEXzwFNtQ4uJpKQ+bKtGvl+HtTe9oPF
	 gpzdnGS6Sgkmw==
Subject: Re: [PATCH net v3 1/7] net: bcm4908_enet: fix the TX ring wrap
From: netdev-bot+sashiko@kernel.org
To: kudzo51@gmail.com
Cc: netdev@vger.kernel.org, f.fainelli@gmail.com,
 florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Sat, 14 Nov 2026 23:59:19 +0000
Message-ID: <179470075948.2199510.6017536287961686127@kernel.org>
In-Reply-To: <20261113235847.517308-2-kudzo51@gmail.com>
References: <20261113235847.517308-2-kudzo51@gmail.com>
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

Critical: 0 · High: 0 (1) · Medium: 1 (3) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] bcm4908_enet_start_xmit()
  (drivers/net/ethernet/broadcom/bcm4908_enet.c:553-555) still has a…

Pre-existing issues:
- [High] The DT binding makes the 'tx' interrupt optional (interrupts
  minItems: 1), and bcm4908_enet_probe() keeps a negative enet->irq_tx…
- [Medium] At this commit, bcm4908_enet_stop() never reaps the TX ring.
- [Medium] At this commit, the lockless TX ring protocol between
  bcm4908_enet_start_xmit() and bcm4908_enet_poll_tx() publishes and…
- [Medium] At this commit, bcm4908_enet_start_xmit() writes
  buf_desc->addr and then buf_desc->ctl (with OWN) to…

--

net: bcm4908_enet: fix the TX ring wrap

The patch fixes the mismatch between how start_xmit() and poll_tx() wrap
the TX ring indexes. Before the fix, a full ring could look empty, and
the queue could stall for good. All descriptors are now used, with WRAP
on the last one, both indexes wrap at length and one descriptor stays
free. Stopping and waking the queue now goes through the netdev_queues.h
helpers.

> diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
> index fd2715f84af97..60f711e8ce189 100644
> --- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c

[ ... ]

> @@ -518,30 +519,34 @@ static int bcm4908_enet_stop(struct net_device *netdev)
>  	return 0;
>  }

[Severity: Medium]
This is a pre-existing issue, but bcm4908_enet_stop() never reaps the TX
ring:

bcm4908_enet_stop() {
    ...
	napi_disable(&tx_ring->napi);
	netdev_reset_queue(netdev);

	bcm4908_enet_dma_rx_ring_disable(enet, &enet->rx_ring);
	bcm4908_enet_dma_tx_ring_disable(enet, &enet->tx_ring);

	bcm4908_enet_dma_uninit(enet);
    ...
}

bcm4908_enet_dma_uninit() only walks rx_ring->slots. Do the skbs between
read_idx and write_idx stay DMA mapped and leak on ifdown?

On the next open, bcm4908_enet_dma_ring_init() sets read_idx and
write_idx back to 0 but does not clear the TX descriptors, so stale OWN
bits can stay set.

The later commit "net: bcm4908_enet: release the TX ring on stop" in this
series fixes this. It adds bcm4908_enet_tx_ring_clean(), calls it from
bcm4908_enet_stop() after the TX channel has stopped, and clears the TX
descriptors in bcm4908_enet_dma_ring_init().

>  
> +/* One descriptor always stays unused, so read_idx == write_idx can only
> + * mean an empty ring
> + */
> +static int bcm4908_enet_tx_free_descs(struct bcm4908_enet_dma_ring *ring)
> +{
> +	int free = READ_ONCE(ring->read_idx) - READ_ONCE(ring->write_idx) - 1;
> +
> +	return free < 0 ? free + ring->length : free;
> +}
> +
>  static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_device *netdev)
>  {

[ ... ]

>  	/* Free transmitted skbs */
>  	if (enet->irq_tx < 0 &&
> -	    !(le32_to_cpu(ring->buf_desc[ring->read_idx].ctl) & DMA_CTL_STATUS_OWN))
> +	    !(le32_to_cpu(ring->buf_desc[READ_ONCE(ring->read_idx)].ctl) &
> +	      DMA_CTL_STATUS_OWN))
>  		napi_schedule(&enet->tx_ring.napi);

[Severity: High]
This isn't a bug introduced by this patch, but what happens here when the
DT leaves out the optional "tx" interrupt?

The binding allows a single interrupt (interrupts: minItems: 1).
bcm4908_enet_probe() keeps the negative enet->irq_tx and carries on, and
bcm4908_enet_open() then skips enabling the TX NAPI:

bcm4908_enet_open() {
    ...
	if (enet->irq_tx > 0) {
		napi_enable(&tx_ring->napi);
    ...
}

A NAPI added with netif_napi_add_tx() starts with NAPI_STATE_SCHED and
NAPI_STATE_NPSVC set. So this napi_schedule() only sets MISSED, and
bcm4908_enet_poll_tx() never runs.

Does that mean no TX skb is ever reclaimed? After length - 1 frames,
netif_txq_maybe_stop() would stop the queue with nothing to wake it.
That is the "queue stops for good with nothing left to wake it" symptom
from the commit message. The new "poll_tx() wakes the queue once there
is room again" comment also doesn't hold in this mode.

bcm4908_enet_stop() also calls napi_disable(&tx_ring->napi)
unconditionally. SCHED and NPSVC never clear on a NAPI that was never
enabled. Can napi_disable_locked() then loop forever while holding RTNL
and the netdev lock?

stop() then also calls free_irq() with the negative enet->irq_tx.

This is still present at the end of the series. open() still enables the
TX NAPI only when irq_tx > 0, and stop() still calls napi_disable() on it
every time.

>  
> -	/* Don't use the last empty buf descriptor */
> -	if (ring->read_idx <= ring->write_idx)
> -		free_buf_descs = ring->read_idx - ring->write_idx + ring->length;
> -	else
> -		free_buf_descs = ring->read_idx - ring->write_idx;
> -	if (free_buf_descs < 2) {
> -		netif_stop_queue(netdev);
> +	if (!netif_txq_maybe_stop(txq, bcm4908_enet_tx_free_descs(ring), 1, 1))
>  		return NETDEV_TX_BUSY;
> -	}
>  
>  	/* Hardware removes OWN bit after sending data */
>  	buf_desc = &ring->buf_desc[ring->write_idx];

[Severity: Medium]
The OWN check just after this line still stops the queue directly,
without the netdev_queues.h helpers:

	if (unlikely(le32_to_cpu(buf_desc->ctl) & DMA_CTL_STATUS_OWN)) {
		netif_stop_queue(netdev);
		return NETDEV_TX_BUSY;
	}

This patch removes the unconditional netif_wake_queue() from
bcm4908_enet_poll_tx(). The only waker left is
netif_txq_completed_wake(), and it only wakes when packets were
completed:

__netif_txq_completed_wake() {
    ...
	if (pkts && likely(get_desc >= start_thrs)) {
    ...
}

Suppose start_xmit() takes this path while the indexes say the ring is
empty. One way is a stale OWN descriptor at index 0 after ifdown/ifup:
bcm4908_enet_dma_ring_init() resets read_idx and write_idx to 0 but
leaves the descriptors alone. poll_tx() then has handled == 0.

Is the queue ever woken in that case?

The old code had no way out of this case either, because poll_tx() is not
scheduled when no DMA was kicked. Still, the new "wakes the queue if
start_xmit() stopped it" comment in poll_tx() does not cover this stop.

The later commit "net: bcm4908_enet: release the TX ring on stop" in this
series removes this OWN check and clears the TX descriptors in
bcm4908_enet_dma_ring_init().

> @@ -562,7 +567,7 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
>  	tmp |= DMA_CTL_STATUS_SOP;
>  	tmp |= DMA_CTL_STATUS_EOP;
>  	tmp |= DMA_CTL_STATUS_APPEND_CRC;
> -	if (ring->write_idx + 1 == ring->length - 1)
> +	if (ring->write_idx == ring->length - 1)
>  		tmp |= DMA_CTL_STATUS_WRAP;
>  
>  	netdev_sent_queue(enet->netdev, skb->len);

[Severity: Medium]
This isn't a bug introduced by this patch, but right after this the
descriptor goes to the DMA with no barrier between the two stores:

	buf_desc->addr = cpu_to_le32((uint32_t)slot->dma_addr);
	buf_desc->ctl = cpu_to_le32(tmp);

With no dma_wmb() between them, can a DMA engine that is already running
see OWN before the new address? It would then transmit from a stale,
unmapped buffer.

bcm4908_enet_dma_alloc_rx_buf() uses the opposite order and writes ctl,
with OWN, before addr:

	buf_desc->ctl = cpu_to_le32(tmp);
	buf_desc->addr = cpu_to_le32(slot->dma_addr);

The later commit "net: bcm4908_enet: publish the buffer address before
OWN" in this series adds dma_wmb() between the stores on both paths,
writes addr first on RX, and adds dma_rmb() in poll_rx().

[ ... ]

> @@ -652,17 +662,19 @@ static int bcm4908_enet_poll_tx(struct napi_struct *napi, int weight)

[ ... ]

> -	while (handled < weight && tx_ring->read_idx != tx_ring->write_idx) {
> -		buf_desc = &tx_ring->buf_desc[tx_ring->read_idx];
> +	while (handled < weight && read_idx != READ_ONCE(tx_ring->write_idx)) {
> +		buf_desc = &tx_ring->buf_desc[read_idx];
>  		if (le32_to_cpu(buf_desc->ctl) & DMA_CTL_STATUS_OWN)
>  			break;
> -		slot = &tx_ring->slots[tx_ring->read_idx];
> +		slot = &tx_ring->slots[read_idx];
>  
>  		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_TO_DEVICE);
>  		dev_kfree_skb(slot->skb);

[Severity: Medium]
This is a pre-existing issue, since the old loop used plain loads here.
Is READ_ONCE() enough for this lockless index protocol, though?

start_xmit() publishes write_idx with WRITE_ONCE() after it writes the
slot and the descriptor. This loop reads write_idx with READ_ONCE() and
then loads buf_desc->ctl and slots[read_idx].

On arm64, could those loads return the previous lap's values, with OWN
clear and an skb that was already freed? That would call
dma_unmap_single() and dev_kfree_skb() a second time on that skb, and the
new frame would be lost.

The other direction has the same gap. The slot loads here are not
release-ordered before WRITE_ONCE(tx_ring->read_idx, read_idx). Also,
bcm4908_enet_tx_free_descs() reads read_idx with READ_ONCE() before
start_xmit() reuses the slot.

The later commit "net: bcm4908_enet: order the TX ring index accesses" in
this series switches all of these to smp_store_release() and
smp_load_acquire(), for both write_idx and read_idx, including in
bcm4908_enet_tx_free_descs().

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113235847.517308-1-kudzo51%40gmail.com
