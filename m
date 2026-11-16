Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788497;
	b=LU8NuWrNcbrqD51hAhsRUAC8xc2NSSD59exXEis4C2SD/BTeGMTQsd2bn8MxGecqg65c
	 ACewvmm7rbk0wvhnVC84rzDvlNj1lUICfeL0O5yEf8kc5MNpLIKcHXbFdb7ltfm897Q1E
	 baM7FmfWBChEaHk3c8WUUH6y3OWSPupL9052nXbePbYTH4u/7hHjv7nivLUXtPn09dgPS
	 UO/63mATrHEEAcYfHQIgUP6xNfhX1+sTECMqbm3JJ3xKxgTvB5+OWgO7mAyUeQ89XPmb7
	 nJtRw6qA85uydUw5Qm5ZxbDk6L+TZN2QUX8MvziDxNYWHDTIjuSsN8l3HdK5hJpgO0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788497;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dap/LO9qKD4MQu3VaZDdAysZ8m+9Ky4O6+ArRzqFmqY=;
	b=z7ZFlCOl2x+yGrLzwKysyYBEG1l785irPyrX4r0r+BxQyFTeSQU5Cz7k4uQ9xOqbAv+v
	 xnbNiONtTSDhSODPAtUTnZ0Vy1bq40Dl13QqRgIIQqR9E2VsgVil4UwBk6GRdVmjymR17
	 9vYtSVN2ydX4YizFb7gdmFCO51bS7HjGyT3mlzNXL9sfUFxUQXXmm2zS8WOxtCmikhvtC
	 r89nsgCysK6O/n8PUdaJESPzLh/qDy4f46nDrTePt/XkoUuMFFghLIZq6boU87zioRkkj
	 PmdF6kj2TpNL7M/rbMxDiNKDjkojVHS7f4rj/qz6iItWRpgONFBUF8KT3PWylJbeKjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dp9wtRJ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72455606A33D;
	Mon, 16 Nov 2026 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dp9wtRJ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4591F000C4;
	Mon, 16 Nov 2026 00:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794788497;
	bh=dap/LO9qKD4MQu3VaZDdAysZ8m+9Ky4O6+ArRzqFmqY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Dp9wtRJ9CZVjXl2/aF0F/otPhaC3hI3ZrAT758+VVwGAAB8bROeRapMmd2pdr1hNX
	 hrW6Xry8O0+TT/a5hLzeKT1sPo34rBvr7MJXbrmBsqXCTS1U9V/NooomOpDpymL1Jz
	 a9fc5687XZT6yaJ+drPgM2I3HeebIyTVRAWsX0yEFO64bBIcfCDYZCXc12jLm8FiS/
	 zSF/HYl3DcMhh0oZelGFvGqdMmMq2h/TyFDoBbjDNEotsYdVsnK23vYCEK6N9khIBD
	 oXnP9HT/lGDxpT7AbZemwb0DboOhTclRdLFzxAsAR1OaTnUrxM8JQinYd9/NfFv9Iq
	 yo71GgDE0or9Q==
Subject:
 Re: [PATCH net 2/3] net: enetc: reserve VLAN extension BDs for software TSO
From: netdev-bot+sashiko@kernel.org
To: vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 claudiu.manoil@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 ioana.ciornei@nxp.com, willemdebruijn.kernel@gmail.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 00:21:36 +0000
Message-ID: <179478849622.3136.8694848306250241692@kernel.org>
In-Reply-To: <20261111233149.479596-3-vladimir.oltean@nxp.com>
References: <20261111233149.479596-3-vladimir.oltean@nxp.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] enetc_features_check()
  (drivers/net/ethernet/freescale/enetc/enetc.c:1128) decides whether…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  changes the threshold of the affected check.

--

net: enetc: reserve VLAN extension BDs for software TSO

This adds enetc_tso_count_descs(), which counts one extra extension BD per
segment when the skb carries a VLAN tag. The new helper replaces
tso_count_descs() in both enetc_start_xmit() and enetc_features_check(),
so a VLAN TSO skb can no longer overrun next_to_clean on a nearly full
TX ring.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index 1606ac57016f3..7f089a84d9a65 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -674,6 +674,17 @@ static void enetc_tso_complete_csum(struct enetc_bdr *tx_ring, struct tso_t *tso
>  	}
>  }
>  
> +static int enetc_tso_count_descs(const struct sk_buff *skb)
> +{
> +	int count = tso_count_descs(skb);
> +
> +	/* Each segment also needs an extension BD for VLAN insertion */
> +	if (skb_vlan_tag_present(skb))
> +		count += skb_shinfo(skb)->gso_segs;
> +
> +	return count;
> +}
> +

[ ... ]

> @@ -1034,7 +1045,7 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff *skb,
>  
>  			count = enetc_lso_hw_offload(tx_ring, skb);
>  		} else {
> -			if (enetc_bd_unused(tx_ring) < tso_count_descs(skb)) {
> +			if (enetc_bd_unused(tx_ring) < enetc_tso_count_descs(skb)) {
>  				netif_stop_subqueue(ndev, tx_ring->index);
>  				return NETDEV_TX_BUSY;
>  			}

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but
the patch changes the threshold of this check. Can the stop here race
with enetc_clean_tx_ring() and lose a wakeup?

enetc_start_xmit() reads next_to_clean through enetc_bd_unused(), then
calls netif_stop_subqueue() and returns NETDEV_TX_BUSY. There is no
smp_mb() and no second check after stopping.

The completion side has no barrier either, and NAPI does not take the TX
lock:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_clean_tx_ring() {
    ...
	tx_ring->next_to_clean = i;
    ...
	if (unlikely(tx_frm_cnt && netif_carrier_ok(ndev) &&
		     __netif_subqueue_stopped(ndev, tx_ring->index) &&
    ...
		netif_wake_subqueue(ndev, tx_ring->index);
}

Consider this interleaving:

CPU0 (enetc_start_xmit)            CPU1 (enetc_clean_tx_ring)
reads old next_to_clean,
  not enough room
                                   completes the last frames
                                   writes next_to_clean
                                   queue not stopped, skips wake
netif_stop_subqueue()
return NETDEV_TX_BUSY

Once that happens, no frames are in flight, so no further TX interrupt or
NAPI clean runs. enetc also has no ndo_tx_timeout, so the subqueue looks
like it stays stopped. On arm64, store->load reordering makes the window
wider.

Software TSO takes this BUSY path often, because the wake threshold
ENETC_TXBDS_MAX_NEEDED is much lower than enetc_tso_count_descs(). For
VLAN-tagged TSO skbs, this patch adds gso_segs BDs to the requirement, so
the path runs even more often.

Would the netif_txq_maybe_stop() / netif_txq_completed_wake() helpers
from include/net/netdev_queues.h fix this? An open-coded stop + smp_mb()
+ recheck, with a matching barrier on the completion side, would also
work.

[ ... ]

> @@ -1114,7 +1125,7 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
>  	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
>  		return features;
>  
> -	if (tso_count_descs(skb) >= priv->tx_bd_count)
> +	if (enetc_tso_count_descs(skb) >= priv->tx_bd_count)
>  		features &= ~NETIF_F_GSO_MASK;

[Severity: High]
Does this guard still work for SKB_GSO_DODGY skbs? For those skbs,
skb_shinfo(skb)->gso_segs is still 0 when ndo_features_check runs.

Both parts of enetc_tso_count_descs() depend only on gso_segs: the
tso_count_descs() estimate and the new VLAN extension BD term. With
gso_segs == 0 the function returns just nr_frags. That is below
tx_bd_count, so GSO is not cleared.

Two paths appear to reach the driver this way. The first is AF_PACKET
with PACKET_QDISC_BYPASS and PACKET_VNET_HDR:

packet_xmit()
  dev_direct_xmit()
    __dev_direct_xmit()
      validate_xmit_skb_list()

Here __virtio_net_hdr_to_skb() sets SKB_GSO_DODGY and gso_segs = 0, and
accepts a TCP gso_size as small as TCP_MIN_GSO_SIZE (8).
qdisc_pkt_len_segs_init() never runs on this path.

The second is a tc egress BPF program that calls bpf_skb_adjust_room().
bpf_skb_net_grow() and bpf_skb_net_shrink() set DODGY and gso_segs = 0
inside sch_handle_egress(). That runs after qdisc_pkt_len_segs_init() in
__dev_queue_xmit().

In both cases gso_within_dev_limits() also sees gso_segs == 0 and lets
the skb through. enetc does not advertise NETIF_F_GSO_ROBUST, so
validate_xmit_skb() calls __skb_gso_segment(). There, tcp_gso_segment()
only sets gso_segs = DIV_ROUND_UP(len, mss) and returns NULL, and the
unsegmented super-skb goes to enetc_start_xmit().

On the software TSO path, the check in enetc_start_xmit() now sees the
real count. For a 64KB skb with an mss of 8, that is about 16000 BDs.
enetc_bd_unused() returns at most bd_count - 1, so this check can never
pass:

	if (enetc_bd_unused(tx_ring) < enetc_tso_count_descs(skb)) {
		netif_stop_subqueue(ndev, tx_ring->index);
		return NETDEV_TX_BUSY;
	}

If the ring is empty, nothing wakes the queue again.
enetc_clean_tx_ring() only wakes it when tx_frm_cnt != 0, and there is
no ndo_tx_timeout.

On the direct xmit path, the skb is freed but the queue stays stopped. On
the tc egress path, the skb is requeued at the head of the qdisc forever.

Earlier in this series, "net: enetc: let core segment GSO super-skb when
TSO would not fit the TX ring" targets exactly this "never fits, queue
stalls" problem. This patch extends the same gso_segs-based estimate to
the VLAN extension BDs, so the new term has the same gap.

The later commit "net: enetc: let core segment GSO super-skb when headers
exceed TSO_HEADER_SIZE" only adds a header length check before this one.
So the gap still seems to be there at the end of the series.

Could the estimate in enetc_features_check() be computed from skb->len,
the header length and gso_size, instead of from gso_segs?

>  
>  	return features;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111233149.479596-1-vladimir.oltean%40nxp.com
