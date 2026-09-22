Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785054DAE2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084827; cv=none; b=itrhEMWadp6oDfCZfy9prJLxX7Qr7/1suPobTNw0wOcbL22VaGw9zSlX55/9olTXVZVCGVqHgcQs6ffG7O+nNrPxO+O22L0zbWdTYGVKhkrj4cQDCzvoBOv2pPCWnYSyz0IWQzQinY+3l0MrWE3gF3ROE/2exrCeRJk2zLO0Aac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084827; c=relaxed/simple;
	bh=/WV6UcnYJb59+aISOqYnJ6c8jl3+NFWBfdwZyU/KRWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=TxXyv1nTn5+o22bgz3d+HmUeDDcXV9F+pimxCMKtqAMM1s623OJj5F6c25n180q6eMcqGIAvyjfWdIJgpM0Um4C+j/jG42S2xUaWs9J4ztlmM1v9amYvwFm2zkuw2Us4Jtw+VSugN4doiK1xmO5OE2O19HHm1D1d8FwctvE4WG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0t8ElE1; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0t8ElE1"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so3111934a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790084824; x=1790689624; darn=vger.kernel.org;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rf3NcYvAmItVxbqtkxxzSpUPurh9H42FsWoY744N9zk=;
        b=D0t8ElE1PtDL708QOVh3ERdEGhjujno5L+rRCINOI/IgqxswUwQz5W36uPgHqQvDdm
         cIT0joE/ArPAXHZafNvl2L51AVZT5KZsHx+W3mBy3yM6baezxTCPbyFD6EINOILIQSFh
         9kVsdJs+RaQsLjyMQa0bJt0trsCpeKSD51qlJAi43wmuOEIJT2o+MHQyWerr42wPxJ0t
         VSGh/YHY0sSBGOJwnmVg9nsN/+UXNoAcLE76WcofZu8ef0ewWrdt/1cpDGIIRF0QiIke
         xKs/YGgYLabz9Jrsn31z5FIneQnzoobyHPYe6pLCOzlYgNPP5/Qalmsu3nnxtc6m/z1l
         Zz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084824; x=1790689624;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rf3NcYvAmItVxbqtkxxzSpUPurh9H42FsWoY744N9zk=;
        b=W9lNOCFMaylPseSXnx6W0TrQ2/ICFh2nh+kljzSl2hrC2ZsT0uYO7J4w1s1Ky6aFi6
         uxWDODGNBqMNnZZhvwZWfR0HcfZBlfzhn2BiwsEfULW0YkfsdIi8ddVFgHIR7ORP38uA
         WrT1fEhItHI79kMmHdrNNWPvKVrhIPUbpvJnVcc6E+7BWEdRze6+AocR564cIdKbBv+2
         RTyQBnTUHhjZ/KGqgVVS4/CoPf3aSr8updHU9eKbQt1VwcUntgjSQ197/yRReUSU4y30
         qbouGZLtBLqc9dH4O7m2itt3Q9kRPyHY/a2WrfJ6L+41a9nuRvZAd8Mo7o4O672jLEOk
         DeoA==
X-Forwarded-Encrypted: i=1; AKwUvByiHGWJU4mktoc2/qo8ZEVralZjHmq2u2osGgw+CHB2FrG1k9WvikPVVjWw2h1bUR5LXGLKVa/qCB9FA2o=@vger.kernel.org
X-Gm-Message-State: AFuF++mwFcGJ8/IiXdUDGydN4aJtEnMEBuUyK9SQlP/VF32Wl1iRvdGB
	J2rXx3ZCxXzAf/DYVwuaXpMja64J8m79PCqmBB++gqeCewfqCmDPxkbS
X-Gm-Gg: AYBFou3oa2MD5MBcDXzbHt0nc0ItcLFNX2bBnrabTI6eJhA7XpF91sWcOQekwMZC5bW
	w6QT775KawTU7Pw6vdgCz6+IXTcecNySuilwj9/NKR/d11xWV1Sz7Ced0+ogyZmlQGaFov3oHjh
	2iYdJ1Twd/TtAmRFWYmTcQlKPyk+pZoSz+2doprgn7rPubcWYM4FFAl8gBfJIZNg6o2CPT1fLKA
	pIYZwusRLWmRasZfIJ9iusHx+n9D8hmvZVLScpNoDDmcP+gwqZ/QwqzCRR2zIrjAsPj+WVQRgQz
	JR2PdMreHW3UJOtbgu52Eda1isetr9M0/FB5gMEs+AmwcpRDfefRbGQKAbcDpV6yCBNwduKOclv
	1Aa2+3nw4mM+VLibsMHbLg8wJ7v8m1zU/ia5Cf3ISLGe7HBXEBqpgkEwppvHRwIlYr25sjXokAU
	5Ip48D8HcDFzPvvjhIdCAMWY8aMU23blLOltKcLrtsytg50/jckGOO22ar9iQiCtckJSQIGAjdu
	8kEANhHTQtzYUm26LDZrLYOQCE9I6NrMII1pkE=
X-Received: by 2002:a17:90b:35cb:b0:39e:6c69:f479 with SMTP id 98e67ed59e1d1-3a073262d85mr1337283a91.56.1790084823601;
        Tue, 22 Sep 2026 06:47:03 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06caf4a73sm1381225a91.2.2026.09.22.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:47:03 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Rex.Lu@mediatek.com,
	andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	edumazet@google.com,
	hujy652@gmail.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH net v4 3/3] net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Tue, 22 Sep 2026 21:46:04 +0800
Message-ID: <20260922134604.617-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179000700034.2160803.10594281691384015089@kernel.org>
References: <20260917144335.19466-3-hujy652@gmail.com> <179000700034.2160803.10594281691384015089@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=v4reply
X-Mutt-References: <179000700034.2160803.10594281691384015089@kernel.org>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 04:10:00PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In mtk_wed_start()
>   (drivers/net/ethernet/mediatek/mtk_wed.c:2346-2347) the newly added…
> 
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but the patch
>   widens it: dev->tx_wdma[] descriptor rings are allocated with…
> 
> --
> 
> net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
> 
> On a non-DBDC MT7986 only rx_ring[1]/tx_wdma[1] get set up, so
> WDMA_RING_TX(0) is never programmed even though WED needs it for RX
> offload.  The patch adds a call to mtk_wed_wdma_tx_ring_setup() for ring 0
> from mtk_wed_start() when the device is WED v2 and rx_ring[0] was not
> allocated, passing reset=true when tx_wdma[0] already exists.
> 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> > index 3f0be70c3f145..3800e602d3c48 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -2339,6 +2339,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
> >  		if (!dev->rx_wdma[i].desc)
> >  			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> >  
> > +	/*
> > +	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
> > +	 * but tx_wdma[0] is also needed for WED to function.
> > +	 */
> > +	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> > +		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
> 
> [Severity: Medium]
> Should the return value of mtk_wed_wdma_tx_ring_setup() be checked here?
> 
> On the first start of a non-DBDC v2 device dev->tx_wdma[0].desc is NULL, so
> reset is false and the helper takes the allocation path:
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_wdma_tx_ring_setup() {
> 	wdma = &dev->tx_wdma[idx];
> 	if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE,
> 					 dev->hw->soc->wdma_desc_size, true))
> 		return -ENOMEM;
> 	...
> }
> 
> mtk_wed_ring_alloc() does a dma_alloc_coherent() of
> MTK_WED_WDMA_RING_SIZE * wdma_desc_size (32 KiB on MT7986), and on failure
> the helper returns before writing MTK_WDMA_RING_TX(0) BASE/COUNT/CPU_IDX/
> DMA_IDX and before the "if (!idx)" block that programs the WED side
> MTK_WED_WDMA_RING_TX window.
> 
> Since the status is dropped, mtk_wed_start() keeps going through
> mtk_wed_hw_init(), mtk_wed_configure_irq() and mtk_wed_dma_enable(), which
> arms MTK_WDMA_GLO_CFG_TX_DMA_EN and, for rx-capable v2,
> MTK_WED_WDMA_GLO_CFG_TX_DRV_EN | MTK_WED_WDMA_GLO_CFG_TX_DDONE_CHK, and
> then sets dev->running = true.  Can the hardware then fetch descriptors
> from a ring whose base register was left at 0 by the preceding
> mtk_wdma_tx_reset()/mtk_wed_reset(), leaving the WED offload silently
> non-functional with no message?
> 
> The other caller of the same helper propagates the failure:
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_rx_ring_setup() {
> 	if (mtk_wed_wdma_tx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
> 				       reset))
> 		return -ENOMEM;
> 	...
> }
> 
> and mtk_wed_start() itself already bails out on mtk_wed_rx_buffer_alloc()
> and mtk_wed_rro_cfg() failures.  Since mtk_wed_ops.start is void and
> mt7915_dma_start() cannot observe the error, would it make sense to abort
> the start sequence locally here (skipping mtk_wed_dma_enable() and
> dev->running = true) and log the failure?

ACK I will add error messages and return when there's an error.

> 
> [Severity: Medium]
> This isn't a problem introduced by this patch, but does this new call add
> another leak of dev->tx_wdma[0]?
> 
> dev->tx_wdma[] rings are allocated by mtk_wed_ring_alloc() via
> mtk_wed_wdma_tx_ring_setup(), but the ring-release helpers never free that
> array:
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_free_tx_rings() {
> 	for (i = 0; i < ARRAY_SIZE(dev->tx_ring); i++)
> 		mtk_wed_free_ring(dev, &dev->tx_ring[i]);
> 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
> 		mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
> }
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_free_rx_rings() {
> 	mtk_wed_free_rx_buffer(dev);
> 	mtk_wed_free_ring(dev, &dev->rro.ring);
> }
> 
> __mtk_wed_detach() calls those helpers and then does
> memset(dev, 0, sizeof(*dev)), so tx_wdma[].desc/desc_phys are discarded and
> the 32 KiB coherent allocation can no longer be released.
> 
> The existing allocation site is mtk_wed_rx_ring_setup(), so the omission
> predates this change, but non-DBDC MT7986/MT7981 previously never allocated
> tx_wdma[0] at all, and now every attach/start/detach cycle would leak one
> more ring.  Would adding dev->tx_wdma[] to mtk_wed_free_tx_rings() be the
> right way to restore alloc/free symmetry?
> 

There is a patch in MediaTek SDK fixing this exact issue.
I will pull the patch from there.

Link:https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch

Best regards,
Zhi-Jun

pw-bot: cr
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917144335.19466-1-hujy652%40gmail.com
> 

