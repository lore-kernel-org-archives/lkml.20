Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562607;
	b=Jrqkh6M1NnpUEt1jc2EUUyr9IDHEZG7toYPcQMD9PKqAVHklvK8YPo7aIGXrOKnCdJJK
	 2ShgZp2AYY1C68kEMSIaDEEvyh5uVTQFF+Lw/6wYsAWPJW9TCnZ2LaxtpbLQqtSCLiZpS
	 7Nqyp7Qj9u4/YmBX2i9DSwNFVx6knl0OjCO73MuOCKoLMkkEaOE4JmwH0kl06oYTR0sEz
	 1YD/O6QHLiXzbvhYO6BUSc7ULvAoWaTrFFTBUrGcMDriJ7TAGoy/RHFqLUAN4czXL3myV
	 5cKMz7y6uMlRMVoSsefLTiaBjTKdwsAXvratvh1K6VIA42qMEp+ItcPeKA96tlEOcYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xD7v+KKjqUXGmD+jDRuPUvviwA8dBJ4NF/bEGvBPM4E=;
	b=WRFqCeHOiTLJJK7F1a/0Sgv6IDm0Nv+iZOyEyv84jDkTkGa8aFSLUmCewIcSA9dxm3I2
	 ZKuKD8s9edbdgAw7rHqqpyxvyy1lvjMB5Ks/zDLWaCM4FGIbdbfuSI1KY8gqcXFe++Yhn
	 KbpNA/+q+XnOQ/+fxDZLc5KOW/cQaAjEBeqWJYMQoeND5xJDfXt9sHvfs/V+zElpVl5w8
	 X13D4+Hg9N1G4o0x+HuTPbRoc4vfPsOQrwklkyXupQOoONi/UqQ3fUZrgpWIFUCRq48Fh
	 8HJdIb+CSqUe8nExHF8h/M5wChVPCpy/4WdJE2o5SFaL9bidFV6bMbfjYHZhuEM76bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+bqXY5o;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91460A2637
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF91460A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+bqXY5o
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad4072943dso194385fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562606; x=1795167406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD7v+KKjqUXGmD+jDRuPUvviwA8dBJ4NF/bEGvBPM4E=;
        b=X+bqXY5ovPrmAzCr+YbuMhv6FoVSrol1b35Wjl3ON+32GqaOZD+YEyQfA8KhanrU7o
         RyFonKB0me+wfsbDOsPKkprix4MxcZdLBdzzXA9U8FBU75N6wGkRDPmZrvX2TUHF+/GN
         QF9U+qnZ8Gf5o1k/jhYGj/LM8I2BgyJZajzlyObB7Q3PZErBuiFmxwiIj9C0U43rDTVp
         b1jd2iAJ0GXw7vM80A8eEI7OjSt1ifpNjoCgwNU1cLuPxB/veOw8dnXfI+Bk4NIghF9B
         H6dUjOqyBdldEU/FkFDcHv+hEIeps0Uf71fu/UzaPOgAXl8sw48w8ECp3/0oj/Uv3CTD
         mUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562606; x=1795167406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD7v+KKjqUXGmD+jDRuPUvviwA8dBJ4NF/bEGvBPM4E=;
        b=OllscKicemsFNsUiVZcdfGlcLblFOT8naazGwNtgJZQU5mTW3iqDWqD+qWJFiKR1iX
         hJkcmMvopgvsGtjeM6D94HoHWnSRejBwsv4lVUzXOWdTKYgg7U/4Xg6jx32UvfCLz+i7
         N9+tYj9opy5cEF2B/iGascNAQ+63gok6bzqnMmwYpThXEDrs+VZjOPsaMRXFPRFkh1NF
         ipWkrX/wGwjZhCU22afsMuGE6ALhfG3Z7r7UcSfkxzzD2J2pAFsH8R0GovB06zu7iyzi
         WTaQZnzIAa2nCei5j02zwp+isi1NOL2YX326zR1JQmQAYXvs/FgeA3ITE3gih5bLcpz+
         J0ug==
X-Forwarded-Encrypted: i=1; AL+hErGdc6H9DMqVLv83E1/rSqqcrxfgLpmfRPaBTesBqcJcOjHJrhdermtb1J83V+vEiKk7SUImVR5c0tXI0QE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sjC88YnWV7HAyrVX7YonboksrsKtsonn7TTNtXsosVq1wpkTs
	5ZwEo3+jn4EozMsRvZHrur1Ba8vxe8Ei6Wk2JhwHc57NLogsss/Y6lWl
X-Gm-Gg: AYBFou15dyA5/7d/iQTRUW8Wv4LT8+rIuuM6Fz9yFor7MzvWFarJg0O9eu03kgVhDIO
	XZG0hNnP8W0xoedNzFiB6KNBch0TiW/yXFlbg+OyYTRu1EypMKm8ce0y+e+4qknEZygtX2EyHkb
	C9C7eCq2bEHZn/2PMEJtKCii+3fDR/ogkA0l2aZsxNZHugiT73pkPzKOLo2hiiU+9KkHINuqff6
	dh8IkzoBJeWjJ9bc4YvHU4SNiy/cX6htZh1YXUAmyst2Zb4/q9iaAyH6WySzA08m2UYmuFWJdSP
	H+srHm8ZX8Jr2VRIx3DSNVvZp8nsKBw1dxZevA0tJ00Ztous7SWLKWD4GQUvesZuLK9p2Fyac+1
	Lj28+fxjcF5vmSlgB8DfgLWeHHr3rlSbfjnV6WqTRBzunpdYku82m+nTOrQPCSdyyF35j+1isus
	czGVuchgekJyBXsKFcQ6Va2h6Qt/CYzi30XwnzVY3xojxaE5ZOgpc9R/jh/tkB2zq3uyTxG2Whh
	k06+NwtoHbX2pwrQUqCMAAxqbkIa0XWjthuTXnPqwnpUVs/sgAZES2t976aypLiyO+Rl49R5pc3
	ahJYtpxebsB0pKAviPPhI+zvDJWo2u46rEWwjJ1LMY9/Bm47jZVYSJSzd59aZnUyx/pEDOYVfOn
	bbMETIn6ewvCdWQz/3kAuuT04+Xb0D7w3X6PwGXNQP5SmjEWRnNSIZvTfcaZCgInRoMT/YUcs6f
	yf0z+z/j30eKzcZGfS4sKbVOeNkSUaig9zya0T33VP4FcPiWWmxuf8
X-Received: by 2002:a05:6808:4f2a:b0:4f7:d324:bc5e with SMTP id 5614622812f47-56e65417a64mr1536731b6e.58.1794562605657;
        Fri, 13 Nov 2026 01:36:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:38 -0700
Subject: [PATCH v5 5/5] dmaengine: dw-axi-dmac: preserve pending pause
 requests
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
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-5-8523a27b5788@gmail.com>
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
In-Reply-To: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_pause() clears SUSPENDED even when polling times out. Hardware
can set that status after the last poll, and the unconditional clear then
discards an acknowledgment the caller never observed. Another channel's
interrupt can also consume the status because the shared IRQ handler
clears every channel's status before taking its lock.

Leave SUSPENDED to the pause and resume paths. Track the suspend request
separately from its acknowledgment so a timeout can be followed by either
a pause retry or a resume. Wait for acknowledgment before clearing the
hardware request, since hardware ignores an earlier clear. If that wait
also times out, return -EAGAIN with the request still pending.

A completed transfer is also quiescent, but its completion handler may
still need to advance a cyclic descriptor. Defer that restart while a
pause is pending, and resume it without reprogramming the first LLI.
Track the active descriptor until its completion handler runs so that
resume and issue_pending cannot restart a completed cyclic segment or
reissue a completed noncyclic descriptor while its IRQ is pending.
Start queued work after the active descriptor is retired, respecting the
pause request.

Clear stale suspension status at the start of a new descriptor rather
than at each cyclic restart. Reset the software state after successful
termination and when allocating a channel for a new client.

Store the lock-protected pause flags as bitfields in existing padding.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 98 ++++++++++++++++++++++----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  8 ++-
 2 files changed, 90 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 1a53fbc951a9..cd9a5b45d295 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -481,6 +481,8 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
 	irq_mask |= DWAXIDMAC_IRQ_SUSPENDED;
 	axi_chan_irq_set(chan, irq_mask);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = first;
 	axi_chan_enable(chan);
 }
 
@@ -489,6 +491,9 @@ static void axi_chan_start_first_queued(struct axi_dma_chan *chan)
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
 
+	if (chan->desc || chan->pause_requested)
+		return;
+
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd)
 		return;
@@ -543,6 +548,10 @@ static int dma_chan_alloc_chan_resources(struct dma_chan *dchan)
 		pm_runtime_put(chan->chip->dev);
 		return -ENOMEM;
 	}
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	dev_vdbg(dmaengine_chan_dev(dchan), "%s: allocating\n", axi_chan_name(chan));
 
 	return 0;
@@ -1087,6 +1096,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	vchan_cookie_complete(vd);
 
 	/* Try to restart the controller */
+	chan->desc = NULL;
+	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
 
 out:
@@ -1134,11 +1145,18 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 			}
 		}
 
-		axi_chan_enable(chan);
+		if (chan->pause_requested) {
+			chan->is_paused = true;
+			chan->cyclic_restart = true;
+		} else {
+			axi_chan_enable(chan);
+		}
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
+		chan->desc = NULL;
+		axi_chan_start_first_queued(chan);
 	}
 
 out:
@@ -1160,6 +1178,8 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
+		/* Leave suspension status for the pause and resume paths. */
+		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
 		axi_chan_irq_clear(chan, status);
 
 		dev_vdbg(chip->dev, "%s %u IRQ status: 0x%08x\n",
@@ -1206,6 +1226,11 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
@@ -1215,16 +1240,49 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	return 0;
 }
 
+static bool axi_chan_is_suspended(struct axi_dma_chan *chan)
+{
+	if (axi_chan_is_hw_enable(chan))
+		return axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED;
+
+	/* A completed transfer cannot acknowledge a new suspend request. */
+	axi_chan_disable(chan);
+	return true;
+}
+
+/* A timed-out request can still be acknowledged. */
+static int axi_chan_wait_for_suspend(struct axi_dma_chan *chan)
+	__must_hold(&chan->vc.lock)
+{
+	bool suspended;
+	int ret;
+
+	if (chan->is_paused)
+		return 0;
+
+	ret = readx_poll_timeout_atomic(axi_chan_is_suspended, chan,
+					suspended, suspended, 2, 40);
+	if (ret)
+		return -EAGAIN;
+
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->is_paused = true;
+	return 0;
+}
+
 static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	u32 status;
 	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	chan->pause_requested = true;
+	if (chan->is_paused || !axi_chan_is_hw_enable(chan))
+		goto wait;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1251,17 +1309,11 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
-					status, status & DWAXIDMAC_IRQ_SUSPENDED,
-					2, 40);
-
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
-
-	chan->is_paused = true;
-
+wait:
+	ret = axi_chan_wait_for_suspend(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return ret ? -EAGAIN : 0;
+	return ret;
 }
 
 /* Called in chan locked context */
@@ -1295,6 +1347,8 @@ static inline void axi_chan_resume(struct axi_dma_chan *chan)
 		}
 	}
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->pause_requested = false;
 	chan->is_paused = false;
 }
 
@@ -1302,15 +1356,31 @@ static int dma_chan_resume(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
-	if (chan->is_paused)
-		axi_chan_resume(chan);
+	ret = 0;
+	if (!chan->pause_requested)
+		goto out;
+
+	/* Hardware ignores resume until the suspend request is acknowledged. */
+	ret = axi_chan_wait_for_suspend(chan);
+	if (ret)
+		goto out;
+
+	axi_chan_resume(chan);
+	if (chan->cyclic_restart) {
+		chan->cyclic_restart = false;
+		axi_chan_enable(chan);
+	} else {
+		axi_chan_start_first_queued(chan);
+	}
 
+out:
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static int axi_dma_suspend(struct axi_dma_chip *chip)
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 3c86e5d468ea..b18c9880711a 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -42,6 +42,12 @@ struct axi_dma_chan {
 	void __iomem			*chan_regs;
 	u8				id;
 	u8				hw_handshake_num;
+
+	/* Protected by vc.lock. */
+	bool				pause_requested:1;
+	bool				is_paused:1;
+	bool				cyclic_restart:1;
+
 	atomic_t			descs_allocated;
 
 	struct dma_pool			*desc_pool;
@@ -50,8 +56,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	/* these other elements are all protected by vc.lock */
-	bool				is_paused;
 };
 
 struct dw_axi_dma {

-- 
2.53.0

