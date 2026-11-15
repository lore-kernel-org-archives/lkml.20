Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703507;
	b=PqwvUisL9W150wvZQVM0LxfT7+x+Yde2UICgJ/cUkGs2MSO32tPpHpboFBX7tpLCf5CX
	 ueFHR8uvRihbu+iARhurLvNUXTO1lMV8lO1TiokAiA2eesP9liRz7ETLeunQ9HagIAbx7
	 lrkm0ozSIghrYbYFeF5kcYS9jSUL+Jw4DG+jvJ0FROkrPrpeFp8Wv7tshC9WY5q3XmS3b
	 3GITbzt2PFMFuCR/n+kuD8mqFhAkyxia3YVLLLPe0x1XRoNfRDI2L9R8DziVbdkYUbedU
	 d+FLpSlMPBKpFmbLdOMH+ZsxvcJio5COQhNr0djRLwYdeLlzane2/sQcNoK455G0G6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703507;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RiNYzztBiVox2P9vASzVZ5SqLcQATUvhICdg6qPjINc=;
	b=bEvGR7IsJC8IkAVL0p2QwYghgRVywWDo91nFraBHqIUaGzVFSGfQv2J3zjh6lgJOwLf/
	 knTMA7LCIQBgWkY5xB+NSj6LAYA+tWjqRikNQ3DKMmW1kZamBSiztEhY+T3uB8XpRAgeE
	 0aZ/CmUlJFsz/OVD0L2anoH1ZD36AzyHW+ZHs+ezrfEztiVMykRXNDueUgzdQpzBrNX8t
	 DAHGLisDLethz5SHfqMXLHCTMgA0rmKS1ZXk2MqTJQmPuKKbsQ4AxUKnT4s84eAA678TS
	 uyvmELTvkv7MKqXDndYWr80mUVYN4qeCH23NglAuAyJoQ4q2xhUFuioFcGvdKyjOXGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9oIFjIp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E432606A332;
	Sun, 15 Nov 2026 00:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9oIFjIp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23961F000C6;
	Sun, 15 Nov 2026 00:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794703506;
	bh=RiNYzztBiVox2P9vASzVZ5SqLcQATUvhICdg6qPjINc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B9oIFjIpjbmmPQ+cWOXhJq27CVqHZyMqMXeRl0v0fIqJUPmhOAKcHMx5KH964FbWa
	 JytEmlvgcb06DNNDmXNvsxW/WOMXVjUudSCAK5fQ4Jtu5+GyhhihJFhh0+E5aD4LSV
	 GaJFmAHqKaIbM1KMdJBgQ9Hq2ROYo2jjX/M5VJSWP6chZdXE+7rbkiwIJ895jBD+qN
	 UyCp8lni+zNkBTTa+HlbEkZHOd6VH5KMo/UFGeZoJC6gVA+Z1fRzW6wT4zc+4JCPmW
	 vqPG7LqdsN3DWUOVrzq6jos3lFVumqCw/LyUVHmGJFeJQ3aWG6CUEm0Mz5iZnjHkmp
	 T1arq23Wx508Q==
Subject:
 Re: [PATCH net-next v6 2/3] net: ethernet: mtk_eth_soc: skip page_pool
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 00:45:05 +0000
Message-ID: <179470350538.2199510.6670148874523069932@kernel.org>
In-Reply-To: <patch-2a89212e66b84e37783e0d2ebdaa0a75@loljews.com>
References: <patch-2a89212e66b84e37783e0d2ebdaa0a75@loljews.com>
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

Critical: 0 · High: 0 · Medium: 1 (2) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] mtk_rx_alloc() (drivers/net/ethernet/mediatek/mtk_eth_soc.c)
  now creates the page_pool only when `ring->buf_size <=…
- [Low] The new comment in mtk_rx_alloc() and this commit's message both
  name `mtk_max_buf_alloc()` as the fallback allocator.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  mtk_rx_alloc() leaks ring->data on two error paths.
- [Medium] This problem wasn't introduced by this patch, but
  mtk_rx_clean() calls `dma_unmap_single(eth->dma_dev, rxd1|addr64,…

--

net: ethernet: mtk_eth_soc: skip page_pool

This patch makes mtk_rx_alloc() create a page_pool only when the ring's
descriptor length (ring->buf_size) fits within MTK_PP_MAX_BUF_SIZE. Larger
rings fall back to the netdev_alloc_frag() path. With the current MTU
limits the gate always passes. It is meant to take effect with the 9K
jumbo support that follows.

Link: https://github.com/mediatek/mtk-openwrt-feeds

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 6c8b039fad415..16c3e4157085b 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2824,7 +2824,13 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>  	if (!ring->data)
>  		return -ENOMEM;
>  
> -	if (mtk_page_pool_enabled(eth)) {
> +	/* A page_pool hands out order-0 pages and is created with
> +	 * MTK_PP_MAX_BUF_SIZE, so it can only back a ring whose descriptor
> +	 * length fits.  Larger rings use the netdev_alloc_frag()/
> +	 * mtk_max_buf_alloc() path below instead.
> +	 */

[Severity: Low]
This isn't a bug, but mtk_max_buf_alloc() doesn't exist yet at this commit.
The fallback below still calls the LRO-sized allocator:

			if (ring->frag_size <= PAGE_SIZE)
				data = netdev_alloc_frag(ring->frag_size);
			else
				data = mtk_max_lro_buf_alloc(GFP_KERNEL);

The commit message has the same forward reference:

    Gate the pool on ring->buf_size <= MTK_PP_MAX_BUF_SIZE and let larger
    rings use the netdev_alloc_frag()/mtk_max_buf_alloc() path that already
    exists.

mtk_max_buf_alloc() comes from the next patch, "net: ethernet:
mtk_eth_soc: add 9K jumbo". That patch renames mtk_max_lro_buf_alloc() and
sizes the buffer from ring->frag_size.

Could this patch name mtk_max_lro_buf_alloc() instead, or leave the
reference to the later patch?

> +	if (mtk_page_pool_enabled(eth) &&
> +	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {

[Severity: Medium]
When this condition is false on a netsys v2+ SoC, ring->page_pool stays
NULL and ring->xdp_q is never registered. XDP only runs inside the
page_pool branch of mtk_poll_rx():

mtk_poll_rx() {
    ...
		if (ring->page_pool) {
			...
			ret = mtk_xdp_run(eth, ring, &xdp, netdev);
			...
		} else {
			...
}

At this commit, the XDP admission checks still compare only the per-device
MTU against MTK_PP_MAX_BUF_SIZE:

mtk_xdp_setup() {
    ...
	if (dev->mtu > MTK_PP_MAX_BUF_SIZE) {
    ...
}

mtk_change_mtu() {
	int length = new_mtu + MTK_RX_ETH_HLEN;
    ...
	if (rcu_access_pointer(eth->prog) &&
	    length > MTK_PP_MAX_BUF_SIZE) {
    ...
}

Once the shared rings can grow past MTK_PP_MAX_BUF_SIZE, could an XDP
program attach successfully and then never run? Every packet would then be
handled as if the program returned XDP_PASS.

This can't trigger at this commit. Non-LRO rings have a buf_size of about
2110, and HW-LRO rings only exist on netsys v1, where the page_pool is
disabled.

The next patch, "net: ethernet: mtk_eth_soc: add 9K jumbo", changes
mtk_xdp_setup() and mtk_change_mtu() to check the shared rx_buf_len. That
appears to make the admission checks match this gate.

Would it be cleaner to make the admission checks use the same length as
this gate in this patch, so each step of the series stays consistent?

>  		struct page_pool *pp;
>  
>  		pp = mtk_create_page_pool(eth, &ring->xdp_q, ring_no,

[Severity: Medium]
This isn't a bug introduced by this patch, but does mtk_rx_alloc() leak
ring->data on the error paths right after this?

		if (IS_ERR(pp))
			return PTR_ERR(pp);
	...
	ring->dma = mtk_dma_ring_alloc(eth,
				       rx_dma_size * eth->soc->rx.desc_size,
				       &ring->phys,
				       rx_flag == MTK_RX_FLAGS_NORMAL);
	if (!ring->dma)
		return -ENOMEM;

Both paths return with ring->data allocated and ring->dma still NULL. The
cleanup through mtk_start_dma()->mtk_dma_free()->mtk_rx_clean() only frees
the array when both pointers are set:

mtk_rx_clean() {
	...
	if (ring->data && ring->dma) {
		...
		kfree(ring->data);
		ring->data = NULL;
	}
	...
}

The next mtk_rx_alloc() then overwrites ring->data. So each time ndo_open
fails at either step, the old array of rx_dma_size pointers is lost.

[Severity: Medium]
This is a pre-existing issue, but now that the page_pool decision is made
per ring, should mtk_rx_clean() follow it too? It unmaps every live RX
buffer unconditionally:

mtk_rx_clean() {
	...
			dma_unmap_single(eth->dma_dev, ((u64)rxd->rxd1 | addr64),
					 ring->buf_size, DMA_FROM_DEVICE);
			mtk_rx_put_buff(ring, ring->data[i], false);
	...
}

For page_pool rings, the pool owns the mapping (PP_FLAG_DMA_MAP), and
rxd1 holds page_pool_get_dma_addr(page) + MTK_PP_HEADROOM from
mtk_page_pool_get_buff().

Doesn't this unmap an offset address with ring->buf_size, and then have
the pool unmap the same page again with PAGE_SIZE when it is destroyed?
With CONFIG_DMA_API_DEBUG this would be reported. With an IOMMU or swiotlb
bouncing, it could corrupt the mapping state.

mtk_rx_put_buff() already checks ring->page_pool to decide how to free the
buffer. Should dma_unmap_single() be skipped under the same condition?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-4b4c5003bcf028fafd094e719c5e910b%40loljews.com
