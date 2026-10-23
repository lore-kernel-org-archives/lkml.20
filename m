Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772855;
	b=w15w+RJuXHpPeEXLrW8cEv9jej693CgqzPx9PdJQXMzcq73BQIZGfdL4OVcdqNiZQVMy
	 7H8N4RpDydhmGVP67Dx6cY/gRu8s6INd5id2S7Lu5FXe/V7joTB1s28wwuNvcIFfHCinS
	 PYcVGt6su/dNxIpUBSej1tg+KuH49UJrXryCaK8/iTvgBviJ24RqgLnzNQ/asCRjLOttT
	 uzWCtKF752SMz5IPFdiXl50JI5VRzxEvioCXgza4bJZDbl9xjZVrtju1yi5vCFlBbRk2N
	 0h5Sz128/JVMgNUJRDrYqcG7Lu+9ZYSS2mbsOX/u+hmbeLuSrUOuoR5JMLwfVfXoH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LnT7ErhIPfz2XEiDMVSZAaVOI+TPOyMOC4a7RAVDPqc=;
	b=j9sdz4XiboGXz7HDB5gdlzChrbNDWi/YKBWBAPswB8BGsgM1z5krK180UaPTAkkff3Rp
	 DnC3qnxqpRGcYnU8QjVonDVM77emb1XslCMpXtNoEypDzsc44ptKLfW+Mpt1Q/ILT4Z9R
	 S28FGZurA3a0jG0X+JJV/oj+X9X0HTC2kC4PMCTArqN6ZIGvgJRm1Lropasu5HsNFpVGe
	 KNBojRFvunFoIXVQfIfJ3WhD9W1xZdrnoBuKlgrfQfR55rNFIn+1/jVoMrS3P8ataqJV7
	 y8dwrPeMYFBZioFi1DTymGhQJfFSty0yQET+eCjLNTO110puQrgb83smUjoajnjSvwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c6EFyH0A;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576EC606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576EC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c6EFyH0A
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso635199eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772854; x=1793377654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnT7ErhIPfz2XEiDMVSZAaVOI+TPOyMOC4a7RAVDPqc=;
        b=c6EFyH0AR4YrAqnRW5359Qq5fVB/fFlXkFiz2Y0Y/vNq9FQTKDfW+eI/bKstwuUyXg
         r3UASbNrjuCIARXD5yucGYPkXUwzHBXTzUeinEVtRy7xBrUKcd6X1cMJ+mFnOPx6xqPN
         iy2pZG46MQesm2e6BGjtor2UyjWsZOSsRHsqviOBQ5j43uVccYephAwdlS+4GSTvu1ta
         9BEQej/XTtxRoen0I6Gdmm148jCm//hStKY+tSQPfDYL9M8F1cE3Jp06wMWc0A6A/Zmn
         F7B2SdCFX36SLw+q1Ktq7LTae6s+0bJBWTAcGnglGT6ZuyAQboJRF7TLXDHuFlLCkBoi
         nD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772854; x=1793377654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnT7ErhIPfz2XEiDMVSZAaVOI+TPOyMOC4a7RAVDPqc=;
        b=mkQpcXQYU7DZDkWh6ar7KSUsEZg8s8IItZKjrNcUztjnOMjz3ovlwH+zYTIOm4dNfn
         Zcjvw5qPxt40EeuCOHWH0k2FRyPUbxb92PTN8vlme6XMjG4VkflOuRSyVmTM0uXQUqor
         TLCugYfcy3v09OrpiZ1SWyZ1jKE/mLXmX3t/PdChz3lxXQGII6pNa84qelC7jjRDIohw
         GyPkAhQzOqtLMox07aRmeEheT9VfuQDGa1t13eQvmlLrcQIK9RxSEg4t08jiUIxkReBd
         Wlw+VzONXu7AYigPVf4nrhLSh1LyWqpU0rEOpI8bHTcv62Go44S+/Kk2gtKorkNX+v07
         j1vg==
X-Forwarded-Encrypted: i=1; AKwUvBxR/g8bAsdg8sFZnMjR3t/qfJYDdwjSykOzXiwvZ2yb4PEkWK4DvRY1WAvUynDwiIHFfJEjzpU/S+/gGqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4KVmmZ1FJ6SozP+1JmleKULC2/ae0dBWHmCas/sH5dD3dw835
	Y2uEUzLY1P9YIvM2XdKFFMmfIwxQdqGYhtbf6nzwsey290bfZPscJIYN
X-Gm-Gg: AYBFou0Y9YSRq8sgkgTR365E/oWtnAiOpFtfdPwfvpl8n9o2CfKGME/Exs8Cj9yItfY
	YGONz14n4Gll/B24498jgGGHjVhTYXtkG10qmRrGB+RZ7qj3wxZNnU4UTH4osLbHwsVv+iO8zHw
	hCTO10nPqBzkkL4/NnMIYXfoXFEddAyKKALitFlIrTXkKWU4vXHSGjllwDgmEJHV+ZHKBWNWnSl
	XNZ8+zLmkjjgculItiAy5y0p+mK5WWuOG6vjNdN/QTVJtyaNnFYnyQXt7tWZRhyNtdJ5p8zcI/C
	zn02BTBjd1e2O98lK+IahHPiTYwD6ftQCVtKai2cejuHAkXnTWNZT63EpZcll0Ht+Z8dctPtrzO
	2FQGdLCwuctnmFH25HsnaFxu/428EGZHKboJpBSEOmLxQg5rvfBN1d0ZSEUlq8meDNt6uJFjald
	h+LdHaF4GembdWURIgea6j2lIkyfYp22TEeY7h/ivmAt75Z0IX//BzXLSDhfNColN+G6iCXaCkz
	tQ4eNYfOGSG5krR6olZ1YR3IHMvFGkV8a8NancFCystPdKYZkPAHGMY0OCM0/DdT0m2p79u7ZRj
	3vdAuyXj3q98fHNfY+i1dm8Az6paYTXlg3jMpyKZPKTaaDOjivrEQqK6eW9xZDedxKgb6HSmzyH
	dA+m62+zGJKIf+ZrVZ/svH5hJEDDpzWZJvjlARRxR2hVlbGIt5shhiVhltXBaBbAN+4sMVm+J3I
	zGKZ8=
X-Received: by 2002:a05:6820:440c:b0:6c2:396e:b991 with SMTP id 006d021491bc7-70b88a8ec5amr1684933eaf.61.1792772854205;
        Fri, 23 Oct 2026 09:27:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9aed3144sm372801eaf.12.2026.10.23.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:27:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 10:27:23 -0600
Subject: [PATCH v3 2/4] dmaengine: dw: serialize error recovery with
 channel termination
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-dw-dma-synchronize-v1-v3-2-c62bf048f5ce@gmail.com>
References: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
In-Reply-To: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Maciej Sosnowski <maciej.sosnowski@intel.com>, 
 Dan Williams <djbw@kernel.org>, 
 Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The tasklet samples RAW.ERROR before taking the channel lock. A
concurrent termination can empty the active list before dwc_handle_error()
uses that cached error to select a descriptor. The list head is then
interpreted as a descriptor. Even with an active descriptor, moving
queue.next unconditionally can put an empty queue's head on the active
list and pass it to dwc_dostart().

Recheck the error status under the channel lock and stop the channel
before selecting its failed descriptor. Only one transaction is issued
at a time, so take that descriptor directly instead of scanning for
completions first. The scan can otherwise complete it and start queued
work before the error handler has identified the failed transaction.

Detach the failed descriptor under the same lock and use the queued-start
helper, which leaves an empty queue alone. Clear the software-LLP flag
before restarting so a failed multiblock transfer does not prevent the
next transaction from starting. Keep the completion callback outside the
lock, with the detached descriptor owned by the tasklet.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Fixes: f336e42f73d9 ("dw_dmac: Move single descriptor from dwc->queue to dwc->active_list in dwc_complete_all")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 07a5f5105787..51c5460b4670 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -408,10 +408,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	unsigned long flags;
 
-	dwc_scan_descriptors(dw, dwc);
-
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/* Termination may have cleared the error since the tasklet sampled it. */
+	if (!(dma_readl(dw, RAW.ERROR) & dwc->mask))
+		goto unlock;
+
+	dwc_chan_disable(dw, dwc);
+	clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
+
 	/*
 	 * The descriptor currently at the head of the active list is
 	 * borked. Since we don't have any way to report errors, we'll
@@ -419,12 +426,7 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	 */
 	bad_desc = dwc_first_active(dwc);
 	list_del_init(&bad_desc->desc_node);
-	list_move(dwc->queue.next, dwc->active_list.prev);
-
-	/* Clear the error flag and try to restart the controller */
-	dma_writel(dw, CLEAR.ERROR, dwc->mask);
-	if (!list_empty(&dwc->active_list))
-		dwc_dostart(dwc, dwc_first_active(dwc));
+	dwc_dostart_first_queued(dwc);
 
 	/*
 	 * WARN may seem harsh, but since this only happens
@@ -443,6 +445,10 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 	/* Pretend the descriptor completed successfully */
 	dwc_descriptor_complete(dwc, bad_desc, true);
+	return;
+
+unlock:
+	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 static void dw_dma_tasklet(struct tasklet_struct *t)

-- 
2.53.0

