Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808884;
	b=NIxnMSCZD2b6zLn4kvYvPzGwzFrxNu8Ib/Wic9cRnEL79jgCOix9w4J7MsE8J5+VpLUy
	 2RoCdBT//beQkEtAP/vKB4HfQwyl+SQoWD7t4Fj/aFnChzeGIv8zesdix3xDYp9zCHasb
	 mTTxlfkWWwIAodsFiitdqDo1+b9W7pMGB27FL3LS9Du3oWkcvOWMeO+VkXXVQCOKNTdVi
	 qLaHDzmLFxY5N+FOCn3hvfNdPav6KiJR0Y4l6Myx5DWm7/XIjjCcuglcZW092FJfQSoll
	 fiJIpPk+aL9xY8jFkN7EuITPOxhbYkPtW+adwC9GcEpgLgBsHqlqgsuSNfgL251QUTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xD7v+KKjqUXGmD+jDRuPUvviwA8dBJ4NF/bEGvBPM4E=;
	b=4lLlBhLbyWscOe3fo/Edes45+c+IXUaaw4FJniLimQPMh3lVamPWGClvZ+wsviC6mo0Y
	 Pccl34gSJQEO6pcg8nO8oxm9Q4XMLzE/oa8cBBZRyc8lyluyrsfS6+6REWL6MgkGi0wAM
	 ckdSt1xx/Ghl3y9H2FvViAvWwyL8JwOnoZoJie9mG2iGvePZ7hryIUyPbZvysWokQmM89
	 hVbBgq4YkGiSxCyRSfnpB/Jf/B5FV88WCBFgtD0l4mSrFU/yUx/5xGKaoUxKkLk/iNbQH
	 akdCavq7EokJFc8zjQAJPSNwlOikW7bnGYx30lKupQGZ9OglpzD6F6VhwWqOPBGAFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPD23fxM;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABBA606A8B0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABBA606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPD23fxM
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-844a8bf7e25so2852185a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808883; x=1795413683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD7v+KKjqUXGmD+jDRuPUvviwA8dBJ4NF/bEGvBPM4E=;
        b=HPD23fxMwC8vBD3CvIILTNiEqkjaQbqYSYW8mJ4ekGqjZOophkemcr0fnqmfUUJjX7
         /yqHdnj3sAlZimQbFFRDtSunyQZQ00J65tXc85d1Of5FUUp3XW7z7vLZGs3yRa46LHQh
         zGh97KrDm5jPVGRJhA8hmNIqH1iPFi3HXLTUaDFVpcinObE4B2fvU8AVm7BLLZUZDOi7
         BoAGM7dgjNHr7Iw2hjnoGzSgyOYn8YQ8/5pY2mo+00BohKImaWGDfjQuIm+NmMxcas7f
         TKxw9/dWDzPwXGS7xHgmYBWzJ9u6JjSfcDTvZjghV3TgvH2l2Fz9oJbRbBTYbY560mbT
         fzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808883; x=1795413683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD7v+KKjqUXGmD+jDRuPUvviwA8dBJ4NF/bEGvBPM4E=;
        b=MfkYA17F32u2Nbibgbxj+PuB8b/oHzWy2hLXqhCTz4uYOWhbw1RDSw0GdGt0I0KadR
         R4P8As1OvKd9kYocus/sN91zxXYpnw93RNCMD5yh0/2j/TgUL0wamuGYBSj5K59OztJU
         IGhD4QwieWhoDvJloT3sPjZjvqepgpn5JDarUPa0jJsPvLxoi5pLreAE23W4OlwQ5FEr
         Z5GsW9lRtpC8Ouw8Slurp6GrqSqsnDA4+r9p4QLo80dohKuYbHjSz+6rENwa58g/CCHr
         Ys+58SK/0Dfgnb3m5UXyNG4LI6l8bc7NlLN1uHF4RxXW1PauR1E95Y4omHJXbwNJJhcC
         M+PQ==
X-Forwarded-Encrypted: i=1; AL+hErGn7uQYBmX40AhSPoH59PURsccEJ5hYBwy7053492vglLUrQPAEJF5TV8pA+bzxz5LlVKU+R3etVz5ooB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88aFoE30HGzY8yWsLLSCf6Mn742Bsg5D75c5FEKzt24KsxcvUI
	Oynpy4KYRN09iqhJZVQwjHvdkVg1ONGl/2Q6pq8fzDM8wo2tdSJq/4le
X-Gm-Gg: AYBFou3kMYev7tBpAnkAoRwhVT2Ie+1LoN4yZsiGvdbY+5jCuPtYDrkuWeG676i926F
	rAyw+LDnh0yi9I9LqJ4v8wBl6cEJmWhOSu0Kvi8V5Ri44pJh0D/GZU6A4ddNmmTAfzE0dWh9dqQ
	FA08SNnSop5tHHv99gojJLkz959Ore6R8flvdj3B0ABpUKYSQ0w8mhl6EOAkzK+SlZ6j8TbOpAz
	7VQnNw8fVf0liAwhB9g7cqsxs0IxM9nLKquKfRGzoIUzSZaTQpuFzrtTOr9V+4pLPDeG33S1/3V
	BJ5JEdRIFcobXf/30D6UsBv7Z3v0PfJc4exh6MCdXSMqfce3Q0U57sWjOSrxeCL6sXjplBKx/BZ
	nfCRbaxpAMwr+c7fBdR9wierYU5KHjgit/3XeiOCIpvfP6n1XRjb5vXJO8HKclIi13HcyUPREyx
	JbgvqW5p0RgZ8GDXToiKyFoenUnuPaRxKGi5+jA4vWNEEdtffHLcf1PtrILxMi53p9hzWltdC7o
	lZyJqdvWne2EBbHE7asvSvJGrqqskBAklt4o2t0upK75VcnJ2xl6eJQVVxyEDHR0VDFDwiy1XqC
	17Rnq/FQcLzJUJJhQzFj8mCwEbwpQo5s0j/JJKTbOROaw7HmjuAjFbbHmaYq355pj6CV5sOdkx0
	BdZjqWqtvq+MMIH1lG6GbptSxeOmztoH//SU6esuubzvdAj5lsHGPfJz69yXl9wayp2SODK51n7
	ZG4eesKfzCi6Zzc2+i9qCbDXsxirDNlPBcIHYRNbrRPcYIdCp1srQ=
X-Received: by 2002:a05:6830:3e05:b0:862:b918:2019 with SMTP id 46e09a7af769-862b91822e2mr3339375a34.29.1794808883265;
        Sun, 15 Nov 2026 22:01:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:46 -0700
Subject: [PATCH v6 5/7] dmaengine: dw-axi-dmac: preserve pending pause
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-5-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

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

