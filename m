Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471791;
	b=Smrqp/FWk2fSdYPXqbetTBcxtfdxaxKgRrdbeRsb/P5iLuu3szWxm2JO6+v4EiuT9Apg
	 VzTw8a4L9oLKQwUze7uF9hOie4bc50AtEDxcjH5k1TZTZujRTJoXEwNEMwVZT7EEIRUQv
	 p/c4/zAdfeRGFy9xtrmXGRCIlMjEKKkAjX7m+Zw3Yt4GvK5BT38mXirji4pCuqe6mN7f/
	 DfT3j4ygmUlZKnCUcmwvY9tWa/i80NcXyg/1GsVQmIZllLlez5SKgzg0sg/k+MpOg3k3C
	 FfoCWwVT5T76ygvWlLfcVqF6WtuDM8xbRZdkapOKDIzaRtFPT2PmwTkDzbkTqv5sqSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MXWQrLCbj1VbbXmwzxndXA36ZN5dlLDITfWb5Un2PIg=;
	b=pQtKt7wCqmOGE63B4c49jVh4Wm6yW5lA4tDq9bEDViGpgxK0VVLToTpABK1ft3S0fui4
	 NcUxW+iThoP1TMMSB+vGCOYotbACHzerDrPaT3KVBFZM9Y6LK4Tl3YhLBd54gWDKeMZWh
	 geULMZwYXJPNaTgPXeD7w7TrI2LfI9Yjeugwrp4n3qVANXj5UCftVM+H48K+5t5reiaxb
	 gL5RG2Ap0jc+z9og1m12OEDOWQ7CqVGnVRJ+iPPv938AUIQRA6JYCW1rK2huXz18ND4p/
	 9vCaIoDdPS8e3SI+Pz3axmvjQvGn5sh4Eqsv5rruLxzuWvBJsbvIs/4NUep0/agDO5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7w6J55o;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026CA60A261E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026CA60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7w6J55o
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b190cdc9feso2324110b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471789; x=1795076589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXWQrLCbj1VbbXmwzxndXA36ZN5dlLDITfWb5Un2PIg=;
        b=f7w6J55oIUyTOapN6J0/hpQgPiqGiPYypBlMjLjjrQzPlC5aEi3+BeOtjnfjQRi0f3
         /F+cfXioV3bgQLRmG5NXiF08p1vDk2YeZ9HsNGMTmdmboM2oPdtZUbdQ1bi6efnd71VJ
         rUOqmqLzwBfZrx7ijmDbQoEUzBHxonCDSFJDE4MkQxye1yMcKfVUkelRGZhbOPYU6lWZ
         cq22DCcOrtjRUrBNYH3XqO2AGQMiOvw8N1c3aVSV1e9zfQHsVzWy09YUFDQXeY//US2W
         1UFMl6jDxD40AMfe+iJBtF0+/LYoOI0ZPHaAO17z415I6I0FTs7K1hbhdywQU6QAb6LD
         LDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471789; x=1795076589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXWQrLCbj1VbbXmwzxndXA36ZN5dlLDITfWb5Un2PIg=;
        b=vhnbu2c4hty8x2k2PgsrdGlkkh4vD5pAslp5tMe6MBIGSGtPT6urfajuk7czMTqQfh
         R1YsUYXA/i2OuCPG6b7MtXF1hS1B7TF865biVUd02JEI672FkE/+7wbkZJrNe3GQbY7P
         vsNF5mAcU5eqR7AlWsnGv/Mmsd8c/LFtrWj6iNXylKmDjj5KT3Ix2zNuMpRLwrbfJDEQ
         oKMWpwh81sYMYujdXPIwTSoa0cfbhrP1Kq7Uzqes290rO1/KdJfCk+cMUdEgro6Hz1WD
         tvJoGAkBtyOvf2Ple69Nyiqp0IZ4zNRaD4Rf574BJHI+Ur7blVCpmDPiTaUpPj8BLDKf
         TW4A==
X-Forwarded-Encrypted: i=1; AL+hErESTa42RCx4LmK9wyqf1qcjtojF+492xIOZMefZBXLhd6wiEHv9iEPiVdhTPkYwVKqKeP9u3DIUNh2iqfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BKJM7WosuAv0RZYkhvkH3l0ak8Wu/WfC/q3GwBWaB64WNVUko
	hehKkTu5G5YiUVWfY60zZVa3ieaoCC0XBpkCPu7zmqx9TKOnowMxtCbu
X-Gm-Gg: AYBFou3obgOH3HJfiUGKVZ++1spJhVZ6msZbnn2D5mBU5PkiFrNobNL2zTfrRr3Rw2E
	6tTePaJwbKSAp29hd1Hn5V5efrVo1F1EyK4bLMsnWvd7roGDqb7Pq8KVWr8DwgWyoyiWZD85j3P
	facgn5WhsnmxAt8TWMIYFJpjMIbUl/kNP4b1XWYV3vEhJ2z4bfcbRrpreB64wJk4EJ8rYR9hplu
	Zr4CrYA3WrC3P54gkvTWftj0rfhIlAYU6DQpXgXvoYQFucELLcsh3juZcz/Ryn1LhS4febc/OQM
	H0GD7z+OObE7Let1Pn+i/iTgEk24KV4Ed7MYRLpbODhNfGGuPglkBJCZg6fInNVT58BrkPDxKZH
	WyAdzngh4M0bP9liUsoXeThEfcxI1I3b2pTU0G9QR57dHNaAQbC36EMGvGkkVAr1xPp3tLdDSkB
	qBthK7g5qJlaZHqrqVCt4hmwZ4Zp5mkXcOW6DXu1CpyevBmJvda4rMWOJ0td+LN3DMOyRkBCqsg
	DhY9RPTC0moUrHenmcm4dI/GTxF4TclYnFAXkyQlvbxJeufVHV0Gi0fgMO10oRgyES0U0teeo0x
	mad5KaqJgfz2lcfgRTIhbNa1x5rtMSYZ1B59yvuZ3juMN/9xSj45gqIi47fx7cXCUz38ICO9xN4
	2qM/4WoyJf7eI/ANcCIvV/fTkbkrAJ95k1bENTJO3+ShAJaMm5B+iAeG3SDw0+KUfiDOnllxiUw
	JilxngCl0axW4BgTNGtnIfMySG/tmyiXvtRpLs2AVgfzJeqmZzRyTbmshfTnvgE9R+qgf1ytHo
X-Received: by 2002:a05:6808:c1b0:b0:55c:928:69d1 with SMTP id 5614622812f47-56b986255c0mr4313912b6e.56.1794471788880;
        Thu, 12 Nov 2026 00:23:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:54 -0700
Subject: [PATCH v4 5/5] dmaengine: dw-axi-dmac: preserve pending pause
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
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-5-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
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
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  7 +-
 2 files changed, 89 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 1a53fbc951a9..70ff0c500623 100644
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
@@ -1215,16 +1240,50 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
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
@@ -1251,17 +1310,11 @@ static int dma_chan_pause(struct dma_chan *dchan)
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
@@ -1295,6 +1348,8 @@ static inline void axi_chan_resume(struct axi_dma_chan *chan)
 		}
 	}
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->pause_requested = false;
 	chan->is_paused = false;
 }
 
@@ -1302,15 +1357,30 @@ static int dma_chan_resume(struct dma_chan *dchan)
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
index 3c86e5d468ea..332f9b9b9fd3 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -42,6 +42,11 @@ struct axi_dma_chan {
 	void __iomem			*chan_regs;
 	u8				id;
 	u8				hw_handshake_num;
+	/* Protected by vc.lock. */
+	bool				pause_requested:1;
+	bool				is_paused:1;
+	bool				cyclic_restart:1;
+
 	atomic_t			descs_allocated;
 
 	struct dma_pool			*desc_pool;
@@ -50,8 +55,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	/* these other elements are all protected by vc.lock */
-	bool				is_paused;
 };
 
 struct dw_axi_dma {

-- 
2.53.0

