Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747716;
	b=fS6OqYkIMLqJg8B2ZkUejYVtIaih9HRUc6SIBHY1EU2lzDunLD1YNMcoKRuMKpe1sU2c
	 I4gFmRJ5c1KypQGpTHsidu+KpXIZteIwS1DceDG0+7grH4EiN5f9w1I1odRv9/hmC0g+L
	 t3lMVpd83agVd0dLaLZZRB7waDWOHxsrSVe2Y/9g+OGC9uLrUTwT9AGQ1xr2H2hL4zCps
	 0aJ43wFuIwIv8wdvhNskit5zRivXI+Cjj8gvwvYc3Irf3CQzQGXpGP6SoRMFGQyDo6omS
	 APvYAqkmpz7TbGxryoNzZVtJWh2bZ+wTk1cpKm674b803p2tBDae3lWYp955iL9QU2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747716;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6NQF+lrUF+qSTerQwu4IKVb8mS5domCvzOcN/5sWjtM=;
	b=As6cQo8Ec2hjImn/FZz3/8yhWrR1AslBYjcDwAGwvH3l0q9e6U+pCfCcMfeSDgGDg16n
	 XathPerN4lRSVy2sBoWNBqG+irFeaXmzdb4uwB9BThDOdX41riiSjP2aBn/Sxt00aQ7yv
	 89hzTegm4FgO4GML61GX/bJFV1rWwlChb1W5e7111fNFoJI8S4IDfPBvZEfsOfQze8KU7
	 jOcwrPcxkQL9qvQAdKU0IP1gNxdTlV3088GrB9z9LaCaEpnFz7W2bm7ZJ4Dx1hKwAAZzG
	 cIhBPvdTWsGQF7SG+DHfv80F2X7QNMZ/lwp23YdqdWoz2ZIcYj7hqUnlum3Iuin1LaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkeV+nal;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F409606A891;
	Sun, 15 Nov 2026 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkeV+nal
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516C91F000C5;
	Sun, 15 Nov 2026 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747716;
	bh=6NQF+lrUF+qSTerQwu4IKVb8mS5domCvzOcN/5sWjtM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fkeV+nalMAhgoqKDOB4PDngcShXr+ltVNlrXmfO+Mh+0kxzZYd2AjoUDfNZEREeeB
	 ZjSE/LTIdSvYfk5RDg6zNgTDCeQ+t0zSmPRNbDpT/7rwVibalMKEVItHsrinmrthRI
	 Hg1wsGpepgAIZrd1gzdr7oV8J6jrNE0+e47W8uW8Unwn+q4N2UBNYnZcnANtwl+woM
	 z2mIHhgPUKbCZQ+H93trWnUo4mlLIWBHVqxmmbOTpKcVIrYyJNhvLOsyvHpIW1UDE4
	 aLfMmdVcpAnZgKu6MqlJOvDXMzivtQ/HV/zeKsW11FQZmvU07OvN06fz204VFW7wSn
	 /vHEjdRf3gL5A==
Subject: Re: [PATCH net-next v7 9/9] net: bcmgenet: reassemble jumbo frames
 from status block fragments
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sun, 15 Nov 2026 13:01:54 +0000
Message-ID: <179474771487.2199510.9115361919445613385@kernel.org>
In-Reply-To: <20261112-nb-genet-mtu-nn-v2-v7-9-43a5d90b3256@tipi-net.de>
References: <20261112-nb-genet-mtu-nn-v2-v7-9-43a5d90b3256@tipi-net.de>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch raises dev->max_mtu to ENET_MAX_MTU = GENMASK(13,0)
  - ENET_FRAME_OVERHEAD = 16347 on every GENET revision except v1…
- [Low] The comment this patch rewrote above bcmgenet_pkt_rdy_thld() says
  the receive threshold "covers the alignment bytes and the frame up to…
- [Low] In bcmgenet_desc_rx() the length check (`if (unlikely(len >
  priv->rx_buf_len || len < min_len))`) runs before the new…
- [Low] net: bcmgenet: frag_drop not cleared on EOP in bcmgenet_desc_rx()

--

net: bcmgenet: reassemble jumbo frames from status block fragments

When a frame is longer than the packet ready threshold, the hardware
splits it across several RX descriptors. This patch reassembles those
frames and strips the per-descriptor status blocks. It also raises
ENET_MAX_MTU to the 14 bit UMAC_MAX_FRAME_LEN limit, which allows an MTU
of up to 16347.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 30ba77931c4f0..eb6975459917b 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -84,11 +84,8 @@
>  				      ENET_THLD_MAX * ENET_THLD_UNIT, \
>  				      ENET_THLD_PAGE_LEN)
>  
> -/* Largest MTU that fits one descriptor, with room for a VLAN tag so a VLAN
> - * interface can use the parent MTU.
> - */
> -#define ENET_MAX_MTU		(ENET_THLD_MAX_LEN - GENET_RBUF_ALIGN - \
> -				 ETH_HLEN - VLAN_HLEN)
> +/* UMAC_MAX_FRAME_LEN is 14 bits wide and counts the FCS */
> +#define ENET_MAX_MTU		(GENMASK(13, 0) - ENET_FRAME_OVERHEAD)

[Severity: Medium]
Has the wider TX descriptor length field been confirmed on GENET v2, v3
and v4, or only on v5?

bcmgenet_probe() applies the new maximum to every revision except v1:

	if (!GENET_IS_V1(priv))
		dev->max_mtu = ENET_MAX_MTU;

Before this change, max_mtu was tied to the single-descriptor RX
threshold (about 3564 with 4K pages). So no TX buffer passed to
bcmgenet_xmit() could reach 4096 bytes, even with the 64 byte TSB added.

With an MTU near 16K, a linear head can now be 4096 bytes or more, for
example with SG off, from a packet socket, or after skb_linearize(). A
single page frag can be that large too. bcmgenet_xmit() writes the
length without clamping or splitting it:

		len_stat = (size << DMA_BUFLENGTH_SHIFT) |
			   (priv->hw_params->qtag_mask << DMA_TX_QTAG_SHIFT);

bcmgenet.h still documents the field as 12 bits for both directions:

/* Tx/Rx Dma Descriptor common bits*/
#define DMA_BUFLENGTH_MASK		0x0fff

The commit message says the TX field is wider, but the only evidence
given is a UMAC loopback test on v5. The RTL confirmation from Broadcom
that it cites covers how RX splits long frames. It doesn't cover the
width of the TX length field.

If the TDMA on v2 to v4 decodes only 12 length bits, would TX buffers of
4096 bytes or more be sent truncated modulo 4096?

[ ... ]

> @@ -2518,24 +2563,42 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,

[ ... ]

>  		/* Reject lengths that would underflow the SKB build path. */
>  		if (unlikely(len > priv->rx_buf_len || len < min_len)) {
>  			netif_err(priv, rx_status, dev,
>  				  "invalid packet length %d\n", len);
>  			BCMGENET_STATS64_INC(stats, length_errors);
> +			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
>  		}

[Severity: Low]
Should this branch clear ring->frag_drop when the descriptor carries
DMA_EOP?

bcmgenet_discard_frags() sets frag_drop to !eop. The rest of an
aborted frame is then dropped without being counted again, and
counting resumes once that frame has ended. This branch can only set
frag_drop to true. So when the last continuation of a dropped frame
lands here with DMA_EOP set, frag_drop stays true even though the
frame is over.

The same thing happens in two other cases. A lone orphan descriptor
with DMA_EOP and no SOP sets frag_drop to true here. A failure in
bcmgenet_rx_refill() calls bcmgenet_discard_frags(ring, false) before
the status word has been read, so it cannot know whether that
descriptor ended the frame.

Suppose the next frame on the ring has also lost its SOP descriptor.
Its continuations reach this branch with frag_drop already set, so
they are dropped without incrementing fragmented_errors. That lost
frame then never shows up in the error counters.

This is only a counter inaccuracy on already abnormal paths. Would
setting ring->frag_drop to !(dma_flag & DMA_EOP) here, after the
count, keep this branch consistent with bcmgenet_discard_frags()?

[Severity: Low]
Should this length check in bcmgenet_desc_rx() come after the new SOP and
frag_drop handling? Because it runs first, two cases skip the reassembly
accounting.

The first case is a frame that has already been dropped (frag_drop set,
frag_head NULL). Each later non-SOP descriptor with an out of range
length still logs "invalid packet length" and increments length_errors.

The comment on bcmgenet_discard_frags() says "do not count it again until
the next SOP". Continuations that carry DMA error flags, on the other
hand, are absorbed silently by the frag_drop branch.

The second case is a SOP descriptor with an invalid length that arrives
while ring->frag_head holds an incomplete frame.
bcmgenet_discard_frags() frees the pending frame, but fragmented_errors
is not incremented. A SOP with a valid length in the same situation does
increment it:

		if (dma_flag & DMA_SOP) {
			if (ring->frag_head) {
				BCMGENET_STATS64_INC(stats, fragmented_errors);
				bcmgenet_discard_frags(ring, false);
			}

Is the lost incomplete frame meant to go uncounted when the next SOP has
a bad length?

[ ... ]

> @@ -2768,7 +2854,8 @@ static void bcmgenet_link_intr_enable(struct bcmgenet_priv *priv)
>  }
>  
>  /* Receive threshold in register units. Covers the alignment bytes and the
> - * frame, but not the status block, which the hardware adds on top.
> + * frame up to the register maximum, but not the status block, which the
> + * hardware adds on top. A longer frame arrives in several descriptors.
>   */
>  static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
>  {

[Severity: Low]
This isn't a bug, but is "up to the register maximum" accurate? The clamp
in bcmgenet_pkt_rdy_thld() uses ENET_THLD_MAX_LEN:

#define ENET_THLD_MAX_LEN	min_t(unsigned int, \
				      ENET_THLD_MAX * ENET_THLD_UNIT, \
				      ENET_THLD_PAGE_LEN)

With 4K pages, ENET_THLD_PAGE_LEN (3584) is below the register maximum
(0xf0 * 16 = 3840), so the page sets the limit.

The comment above ENET_THLD_PAGE_LEN says the same: "on 4K pages the page
bounds the threshold before the register does". The two comments now
contradict each other.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-nb-genet-mtu-nn-v2-v7-0-43a5d90b3256%40tipi-net.de
