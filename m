Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316610;
	b=RfmdJ2bYu4njgnmZCBfoDBVA8hlZjN9RIx14ca9wirIA3cA66yPDmcMGRR+/IimRgtu0
	 H8GA5bMJ43OEoVqfRmKf84g7IsEx3Lt6kyczAxNo1+1FgfMPowDkzzLmb4DLrPr6ws2eH
	 fNSsaxxzO+7/V2sqOBxwZtvCMZrnGmb6VqsKdxd9HaxCDpLn78thjyrIv2zY1D5agHcA9
	 562rKlZq+n0GepdLc+3soKJmxuXE1aGhwIeic9z+a4u9/FicWymAyxa2/eAGlQvz7g8N4
	 FKF2IYWESPe4bpM6ub1+lCl+c9vilIiOQLDbq5W/s4xNBMGPoE1X6ysl2HVDw1c10oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8qSxPIJXGmZS6SvVTVsFVDiQtnJa1ZzyZtQ6kW4/PMI=;
	b=Eb9IFtUC3TjQZ8hqFdzMi1Z98darY0irCTD5nUYrAI6T7wVyZK1XEh67dZ1Lbx7dxRuc
	 9d5cev01pMbrlyHKrBdC8vjWnxxk7Un703OefUuqFy5TYDR2mVcGgkqUho75u/7L1IlZE
	 A2fU+OET75qAavge4vHKz4tmekMeAK++M66chcz3XcNSGpbGgxRE6sOu4BoqqlifPygiA
	 chrT0UcPwbeuCMc5fO6zIursCL0YFF0yM+8EYg0nRK4oLybPC7wzlMbz7e+BcfCtdSbex
	 2agHuj+x2XKDptDeNiHW0z2JRd3cHQ00lxzqN+RymE4zGjn6DAM4SgX9vrayEwyxAQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVyzpUgW;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250260A6F7D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4250260A6F7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVyzpUgW
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1251037a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316610; x=1794921410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qSxPIJXGmZS6SvVTVsFVDiQtnJa1ZzyZtQ6kW4/PMI=;
        b=TVyzpUgWfv/BXNZsfbzPF45RML6viOGXtfGz+T12krB8pckShd8XGdJmSPwMxZkaQS
         XWaAGSPEEmwg5J5blqv9OGzP4Qrest+0jpKvfXVmbxskTWNDX2ItjCn8kg4uHTNIQhp4
         NiZPminUYZKl43lqdthkVAbz+EmJiP5QymOt0iLnph5c6nnX5D1abxH0uNtvyIQNh4JX
         AU4lfLD7mfjBK4FzjsGWtQar3wEMR9Hm7wpPDinUGda3LUrg11/biDhii/TCbtn4ij55
         LNsOjFD5srPwH2haoU3vumsyby6xi9qvxrmgNFjkigV7Mxkf3OMnh9qXKWtAvOCEnpDa
         a0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316610; x=1794921410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qSxPIJXGmZS6SvVTVsFVDiQtnJa1ZzyZtQ6kW4/PMI=;
        b=WoNs636ClvgSIfwv2Nfet7KGgzRSQaRKrpRXFu+o89qTV9JmnHvB7SbNv2IfG/XNYQ
         pIBR9BcASF0xOWoALj9j2XeCwd8U/8xSvR8eDu6G+w2EcEryZNK/An6zLpSV3r+titSj
         86o9HnZo7/vwLo6OFsQjr70lqWAQWO97kV92LVEV37QkfPcShcyyfkPQf/InPtrj0CwT
         6uEewxmyb3mJsI6PWLW4A+BgIUf0gESOSUZz4QRkhor3LOPKKjlZTiGFFXC3BXDb4147
         Yw6dfmWIXslrwzI7IKoeUfPc4R0tKaMDqMz+ZJhwTrBqss0/+0TkmLF7ZQocyodkiFVc
         74Cg==
X-Forwarded-Encrypted: i=1; AL+hErGD3pgTL4mke+xJvK4v9ejOntpN9v6l9HS+u0qGBrF0OYlTKaesPcqeUZoDr9ieOOnbZpU4jHqIeclutuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z806eKHZaFkxlc0PNpiKdDR1R0B6Z+5H/F0mrRPEiwxnswrRszr
	/AsPnjmIZ1PJIzrN95R2DX6ZGwh80i400Zrc/pKoX7qZ4TxXVhfCrese
X-Gm-Gg: AYBFou1J9Xl/yrBTT5y8G4l4buiBynZy0yy/ldUBckRa/k3dgjzOk8czcZHvnBBpdgU
	BZ/snOQ2X3oZj8LsErES9kXrP3xtEOaoIItTtKmdX7mDNgtrOuCMEqdezd4bifn7quCdMlBo8Jv
	acMR/o+SWJuhXq3dYJn2Hgtmmntlf/qYYrOBJoEMhLl62UP1dS+jpMlHsr8u5xxg7Iih8OoAihn
	1HCe0Vygej+r1Ihhf4fh9cjprvkwE50uLWGT2NyHdLLdHnTqPYVFNRFoS8fY1EPyricj8dlUXW3
	TvC7SYxXV86jB8ljdIZZHTMnVkCuQyU1ZQkOIlOhtN6cHR3NbSa7KxF5LNdLEEqqS4J0liANzHL
	K+k+1+3RM8h644XHx+sXl9Fizy2KlF2We37naMlSCDboi88U3fQESjeSpGvr6GvFU/bcf102g1t
	eawBKEjDps+vVoraCMuhezdqt2nfULUiDc6Ds725BvZ/33Hc9Wy0Vue/nNbPlQ7EugaEb71kqOt
	W4pnfO15nHoSdU3JRQvIEZO3h3Uw4kjdJAdGU4J7779STAYFcXeZb6QdPGGo1qm3lLPsP/zqVd4
	wNr50XRqtew+eLuJBU6eSEoPJ2pHT/U=
X-Received: by 2002:a17:90a:da8c:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b1678cee19mr1766766a91.6.1794316609428;
        Tue, 10 Nov 2026 05:16:49 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:49 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 18/33] dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:18 -0800
Message-ID: <9195a9c6df38ec4e883db2aa271c8c178af98d3d.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/xgene-dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 3714099aef07..a10db8623f46 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -260,7 +260,6 @@ struct xgene_dma_desc_sw {
  *	These descriptors have already had their cleanup actions run. They
  *	are waiting for the ACK bit to be set by the async tx API.
  * @desc_pool: descriptor pool for DMA operations
- * @tasklet: bottom half where all completed descriptors cleans
  * @tx_ring: transmit ring descriptor that we use to prepare actual
  *	descriptors for further executions
  * @rx_ring: receive ring descriptor that we use to get completed DMA
@@ -280,7 +279,6 @@ struct xgene_dma_chan {
 	struct list_head ld_running;
 	struct list_head ld_completed;
 	struct dma_pool *desc_pool;
-	struct tasklet_struct tasklet;
 	struct xgene_dma_ring tx_ring;
 	struct xgene_dma_ring rx_ring;
 };
@@ -975,9 +973,10 @@ static enum dma_status xgene_dma_tx_status(struct dma_chan *dchan,
 	return dma_cookie_status(dchan, cookie, txstate);
 }
 
-static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
+static void xgene_dma_tasklet_cb(struct dma_chan *c)
 {
-	struct xgene_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xgene_dma_chan *chan = container_of(c, struct xgene_dma_chan,
+						   dma_chan);
 
 	/* Run all cleanup for descriptors which have been completed */
 	xgene_dma_cleanup_descriptors(chan);
@@ -999,11 +998,11 @@ static irqreturn_t xgene_dma_chan_ring_isr(int irq, void *id)
 	disable_irq_nosync(chan->rx_irq);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Schedule the bottom half to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1539,7 +1538,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	INIT_LIST_HEAD(&chan->ld_pending);
 	INIT_LIST_HEAD(&chan->ld_running);
 	INIT_LIST_HEAD(&chan->ld_completed);
-	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
+	dmaengine_init_bh(&chan->dma_chan, xgene_dma_tasklet_cb);
 
 	chan->pending = 0;
 	chan->desc_pool = NULL;
@@ -1556,7 +1555,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	ret = dma_async_device_register(dma_dev);
 	if (ret) {
 		chan_err(chan, "Failed to register async device %d", ret);
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 
 		return ret;
 	}
@@ -1579,7 +1578,7 @@ static int xgene_dma_init_async(struct xgene_dma *pdma)
 		if (ret) {
 			for (j = 0; j < i; j++) {
 				dma_async_device_unregister(&pdma->dma_dev[j]);
-				tasklet_kill(&pdma->chan[j].tasklet);
+				dmaengine_kill_bh(&pdma->chan[j].dma_chan);
 			}
 
 			return ret;
@@ -1790,7 +1789,7 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
 		chan = &pdma->chan[i];
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 		xgene_dma_delete_chan_rings(chan);
 	}
 
-- 
2.43.0

