Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312992;
	b=xNiXmLB9VjmWcs1s52i+ZoQeZgcKanA3Us9VC0D65r71LWyEuoUn5E9+AXTJVjYsrffL
	 qeY6d2wrMzBUWoCGPZdeChK1+ifm4Vu5898xmWKxgoqguWoj0xsrisRX1cuIOmtmUmT5r
	 gM2+U61vDFyTvvvYS+tZ7tpiB05TgtUKwwVQQPmD88GB/P4RblXZZlgLKQECidPXK0TLc
	 balkWKG+MKjY0IFbbUmmlb/kK4ENtPUUzi7pYXy78ZKZZI+y4l54gja4Kqjy75V3aDuC+
	 cS1+9Dk4h8HqMBSIv0ejEcjJ+NXWYHSUlI275djvcv8ZfqATp3YQB5nu7T+AmpN8j8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WfY8c5mvIozvo8fZqoEeqzCcOy78ENTaP61rU6ASEDE=;
	b=tGGpKyxXfF8SLB1WREZacO9mRDi4LX9UGITo17uxhZiLXbCjYwh32OIF3V1I+/CueDsT
	 RJKZKhkhEhaXLV/IDNCg3pkwSXNyNlblRNTKlywkvVXM+3HhKZqCL9GpeHGY1olLHWq/P
	 Yr/Lk0pw9mKAFsurdIX1EAwFQcRfCVUbLebgk3o/hpuNO7Z74KuVFR6UsgPgzrod1NRZU
	 gvKnBs223YUlSO6izOhP6E8oa2r0gWiTv8RFChvqjfyzVrUo5GmKKY/g6N6SuI8oTEqn1
	 Prw0bhGP614Tt6W0DiKPBf3XzPOJQ3qLjA8xxiVbs+llMagTgkvN/6HhsJUvJZBo48Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCKII17x;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E2606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4E2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCKII17x
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec9237600so51237b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312990; x=1793917790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfY8c5mvIozvo8fZqoEeqzCcOy78ENTaP61rU6ASEDE=;
        b=WCKII17x6k3IcI+BdpSh5/L0F4hXyUAX01UzKcgwftNpct61Eqdm9jgKeNlCrYcSVc
         +yr75ydP2Sr67TGzDUdc8rUUsA6F2LUsru1XeaXZw9klt6XiRTwbqxg536IH5gEpp9WZ
         ePa1u/d5DZnoN9NtxkDpnBokS4AJ+2WOrekc+DoaHTORwdFb2OvMl4DzlMaEQGgZFFqI
         lnTY0qL+2ONhBtO/XbAF6Y2zjzkJ+T3iIbceA0DBVf27DlzmV+3HFaxE5faRTNSmnHIw
         RleIb/7vKJ7E4nGSUSWo1UpCni6cG75JxbCr5U2SOcMmJD76jpEyxxSE3exstuS5B1yA
         mNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312990; x=1793917790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfY8c5mvIozvo8fZqoEeqzCcOy78ENTaP61rU6ASEDE=;
        b=GjIT7jIEqwbNeVHhAmvohlcGw25mMw35mxvzsARySSPYk/JWk7F/G7VMn2C2yc/KJj
         plMJnr7reepevfqJ/LIS/7EJXG4Wu0ok3YfNK6hqPOz6ZY9mTVuNQb8dB/7Fi6CoidEk
         +vJUKPmGMnqRGc7hrjV359lzYQxCCkWCPJCG+668yFT/DDMCIONLCfeUNq/QbCJv+9zc
         MQkXopz1VnV4cfgzrM9Ro4A9bR5rlVkxofXpWNJ6Y8T1Mj69JQxftN5wcIpdpqx92E3k
         U5nd//O2ywSTfyxttg8GeiTxbn0KF/urOn3RIIWQnT8vV00Ds7AWRycsTXZdUBGa0KFo
         6FEg==
X-Forwarded-Encrypted: i=1; AKwUvBxh2ttdhANnbCUP3b/FlBh3vVAUR8dJtVS35Sl76DLOKqsVfiEfUdj4nXbHwYq0Bmzn8muUbZpbfRl2/Ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb9t2TlWWQtVZLDnorfS2K2saAUu1oPi77dik3dHjkhqixsPX0
	O0SBjfcNHLmPbGLOkpifoCK88Tl+tKCVZRdVr21+r2deUhcmpdGFazkq
X-Gm-Gg: AYBFou3Ni8iblR8usgTow0Yiw+d6zdLW6/y5mRs81yrx4C5MMCD/ajdL6FeTWv0ii4I
	LbshdItssWhaIatsIIINx0s7ruDoGHHl1w2eCrRQ/fKR20G6UVo8fT5VKMy8v6ETCam9EytAHFG
	osag0fXMXh3+VQWn4YHXBvqFElD9ppyEpjl3PNbk53NP1gGT09T3HaW0wYNuxkFQGdCbnhbY3Nt
	ublE8BHcFrdr9cPlStKIlMIYQvQWyTiDZGTL/CqYr7/HsspVedkar8i6D3pwtbBUI5Dewt0oznM
	eE12lI2oifTlN/O9gRSmLf0HiqWNPAdN7I+cwN2QduPLi7rD5BP43iJX2Es9DEs52EjEZlRjit5
	INzfikSlMn55L7mbTDSqV6XVQnBj4TZEwUSLCJ+S5SdlziBgMzXntABE6NA0mbvfQtMrQ5colhv
	D2LCzQDaAy5ujbqKba9L7VLbyH07UkRTMA5qVj/wfVlMe5OHg1rdpMnnyze2AJzDG1boPaMJuxT
	pCh7mNfANoz9jAb7NAiIJsmvyHnvdbnpUczsQgqSlZ3sI6XEexBekjtFO8JV5XQ0OiBml1Ipz2o
	w8PdAoDTvvgd5gzg2PGC6wdwcWKF2BzjIw8CPlX48i4t5J1jFAKAI3iUgj9ibbR2BVo8oXsCciK
	zx6kkuq9Oj1HOR+NwQO8x4ho/4yMaRlx6Lg+C+SDYZfvqVFPPngSPtmhDjkK5Nth/4NpuYQAYsE
	fz8O8VGS3xLiGLAVswYbkY8w2fOXaXZXorMmt6sCZ84EcWS0O7k7lit0bJVV0wksvXMR6hE92O/
	g==
X-Received: by 2002:a05:6808:c40a:b0:4f6:243:cb9d with SMTP id 5614622812f47-5640e048f30mr442523b6e.61.1793312990244;
        Thu, 29 Oct 2026 15:29:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:36 -0600
Subject: [PATCH v4 2/7] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-2-fea447d9f285@gmail.com>
References: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
In-Reply-To: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

