Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793BF4CA769;
	Mon, 28 Sep 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602878; cv=none; b=rCVB1tVusu9EI4Q8p4O7rrJ4wncrp80Y1eWpA85rP1nCEctWF24SBLh5smq+s39IKuyHUp/ujviO1TVcwHREyjRrwRGsszrrPO+EBGsBvr5dOZX8gjlvRHKZJfVXWlmzthQC6vak2w7fEQEmFcEwIJYqJzPHCNY0V6eilrqIGC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602878; c=relaxed/simple;
	bh=lGtll8x3pPIrHBaAshsePQ7EII5sNvyrdOo47W3b6zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+S9q3InlYYRaE34y2I29OWxXoJJl8tiDYgvHFh9mOoVNWgez8aC5iavbs+ZM0Hxk/9q/8wvmTWwFCsDgucuZ4L+l2pH4kdZ1h7Yr8Xpeg9VnXGodpCstJErAWx5HFjIdhaFjWuCv+5s4S2AEw4je2i2mT+/aYMJPeQg3N4eYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=NvaGw0NV; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="NvaGw0NV"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.109])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5d6f426;
	Mon, 28 Sep 2026 21:41:08 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	1742789905@qq.com,
	u.kleine-koenig@baylibre.com,
	lgs201920130244@gmail.com,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] media: saa7164: drain IRQ work before freeing the device
Date: Mon, 28 Sep 2026 21:41:06 +0800
Message-ID: <20260928134106.1930-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e83f723c03a1kunm6233be7b200186
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTk9DVkxPTh5JTx9ITE9JGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VSktCWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0
	hMVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=NvaGw0NVRSg0yMLl2e2mRb1gX9EluBNIZ4LJQ/ShdmWGyLMO3LnEwDKLqYLufU/qNMnkW2acRd/Ynzzn27tDXlMJe4GoAlDME2WcaoVY9Ae5InhgwTmuHcGMnDU88HjC/fBFL852TOFE3b6M8/c1sp6w8MlwpKortobfJWrj6Kg=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=nWYhRb8xuGWyBONLpS3h14grfn/VcE4Qzh2fMSlOQRo=;
	h=date:mime-version:subject:message-id:from;

The saa7164 interrupt handler queues command, encoder, and VBI work
embedded in the device and port objects. free_irq() waits for active
interrupt handlers, but it does not cancel work they queued. Teardown
can therefore free those objects while a worker still references them.

Free the interrupt after shutting down the hardware, then cancel each
work item that was initialized for the board before unregistering the
ports.

Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/media/pci/saa7164/saa7164-core.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index ac5eb6b923e2..157f380f0df9 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1492,6 +1492,20 @@ static void saa7164_finidev(struct pci_dev *pci_dev)
 		&dev->ports[SAA7164_PORT_VBI2].poll_interval);
 
 	saa7164_shutdown(dev);
+	free_irq(pci_dev->irq, dev);
+	cancel_work_sync(&dev->workcmd);
+
+	if (saa7164_boards[dev->board].portc == SAA7164_MPEG_ENCODER)
+		cancel_work_sync(&dev->ports[SAA7164_PORT_ENC1].workenc);
+
+	if (saa7164_boards[dev->board].portd == SAA7164_MPEG_ENCODER)
+		cancel_work_sync(&dev->ports[SAA7164_PORT_ENC2].workenc);
+
+	if (saa7164_boards[dev->board].porte == SAA7164_MPEG_VBI)
+		cancel_work_sync(&dev->ports[SAA7164_PORT_VBI1].workenc);
+
+	if (saa7164_boards[dev->board].portf == SAA7164_MPEG_VBI)
+		cancel_work_sync(&dev->ports[SAA7164_PORT_VBI2].workenc);
 
 	if (saa7164_boards[dev->board].porta == SAA7164_MPEG_DVB)
 		saa7164_dvb_unregister(&dev->ports[SAA7164_PORT_TS1]);
@@ -1515,9 +1529,6 @@ static void saa7164_finidev(struct pci_dev *pci_dev)
 	saa7164_i2c_unregister(&dev->i2c_bus[1]);
 	saa7164_i2c_unregister(&dev->i2c_bus[2]);
 
-	/* unregister stuff */
-	free_irq(pci_dev->irq, dev);
-
 	if (dev->msi) {
 		pci_disable_msi(pci_dev);
 		dev->msi = false;
-- 
2.50.1.windows.1

