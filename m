Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808886;
	b=0CtoRel2E8xexd7wor9aZr/zrdNK+K5nTnb43etNZ/Ycp0ZyQ7zTBFcpeBPF+ZqtvaMc
	 IhjaEl4G6G7gBG/io7aVwqU/3echMGop/JWrUPNARw56XE5y7Poi9LWCWA+HIEb//4shz
	 DiLAmaVu8m6HnuHu4uvz0/3Ujj82dlTL2k/btb460tply5Ti4Kkh/wPEiWUxruGejG4SN
	 9PyMHBUOfmu5Lm0w1t9Hb9rEnkLiV6p2oTTeymx5VvNwgYesPfFZRRs3lwPlFQdZibe/S
	 +LpOINUMYZ+7SY5adJ/l26bdS+nszMHEezfOw+2DSynrO/JU4OqdOQWP08v6T9Ng6SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
	b=oi12iCTFIh2dnLRX4IUxagOYeCSIGMV4M8L8+ptjeVExsPX86zm4TjegySUVnLQgaXno
	 lfEm7Ei9xkUlbA3PLQac4ei3yzhzNW5+rYHfOr+pcf/qkFLC9XQPU+xxeJhKzwXBTBLSE
	 6KSvRjD74HKZjI595kH2f8bYJMfPCHmZUfzD8KriZJGvCUpzDWG6lFinArZoc2II5dZBg
	 Sx5NCUlWwo2igo9dCDMSR1XXXqVT5DIHgvV2WW5ZXNIayU7C5wcoMwn+dygqynTdfV76f
	 02rIPxK4TspytjAbnW7+R1SnQCKJx2IWsd6Rr3wtg9251enPZNPjbj9x7qcwLxwlbmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmSqTiC4;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4860A2621
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB4860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmSqTiC4
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-706113e92f9so2423145eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808885; x=1795413685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=LmSqTiC4cska9/oQc3Wi5LiRvFjSaeINLbN+YU1JT9Ek6gWr4lar7DQOkNCLDqXyjc
         mwqbVO3wfQjfAgDwWLPY7GjIpmW7KkPIK4Vbkch2A+JSDmJOdNUEz9TTSmPgemu/NY9r
         T0Obk53A5k5rTVXnvgf5bKQl009BLwzHjV+G/pqccD9YsbBGcxLPsUpAqEa15j84eTMu
         0+3b0Eg5vpJwTorVFruQKBfLVlWlnNIUa6Pil9xsV1MqAnbe/53gM0Y/ZhkHgHkOVQRf
         ouEBpdJOuCq8qM88k1hQWjwDAOu5znqvNl91n4dnNHnAn2JVJFdCz9TsKdKWgh7UBsGy
         F2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808885; x=1795413685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVtERnt1yagTDveFZiJK9CUhtwDO+IK5KagdoU7rqog=;
        b=dklHSMmDYHNsoR0gvqexGRl7BU6sjNT1ds12fesfEr3DBndATYJy/iofrt5jLTJEva
         52QuYz+pkloLd/kKkKACZ8l4F6NFeGZrnNe+0XbgoP8MRQVpBCagCeZcBh0qsYRxyXD5
         dEPNSWbhB/Oi5Nd+d5iYtKNMDrWfoALbP8GBnT1/imEX/Mj0pjuqwpyAw/wlRekMepiP
         ef8DkweeD0B9VC/Uu/So+GcZEkTvqWym8I3Az3vwbuZOj8jpPPNO/t9A8dRp9CpzPdWf
         3B+86tgxIxdEAb91KL14KpvwvsEiGUnABJBHwpD7MC9yP4qS0qC0mCueaQ7cCl9Fb7mi
         sfEg==
X-Forwarded-Encrypted: i=1; AL+hErH9muzKlNceKks8sgr01vhr9hLBxsUQlrLblDll5tlv5oGW7wVfQUWBEPHjmZiy0qk1ltRLacH5+/+kLr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FGZLDCoRyMl+LGUJGTHh4PMsGXmpPLaUZR+rTy5AEKdT46Djj
	YNGx2222VD8zb1NgdJHQcXTj6IfD5jTROphSRnXVvrbclzeyba5457wje1+L2OE1
X-Gm-Gg: AYBFou3EfdtyD7VndEFgfo+/rZkE8FTDWVaNzYO1E6lx8t4+6HZKNld8wfgr2z1Mm1p
	NeTzcfWCqq0xXvSc69O/3MAbsC8dowTSrH7lcS+YYsShkFUyilf1gCFebh2WE/Zk7OfWSMpYAVU
	W5RAThRFfbYzLiIf8lRg+LfddQqzcFUdguEhzpjldfeWqGwycrfvj5j9fMUnlMLUUdm1foR5vDd
	iTUgKKyiBBwgvSj3nk7dXqqVEVGuXY9LMsjZrmdxLX0lI5arKU0Yjs9AdIxLOLaXFepNluHdOAL
	3ncW1kMlsIvRBb0m+68C6aIdE7qnao7a+psgqKSBh/V1AF89e3ocOMEw5b8BhmexNbwhRirLknb
	QqbhyGGSgkPIEqMttfS92NZ5DP0lmJjYP2b9sDKhLtW8ErhAhNHh1me9P+xBNkWm9OcHXvWcBjx
	kTmPBMglqu61LdZRRVmKYqawjDSG+rtdznea+5vDFZVPBqKx4nlU6AvmESmEmFuyYRpfCJFPUxI
	elg127Pek3Je39hm1NoMi2S7pM6IlmWS+XwjDM/cze0+cRgzfJCrVhXP7qZtJECXEX9AX2HleOn
	IdXFqx7RI57DIdMAo8by+MxXWCPyZZJfT7ff2allrjtxyYifqBNMeavp+3UNiudXWbZVvSANVaU
	G5Bs799RyhxWV5DrxBXEkncuTH7kKg4Kp9Y7g1w5RMNsL+ural4stKbzoy1/gOWB5PG2lfRbZLa
	xExvyPz5LpcCUWsELKilf/Ipvv2UvM5NHesEdaNkC+IU3zS5l1h20=
X-Received: by 2002:a05:6820:3404:10b0:6cd:3ffc:acf7 with SMTP id 006d021491bc7-71ab50916f1mr3874435eaf.71.1794808885251;
        Sun, 15 Nov 2026 22:01:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:48 -0700
Subject: [PATCH v6 7/7] dmaengine: dw-axi-dmac: serialize interrupt status
 with channel reuse
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-7-bcb23d1e7029@gmail.com>
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

The interrupt handler reads and acknowledges channel status before taking
the channel lock. Termination can finish and a new transfer can start
before the handler takes that lock. The saved completion or error status
then applies to the new descriptor, stopping it and completing its cookie
before its DMA transfer has finished.

Termination also leaves completion and error status pending. A subsequent
interrupt can consume that status after the channel has been reused, even
if no handler was running when the old transfer was stopped.

Read and acknowledge status under the channel lock and keep it held while
processing the event. Move locking out of the completion and error helpers
into their sole caller, and clear all channel status after a successful
stop. Status collection, descriptor ownership and channel reuse then share
the same serialization.

Initialize the virtual channels before requesting the shared IRQs so every
lock is ready before the interrupt handler can run.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 31 ++++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 97098367535f..0116c44d3bef 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -20,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -1071,9 +1072,8 @@ static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 {
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
 
 	axi_chan_disable(chan);
 
@@ -1082,7 +1082,7 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
@@ -1099,9 +1099,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	chan->desc = NULL;
 	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
@@ -1110,11 +1107,11 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	struct axi_dma_hw_desc *hw_desc;
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 	u64 llp;
 	int i;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
 	if (unlikely(axi_chan_is_hw_enable(chan))) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s caught DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
 			axi_chan_name(chan));
@@ -1126,7 +1123,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 
 	desc = vd_to_axi_desc(vd);
@@ -1158,9 +1155,6 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		chan->desc = NULL;
 		axi_chan_start_first_queued(chan);
 	}
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
@@ -1168,6 +1162,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	struct axi_dma_chip *chip = dev_id;
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan;
+	unsigned long flags;
 
 	u32 status, i;
 
@@ -1177,6 +1172,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
+		spin_lock_irqsave(&chan->vc.lock, flags);
 		status = axi_chan_irq_read(chan);
 		/* Leave suspension status for the pause and resume paths. */
 		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
@@ -1189,6 +1185,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 			axi_chan_handle_err(chan, status);
 		else if (status & DWAXIDMAC_IRQ_DMA_TRF)
 			axi_chan_block_xfer_complete(chan);
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
 	/* Re-enable interrupts */
@@ -1225,7 +1222,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_terminate_all(&chan->vc);
 
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_ALL);
 	chan->desc = NULL;
 	chan->pause_requested = false;
 	chan->is_paused = false;
@@ -1599,10 +1596,6 @@ static int dw_probe(struct platform_device *pdev)
 	if (!dw->chan)
 		return -ENOMEM;
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	INIT_LIST_HEAD(&dw->dma.channels);
 	for (i = 0; i < hdata->nr_channels; i++) {
 		struct axi_dma_chan *chan = &dw->chan[i];
@@ -1616,6 +1609,10 @@ static int dw_probe(struct platform_device *pdev)
 		vchan_init(&chan->vc, &dw->dma);
 	}
 
+	ret = axi_req_irqs(pdev, chip);
+	if (ret)
+		return ret;
+
 	/* Set capabilities */
 	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
 	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);

-- 
2.53.0

