Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316587;
	b=qzASzxiAlW1gMNcWdrUzQdYHgfeTjG6Eppvg9X0Bsc3vp3CLKaIwNdYHltgyiFW51k8M
	 hd8tAm55jrfzDJ57euZHoc+VoIOdj40hNSKsDJyljb/DO2dwVJ3ZJfQTYAUoNy2nfmOYH
	 +D7wrZighe1WwoxZTuSLarALmUp4mE+4kCgHcMvPo63TU+Q9xVOoBwPJ8fF+sWuMShgAW
	 Mezci9jQFoAIUZpD0nK9hU0P8fyAWkGqrtFt0p/04pQ8RDbJmNE//JRvUlRTi10xtwBfp
	 KXescCrsET1eFvk91vAP0u0pnzCjhuule5n0CyTPjZAGeH8vzc8Q50/quR9vkHtGFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MU3RiOGrSRHx1hu2s1LecvApwkWB3wk5pwMHBRlnI10=;
	b=EwMEtQevA8+bvvwTpJ7fSbxP8++oULVVoLLmTXZ0B25CiFr3cWlhHGM+RMGDb2+vUL+Q
	 7lwKESE7FyQVTBz7IRHuSKoLRFqTNUbTt3Mo5oIoay6nfld3MQfE7QFoeHZPmG4YU5tdQ
	 JrvotZN9mLP9TDTaWr8CA/2cohU+3y0rowu4HVkO5nvXvdemfYrsk2fdyNpWrCTIng8zy
	 yV6Z8uCTg9+wEXZfvRaIGCie7w8XjiZPk4/tlrd/0mOMHvWjAvkhRA2VzEUBbHRjjSX43
	 iBVZ7MrN/qLSI27hdAqT1sTJYgn7ji7evxTgnG1n9eNpnH7LLH+fe3YHHFsmNoRhzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XJHTmY/T";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7660A3817
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A7660A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJHTmY/T
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so910786a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316585; x=1794921385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU3RiOGrSRHx1hu2s1LecvApwkWB3wk5pwMHBRlnI10=;
        b=XJHTmY/TI0apXAyAu/l41Uzr9Z8Ii1KnkkP1TWQAsMPiAhLKROFgc0JtQhp+MoO7eh
         8jyZxARy3G19I5AH4NgA0NwAT+6omkEQVwOW1rI7iZsSQJLyXFWeyDFMq0oJvvteEje+
         nYD59YTPtK3GotzLQmhkWQErI3j+sL9oJ8n1I1jFad3uvFXtDuWYjOFJ0LVCqzI0QaZ7
         983eyTJP+FIdNbVAKrv7SbB+J+iEPIBBgjog/uFiHpHwPgT/C4uZ68FUb6nmvzJU/iWU
         53ovvOxScwos8EeNBygTxtVOdZNS5FayPcycKwDepAXlFYR0fAcv9ajxAWu6guTZZkgc
         egfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316585; x=1794921385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MU3RiOGrSRHx1hu2s1LecvApwkWB3wk5pwMHBRlnI10=;
        b=Bkm/N+zmjziYrFI7HY2SMGi+Ay2KLV8s+ali1ztW9NI4xw/HZnoOCprQLfMLiX4gYy
         jRJeZSi6PDuQsU4zsqio6iL4pjaxIg06jENSx81kMAyqe4oYVSaGwABQpYr/PAYTn5Hp
         2nuk22claz78esBy+VxI2hjrQ/P1zz8H/HAgSrUzwY0eJcvBMQa1eXqWB2khGsbRVAT8
         CgRABWQLTzqJShhCImD6aLldnODDeZcLl2EqAvvANCtC/yeMhtDDCgpGxY3fnOW/AGAv
         96VvtvGCtDOTZ821iMbXyfW82HZVKLlxB/fIM6yn514V6n21hnTWEEtZx6k9XL9tN9co
         VFzQ==
X-Forwarded-Encrypted: i=1; AL+hErFhfArWD+FTlmPX8/kvwB9Xft7BkeWHYc06ouWynILSUPKfaJWgGGnoE2HB3Jqa128M4h+AP2lnQ/XKPFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o2kxp5FF+cMacoiiKIxKPNlWMO7dEtAbtAjrkgEmEmAgWO9Vc
	/st398G3/IH06iN61lb5lKqEszhF9NIKZw6aCPQHJ+2soMyUhDLhozh7
X-Gm-Gg: AYBFou2CBVtOWpoXH4X2W+PBBUY7NLqKKQlhq2RGLO1DvG/IB55VW0BhipnYZC8eXOY
	PJPjfTSkkIhq0SbuAS2N63duZ7mEoLaNs6rNTpkpI4A1h5x68xGAqa4qRAJ9g+HxfNyj9GYNIxP
	XYatV4EXQrZK1G2m5vgByoyiGm6kK+Izgr/gKUG0ixyWlEoQM45WSeN165hPDylKV2hzBIt8EqV
	JRg/nFk6pI/7/OvL6hnZua1TAPF2SpPpwscQnwD3C6+PT94/dvGtfRcwRDCK3PcbxF4snWugxHd
	fCw1I8GKj2te/HGH1G5gHLR5MQkjZyiiOnW/cqCw9TNTjyqiyJTIzWTdtGkCs7Difsz3+plV9Jc
	I3vFLj3DfYbTyQcHLIhgB+pjn09cxvdeuQaOwuOxzcWaYhWtSn+Yj8sL97pcrR714ihGNIpg0jw
	0MhfFdBiiqGluS0C1eIJHNa5AsBFQ8qQSlpEH+B9YVOmbLQ7m2t33K6eF+7IpikXwIU1ty5EV0m
	zl+HY+jvL+r+jD4yIqE2KMTYAyMQNBqpgW0FlioytPRcpSiLLuWdX2lnitZRkYBV8MOOPIHTYQk
	HxKR/cyztxrAXLb3JMsdSrhHMkP5Px0=
X-Received: by 2002:a17:90b:534c:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3b166ce5259mr2804698a91.54.1794316585052;
        Tue, 10 Nov 2026 05:16:25 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:24 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 12/33] dmaengine: mv_xor: convert irq tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:12 -0800
Message-ID: <36805c4397b387b8323c00190aa015d5cab3feb9.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mv_xor.c | 14 +++++++-------
 drivers/dma/mv_xor.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 92fb996f5b3f..41fe35b3aab0 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -327,7 +327,7 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
 				 * some descriptors are still waiting
 				 * to be cleaned
 				 */
-				tasklet_schedule(&mv_chan->irq_tasklet);
+				dmaengine_schedule_bh(&mv_chan->dmachan);
 			}
 		}
 	}
@@ -336,9 +336,9 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
 		mv_chan->dmachan.completed_cookie = cookie;
 }
 
-static void mv_xor_tasklet(struct tasklet_struct *t)
+static void mv_xor_tasklet(struct dma_chan *c)
 {
-	struct mv_xor_chan *chan = from_tasklet(chan, t, irq_tasklet);
+	struct mv_xor_chan *chan = to_mv_xor_chan(c);
 
 	spin_lock(&chan->lock);
 	mv_chan_slot_cleanup(chan);
@@ -372,7 +372,7 @@ mv_chan_alloc_slot(struct mv_xor_chan *mv_chan)
 	spin_unlock_bh(&mv_chan->lock);
 
 	/* try to free some slots if the allocation fails */
-	tasklet_schedule(&mv_chan->irq_tasklet);
+	dmaengine_schedule_bh(&mv_chan->dmachan);
 
 	return NULL;
 }
@@ -742,7 +742,7 @@ static irqreturn_t mv_xor_interrupt_handler(int irq, void *data)
 	if (intr_cause & XOR_INTR_ERRORS)
 		mv_chan_err_interrupt_handler(chan, intr_cause);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->dmachan);
 
 	mv_chan_clear_eoc_cause(chan);
 
@@ -1112,7 +1112,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 	mv_chan->mmr_base = xordev->xor_base;
 	mv_chan->mmr_high_base = xordev->xor_high_base;
-	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
+	dmaengine_init_bh(&mv_chan->dmachan, mv_xor_tasklet);
 
 	/* clear errors before enabling interrupts */
 	mv_chan_clear_err_status(mv_chan);
@@ -1167,7 +1167,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 err_free_irq:
 	free_irq(mv_chan->irq, mv_chan);
-	tasklet_kill(&mv_chan->irq_tasklet);
+	dmaengine_kill_bh(&mv_chan->dmachan);
 err_free_dma:
 	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
 			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
index c87cefd38a07..27774abe34a6 100644
--- a/drivers/dma/mv_xor.h
+++ b/drivers/dma/mv_xor.h
@@ -98,7 +98,6 @@ struct mv_xor_device {
  * @device: parent device
  * @common: common dmaengine channel object members
  * @slots_allocated: records the actual size of the descriptor slot pool
- * @irq_tasklet: bottom half where mv_xor_slot_cleanup runs
  * @op_in_desc: new mode of driver, each op is written to descriptor.
  */
 struct mv_xor_chan {
@@ -118,7 +117,6 @@ struct mv_xor_chan {
 	struct dma_device	dmadev;
 	struct dma_chan		dmachan;
 	int			slots_allocated;
-	struct tasklet_struct	irq_tasklet;
 	int                     op_in_desc;
 	char			dummy_src[MV_XOR_MIN_BYTE_COUNT];
 	char			dummy_dst[MV_XOR_MIN_BYTE_COUNT];
-- 
2.43.0

