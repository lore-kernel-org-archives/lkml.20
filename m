Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03E3BFE40
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483563; cv=none; b=gZx2OxARzauUNtuGdmxMMOt4v7GbAnorp4HUF5j1+yEWDQM6Kr60IPZbhHN3AXGCbGcjlySuiH6Y9D2ZkGB4puNciKUOlmFcCUus1ANRVfue7HeZCjhEFxQfBViJaQJMJRcy+9a81z1YuC5iBXY/oeGuoe9fWU7cQpD25+GIaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483563; c=relaxed/simple;
	bh=LfQczfSOlNVr7O3rPa84GzcjWAB8NrDYExnapeFvecI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a+ytyPzMtutaDO3NoxDsIRG+C378GMF05xqzKzy95b8+yjTEnyiR9ibIZp/XtRxmbaVGQV9tjUAiihtmrrdFZ72lr4HgRx9GEZ9f+DPPEECB30ZO2jI2qfkCbFXORiAlNfnAOwUeUBuzDI8ex6jIZFqa7bdG1BAF/cfoH7plLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=tIDlp0VP; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="tIDlp0VP"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ddceb527;
	Tue, 15 Sep 2026 22:45:46 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mtd: rawnand: r852: Prevent card work during removal
Date: Tue, 15 Sep 2026 22:45:43 +0800
Message-Id: <20260915144543.3466083-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0a587f7f503a1kunm35bf4d8e2df843
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ01OVklOQhlMGU9JTUweH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=tIDlp0VPgZQMucIua2E7MLzI6R6LiX+1z9YPWHvJ7a9waxd2T0Lv1dQ/rW8GarWFsyLaULnD/T61Vqt/uZoo8nWACQZEan/AWVCbW19rN1AFM+tTOP6+tYhZI9BDTHk7BpOXngKTFcKLIZ+dTF4k2RpVA3kl4kO2dDubvhK7XA8=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=BhOZe8NSRy2x4UKf+xHcg6ZlHNX3SVPP+kqzW3NooFQ=;
	h=date:mime-version:subject:message-id:from;

r852_irq() queues card_detect_work when card state changes.  r852_remove()
currently cancels that work and destroys its private workqueue before it
disables and frees the IRQ.

A card event in this interval can queue delayed work on the destroyed
workqueue.  Its timer is part of struct r852_device, which is freed later
in r852_remove().  KASAN reported a use-after-free in the timer code when
the card interrupt occurred in this interval.  The same test completed
without a kernel diagnostic after this change.

Set a removal flag while holding irqlock before cancelling the work.  The
IRQ handler still acknowledges and disables card events, but does not
queue more card-detect work during removal.  The lock ensures that work
queued before the flag is cancelled and later interrupts skip the queue.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 drivers/mtd/nand/raw/r852.c | 7 +++++++
 drivers/mtd/nand/raw/r852.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..6170a481cb1f 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -747,6 +747,9 @@ static irqreturn_t r852_irq(int irq, void *data)
 		/* this will timeout DMA if active, but better that garbage */
 		r852_disable_irqs(dev);
 
+		if (dev->removing)
+			goto out;
+
 		if (dev->card_unstable)
 			goto out;
 
@@ -977,6 +980,10 @@ static void r852_remove(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
 
+	spin_lock_irq(&dev->irqlock);
+	dev->removing = true;
+	spin_unlock_irq(&dev->irqlock);
+
 	/* Stop detect workqueue -
 		we are going to unregister the device anyway*/
 	cancel_delayed_work_sync(&dev->card_detect_work);
diff --git a/drivers/mtd/nand/raw/r852.h b/drivers/mtd/nand/raw/r852.h
index 96fe301d15da..5c931880c2f4 100644
--- a/drivers/mtd/nand/raw/r852.h
+++ b/drivers/mtd/nand/raw/r852.h
@@ -131,6 +131,7 @@ struct r852_device {
 	int card_detected;		/* card detected in slot */
 	int card_unstable;		/* whenever the card is inserted,
 					   is not known yet */
+	bool removing;			/* do not queue card work during removal */
 	int readonly;			/* card is readonly */
 	int sm;				/* Is card smartmedia */
 
-- 
2.39.5

