Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703506;
	b=ihageXefE71lueHHQeWAO7AIZVsZJPQiedxbmkFJYmcgbAgiRey+nHDK2Z/h0j0jFXFk
	 2wMn3CP03KL/ltfp7OAeLR6ujuv8mEoim66RuzrR5gBdEjhGQJtg7YgOJNxBNaXZek1wK
	 QUrkb7FmtVeOephcj1WYmQn7TDw5svgOHq5EM5s9yNtyv6wm3aO/0Is/4pKa3fPirf8Bq
	 X4/WaVgH0ZPQKHfZwX4Tt059LasW3tvDSkfh4HKcGRFi2OxSCzCuAkpn14ut4L6DP3Z2m
	 ydIJEZ8gcEPx42FzpEBZOsxg00jfHN2XrAhKXJusqJ2YER8Lb8VJBM2w/5yHJDzYZMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703506;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p1qeezPkjYvl7m0buWilarmr+j2OC6NCeVnUky5I7Ec=;
	b=W7LOaNbefHt2nSLFyBfBBT+Ymk3FhNDz1mSG1oz5mbjl4GY8y0rn9vmRQXCCGPDVVaTw
	 KTVl/3riEURowI+s9Miy42YOnCdU0uuZ3lZqLzFSZlkjQSwugn3+Eaq56Y7Od7nxMvc21
	 SHrQuZrRztYfoqhe4qMov9sEJtN9D5lDclSQ+zbHf9khRqxvqlWO8uzc3kHtDtKPPYjsU
	 r5wfW4ueha7Tz7YGpQoby+gmlc4y69yjM4qbGBTqRx6UZIr5fPpMJKl/nSm3sRp9lq/tR
	 pUyP5vBG1X2HhtX17xbRJPpUW/N7YMya9MzSyud5ygXY7aRI0feMlcKvaHq+NhL28jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wd70A3+b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ADE606A323;
	Sun, 15 Nov 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wd70A3+b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547D91F000C5;
	Sun, 15 Nov 2026 00:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794703505;
	bh=p1qeezPkjYvl7m0buWilarmr+j2OC6NCeVnUky5I7Ec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Wd70A3+bv0aZmQ/elxnY9+B8Gdb5zZ2T+8MT97x8b2jpwba7sdix9RBhgo5wJFd/u
	 0ZL7dD+iz69zk+ANATes9YnkytLrURvVag+CDosKM10OQGRvQJBDOMzvf8uZ/q6Bmp
	 TBI+RwiaJUmaGAleMRXQVo2rUDEeGSrWwrIfGZqtC1ES3Mw2HJ3UzYtyPuAjwoWQLj
	 70rMAV2CdmsnwHGCPOsc/suOiBD2aLgqMXe5MoLtaCVSDAz2R4IGqmjZFaAqTOwbyv
	 gyKvkbwhwIwO3RqBzg/v4oA0O8Rra4qENJDC0yYFsf7JBI7yn+Iq+pWz5T9Bjz79U/
	 Z6wnD3unudI5A==
Subject: Re: [PATCH net-next v6 1/3] net: ethernet: mtk_eth_soc: fix the RX
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 00:45:03 +0000
Message-ID: <179470350391.2199510.1485391861090132860@kernel.org>
In-Reply-To: <patch-4b4c5003bcf028fafd094e719c5e910b@loljews.com>
References: <patch-4b4c5003bcf028fafd094e719c5e910b@loljews.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "net: ethernet: mtk_eth_soc: fix the RX"
  gets the history and cause backwards.
- [Low] The subject line "net: ethernet: mtk_eth_soc: fix the RX" does
  not say what is being fixed.

--

net: ethernet: mtk_eth_soc: fix the RX

This patch resets dma_addr to DMA_MAPPING_ERROR at the start of every
loop iteration in mtk_poll_rx(). Without it, a descriptor that goes to
release_desc without a new mapping can pick up high address bits left
over from an earlier iteration. That matters on MTK_36BIT_DMA SoCs with
DRAM above 4 GiB.

> That protection was added by commit 6e0490fc36cd ("net: ethernet:
> mtk_eth_soc: fix SER panic with 4GB+ RAM") for the MTK_RESETTING path,
> but commit e10a35abb3da ("net: ethernet: mtk_eth_soc: fix
> uninitialized variable") moved the DMA_MAPPING_ERROR initialisation
> out of the loop, so it only holds for the first iteration.

[Severity: Low]
Is this history accurate? e10a35abb3da is dated 2023-09-10 and
6e0490fc36cd is dated 2025-04-27, so e10a35abb3da came first.

e10a35abb3da also does not appear to move an initialiser out of the
loop. Before it, mtk_poll_rx() declared dma_addr inside the while loop
with no initialiser:

    dma_addr_t dma_addr;

e10a35abb3da moved the declaration to function scope:

    dma_addr_t dma_addr = DMA_MAPPING_ERROR;

It also added the first dma_addr != DMA_MAPPING_ERROR check at
release_desc. Later, 6e0490fc36cd replaced that check with the FIELD_GET()
branch:

    if (unlikely(dma_addr == DMA_MAPPING_ERROR))
        addr64 = FIELD_GET(RX_DMA_ADDR64_MASK,
                           rxd->rxd2);
    else
        addr64 = RX_DMA_PREP_ADDR64(dma_addr);

So that branch only ever worked for the first loop iteration. Nothing
broke it later. Could the message give the order that way?

The message also does not say that this fix depends on the FIELD_GET()
branch from 6e0490fc36cd. Both hunks touch only the declaration and the
top of the loop, which have looked the same since e10a35abb3da. So the
patch would apply cleanly to a tree that has e10a35abb3da but not
6e0490fc36cd.

In that tree, every descriptor reaching release_desc would hit the
dma_addr == DMA_MAPPING_ERROR case and skip RX_DMA_PREP_ADDR64(). Its
high address bits would then be cleared. That is the original SER
failure, now on every iteration instead of only the first.

6e0490fc36cd carries Fixes: 2d75891ebc09, so most stable trees probably
have it already. Would it still help to name 6e0490fc36cd as a
prerequisite?

> net: ethernet: mtk_eth_soc: fix the RX

[Severity: Low]
This isn't a bug, but the subject does not say what is being fixed.
Something like "reset dma_addr per RX descriptor" or "keep descriptor
high address bits on release" would be more specific.

> With MTK_36BIT_DMA and DRAM above 4 GiB the hardware then DMAs the next
> frame to an address that is neither buffer, and the driver passes the
> stale contents of the untouched buffer up the stack.

Could the consequence be stated more directly? Before this patch, a
stale dma_addr from an earlier iteration reaches release_desc in
mtk_poll_rx() and goes through:

    addr64 = RX_DMA_PREP_ADDR64(dma_addr);
    ...
    rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size) | addr64;

RX_DMA_PREP_ADDR64() fills RX_DMA_ADDR64_MASK, which holds physical
address bits 35:32. These bits are combined with the current buffer's
low bits in rxd1. The device then writes received frames to the same
offset in a different 4 GiB window. That is silent DMA corruption of
memory the driver does not own.

The mismatched address is also passed to dma_unmap_single() later. One
caller is mtk_poll_rx() itself, on the non-page_pool path:

    if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
        addr64 = RX_DMA_GET_ADDR64(trxd.rxd2);

    dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
                     ring->buf_size, DMA_FROM_DEVICE);

The other is mtk_rx_clean() during SER.

Would it be worth calling this memory corruption in the message, so
stable and security triage can judge how urgent it is?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-4b4c5003bcf028fafd094e719c5e910b%40loljews.com
