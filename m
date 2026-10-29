Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312998;
	b=eSidayF2WNVPQLx9LTNwh/RPgk0TonBJpm8Y7SBZufz+FdqhjpyIWZcKB4FTH8s5MXHU
	 s6X6t+WMLmurYnziRZZSr1T9k6HOmgoNIl3/CVT9fsuNf6aNzYUD+o4vAzGKsP6C0nQ9s
	 zB8pPr5wtRvYfzlfGoOookPEb5CQmsGqCUST3tF3p1yl7iDlTnFDWbrRvat26cnAKFWvE
	 sNacPnWv0zHbT4M0w5b6FUwN0nibSPLeNLfOi3s1YujjpaojM1SVta0kQEVDj6C1EQHET
	 Iw5qkNHIfFRKy2l4o74K2lcV3p1NGA6znnGsqpfxIljn8KG+4VyytGlLanhVN9m9SmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ey6BHUao94Xpp8EbfeqF51xoo0FBZh7q8JGT3DY9akc=;
	b=0j4CmiPL0czAuMpjEu44/JNciiotIoeKezXp0hNUiJ54znAtVUkokVtRnYq/f7qe0Iw8
	 LfPK47+wC31st2oNGkl8iVXnfcxaU95UC2p+om19hUHWqBkCE6pFK4oxA28HU6QsQXbDH
	 u8nt9p1WcKRPFmIJ5C4WtwPs5oqiecddeW8b24UYvMg/6xYl5WW/FKI7FJKQwn6r+KMtk
	 qmjxBdKx5y5ti7j2y3yR4Ew7hmXjcv30m2RE0j2kyaFrYYFuENW5a56f2C2YiRZJqxilY
	 7/t8o5AWneJLdjq623joGWMw9dZf3qdZU9RaEcUtEXU/fFpJTlkOBQodCtTS7ufssyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxnkULYT;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C8360A2635
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C8360A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxnkULYT
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6de2f213b7aso34890eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312996; x=1793917796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ey6BHUao94Xpp8EbfeqF51xoo0FBZh7q8JGT3DY9akc=;
        b=pxnkULYTZlQQ7sbXKeHlDtHbDkGsParzPsMN1t7fwHGNfjqUgiN0kljunsNIP5k+uy
         nkHNdvMfJ3tZxQ6EUv+mD7VohbThTvs7HMYn0oq6mNeReev5QiLN/q3ZbZm1BiWwAVjn
         HVkH7yimS9tbL+a1TmhGHKEGEGIpeyK2m3ze0eHfPxFv/J/XobfGHdwpNzbyUognMO2L
         vnCFxNn2S33eXv51tVbLip3z+RN4b5boDyMXrrBnUS0D+PjXVeqTJ7aVZ33lgnCAlA4n
         Roxzx+Do2aKiIhirrwKfDUFlEgZ/7WSNOl77Khc+QehOIQJof5AoUfkJquavWAuZgee2
         +j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312996; x=1793917796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey6BHUao94Xpp8EbfeqF51xoo0FBZh7q8JGT3DY9akc=;
        b=WHtyFsoU1UBUeXwbWswX3b0YsuNkdwczq03mZwseJIS1YxfYtKIFViK4mJx7UPn//y
         pNbr8LUUxyl5c/UUmsPJ8JBLXHtRmCGXhHs1gMM+hr3ACMS9XMKXU02qiK5TUg0hJ/CY
         3eQ8ucGQS3522LOCiBLM4nlDz9GV5R4O5CDFdB77dn55jgfB4CY+rsven3DukTOLrBli
         A2UDJLPsBupqfv101oBC51Ca2N+Itk0igl5A2KLAHBVspCy8xJfyfMT+Slc2cM4YAqRE
         /PRYqLo7rlmkIp0YYPFxPFhwOHk35yUIhqRR+PTh5l1Eiee2bM4RVnfxWaqRY81Y7ku5
         z0cA==
X-Forwarded-Encrypted: i=1; AKwUvBzG4SnfxXHU0rIGCZWiLM4JJ/T2ZvkUWelpeovFV3EJ1qwguFZGjdXAR6nWkh6JsjmkBT1Llv++fUUwuTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi8IDUXRdrTZmW0purBi6MNJ+NBWg2M0g2g/3hs6bNPOC4le1p
	JdMcHGEaUzsLYsZ8d7dSnjewg3EhiedM0jbKGknB/IMSCfCiLlzdMNg3
X-Gm-Gg: AYBFou3Renh+boV1wv7RpM7ZhebmZOoCBpoPqGVOPANvCXGY68o7OxZ/eL5zoGB517h
	XZ5AzqaImGzq2oQBV2KFIs43zWDECu+/82rU1TiPGIEp36IBGERaxdd0saeuS3jxwrRihIyQRdr
	s5L3NFmOsGR4H+GPT5tWqZFYBcMKSI1tomW7+rL585ryArQBerBeRTr3xX/CLtGKLM5JPIqMaIp
	Ge3TCdCFZykwEdCPnNcInTSJs3W6ICa2PJQOAowJ/VTIjmQdUgQ61ROz7+gmt2X4g0RvTyX5Tg4
	z6K8tBSmS8qBdqUJWDitZbym3Z3V5JGMFdtFHxZk3zQ+nFivnDgpnvBwCiK1RJ8J5Ld2n21qkxI
	hvzlCmcJQi4YSWzgi1sm40ltLROS7oRdmJXNcS0L12hAGTbrQeQt1wl5tw83mLkhsVRlXqgsbAa
	qr6q5+79zirEHsMoS0H0pG5RWl/xkOqjoUmc+K2GUkXQde9VoPdTCNQs/grHLgQnMaNKnLTXg++
	U7fgrn77wKYaBaCJK2MVazfGw/hYDiw2nvzktWfPhY/K4cvt42HocgNiOeFeBFQAY49aQ5EVbhp
	LtCE+WEjjYKtyBA0rKYMyqaH7rmPfQNsYjoVubdd3i0NQcIlv2WoO7ghBUVYS9+th5g8wix/O7E
	gwBfX0xqLsOKg+v3DR85ZctMkj2xqa+oTQs8YtRslQ8jce/BRbazWh/4aCCCQEpfYzvDjwMfeAt
	vxlUiEbWi3DX+g+IHkPz1eoRVClrivHwIIpiSno98tVDqT1gdXeyqJ1Wpj9Q0p6HkUalwCn1cYZ
	g==
X-Received: by 2002:a05:6808:1524:b0:55c:a67:d111 with SMTP id 5614622812f47-5640dcea1demr509334b6e.19.1793312996201;
        Thu, 29 Oct 2026 15:29:56 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:41 -0600
Subject: [PATCH v4 7/7] dmaengine: dw: Prevent tx-status calling DMA-desc
 callback
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-7-fea447d9f285@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

The DMA transfer status getter can invoke a completion callback from
dwc_scan_descriptors(). An 8250 RX timeout queries that status while
holding the UART port lock, and its DMA callback takes the same lock:

  serial8250_handle_irq()
    uart_port_lock_irqsave(port)
    serial8250_rx_dma_flush()
      dmaengine_tx_status()
        dwc_scan_descriptors()
          dwc_descriptor_free()
            dma_rx_complete()
              uart_port_lock_irqsave(port)

Queue completed descriptors on a channel completion list under the channel
lock. Let the controller tasklet detach that list and invoke callbacks
outside the lock. Termination discards notifications still on the shared
list; the tasklet owns descriptors it has already detached, and the
synchronization hook waits for that run.

Keep handling raw completion events from tx_status(). Clients such as
catpt poll transfers without DMA_PREP_INTERRUPT and can mask the controller
interrupt externally. Polling must still advance software-emulated LLP
blocks and complete cookies without waiting for tasklet execution. Hold
the channel lock across event handling and status calculation, then
schedule the tasklet for deferred notifications.

On channel release, discard queued notifications after draining the
tasklet, before clearing the controller's in-use state.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: defer notifications while preserving polled completion and cleanup]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
---
 drivers/dma/dw/core.c | 111 ++++++++++++++++++++++++++++++--------------------
 drivers/dma/dw/regs.h |   1 +
 2 files changed, 68 insertions(+), 44 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 66065d7b26ae..d80be93f0c49 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -262,6 +262,22 @@ dwc_descriptor_free(struct dw_dma_chan *dwc, struct dw_desc *desc,
 	dmaengine_desc_callback_invoke(&cb, NULL);
 }
 
+static void dwc_complete(struct dw_dma_chan *dwc)
+{
+	struct dw_desc *desc, *_desc;
+	unsigned long flags;
+	LIST_HEAD(list);
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	list_splice_tail_init(&dwc->completed, &list);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, true);
+	}
+}
+
 /* Returns how many bytes were already received from source */
 static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 {
@@ -274,19 +290,17 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
-	struct dw_desc *desc, *_desc;
+	struct dw_desc *desc;
 	struct dw_desc *child;
-	unsigned long flags;
-	LIST_HEAD(list);
 
-	spin_lock_irqsave(&dwc->lock, flags);
+	lockdep_assert_held(&dwc->lock);
 
 	if (!(dma_readl(dw, RAW.XFER) & dwc->mask))
-		goto unlock;
+		return;
 
 	dma_writel(dw, CLEAR.XFER, dwc->mask);
 	if (list_empty(&dwc->active_list))
-		goto unlock;
+		return;
 
 	desc = dwc_first_active(dwc);
 	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
@@ -304,7 +318,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 			/* Submit next block, including for polled transfers. */
 			dwc_do_single_block(dwc, child);
-			goto unlock;
+			return;
 		}
 
 		clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
@@ -319,15 +333,8 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	}
 
 	dma_cookie_complete(&desc->txd);
-	list_move_tail(&desc->desc_node, &list);
+	list_move_tail(&desc->desc_node, &dwc->completed);
 	dwc_dostart_first_queued(dwc);
-unlock:
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
-		list_del_init(&desc->desc_node);
-		dwc_descriptor_free(dwc, desc, true);
-	}
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)
@@ -344,18 +351,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *bad_desc;
 	struct dw_desc *child;
-	unsigned long flags;
 
-	spin_lock_irqsave(&dwc->lock, flags);
+	lockdep_assert_held(&dwc->lock);
 
 	/* Termination may have cleared the error since the tasklet sampled it. */
 	if (!(dma_readl(dw, RAW.ERROR) & dwc->mask))
-		goto unlock;
+		return;
 
 	dwc_chan_disable(dw, dwc);
 	clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 	if (list_empty(&dwc->active_list))
-		goto unlock;
+		return;
 
 	/*
 	 * The descriptor currently at the head of the active list is
@@ -381,40 +387,41 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 	/* Pretend the descriptor completed successfully */
 	dma_cookie_complete(&bad_desc->txd);
-	spin_unlock_irqrestore(&dwc->lock, flags);
+	list_add_tail(&bad_desc->desc_node, &dwc->completed);
+}
 
-	dwc_descriptor_free(dwc, bad_desc, true);
-	return;
+static void dwc_handle_channel(struct dw_dma *dw, struct dw_dma_chan *dwc)
+{
+	lockdep_assert_held(&dwc->lock);
 
-unlock:
-	spin_unlock_irqrestore(&dwc->lock, flags);
+	if (dma_readl(dw, RAW.ERROR) & dwc->mask)
+		dwc_handle_error(dw, dwc);
+	else
+		dwc_scan_descriptors(dw, dwc);
 }
 
 static void dw_dma_tasklet(struct tasklet_struct *t)
 {
 	struct dw_dma *dw = from_tasklet(dw, t, tasklet);
 	struct dw_dma_chan *dwc;
-	u32 status_xfer;
-	u32 status_err;
+	unsigned long flags;
 	unsigned int i;
+	u32 status;
 
 	/* Channel release may have drained a polled completion before this run. */
 	if (!dw->in_use)
 		return;
 
-	status_xfer = dma_readl(dw, RAW.XFER);
-	status_err = dma_readl(dw, RAW.ERROR);
-
-	dev_vdbg(dw->dma.dev, "%s: status_err=%x\n", __func__, status_err);
+	status = dma_readl(dw, RAW.XFER) | dma_readl(dw, RAW.ERROR);
 
 	for (i = 0; i < dw->dma.chancnt; i++) {
 		dwc = &dw->chan[i];
-		if (test_bit(DW_DMA_IS_CYCLIC, &dwc->flags))
-			dev_vdbg(dw->dma.dev, "Cyclic xfer is not implemented\n");
-		else if (status_err & (1 << i))
-			dwc_handle_error(dw, dwc);
-		else if (status_xfer & (1 << i))
-			dwc_scan_descriptors(dw, dwc);
+		spin_lock_irqsave(&dwc->lock, flags);
+		/* The snapshot selects work; recheck events under the channel lock. */
+		if (status & dwc->mask)
+			dwc_handle_channel(dw, dwc);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		dwc_complete(dwc);
 	}
 
 	/* Re-enable interrupts */
@@ -890,6 +897,7 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	list_splice_init(&dwc->active_list, &list);
 	list_for_each_entry(desc, &list, desc_node)
 		dma_cookie_complete(&desc->txd);
+	list_splice_init(&dwc->completed, &list);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
@@ -960,10 +968,9 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
 				      enum dma_status *status)
 {
 	struct dw_desc *desc;
-	unsigned long flags;
 	u32 residue;
 
-	spin_lock_irqsave(&dwc->lock, flags);
+	lockdep_assert_held(&dwc->lock);
 
 	desc = dwc_find_desc(dwc, cookie);
 	if (desc) {
@@ -983,7 +990,6 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
 		residue = 0;
 	}
 
-	spin_unlock_irqrestore(&dwc->lock, flags);
 	return residue;
 }
 
@@ -993,19 +999,26 @@ dwc_tx_status(struct dma_chan *chan,
 	      struct dma_tx_state *txstate)
 {
 	struct dw_dma_chan	*dwc = to_dw_dma_chan(chan);
+	struct dw_dma		*dw = to_dw_dma(chan->device);
 	enum dma_status		ret;
+	unsigned long		flags;
 
+	spin_lock_irqsave(&dwc->lock, flags);
 	ret = dma_cookie_status(chan, cookie, txstate);
 	if (ret == DMA_COMPLETE)
-		return ret;
+		goto unlock;
 
-	dwc_scan_descriptors(to_dw_dma(chan->device), dwc);
+	/* Poll completion even when the client has masked the controller IRQ. */
+	dwc_handle_channel(dw, dwc);
+	if (!list_empty(&dwc->completed))
+		tasklet_schedule(&dw->tasklet);
 
 	ret = dma_cookie_status(chan, cookie, txstate);
-	if (ret == DMA_COMPLETE)
-		return ret;
+	if (ret != DMA_COMPLETE)
+		dma_set_residue(txstate, dwc_get_residue_and_status(dwc, cookie, &ret));
 
-	dma_set_residue(txstate, dwc_get_residue_and_status(dwc, cookie, &ret));
+unlock:
+	spin_unlock_irqrestore(&dwc->lock, flags);
 	return ret;
 }
 
@@ -1082,8 +1095,11 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 {
 	struct dw_dma_chan	*dwc = to_dw_dma_chan(chan);
 	struct dw_dma		*dw = to_dw_dma(chan->device);
+	struct dw_desc		*desc, *_desc;
 	unsigned long		flags;
+	LIST_HEAD(list);
 
+	/* Polled completion can leave descriptors waiting for the tasklet. */
 	tasklet_disable(&dw->tasklet);
 
 	dev_dbg(chan2dev(chan), "%s: descs allocated=%u\n", __func__,
@@ -1095,6 +1111,7 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	BUG_ON(dma_readl(to_dw_dma(chan->device), CH_EN) & dwc->mask);
 
 	spin_lock_irqsave(&dwc->lock, flags);
+	list_splice_init(&dwc->completed, &list);
 
 	/* Clear custom channel configuration */
 	memset(&dwc->dws, 0, sizeof(struct dw_dma_slave));
@@ -1106,6 +1123,11 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, false);
+	}
+
 	/* Disable controller in case it was a last user */
 	dw->in_use &= ~dwc->mask;
 	if (!dw->in_use)
@@ -1243,6 +1265,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 
 		INIT_LIST_HEAD(&dwc->active_list);
 		INIT_LIST_HEAD(&dwc->queue);
+		INIT_LIST_HEAD(&dwc->completed);
 
 		channel_clear_bit(dw, CH_EN, dwc->mask);
 
diff --git a/drivers/dma/dw/regs.h b/drivers/dma/dw/regs.h
index 5969d9cc8d7a..c41f18281efe 100644
--- a/drivers/dma/dw/regs.h
+++ b/drivers/dma/dw/regs.h
@@ -279,6 +279,7 @@ struct dw_dma_chan {
 	unsigned long		flags;
 	struct list_head	active_list;
 	struct list_head	queue;
+	struct list_head	completed;
 
 	unsigned int		descs_allocated;
 

-- 
2.53.0

