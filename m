Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695174;
	b=R0HTKZTm1gcsIav2jq/Nrq2erBm0qZ+QLU76A6zmD+7X5okkrLk8P94v7LrIaFQGcKIm
	 meIpzFk0taUz8Zl/PD/4H7aI5SdTV0AtAgadGBN1junb26MJ+F4MGvUPcYM+gSmRYQfbE
	 IZtgGuhGLl+qWFWhtOrXogimCAvyI/I5Uzk3KjAlm28QkYcgZYvBaaoKyN+mIlYqsG6Hb
	 NywrRdXcBWFGM7guNgCpp9hQxKF00kN42VthRJuW8mQMAiZJEJew45Hsodi7eLKtIcTEZ
	 SBtFE41Bx0E3XkM++TktaL9zXpUVdE2MexGb8iZXgfR24dY9oLbVajnES3wKjmi9L1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KbJm5SGXsdECTH4ZZRdz2rXhZWT5LUE28XcGXGMl8J0=;
	b=o7gZzTMuyofiMuzE8N2RccByAJhUXlugHsnR9x60NyV0tC9rk9T/BCDPLkOe7Ke+WopY
	 c9eHeKchHV+1b51eEmUI+ONssyz32MsyS4lFkXJ4zDuSJXgO3XdlvbywcA5wQEGvdU/ZZ
	 fGC8bxWAyVemC73rnuLsV8O0wxAmL9nUZZcGbgtFUIsrfoJS3/XWgVhyOfnX0tVHMF0Ac
	 6DlpfUmaL+RKGIw1wpkv1nycthc5GQaNx8kLdt3j4GySebjEMrhoNxYf22isAD5gbUvAn
	 X21jMFRE6WiVV1O9NnDhLMkqlrz+lm47PekgRDTXM48oX3g+g23gwqk02chiwzu6HEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LHfk67pa;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6568060A260D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6568060A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LHfk67pa
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843a4ca671eso32780a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695173; x=1793299973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbJm5SGXsdECTH4ZZRdz2rXhZWT5LUE28XcGXGMl8J0=;
        b=LHfk67paldhYAuv9kaDjn79xOy88fVU3TrAO/kbwW0obhlMHE6xLXBCW5C4DA1VdB2
         Iw3znsq3xbanboqW47ChizQwQ1P+jW+7oqaxabGNJsORuLtagLQje/CiEjdwKYyACitU
         2qWZ640MRg0bZvZfhRlqiE1LD7CyusNqHWQt/SXf9Bvx2hYW074YifX4NxL/lfHHWIfw
         j0QrmROhLNGxriITCFflR1/JLkvCptktrFO8569G19CO/0Lec2O9r+jampJ1pP5YSGnn
         vFFigWaIXQmYMs4E/L7/TTU3FyklrXgYlounseFxb8HLmpOhVynKXXELqrYg3y/9HjH4
         4zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695173; x=1793299973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbJm5SGXsdECTH4ZZRdz2rXhZWT5LUE28XcGXGMl8J0=;
        b=A4d8lWhov+dBN4N1QxwX0sGyVxH499kAxMDeI5Ahg2PlNy7XaEOamvBKV4TFvDj0zS
         0FhLyP5zPVxkk+6iox2j12x0aZ9gN59AbfMIW4f6GOQS9WYTZjFjmeN7XYOa1s8+lJX+
         nOomM66XFfog1oBGB0xd7A82S34Frlqh9zFQk/Kpu89KGBNe7DiNs/LL4QvzszAo7v86
         GdyHh03N+6XTco9kkloDd+Y6hBcyZYlIcscZmU56S/BZy98bt21fD1jJ97djiLzNmAxA
         GfsdxHK0+ta/VJ7tVKpVfvnqY/Zy5XreBBXYEOYIpyOzTR8NmucDt0fjE8AiHMGJD4pt
         +rwg==
X-Forwarded-Encrypted: i=1; AKwUvBx5L9Zu8Z885d+lWXNlIeADMPbbZFg+yWA3/5Jme0y05f3zsn6LFf+EnQRF+OMRUtspkbPbuL6P4tABPlY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1TrjnkrjjfiOaW+twNwYVvu7sXEdXnNyk/SZlnB1PWsjBbGqx
	nyAT3ZsN/MbasOljbbhKsM/DDW2We2C02R2saM6E4mjtN07PozPaECwh
X-Gm-Gg: AYBFou0/LSYE9ktlKbHW2T4/rKSflWILzDDA2I1AJQxFl+8tlih4QarA91TbpuKfyxf
	SOnzqvNLXFU/vgqMuazsCfyTU5ZOrWWXgbL4caJVL+Wr+hBDPruvUyool54gDnoUBiSwZDzPeEm
	bWLptOUbl/No2IoyTnMeq76tPOVss7/Sg1UmqiA6OK+bdCsfG4IvNqTwCNsSR0d4CshcnY+Bjo6
	kTRkppZklcmQoowKiScbHInvgH/GN6qdV9Ix6S//mUknaCFYOJTAKvv7jli3TIKOl0z/6UWOVWB
	tEXqarboc52rZ1tPdtNH+AtNlwkouaWwNIQPknTf6uFrbs+niRwu4k9i7PnIpauHNag/i/PgCUA
	y7auqGf5PCMjKB8R5C7pnCpCQZW8Xb7iM5xbR9BYU+o1sL10HbUx7wur1WBRgRA2c7PMB8mA0Hp
	1NLXnVJQ80prfYAdRrXie9Zdl5Yt+AEUs6nm5N3mffq6Zwb5QoLFVQSbU6Q+u6QGuIOYDfShlLn
	oz8KEYX2DislZjrrMPRb9ywwJvhexl3+mKcJjeLkCFaVAvDoiUMGvBZHFuef9//Zj9nM14DOkaT
	M9080dfLugVdyyUaFBXeKDb+7iEFnKkhR87SgIBHxShwhK+ZjBwOT020D6qT470J6lo/j5yLmJ8
	hx79BRiuFLydYRJioVJyyfpJb2HqpaUqNEWlxUm9/aKuRaMVqRXtZWyIe17roYNhPfT9nyCbiza
	/rU3E=
X-Received: by 2002:a05:6830:82ae:b0:804:d4b0:a36 with SMTP id 46e09a7af769-84d08f1169amr5063899a34.27.1792695173289;
        Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d288sm536083a34.4.2026.10.22.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 12:52:50 -0600
Subject: [PATCH v2 3/4] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261022-submit-dw-dma-synchronize-v1-v2-3-5244e94dca8c@gmail.com>
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
index fbc46cbfe259..1df028970c4a 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -395,10 +395,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
@@ -406,12 +413,7 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
@@ -430,6 +432,10 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
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

