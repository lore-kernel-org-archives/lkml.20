Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316604;
	b=tuxrZdWZ3TufXuo7/8er2PHUKD5t/fMp8/VzR202oErmJVzQd/4pu1xhnPbIrWM8P4O2
	 gss+8iWU6mGwLdTC9D5s/FcPorQBiqNyK+ukVIZITxqVbL3I844f4wzI1bgTW5BHDJwZv
	 MZ6vLup1EpaTfiLqF8U7GvIlvJFEIJpHkB4U62VSARr7gSMDstfUmMTbMwdDXfAQ5SiHe
	 NAx3HoIRAcimCu8MNqbdgSewReFy3P1cFBE5JsoCRHsM3gSS840b5+TM0rS4ykIMfII8E
	 4Wk8RTNqgICufWZGRghDXcXJprxrhy2+kpfDVfr+oB4DizYaZg5oGNR+Yy2dS1/H4KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FrTi5WGJf6rYQ8TjZQMg59vPwm3N9TskdTdengcVrik=;
	b=DVZZxm9Ai2r7ZFQyemq9X5zWmc8h5d553q5cC7Hrt3gDw3o0dVulTPyGdIz3cLlWvo6P
	 g0dnyGhRddPGPrZt4e89Rqlq4WHqK4JlhWd88rfcwhJMiZxfn0m8DlMxWM+iOIEPXOpVL
	 +NADg6Zug8FvwJ08knVdpHS9Hx1Xd1TjTR2dxjDLY6CSukIpj7uBBZ8TdB3zaswV5t2wH
	 jt2c+Tq9Nju+3VDuZHTUgUX/dRpL+PtpQpSuTtxarwxpRqfh8YZvstLejCTfCgW9HXNU1
	 m9pPl5rVwJvoV2O0T2RxkWehx5qA0SCDdrMK9PP7+TKYUYVI7RFzgKqKwmPbCGjsL/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZdUYCif;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC24606A74C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC24606A74C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZdUYCif
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1164074a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316604; x=1794921404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrTi5WGJf6rYQ8TjZQMg59vPwm3N9TskdTdengcVrik=;
        b=eZdUYCifsrv/B3bSCiKuMFzJuMoSNjobRc+uIamCit8kmZ4T3gfOUC7jyuRTff+TCH
         v6SZi6LeFf3RV9lYUlZ+GlSJHhKt9rE1w7iIOpSyMtchBzQncv2xQLbN8BB252mV0tWS
         Ef7bwNvhefoCaAGhZ9b5elPk+A49PSeKB7psfg3VHuiB9UU1okwM3ArcnGctcAKS2LDq
         /RXy0bSUHr6dSxU8RQOzJicLS07Uiy1Xjj38NitCI3HWLhOQy0vnpk40hjnAQ7hCYqtt
         SCnv6QBZUI/MRM6VT3clW9OQPCjT2lmhjSJyKE1mH3SI2Flu2Eh4aYbFw4ZyCP2e4LXb
         dUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316604; x=1794921404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrTi5WGJf6rYQ8TjZQMg59vPwm3N9TskdTdengcVrik=;
        b=KjEMPyUFSBDYi1c7bHoChZxT1/MuJT2qEWDWvvglvISf0IKXphI9zWVU1Hosb2Pyxw
         T4hJqdKs1CjWL4stiace98uNss2IiAYe3+s0goNSwZQs0xr/hjfnhULp6pYptKPRFFu5
         RfVplW9/lT6jyeVMsaaW2yPpnz7qxllCNDAn6HRxNcUn5CPJMRTAlVLE8k4AYmFz8UNp
         612HIVbWp5yIrSC+n14swiVuxaCU5FLByiv27MS5p8cT2xU/3s9a5P4MzeoNaS1hDrNu
         jMvNbUx4O4Ih2/aGiwv4JgaOFOX9IKXJxj9ffJG4nf91oBVZVdmiY6Do/vK1HGAVT3wv
         ZaBQ==
X-Forwarded-Encrypted: i=1; AL+hErGExYL1Vj7A/a7IqDymtyl6XgqI16zmRarLHxkrpSrbBGVmINHpsDX3nsfz72rZ48uR8lqkMp+l1uDcpZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EO/gxCTijdnlN7sXbZaV6P2Nc0w/8mwdrEEKjkfpbVUvyT98F
	PHP8PqFufFdy6U4is40gK+vZWvGKSs1goAmyFPZQr6D42yPFf/euCTsK
X-Gm-Gg: AYBFou3VIT+LpF7x3/sv3NPldUzRykFp3EJeusuRauCCUYNUaZHCNjXWN+8cK83G0F1
	bE5rlEnEvznyGhfA979Hnv+lwoyJrIhvZOIsoTVeJhk+QNjFF1MlxL0n3R1QEmvzstbJ9up3/ZA
	u6n0S5ay9skBDwngN92qKfjYUVyjP+lHBzVHJdeHN1cI59ET+Qw1j1/YSaGSiSULp6qjlrvbtWc
	RtkSIAcxml0RoXaYizXjVJ2K6w2vGFicBvThX4xTgkZ2ftGOcj+jT4h3J6X4Pv5nnpfW/pOD0qB
	45+eYsEfRK7xXCnbeyCgZUvCBkg6gIA8SrCqTTo2w+bFjf21c4F34mWA6s+PjPjAsBUz/c4rIg2
	unTH+04O08UiCyUPexWESw6NthvXBFXZQXfv+gZhIuglZxz+qbzBGfW6rm0/RaRqc/CDP3KOfI2
	+icJJkEP/fCP4B4hvWhFXla69X1L3xfvTBHEXu+JpPL8rhA489pWzW+PheD4D9adlsmHn1okEj+
	MHIh0Yj/M1WKhLh7nKFU/sv+9MoznMLx9bCe1Q9/BU87Z9xSagdEXs1IkVu9moTeyabFmAXWXBg
	8v6X7w7P62V/j5yI5jkdpp8yrtKiE44=
X-Received: by 2002:a17:90b:6c8:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3b166cd84b0mr2754626a91.23.1794316603596;
        Tue, 10 Nov 2026 05:16:43 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:43 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v4 16/33] dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
Date: Tue, 10 Nov 2026 05:13:16 -0800
Message-ID: <49664b6b5a0780454a3e9d2342275abfec7069ed.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/ppc4xx/adma.c | 14 +++++++-------
 drivers/dma/ppc4xx/adma.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index bcc54d584e2b..8fa36d72b145 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -1658,9 +1658,9 @@ static void __ppc440spe_adma_slot_cleanup(struct ppc440spe_adma_chan *chan)
 /**
  * ppc440spe_adma_tasklet - clean up watch-dog initiator
  */
-static void ppc440spe_adma_tasklet(struct tasklet_struct *t)
+static void ppc440spe_adma_tasklet(struct dma_chan *c)
 {
-	struct ppc440spe_adma_chan *chan = from_tasklet(chan, t, irq_tasklet);
+	struct ppc440spe_adma_chan *chan = to_ppc440spe_adma_chan(c);
 
 	spin_lock_nested(&chan->lock, SINGLE_DEPTH_NESTING);
 	__ppc440spe_adma_slot_cleanup(chan);
@@ -1754,7 +1754,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_adma_alloc_slots(
 		goto retry;
 
 	/* try to free some slots if the allocation fails */
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return NULL;
 }
 
@@ -3595,7 +3595,7 @@ static irqreturn_t ppc440spe_adma_eot_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -3612,7 +3612,7 @@ static irqreturn_t ppc440spe_adma_err_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -4137,7 +4137,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	chan->common.device = &adev->common;
 	dma_cookie_init(&chan->common);
 	list_add_tail(&chan->common.device_node, &adev->common.channels);
-	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
+	dmaengine_init_bh(&chan->common, ppc440spe_adma_tasklet);
 
 	/* allocate and map helper pages for async validation or
 	 * async_mult/async_sum_product operations on DMA0/1.
@@ -4247,7 +4247,7 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
 				 device_node) {
 		ppc440spe_chan = to_ppc440spe_adma_chan(chan);
 		ppc440spe_adma_release_irqs(adev, ppc440spe_chan);
-		tasklet_kill(&ppc440spe_chan->irq_tasklet);
+		dmaengine_kill_bh(&ppc440spe_chan->common);
 		if (adev->id != PPC440SPE_XOR_ID) {
 			dma_unmap_page(&ofdev->dev, ppc440spe_chan->pdest,
 					PAGE_SIZE, DMA_BIDIRECTIONAL);
diff --git a/drivers/dma/ppc4xx/adma.h b/drivers/dma/ppc4xx/adma.h
index f8a5d7c1fb40..9af1feaf0b9a 100644
--- a/drivers/dma/ppc4xx/adma.h
+++ b/drivers/dma/ppc4xx/adma.h
@@ -80,7 +80,6 @@ struct ppc440spe_adma_device {
  * @pending: allows batching of hardware operations
  * @slots_allocated: records the actual size of the descriptor slot pool
  * @hw_chain_inited: h/w descriptor chain initialization flag
- * @irq_tasklet: bottom half where ppc440spe_adma_slot_cleanup runs
  * @needs_unmap: if buffers should not be unmapped upon final processing
  * @pdest_page: P destination page for async validate operation
  * @qdest_page: Q destination page for async validate operation
@@ -97,7 +96,6 @@ struct ppc440spe_adma_chan {
 	int pending;
 	int slots_allocated;
 	int hw_chain_inited;
-	struct tasklet_struct irq_tasklet;
 	u8 needs_unmap;
 	struct page *pdest_page;
 	struct page *qdest_page;
-- 
2.43.0

