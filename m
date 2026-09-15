Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF3D4A260F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483555; cv=none; b=Se+4c4xzPAQCknlO8zR1Nm2qWd8hfZCVX/o9xpkuDGsAE6iRd0JmPmHfrOmJMMHrchLJ6w9QMapPjcrPbCuK1/omwnx4RCroiEPp6SyA5O6gAEcEpyuxtZc+mQlO5JptzNbiHy+QXKfH0ZXMYR3s+5SFp4Oy+NWEzHVVWP2hB/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483555; c=relaxed/simple;
	bh=kYTcyzTRwlmuMU/1A5rHIqEzkbjIP+QlKGRK9SektvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bdri6jQJzQEYQD2uV/6sk+L5kb+39NV4zI3RjqGFl8/AloE053g1rQufn/8M7MV31e8BR31ZY7xL0WYTDepithMGC2jZY4isI+OQ25BQnn+J49F4tfxRxkRIs3inxE+P/kQLNqz+XHNd2RicAEmA3MEiCvgTbGJqc2zLDZYG8zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=D8j/1ttJ; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="D8j/1ttJ"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ddceb524;
	Tue, 15 Sep 2026 22:45:40 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Andy Gospodarek <gospo@broadcom.com>,
	Rob Rice <rob.rice@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mailbox: bcm-pdc: Free the IRQ before cancelling receive work
Date: Tue, 15 Sep 2026 22:45:38 +0800
Message-Id: <20260915144538.3465774-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0a587dfdf03a1kunm21cdcc192df834
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhpMVklCTEhCGUIZTxoeQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=D8j/1ttJtdIDTwE8MDV6qv7sR923nDd2XpkLTs5YN/XC7nRDxVNc4+6EupOOOhNs0vBiJwbvoZLsrPQxY0ziYzCpahyjsGwnD79CncrSq+o0MMyjPc6wCe0P7E3KXg6WBmnjcMfYiNMxNjRE5skTgwGt9kDqo2Fe2cHfwM+LNoQ=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=gwqHhtCYf7MptE2q7bgzsad2NEtMBHqMNxa0IkSfrNY=;
	h=date:mime-version:subject:message-id:from;

pdc_irq_handler() queues rx_work to process received data.  Because the
driver requests a managed IRQ, the handler remains registered until
after probe or remove returns unless the driver frees it explicitly.

The pdc_mb_init() error path and pdc_remove() currently cancel the work
while the IRQ handler is still registered.  A later interrupt can queue
the work again.  Cleanup then destroys the DMA pools and frees struct
pdc_state, so pdc_work_cb() can access freed memory and registers.

KASAN reported an invalid access in pdc_work_cb() when an interrupt
queued the work during removal.  After this change, removal waited for
the work to finish and the same test completed without a kernel
diagnostic.

Add pdc_stop() to disable the hardware, free the managed IRQ and wait for
rx_work.  Call it in both paths before destroying either DMA pool.

Fixes: 8aef00f090bc ("mailbox: bcm-pdc: Convert from threaded IRQ to tasklet")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 drivers/mailbox/bcm-pdc-mailbox.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-mailbox.c
index 6fcc4002ad4f..aea2e5273bf0 100644
--- a/drivers/mailbox/bcm-pdc-mailbox.c
+++ b/drivers/mailbox/bcm-pdc-mailbox.c
@@ -1335,6 +1335,15 @@ static void pdc_hw_disable(struct pdc_state *pdcs)
 		  &dma_reg->dmarcv.control);
 }
 
+static void pdc_stop(struct pdc_state *pdcs)
+{
+	struct device *dev = &pdcs->pdev->dev;
+
+	pdc_hw_disable(pdcs);
+	devm_free_irq(dev, pdcs->pdc_irq, dev);
+	cancel_work_sync(&pdcs->rx_work);
+}
+
 /**
  * pdc_rx_buf_pool_create() - Pool of receive buffers used to catch the metadata
  * header returned with each response message.
@@ -1581,15 +1590,16 @@ static int pdc_probe(struct platform_device *pdev)
 	/* Initialize mailbox controller */
 	err = pdc_mb_init(pdcs);
 	if (err)
-		goto cleanup_buf_pool;
+		goto cleanup_irq;
 
 	pdc_setup_debugfs(pdcs);
 
 	dev_dbg(dev, "pdc_probe() successful");
 	return PDC_SUCCESS;
 
+cleanup_irq:
+	pdc_stop(pdcs);
 cleanup_buf_pool:
-	cancel_work_sync(&pdcs->rx_work);
 	dma_pool_destroy(pdcs->rx_buf_pool);
 
 cleanup_ring_pool:
@@ -1605,9 +1615,7 @@ static void pdc_remove(struct platform_device *pdev)
 
 	pdc_free_debugfs();
 
-	cancel_work_sync(&pdcs->rx_work);
-
-	pdc_hw_disable(pdcs);
+	pdc_stop(pdcs);
 
 	dma_pool_destroy(pdcs->rx_buf_pool);
 	dma_pool_destroy(pdcs->ring_pool);
-- 
2.39.5

