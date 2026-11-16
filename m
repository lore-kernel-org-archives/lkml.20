Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788496;
	b=wRhoNYdQiWISIZWfla642OoU9RZOT8QqIPle2TsDuvVpALBPQPkthbtCHFwG72oTTTTR
	 kNWywGY3riVZyF+9YjoZS7TzzfEVIxjF6cDvpo7lsnhAOncGQDf5p1svn9oVhsnR3fErv
	 X7WGwjj9sz21gQFOrCSscBa0KFSg4hXI32pCFjzWNObnEp/I87Kni4y6LD4mbyU8kIz/y
	 rTCRljRMbhEPvm/4JV+2jCCNmAeixWp55Oj5zSwYSSOXrPwHDA3gC+L6v8vAfe5QOsALy
	 YlDO/huC69AquhDfK1/dwJr4KW24FT+pJMD9j4WgLo5JWJ1IRX9WbKQrpmbs8hImBjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788496;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=815aWJsIt4ff4spJiIdcgyH80McTdDzk8dYP7BF5UfE=;
	b=xR+gGs6uho2Rbzpr5sUzdTZndX5pd3GBvQczL8sSXEsXQhbtTh8AWKJvJoMU7NCPz8mQ
	 QIik4KjD96Pfnf8iravbRN7RtOFBjy/D0IjfsILcV6LmI+pFLiO/hmW8mdbsLqXXiCtJw
	 A/zKDq7g/BSY4pH/pk8yptrz4WeftHk0x8Epp/5N9t2GOg1eXHjNTAnWFLS/t/YaMSBON
	 FIW1/mZi3osGdChsKSxUE/mrHhOfNDx8uR1oBt1F6cFYuIIRiF90Q19aUI3bWVNpPyFhN
	 WqdmN3XtY/uYc42Nw9TYyNnMmGb4LysqHveyG1LLt0ZftgR81EZ+dRMc7PCMAn889zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ufz0BKHA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393A606A31F;
	Mon, 16 Nov 2026 00:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ufz0BKHA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6F61F000C4;
	Mon, 16 Nov 2026 00:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794788496;
	bh=815aWJsIt4ff4spJiIdcgyH80McTdDzk8dYP7BF5UfE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ufz0BKHAiOj+0HG8bEM6pyZd1pdIgfRi0M6zQikOEJdLN7e6dQ0yORTyLNykKclo0
	 8K8FDdYpR/a1+QiqDL9952KTMNEowILtNT9lq/kb9ZB1Jm+n/fBK2UCjlv/HVia7hh
	 4tPft6/NwlGVFogQ5245X7jqF57En9suCNeYPgrYSHVOWr6W/KsKxovwhLmqN9tGBh
	 bpq9qG1zZgB3WSCm6Hlrc2ljf1pxeLaqOwlgwuJUKSlKR2otAbDHOREgTDtTFZhi96
	 e7elNXKpvVFaZw+OHhXKots8v9RzBt4JDDTeY7pWrppf+CjwBMBr/8EXoeOn6FhqoR
	 h5gDXKz4qX0Xg==
Subject: Re: [PATCH net 1/3] net: enetc: let core segment GSO super-skb when
 TSO would not fit the TX ring
From: netdev-bot+sashiko@kernel.org
To: vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 claudiu.manoil@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 ioana.ciornei@nxp.com, willemdebruijn.kernel@gmail.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 00:21:34 +0000
Message-ID: <179478849492.3136.15273523164661728794@kernel.org>
In-Reply-To: <20261111233149.479596-2-vladimir.oltean@nxp.com>
References: <20261111233149.479596-2-vladimir.oltean@nxp.com>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: SKB_GSO_DODGY skbs can still stall a TX
  queue for good.

--

net: enetc: let core segment GSO super-skb when TSO would not fit the TX ring

This adds an ndo_features_check() to the enetc PF and VF drivers. On the
software TSO path, it clears the GSO features for any skb whose
descriptor estimate is larger than the TX ring could ever provide. The
core then segments those skbs itself, which avoids the permanent
NETDEV_TX_BUSY loop in enetc_start_xmit().

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index c6571b5cc8425..1606ac57016f3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c

[ ... ]

> @@ -1098,6 +1103,24 @@ netdev_tx_t enetc_xmit(struct sk_buff *skb, struct net_device *ndev)
>  }
>  EXPORT_SYMBOL_GPL(enetc_xmit);
>  
> +netdev_features_t enetc_features_check(struct sk_buff *skb,
> +				       struct net_device *ndev,
> +				       netdev_features_t features)
> +{
> +	struct enetc_ndev_priv *priv = netdev_priv(ndev);
> +
> +	features = vlan_features_check(skb, features);
> +
> +	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
> +		return features;
> +
> +	if (tso_count_descs(skb) >= priv->tx_bd_count)
> +		features &= ~NETIF_F_GSO_MASK;

[Severity: High]
Can SKB_GSO_DODGY skbs still get past this check and stall the queue?

tso_count_descs() is based on skb_shinfo(skb)->gso_segs. The same is
true of enetc_tso_count_descs(), which replaces it later in the series.
For DODGY skbs, gso_segs can still be 0 when ndo_features_check runs.

enetc does not advertise NETIF_F_GSO_ROBUST, so the skb takes this path:

validate_xmit_skb()
  __netif_skb_features()
    enetc_features_check()     <- sees gso_segs == 0, keeps TSO
  __skb_gso_segment()
    tcp_gso_segment()

tcp_gso_segment() only fixes up gso_segs and then returns the skb
unsegmented:

net/ipv4/tcp_offload.c:tcp_gso_segment() {
    ...
	if (skb_gso_ok(skb, features | NETIF_F_GSO_ROBUST)) {
		/* Packet is from an untrusted source, reset gso_segs. */
		skb_shinfo(skb)->gso_segs = DIV_ROUND_UP(skb->len, mss);
		segs = NULL;
    ...
}

Take the software TSO path (no ENETC_F_LSO, e.g. LS1028A). A DODGY TCP
skb with a gso_size of 8 and about 64KB of payload gets a gso_segs of
about 8000. That puts the descriptor estimate at about 16000, well
above the 2047 BDs an empty ring can offer.

In that case the enetc_bd_unused() check in enetc_start_xmit() is
always true. The driver calls netif_stop_subqueue() and returns
NETDEV_TX_BUSY every time.

There seem to be two ways to produce such skbs.

The first is AF_PACKET with PACKET_VNET_HDR and PACKET_QDISC_BYPASS.
__virtio_net_hdr_to_skb() does:

	shinfo->gso_type |= SKB_GSO_DODGY;
	shinfo->gso_segs = 0;

and only clamps gso_size to TCP_MIN_GSO_SIZE. The send path is then
packet_xmit()->dev_direct_xmit()->__dev_direct_xmit()->
validate_xmit_skb_list(). That path skips qdisc_pkt_len_segs_init(),
the only place that recomputes DODGY gso_segs before features_check.
On BUSY, dev_direct_xmit() frees the skb, but the subqueue stays
stopped.

The second is a tc-egress BPF program that calls
bpf_skb_adjust_room(). Both bpf_skb_net_grow() and bpf_skb_net_shrink()
set SKB_GSO_DODGY and reset gso_segs to 0. This happens after
__dev_queue_xmit() has already run qdisc_pkt_len_segs_init(). Ordinary
TCP TSO traffic would then skip the new check, including the small-MSS
peer case from the commit message, and be requeued with BUSY forever.

The only wake-up for the stopped subqueue is in enetc_clean_tx_ring().
It needs tx_frm_cnt > 0, and the driver has no ndo_tx_timeout, so an
idle ring would not recover.

Could the ring-size check use a bound that does not trust gso_segs for
DODGY skbs? One option is DIV_ROUND_UP(skb->len - hdr_len, gso_size).
Another is a fallback in the xmit path for skbs that can never fit the
ring.

> +
> +	return features;
> +}
> +EXPORT_SYMBOL_GPL(enetc_features_check);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111233149.479596-1-vladimir.oltean%40nxp.com
