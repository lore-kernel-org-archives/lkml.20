Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279974;
	b=jZSN5lPd3RzhUtLc8RaZM9cVAqEaYSU/omirHZWQAKa4bhvHQaHZCw3AqQlhQeUpslzE
	 ngSdlTbeciXIJcoEj4FO31oEJI3ucckxElGpDfK/KpuCRShGeR/Np81tfA6F/l6PJ+RE+
	 0DOYPrw20BFB2H37vc7NshDvw498V9on/7smjJfyPl8/WCYj2T6vS15OeXdo4wtA3JcoO
	 +uJKZKAID62t5QVKoiPpKdf16P42gMrcCpNWkkUPOygP7pr1e2nqUHxbJQQLJ/BappG1h
	 lP/mZ0dG2Y2wjYgM8r9kqJf0PGxDvLE12GXHqMn4a9sZKDbiKstskJykoglvGldQtGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=L5RBou/wH7W3yruKU0mo8RfLDeMK/TCy1QAXcInHKoU=;
	b=hLWjzeVZ1W9cp4NQY5ojIO3NS/3FDTfMO2d3Xeir13Dxd7vUWG+pg0G0SCIJMR6CaE75
	 4vU+Up3/sq0LJQThJS5tSVMfzJoqIRSObXXNTDgq/RTIHrejpzfPbSctroY6FfjcbEOpe
	 7IfblAnR3iKRTkkFTGQnWYDBFVy+Ziw5wHCNVvekc9y/uxG971lxLuwr8KvdDygiJ6Bdr
	 JI2jCayqzHMF/OLbj+ErBHr0/Nh1goef3LvLr1ydXuZ01tUWGFzRagi4H45nZz5x+a2+F
	 AVz6NBuI+UbpBIOl8FECMO4rFuJ6BEFj/F5KoM4nENzYNTAxhVROidUtJKAfJp0XTsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpZ83bBH;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19C060A2611
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19C060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpZ83bBH
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so1020254fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279973; x=1794884773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5RBou/wH7W3yruKU0mo8RfLDeMK/TCy1QAXcInHKoU=;
        b=zpZ83bBHPjitTsbXQSBxAveULYnRjdbE2GCb8MBC/DTfSjGrK1Sg+CNmJlp/34qXmO
         CDr6ESQwnI3xMSk0pvIKebgMf1VJaOf7E2pO0K1CMy2nz0qNu+W/iF2MdcYbtxDylroe
         6iL1L2CDh/KzUgT5dLJi/v2RSHneIhTB8ofs1iPgWkD3po2glqrUJ4W6tJKt2kLXYrb7
         6SnNtCWgDLC59K0YJzy+D1Y9qr4jpuBi103ZcBQnxMvTa+gJUGuDbY+uyQh2TdlJNjrB
         GzUY4arOeKQZUK8BMhg6lZhKFVKjcjrYSkROVySBigBqo83KNsqq5brJZqaOEEtY1aFt
         Axeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279973; x=1794884773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5RBou/wH7W3yruKU0mo8RfLDeMK/TCy1QAXcInHKoU=;
        b=IoNWHyVBtcIWmZ4GirkvZLeACukPYxTw6Y8ii7VtHzg/yymuiQ7b1J0xU+cPTT7s7f
         10Iyg6akwsM/ENSAknExidqi3TMXugqSAuuXcUkE1iPjAmuQtXp+KPyq2bzM3TXLJT6c
         vXG7gOo50uqMwTUabkZC7H669U3d27dIUeCAxAkYnKhakYM1rB3zTETkpIMtUYyraMBc
         LyZYbUzIbggAW14w892L0KLl1PtnWc9uyO+t5VLjFgN0DVbEDdcndssyFcANCj+SnuRK
         gGuqjHbCh3aVYY+gCZQ2mFELWg4nn7bQHbWbhadH4YfKPT2awYqB85Jfs4dq1KmM1PTt
         CF2g==
X-Forwarded-Encrypted: i=1; AL+hErGEpn6jkxEEYydDU6+t7uacHlgK9+S7wCNLdfy3xJb0YnUKbIvBO2Mgkg+f9z4QHza2DY916QtqGc1fv5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xq4WVe1dV/IGTYD97ZyhwJryTbuWNo6kJxkmFIOb9zuRxnHsb
	aoACjKAxlLUqGbkoTuwBmJCOf5jWaVcX+KQnrFtawBDlXQZvtOX0VSjdxPkxclfh
X-Gm-Gg: AYBFou3tM0cGPmWQaodeYURPX8fM2GiXVYc/rkXYhtmwkj5z1ncjFg3S7CB8Z1JArfe
	WShetnLWrHgnstHQS2JZfNN0Q+zIecRkeOctSPpjwi7K3s/x32I1G1JqHx7Qb/wVSG9WfUGce1y
	t3S+IsrnHyr8QEl6+coosszerdZO0tu4/f+DSE/RXPfthL66qpTX1DDqERRPV5e8MJWLqqynCi8
	Tt+FBiikkAeQRH+TRam95p1yMSEhWf0S1Kr7s/qDdrQZt5jUDF1J+iPI7jxi8T65uYDR7iNiok5
	BJQARpuxBeatxe4GjRK0g/U8glMgmpvNgXUqsZMOX/amS7/YSF4AGr+9/M76dLqyTdeiKcOLT/l
	BYpMWCnrU9DTbVbesxS3eVrjMoj7nhWTi6MI9Dppc45WSmcxAMS3NivVYe8W7iovXudVeDTrP3M
	WyAWs/Z8tm6KnVNev+7z42q12I/+iSGjxeAinU3UPKp3HaL6/r8WXLNqExvuFy611rGN/C54ufb
	6a6TlymW/w3CzZdYqLxmOxvU4zovSMe5elaAv/oG26sNUjg+w71RHwcw81Hh4giE5Khze10BDu6
	eDU7RxJWEp7ZFHUK9yTR43DD59ToLqZvyOdrVYsbT01Mld4E8tRLu5VcvSyHS/fEtFN9hW5AUA3
	37UvZpgV2fGki2oSrEg6WaJ/3joA/5VLnotHm4QRBfsDDF068qP3apFbr+z+y2SMWDkHEmi+ErT
	2hB8dKdsuFSc1H4qhLHDf8l1JrYRdU4TBOac2LPWNZK91VZ4rN0/KQ
X-Received: by 2002:a05:6870:f616:b0:4a7:6dc:af5f with SMTP id 586e51a60fabf-4ae22743a94mr748298fac.53.1794279972710;
        Mon, 09 Nov 2026 19:06:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:06:02 -0700
Subject: [PATCH v2 3/3] dmaengine: dw-axi-dmac: preserve pending pause
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
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-3-64adc48df793@gmail.com>
References: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
In-Reply-To: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_pause() clears SUSPENDED even when polling times out. Hardware
can set that status after the last poll, including during the final
delay, and the unconditional clear then discards an acknowledgment the
caller never observed. Another channel's interrupt can also consume the
status because the shared IRQ handler clears every channel's status
before taking its lock.

Leave SUSPENDED to the pause and resume paths. Track the suspend request
separately from its acknowledgment so a timeout can be followed by either
a pause retry or a resume. Wait for acknowledgment before clearing the
hardware request, since hardware ignores an earlier clear. If that wait
also times out, return -EAGAIN with the request still pending. Use the
atomic polling helper so an acknowledgment during the final delay is
observed.

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

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 101 ++++++++++++++++++++-----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   2 +
 2 files changed, 86 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 281d7c79246e..5c1eb120a28b 100644
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
@@ -1135,12 +1146,19 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 				}
 			}
 
-			axi_chan_enable(chan);
+			if (chan->pause_requested) {
+				chan->is_paused = true;
+				chan->cyclic_restart = true;
+			} else {
+				axi_chan_enable(chan);
+			}
 		}
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
+		chan->desc = NULL;
+		axi_chan_start_first_queued(chan);
 	}
 
 out:
@@ -1162,6 +1180,8 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
+		/* Leave suspension status for the pause and resume paths. */
+		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
 		axi_chan_irq_clear(chan, status);
 
 		dev_vdbg(chip->dev, "%s %u IRQ status: 0x%08x\n",
@@ -1207,6 +1227,11 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
@@ -1217,15 +1242,49 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	return 0;
 }
 
+static bool axi_chan_is_suspended(struct axi_dma_chan *chan)
+{
+	if (!axi_chan_is_hw_enable(chan)) {
+		/* A completed transfer cannot acknowledge a new suspend request. */
+		axi_chan_disable(chan);
+		return true;
+	}
+
+	return axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED;
+}
+
+/* Called with vc.lock held. A timed-out request can still be acknowledged. */
+static int axi_chan_wait_for_suspend(struct axi_dma_chan *chan)
+{
+	bool suspended;
+	int ret;
+
+	if (chan->is_paused)
+		return 0;
+
+	ret = readx_poll_timeout_atomic(axi_chan_is_suspended, chan, suspended, suspended,
+				       2, 40);
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
-	unsigned int timeout = 20; /* timeout iterations */
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	chan->pause_requested = true;
+	if (chan->is_paused || !axi_chan_is_hw_enable(chan))
+		goto wait;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1252,20 +1311,11 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
-
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
-
-	chan->is_paused = true;
-
+wait:
+	ret = axi_chan_wait_for_suspend(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret;
 }
 
 /* Called in chan locked context */
@@ -1299,6 +1349,8 @@ static inline void axi_chan_resume(struct axi_dma_chan *chan)
 		}
 	}
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->pause_requested = false;
 	chan->is_paused = false;
 }
 
@@ -1306,15 +1358,30 @@ static int dma_chan_resume(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
-	if (chan->is_paused)
-		axi_chan_resume(chan);
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
index d8dd07efe60f..c61fcf070958 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -52,7 +52,9 @@ struct axi_dma_chan {
 	enum dma_transfer_direction	direction;
 	bool				cyclic;
 	/* these other elements are all protected by vc.lock */
+	bool				pause_requested;
 	bool				is_paused;
+	bool				cyclic_restart;
 };
 
 struct dw_axi_dma {

-- 
2.53.0

