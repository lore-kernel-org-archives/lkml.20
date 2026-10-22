Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695174;
	b=MbuFhGVGYcno2K6SmtbcntOtG9ZRQ0jj2A/FfHN8AtS0g/48NMW8hS+CHpwhf7+RGZVm
	 mNsKucXuE6LuWDjsQuIJmX7zvdI45S0ZB5/kd1XOUVM8WRLtE0waOnbEwIwXB0ox/f4Mf
	 hQkIXHNk64KCGRaYzJYfKnko4/1zbcYy2rL+0mr4Qwyym1x4Ogh1d/tQnIzTPkFKP8Paf
	 qHSwPBCjQBPRzdc+/QVlCUpDdT8bWEtKT3QhgHAoh1LpibplyOwMuO11B02MFsH2V2BYr
	 7tQczwYEPdCWG6IkGrLp4KhQJLzZD8kF7ibjuvE116mhxE6gc5CInunet9bcobmyanA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZNy7GlryTQX1/7R0dXcIMAHqMyL4o5XmS9vSyRLbpSw=;
	b=ams8Fpm9mCrCwYLL4QAwIYz9I9q/UTtWFWXoe7ZgW1sSDc1uRJdDB0eGyHWbsu7wjVmD
	 M5ltugDhfxK+hL/qfI/wJaa1AY4Gc7HYJdwYEVttRhqkTzMWWLrvRyCnkkLR4IwB6K9wD
	 6mXhrCMshcwwN/CdgfV9bG5oH9AQggO0vLF/Y23idsjlqJK+iPSPAGaJM+RgelCj5y12j
	 bNOemTSEsSVgRpOmcQ/lvUegvKqP9ttaYo9fHnD3SPz7AHE4rakCsypVuNb/t3wrfNqGo
	 zlPNGjpBO+rB6Uzn0841efyUuXCurf22atfV7oZex5oj/pdqvPBLdL84V6Zoj1/CCzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YEUJjpDc;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859BC606A335
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859BC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YEUJjpDc
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6de2f213b7aso70283eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695172; x=1793299972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNy7GlryTQX1/7R0dXcIMAHqMyL4o5XmS9vSyRLbpSw=;
        b=YEUJjpDcSywgbdSCg2CHm0rj4zicRED03tF52qYohnYatMax3GbXi6/+uiPr2HF+K6
         WzpNWntxa6F7YJwEiWCt3LtrBL7g9pkjFIb2gg61F/oFaD0XS5ZMM1Ug6SWWVaEbi44J
         xGlmdnFT7E7GcwiB/8FWCT+wEUJylOKeJNXnWcR18hXmnDunvRCPY+GQndRCOGzQJAqM
         HiAFd+mc6iDrSHlZv+hvHw92OIYbJivuUMSvK300ucHLRDc8D2Lg06CnvQUnJTPjy5/z
         bCG3QqKyxrJONZ1vOR2wz2X6rcevGzGvXX2BWWMJUT9osIfZxXQG0ruwfLjWlBwBrh6f
         6doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695172; x=1793299972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNy7GlryTQX1/7R0dXcIMAHqMyL4o5XmS9vSyRLbpSw=;
        b=PixubP4aE/ykUe3AOTLRycKx0/oSEHg/pZeajh7+7YWwXbT7kZjghk8YhNpB9+sAv0
         /NQ8X3D6+xD+2sIlATMp4FwnxeLAKooUu8Lv6SLPO31gjJi7s6S0xWGRYk6bOq2I4DJy
         Ie4Mj1Hl7QrH7lNSOyr830KYIbRmVOrRvdiuJ20ICZc6kflsnyOjMo3f+ZPrYLci8IYG
         r1CofzQzKyJhkBbFPwgWge91pVxIspnv7i5EL3ABg0mAzKQ9H0YidJrpek89D3168voY
         3HPc1+yqGbl7NWl2sYbm0FyXyk5MP18zqbgUkfHOAK/jikGevj9hgWZtUAW8yB4KNDe1
         TQeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrpqMm5f4huEP+++gEgA5/hWcfdgeuklyAmWYigVykh7ZFmerA93kKThbDnYUbN9uOx8h6reJubfNf/0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIynfhkExn/jFcHLHIa9gvqXdDBDLgvBhgnLPO3ju4rpocpEiZ
	GJZqAM+W/EfhjGtuF1FM1oZKX5SoUFGWmotU8IqfaTDRuP+/NcvbzpAB
X-Gm-Gg: AYBFou2BoedtK3ocA7BE8GIwuMx3WsyCyXcZjm7Uzf6fI95UmfkZwbzOG/oj8Z0QAwh
	I6z7dD5gHAqWr8zQjax2gZ+gUG9qpfkwIbTTQPMXO+F1HtbP/wZTcFKgGl+aOBedgyPI6BRk8vJ
	tNUO/Ys2L5sFKDVYkuTQVmqeAFRa+RSMtHAwbdjmoGBlDKYCF9kEU2BWqyQxYSstFV8Zkrhd5HW
	Z3jip9dq38cijmBmDv5yQs4sDI2QdL1NjcA7CDGIpml9xAOOEuZCIi2Xc7fqZqawYtVcNglnXSz
	SijO41Kwgr3tLYfniBV/5bxwnivXFcKJQMRMY5PaEXMDUoOQEYEYUronB5NI+wSoV5favOTikCK
	N6PUzUkJ6GMuMqpRuSA7LbJlfmXvNHpBNrTKJHrwx5dHtiab9/DySAWj3jFAoE6lm0o91WhC0tv
	0ea/t8Jczhha+eZghcOdw2PL+hSgqfy6qweHsNjtUW507aCBPRWlx8+shoNkgqczp9Oi2X66Dpe
	yXMaEdNHP/CJLp4aXzNx+3EDbzhbN5T0Z3jMu6brtM2/duO+nRCtHwW9aEFYNeF7y9v0D4ftBBV
	2FoX0zsADbBhxqEqoWZNlHeNhXuzv5ZWxbHYwIMbRxBfOXxrGHMJTO+2rXXZzqqiDPbvr2YSD54
	mOTZzu2JrrGxymhVjm2bu72mLv+j2fpUBmniJFKBI35h1GCBhfUAtWTeYsDNoFbnosZgrMSN18W
	SZkcHX
X-Received: by 2002:a05:6820:198d:b0:6f4:80f6:6ae7 with SMTP id 006d021491bc7-70b88ab7462mr231021eaf.67.1792695172346;
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d288sm536083a34.4.2026.10.22.11.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 12:52:49 -0600
Subject: [PATCH v2 2/4] dmaengine: dw: Fix XFER bit set, but channel not
 idle error
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
Message-Id: <20261022-submit-dw-dma-synchronize-v1-v2-2-5244e94dca8c@gmail.com>
References: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
In-Reply-To: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

If a client driver gets to use the DW DMAC engine device tougher
than usual, with occasional DMA-transfers termination and restart, then
the next error can be randomly spotted in the system log:

> dma dma0chan0: BUG: XFER bit set, but channel not idle!

For instance that happens in case of the 8250 UART port driver handling
the looped back high-speed traffic (in my case > 1.5Mbaud) by means of the
DMA-engine interface.

The error happens due to the two-staged nature of the DW DMAC IRQs
handling procedure and due to the critical section break in the meantime.
In particular in case if the DMA-transfer is terminated and restarted:
1. after the IRQ-handler submitted the tasklet but before the tasklet
   started handling the DMA-descriptors in dwc_scan_descriptors();
2. after the XFER completion flag was detected in the
   dwc_scan_descriptors() method, but before the dwc_complete_all() method
   is called
the error denoted above is printed due to the overlap of the last transfer
completion and the new transfer execution stages.

There are two places need to be altered in order to fix the problem.
1. Clear the IRQs in the dwc_chan_disable() method. That will prevent the
   dwc_scan_descriptors() method call in case if the DMA-transfer is
   restarted in the middle of the two-staged IRQs-handling procedure.
2. Move the dwc_complete_all() code to being executed inseparably (in the
   same atomic section) from the DMA-descriptors scanning procedure. That
   will prevent the DMA-transfer restarts after the DMA-transfer completion
   was spotted but before the actual completion is executed.

Fixes: 69cea5a00d31 ("dmaengine/dw_dmac: Replace spin_lock* with irqsave variants and enable submission from callback")
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 54 ++++++++++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index af1871646eb9..fbc46cbfe259 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -143,6 +143,12 @@ static inline void dwc_chan_disable(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	channel_clear_bit(dw, CH_EN, dwc->mask);
 	while (dma_readl(dw, CH_EN) & dwc->mask)
 		cpu_relax();
+
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	dma_writel(dw, CLEAR.BLOCK, dwc->mask);
+	dma_writel(dw, CLEAR.SRC_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.DST_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.ERROR, dwc->mask);
 }
 
 /*----------------------------------------------------------------------*/
@@ -259,34 +265,6 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
 	dmaengine_desc_callback_invoke(&cb, NULL);
 }
 
-static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
-{
-	struct dw_desc *desc, *_desc;
-	LIST_HEAD(list);
-	unsigned long flags;
-
-	spin_lock_irqsave(&dwc->lock, flags);
-	if (dma_readl(dw, CH_EN) & dwc->mask) {
-		dev_err(chan2dev(&dwc->chan),
-			"BUG: XFER bit set, but channel not idle!\n");
-
-		/* Try to continue after resetting the channel... */
-		dwc_chan_disable(dw, dwc);
-	}
-
-	/*
-	 * Submit queued descriptors ASAP, i.e. before we go through
-	 * the completed ones.
-	 */
-	list_splice_init(&dwc->active_list, &list);
-	dwc_dostart_first_queued(dwc);
-
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, true);
-}
-
 /* Returns how many bytes were already received from source */
 static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 {
@@ -303,6 +281,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	u32 status_xfer;
 	unsigned long flags;
+	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	status_xfer = dma_readl(dw, RAW.XFER);
@@ -341,9 +320,26 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 		}
 
+		/*
+		 * No more active descriptors left to handle. So submit the
+		 * queued descriptors and finish up the already handled ones.
+		 */
+		if (dma_readl(dw, CH_EN) & dwc->mask) {
+			dev_err(chan2dev(&dwc->chan),
+				"BUG: XFER bit set, but channel not idle!\n");
+
+			/* Try to continue after resetting the channel... */
+			dwc_chan_disable(dw, dwc);
+		}
+
+		list_splice_init(&dwc->active_list, &list);
+		dwc_dostart_first_queued(dwc);
+
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
-		dwc_complete_all(dw, dwc);
+		list_for_each_entry_safe(desc, _desc, &list, desc_node)
+			dwc_descriptor_complete(dwc, desc, true);
+
 		return;
 	}
 

-- 
2.53.0

