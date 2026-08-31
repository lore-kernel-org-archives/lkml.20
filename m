Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43063F39EE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176326; cv=none; b=TASVN0sSBrpBqS338+ZuxGIeasptpybO5KZAJhtQwYkRlLf6rOBZyDDENM3mCdtZX/hhgW7X167+0ggFlklIaK7oC+G3POJHV1umlGGqAdiTfiaWkNrJdn/WQUTWTDLZU6yKrj6TsbDqfCSso5xbSXyL0EUEqBKcpNHoC+rRm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176326; c=relaxed/simple;
	bh=G2wkGOHoI0v2yjNnkkXd5xcOv4EsesC6pU3GWngMgNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XH33v9vNOI0xIfeyYM8audheshvd5uDFjgos3uGYE3na9v09M22RGDpfAk+7ZpC2gmpRq8VrJc1UnyUFXhS+p9jlMCkkJtVAyWuo/7LYlBUmAiTkeej3gZjvr5smNZlUgo3l+zPkBJs88v/IxmQD8BFilqeua2tRPGXBqy+D7I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwFGXqWj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwFGXqWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176325; x=1819712325;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=G2wkGOHoI0v2yjNnkkXd5xcOv4EsesC6pU3GWngMgNQ=;
  b=RwFGXqWj4OyxE/nhLL24Mn9LiqZgLNJSbYfe+/WegAcvxlqWu0Ia08Yd
   cwmRjQy/GAsGz7GuyYKlQWLhWZ+1FfE3W9q+VH/J9dZZjWhJ4b1/TvRDA
   gYLiS8JbBltWfO4bo1/prgHhd6LOJnkK7Abr3Qtd7/PMjycS76iO22iuU
   dMrAysZciA7CxIqEjhuGniY2w/RMHomihy42/h9S8RAK7VoWv70lVjK65
   jJDit90ceuCWklg8UYy3yWcpBodmCPS1vfgnLDVRnfVfhVfucmFu3J4Fm
   22us7UXpkD5Hu2NsuAyg8N0UwKdW2hM+iMDXK/q9fk3vl/OGxmWA/O+vw
   Q==;
X-CSE-ConnectionGUID: 2clFmcEjSe22ps+Oi20Kug==
X-CSE-MsgGUID: mfEToKmYRjuc0dgLz4T2Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="76129328"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="76129328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:44 -0700
X-CSE-ConnectionGUID: KuzqMe6cSmuTIfjlhiXH2w==
X-CSE-MsgGUID: sfOAddfkSw29DUwnij687w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262645109"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:43 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Mon, 31 Aug 2026 14:38:32 +0300
Subject: [PATCH char-misc-next 2/4] mei: csc: add option for polling and
 enable it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-cri_polling-v1-2-d927315e6598@intel.com>
References: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
In-Reply-To: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Menachem Adin <menachem.adin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788176320; l=4439;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=G2wkGOHoI0v2yjNnkkXd5xcOv4EsesC6pU3GWngMgNQ=;
 b=eS/DlOklX26covREgrskhc+4UfKyb6FVznXt6ioU5c+3jCUHLjeq2asVVT4LnGvnli00Ajc1p
 M2QTf+G5FD6AVQhC0QOHQ0X+Nbnipmbp0WaWM9WXnow4KNco3GQI7VY
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add option to poll instead of waiting for the interrupt
to wallpaper over hardware not releasing the interrupt line.

Enable this workaround and leave option to use interrupts when
hardware is fixed.

Reviewed-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/pci-csc.c | 71 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/mei/pci-csc.c b/drivers/misc/mei/pci-csc.c
index 6e1e8008f267..f50ef93e27dc 100644
--- a/drivers/misc/mei/pci-csc.c
+++ b/drivers/misc/mei/pci-csc.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
+#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
@@ -26,6 +27,10 @@
 
 #define MEI_CSC_HECI2_OFFSET 0x1000
 
+static bool use_polling = true;
+module_param(use_polling, bool, 0600);
+MODULE_PARM_DESC(use_polling, "Use polling instead of interrupts");
+
 static int mei_csc_read_fws(const struct mei_device *mdev, int where, const char *name, u32 *val)
 {
 	struct mei_me_hw *hw = to_me_hw(mdev);
@@ -87,20 +92,40 @@ static int mei_csc_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pdev, mdev);
 
-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_INTX | PCI_IRQ_MSI);
-	if (err < 0) {
-		dev_err_probe(dev, err, "Failed to allocate IRQ.\n");
-		goto err_mei_unreg;
+	if (use_polling) {
+		dev_dbg(dev, "Using polling thread\n");
+		hw->irq = -1;
 	}
 
-	hw->irq = pci_irq_vector(pdev, 0);
-
-	/* request and enable interrupt */
-	err = request_threaded_irq(hw->irq,
-				   mei_me_irq_quick_handler, mei_me_irq_thread_handler,
-				   IRQF_SHARED | IRQF_ONESHOT, KBUILD_MODNAME, mdev);
-	if (err)
-		goto err_free_irq_vectors;
+	/* use polling */
+	if (mei_me_hw_use_polling(hw)) {
+		mei_disable_interrupts(mdev);
+		mei_clear_interrupts(mdev);
+		init_waitqueue_head(&hw->wait_active);
+		hw->is_active = true; /* start in active mode for initialization */
+		hw->polling_thread = kthread_run(mei_me_polling_thread, mdev,
+						 "kmecscirqd/%s", dev_name(dev));
+		if (IS_ERR(hw->polling_thread)) {
+			err = PTR_ERR(hw->polling_thread);
+			dev_err_probe(dev, err, "unable to create kernel thread.\n");
+			goto err_mei_unreg;
+		}
+	} else {
+		err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_INTX | PCI_IRQ_MSI);
+		if (err < 0) {
+			dev_err_probe(dev, err, "Failed to allocate IRQ.\n");
+			goto err_mei_unreg;
+		}
+
+		hw->irq = pci_irq_vector(pdev, 0);
+
+		/* request and enable interrupt */
+		err = request_threaded_irq(hw->irq,
+					   mei_me_irq_quick_handler, mei_me_irq_thread_handler,
+					   IRQF_SHARED | IRQF_ONESHOT, KBUILD_MODNAME, mdev);
+		if (err)
+			goto err_free_irq_vectors;
+	}
 
 	/*
 	 * Continue to char device setup in spite of firmware handshake failure.
@@ -126,7 +151,8 @@ static int mei_csc_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return 0;
 
 err_free_irq_vectors:
-	pci_free_irq_vectors(pdev);
+	if (!mei_me_hw_use_polling(hw))
+		pci_free_irq_vectors(pdev);
 err_mei_unreg:
 	mei_deregister(mdev);
 	return err;
@@ -141,9 +167,14 @@ static void mei_csc_shutdown(struct pci_dev *pdev)
 
 	mei_stop(mdev);
 
+	if (mei_me_hw_use_polling(hw))
+		kthread_stop(hw->polling_thread);
+
 	mei_disable_interrupts(mdev);
-	free_irq(hw->irq, mdev);
-	pci_free_irq_vectors(pdev);
+	if (!mei_me_hw_use_polling(hw)) {
+		free_irq(hw->irq, mdev);
+		pci_free_irq_vectors(pdev);
+	}
 }
 
 static void mei_csc_remove(struct pci_dev *pdev)
@@ -210,6 +241,9 @@ static int mei_csc_pm_runtime_suspend(struct device *dev)
 		return -EAGAIN;
 
 	hw->pg_state = MEI_PG_ON;
+	if (mei_me_hw_use_polling(hw))
+		hw->is_active = false;
+
 	return 0;
 }
 
@@ -219,8 +253,13 @@ static int mei_csc_pm_runtime_resume(struct device *dev)
 	struct mei_me_hw *hw = to_me_hw(mdev);
 	irqreturn_t irq_ret;
 
-	scoped_guard(mutex, &mdev->device_lock)
+	scoped_guard(mutex, &mdev->device_lock) {
 		hw->pg_state = MEI_PG_OFF;
+		if (mei_me_hw_use_polling(hw)) {
+			hw->is_active = true;
+			wake_up_interruptible(&hw->wait_active);
+		}
+	}
 
 	/* Process all queues that wait for resume */
 	irq_ret = mei_me_irq_thread_handler(1, mdev);

-- 
2.53.0

