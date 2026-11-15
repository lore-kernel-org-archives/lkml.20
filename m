Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703508;
	b=fBF33F2YpUG1z1Vc1dH0uc/D+JHGL4VPNHLIvhnfXNnwGhSW4lVojZ9R9mqovoUG0jmx
	 SFf1j+Hrr6PSvwa3NHaqt5Sa0N/SbB/gPYJEdgzzqD62YYlZncwGQhAO0fomfTtzWzhBP
	 NiNPHYWcD2BkcHYd0dR3O0M3ycPb23WFZSAzNZ6IwsiptCjJbx26xx8qmwXf88i/qKFqF
	 Z8RmmCKei8Prwog/WBi7gOXlLj5q/yZ/m7fn6Imqfk9pVRyWi8BOMtOOM2JkbvPTcn9/o
	 PC6O5uE3WWDyuHkj2Vtoebg/PSlY+v1WvcURblLJbIVQ0wCqKO84Oee4nJTlScqdTJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703508;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bKbzyTbnAC4UhePTKE+Ogl1JBdxCfS+uTQV6dzzS6Gk=;
	b=XbmtOtZc1qHAc8VSCqiN9g6AT0h80wag8o2rJYkT84BjKGQqO42Sdr/LWTonvbvAWcmv
	 HvmWU88WLWNd6SBQ41Hhn0JEb7CThHOPkqcB/G8OKrookSXPh1me+gDEt4y/kuNDX4W1Y
	 M7bM/n2yuHxUULg94szNX6+2ENsOw0adYShUwY0+0ADEy7198PJ0+jHd5/gr4ksi/EfIy
	 xEzF6M2z0jhO754iO6lUD/aA6cUviaZoiXa/6TVuhXWu6kd+H5NVTFKHQbY/JZXUh3UTF
	 RzI93qL8eNbPO7kl2EQhhguy+oIHp4WqR0yYEvxVDOqEVn2qOgwqkJIqFt8U6dXph/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuycLK25;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC52606A880;
	Sun, 15 Nov 2026 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuycLK25
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7515F1F000C4;
	Sun, 15 Nov 2026 00:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794703508;
	bh=bKbzyTbnAC4UhePTKE+Ogl1JBdxCfS+uTQV6dzzS6Gk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IuycLK25bGXognx0cgfEcpOssDGZvqJtrOas2HMHuJd6D9YW2exr1apxE7RFCNJH8
	 W4X7J3lIOAudhx6YcB746ZXCCnXCUKAbA4E6iUCMc/TfE2Wd/YV/MESN27B+6IY9hf
	 KZ/d0B5Iae1PwvKICnjhsZ9sPoqE9lh5vL/QW6BARJpLHBVuY8ZTkxOJpxYWSAyeUw
	 5Zzv51d5hlR6rj0MkwHXTmgd77+puiJytLkME+mubjG9jkoN9jSfpANE2hAj5H4EaP
	 zrETU1iGNMAZ1P5bhdYyKDEVSHaxqSXYR8JcERAOCcBq988Bc4KDht30F1xcoB71Pr
	 Pr2/9zglCfjYA==
Subject: Re: [PATCH net-next v6 3/3] net: ethernet: mtk_eth_soc: add 9K jumbo
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 00:45:06 +0000
Message-ID: <179470350699.2199510.9469454275750994958@kernel.org>
In-Reply-To: <patch-a5e17908a370040f1eb940d8577dd635@loljews.com>
References: <patch-a5e17908a370040f1eb940d8577dd635@loljews.com>
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

Critical: 0 · High: 0 · Medium: 4 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] SoCs without MTK_NETSYS_RX_9K regress, and the code
  contradicts the commit message ("The other SoCs keep their per-device…
- [Medium] The patch adds a new drop path in mtk_poll_rx() for every SoC
  and every ring: `if (unlikely(pktlen > ring->buf_size)) {…
- [Medium] On every netsys v3+ DMA init, including the default MTU with
  2K rings, mtk_pdma_set_sdl() writes FIELD_PREP(GENMASK(30,16),…
- [Medium] net: mediatek: mismatched XDP buffer size check in
  mtk_xdp_setup()
- [Low] The commit message overstates the memory cost of 9K buffers.

--

net: ethernet: mtk_eth_soc: add 9K jumbo

This adds a MTK_NETSYS_RX_9K capability for MT7988. It raises max_mtu on
the XGMII MACs to 9194 and sizes the shared RX rings from the largest MTU
of any MAC. It also programs the PDMA RX SDL field, XMAC_RX_CFG2 and the
MCR jumbo field from the shared buffer length, and rejects MTU changes
that need larger buffers while DMA is running.

Link: https://github.com/frank-w/BPI-Router-Linux/commit/b4c6cb1d5532
Link: https://github.com/mediatek/mtk-openwrt-feeds

> With the 1 KiB rounding, the buffer length is order-1 (8 KiB) for
> rx_buf_len 4096..7168 (MTU about 3051..7146) and order-2 (16 KiB)
> from rx_buf_len 8192 (MTU 7147) up: once any MAC's MTU reaches 7147,
> every RX buffer is a 16 KiB compound page, which pins around 64 MiB
> at the 9K ring size while DMA is up and turns the refill into a
> high-order GFP_ATOMIC allocation.

[Severity: Low]
Is the 64 MiB figure right for MT7988?

mt7988_data has rx.dma_size = MTK_DMA_SIZE(2K), which is 2048
descriptors. MT7988_CAPS does not include MTK_HWLRO, so eth->hwlro is
false. That means mtk_dma_init() allocates only rx_ring[0] as a
CPU-polled ring, and rx_ring_qdma keeps its 2K buffers.

At MTU 9194 this works out to 2048 x 16 KiB = 32 MiB, not 64 MiB.

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 16c3e4157085b..618f9a5e8fcec 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c

[ ... ]

> @@ -2268,6 +2345,15 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  
>  		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
>  
> +		/* The engine can report a length larger than the posted
> +		 * buffer; never pass the unwritten remainder of the buffer
> +		 * up the stack.
> +		 */
> +		if (unlikely(pktlen > ring->buf_size)) {
> +			netdev->stats.rx_length_errors++;
> +			goto release_desc;
> +		}

[Severity: Medium]
Will these drops show up in any exported counter? mtk_get_stats64()
implements ndo_get_stats64 and fills rx_length_errors only from the
hardware MIB counters:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_get_stats64() {
    ...
		storage->rx_length_errors = hw_stats->rx_short_errors +
			hw_stats->rx_long_errors;
    ...
	storage->tx_errors = dev->stats.tx_errors;
	storage->rx_dropped = dev->stats.rx_dropped;
	storage->tx_dropped = dev->stats.tx_dropped;
}

dev->stats.rx_length_errors is never merged in. dev_get_stats() also
does not fold dev->stats in when ndo_get_stats64 is provided. So every
frame dropped here looks like it disappears from all exported
statistics.

Could this count into rx_dropped instead, or could mtk_get_stats64()
merge dev->stats.rx_length_errors?

This check also applies to every SoC and every ring, and the commit
message doesn't mention it. Before this patch, an oversized pktlen would
have gone to skb_put() past the build_skb() tailroom and hit
skb_over_panic(). Now the frame is dropped silently.

The comment says the engine can report such lengths. Would this be
better as a separate fix with a Fixes: tag?

[ ... ]

> @@ -3259,6 +3363,58 @@ static int mtk_dma_busy_wait(struct mtk_eth *eth)

[ ... ]

> +static u32 mtk_rx_buf_len_from_mtu(int max_mtu)
> +{
> +	int length = max_mtu + MTK_RX_ETH_HLEN + VLAN_HLEN;
> +
> +	if (length <= MTK_MAX_RX_LENGTH_2K)
> +		return MTK_MAX_RX_LENGTH_2K;
> +
> +	return DIV_ROUND_UP(length, 1024) * 1024;
> +}

[ ... ]

> +static void mtk_pdma_set_sdl(struct mtk_eth *eth)
> +{
> +	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
> +	u32 val;
> +
> +	if (!mtk_is_netsys_v3_or_greater(eth))
> +		return;
> +
> +	val = mtk_r32(eth, reg_map->pdma.rx_cfg);
> +	val &= ~MTK_RX_CFG_SDL_MASK;
> +	val |= FIELD_PREP(MTK_RX_CFG_SDL_MASK,
> +			  MTK_PDMA_LRO_SDL + eth->rx_buf_len);
> +	mtk_w32(eth, val, reg_map->pdma.rx_cfg);
> +}

[Severity: Medium]
Does this set the PDMA limit well above the RX buffer length?
MTK_PDMA_LRO_SDL is 0x3000. With the default 2K rings this writes
12288 + 2048 = 14336, and with 9K rings it writes 12288 + 9216 = 21504.
Both values are larger than ring->buf_size and larger than
MTK_MAX_RX_LENGTH_9K.

mtk_dma_init() calls this on every netsys v3+ open, including at the
default MTU. It therefore replaces the ~1518-byte reset default that,
per the commit message, used to drop larger frames at the DMA engine.

After that, two bounds are left: the MAC limits and the descriptor
PLEN0. The commit message says GMAC1's MCR field is probably not
enforced for switch-side frames.

If the engine doesn't strictly honour PLEN0, could a frame be DMA'd
past the end of an order-0 napi_alloc_frag() or netdev_alloc_frag()
buffer and into a neighbouring fragment?

If the engine instead chains oversized frames across descriptors,
mtk_poll_rx() doesn't check LS0 on non-MT7628 descriptors, so each
piece would be delivered as a separate packet. The new
pktlen > ring->buf_size check in mtk_poll_rx() only runs after the DMA
has completed.

The GENMASK(30, 16) width of MTK_RX_CFG_SDL_MASK in mtk_eth_soc.h is
also undocumented. If the real field is narrower, values of 0x4000 and
above would set bits outside it.

Would it be safer to program the SDL from the actual descriptor buffer
length (ring->buf_size), and to confirm the encoding against the
datasheet?

[ ... ]

> @@ -4360,21 +4511,59 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)

[ ... ]

> +	rx_buf_len = mtk_rx_buf_len_from_mtu(max_mtu);

[ ... ]

> +	running = refcount_read(&eth->dma_refcnt);
> +	if (running && rx_buf_len > eth->rx_buf_len)
> +		return -EBUSY;

[Severity: Medium]
Can this regress the SoCs without MTK_NETSYS_RX_9K? The commit message
says "The other SoCs keep their per-device limits: they never grow
their rings". However, only the MAC register writes are gated on the
capability. Both the rx_buf_len derivation in mtk_rx_buf_len_from_mtu()
and this -EBUSY check run on every SoC.

mtk_add_mac() leaves those MACs at
max_mtu = MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN = 2030.
mtk_rx_buf_len_from_mtu() adds VLAN_HLEN before rounding up. Any MTU
from 2027 to 2030 therefore gives 2027 + 18 + 4 = 2049 or more, which
rounds up to 3072.

With DMA up at the default MTU, eth->rx_buf_len is 2048. Running
"ip link set ethX mtu 2030", the advertised maximum, now returns -EBUSY
on MT7621, MT7622, MT7623, MT7629, MT7981, MT7986, MT2701 and on the
non-XGMII MACs of MT7988. Before this patch it just reprogrammed the
MCR bucket.

With an MT7530/MT7531 DSA switch, a user port MTU of 2023 to 2026
raises the conduit to 2027 to 2030, and that fails the same way.

If the MTU is set while DMA is down instead, mtk_dma_init() builds
3072-byte normal rings through mtk_rx_alloc(). On these SoCs the MCR
bucket tops out at 2048, so the extra 1 KiB per buffer can never be
used.

Should the rx_buf_len growth and the -EBUSY check be gated on
MTK_NETSYS_RX_9K? Alternatively, should VLAN_HLEN be kept from pushing
the length past the 2K bucket on those SoCs?

[ ... ]

> @@ -3787,12 +3943,28 @@ static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (dev->mtu > MTK_PP_MAX_BUF_SIZE) {
> +	need_update = !!eth->prog != !!prog;
> +
> +	/* XDP only runs on rings that have a page_pool, and the pool is
> +	 * only created when the shared RX buffer length fits
> +	 * MTK_PP_MAX_BUF_SIZE.  eth->rx_buf_len describes the live rings;
> +	 * when the rings are not live, or this attach tears them down,
> +	 * the next open re-derives it from the current MTUs, so check
> +	 * that value instead.  A detach never needs a pool, so it is not
> +	 * checked at all.
> +	 */
> +	rx_buf_len = eth->rx_buf_len;
> +	if (prog &&
> +	    (!refcount_read(&eth->dma_refcnt) ||
> +	     (netif_running(dev) && need_update &&
> +	      refcount_read(&eth->dma_refcnt) == 1)))
> +		rx_buf_len = mtk_rx_buf_len(eth);
> +
> +	if (prog && rx_buf_len > MTK_PP_MAX_BUF_SIZE) {
>  		NL_SET_ERR_MSG_MOD(extack, "MTU too large for XDP");
>  		return -EOPNOTSUPP;
>  	}
>  
> -	need_update = !!eth->prog != !!prog;
>  	if (netif_running(dev) && need_update)
>  		mtk_stop(dev);
>  

[Severity: Medium]
Can the XDP checks here and in mtk_change_mtu() disagree with the
page_pool gate in mtk_rx_alloc()?

Both checks compare the derived rx_buf_len against
MTK_PP_MAX_BUF_SIZE. mtk_rx_alloc(), however, only creates
ring->page_pool when ring->buf_size <= MTK_PP_MAX_BUF_SIZE, and
ring->buf_size is not the same value as rx_buf_len.

mtk_max_frag_size() aligns NET_SKB_PAD + NET_IP_ALIGN + buf_len up to
SMP_CACHE_BYTES. mtk_max_buf_size() then subtracts NET_SKB_PAD and
NET_IP_ALIGN again. On arm64 with 64-byte cachelines this leaves
ring->buf_size = buf_len + 62, so a buf_len of 3072 becomes a
buf_size of 3134.

MTK_PP_MAX_BUF_SIZE depends on sizeof(struct skb_shared_info), which
grows with CONFIG_MAX_SKB_FRAGS. Take 4 KiB pages and a
CONFIG_MAX_SKB_FRAGS between 41 and 44. SKB_DATA_ALIGN() of the shared
info is then 768, so MTK_PP_MAX_BUF_SIZE is 4096 - 256 - 768 = 3072.

For any MTU from 2027 to 3050, mtk_rx_buf_len_from_mtu() returns 3072.
That passes the rx_buf_len > MTK_PP_MAX_BUF_SIZE check here and in
mtk_change_mtu(). The ring is then built with buf_size 3134, so
mtk_rx_alloc() skips the page_pool and mtk_poll_rx() takes the
non-pool path. The program attaches successfully but never sees a
packet.

The default MAX_SKB_FRAGS of 17 doesn't hit this. But the commit
message says "A program can therefore never attach and silently not
run". That guarantee currently depends on the cacheline and
skb_shared_info rounding happening to line up.

Would it be more robust to check the buf_size the ring will actually
be built with? For example, the mtk_max_frag_size() and
mtk_max_buf_size() computation could be factored into one helper used
by mtk_xdp_setup(), mtk_change_mtu() and mtk_rx_alloc(), so the three
cannot drift apart.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-4b4c5003bcf028fafd094e719c5e910b%40loljews.com
