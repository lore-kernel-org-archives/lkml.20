Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5583F4DC5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176328; cv=none; b=WfzS7OTPkBCwQiI0fl+40bszINV7ni5unbf3mI0dk59UXlb0XyUONWp6v0yiPrro8+tpmllQU8eMigvvzS2mueMaAQoa3vjWW4j3OvLjd+OX2z2P1838YNK+DorenISKD1VVumXjQqhCNvkTQmbaI9aegccHGrdtWoUqOFwHhvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176328; c=relaxed/simple;
	bh=Tz+k3ne/kB51P7Czgm9pe3f0ZMF20JJimKgMhl8hJhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8bBikH4G3mmhhZRgS+bSJ7zYPdfYSSBAe9AS2xGwxA+lEELAx4M6FXi5OQUgXm1jTZeVJd+Mu455aMLZNTeNAGVAI/IX1gAmDnCfmzZ9LrE3r1Hz944XRaOP5PrN0KX8nG+HRrB+AbaAjkYyDRZpr7C8/nUrGUW4e5Gx4oN3n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHsOyikh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHsOyikh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176326; x=1819712326;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Tz+k3ne/kB51P7Czgm9pe3f0ZMF20JJimKgMhl8hJhg=;
  b=MHsOyikhhJhbAt3ZSM/FCr6c2hxQTGsCW8MF/GIuYDHRjM6M6rwHyfet
   6T5IzzvtHNePeN4et2Rp9OO/aKmefhI/kxmwfnOwxNnylZoPosdguA979
   3FkqPWvhAXpSFkILUEwtwoI8NDJuA/Qhwe5vk+gpDxJhosdpDhNmUx47c
   eqsFyKQMco3skNt0QtYzerODuXAJaGyty1dSJYR2JPO6Qqm8jUEqJsThP
   mHjZHqMXF5ngEg58+qNPDTFz7I9ZQZHIhxkAoo8qvVBT1poVcgLvvUnFA
   jwTJ8m21ImF6x77Stfyv0nuBxKgr7E33jUTLwEXXn96g7y20WFKp2pieV
   A==;
X-CSE-ConnectionGUID: hbxxu1xOQ1Wij8sHGSsy4g==
X-CSE-MsgGUID: LcqLsomsTPyARoC7pJl20w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="76129331"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="76129331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:46 -0700
X-CSE-ConnectionGUID: o7N+LDchRFeaPCF4CKMqHQ==
X-CSE-MsgGUID: 2jrTmbfhT9CeMFXxyHxNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262645114"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:45 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Mon, 31 Aug 2026 14:38:33 +0300
Subject: [PATCH char-misc-next 3/4] mei: me: avoid hw access in polling
 when not active
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-cri_polling-v1-3-d927315e6598@intel.com>
References: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
In-Reply-To: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Menachem Adin <menachem.adin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788176320; l=5493;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=Tz+k3ne/kB51P7Czgm9pe3f0ZMF20JJimKgMhl8hJhg=;
 b=mjB85NcrJqjiblt4v/r9jWIXm40wM28xnph6vsGu8gSL8poSzDWnS1pjS4T65tGKb0OuRRg/z
 K2PGEVYh+8rCROJJh9/vCgS/3U4rMQfex5a9qLlhldUQ0+p1PW44hML
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Polling thread should not access hardware when not active.
Check for active state under device lock to avoid such
access when hardware is powered down.

Reviewed-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hw-me.c | 99 +++++++++++++++++++++++++++++-------------------
 1 file changed, 59 insertions(+), 40 deletions(-)

diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index ef7e1289ad7e..f3d833be0e1a 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/kthread.h>
@@ -1290,28 +1291,15 @@ irqreturn_t mei_me_irq_quick_handler(int irq, void *dev_id)
 }
 EXPORT_SYMBOL_GPL(mei_me_irq_quick_handler);
 
-/**
- * mei_me_irq_thread_handler - function called after ISR to handle the interrupt
- * processing.
- *
- * @irq: The irq number
- * @dev_id: pointer to the device structure
- *
- * Return: irqreturn_t
- *
- */
-irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id)
+static irqreturn_t __mei_me_irq_thread_handler(struct mei_device *dev)
 {
-	struct mei_device *dev = (struct mei_device *) dev_id;
 	struct list_head cmpl_list;
 	bool pg_blocked;
 	s32 slots;
 	u32 hcsr;
 	int rets = 0;
 
-	dev_dbg(&dev->dev, "function called after ISR to handle the interrupt processing.\n");
 	/* initialize our complete list */
-	mutex_lock(&dev->device_lock);
 
 	hcsr = mei_hcsr_read(dev);
 	me_intr_clear(dev, hcsr);
@@ -1406,13 +1394,33 @@ irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id)
 end:
 	dev_dbg(&dev->dev, "interrupt thread end ret = %d\n", rets);
 	mei_me_intr_enable(dev);
-	mutex_unlock(&dev->device_lock);
 	return IRQ_HANDLED;
 }
+
+/**
+ * mei_me_irq_thread_handler - function called after ISR to handle the interrupt
+ * processing.
+ *
+ * @irq: The irq number
+ * @dev_id: pointer to the device structure
+ *
+ * Return: irqreturn_t
+ *
+ */
+irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id)
+{
+	struct mei_device *dev = (struct mei_device *) dev_id;
+
+	dev_dbg(&dev->dev, "function called after ISR to handle the interrupt processing.\n");
+
+	guard(mutex)(&dev->device_lock);
+
+	return __mei_me_irq_thread_handler(dev);
+}
 EXPORT_SYMBOL_GPL(mei_me_irq_thread_handler);
 
-#define MEI_POLLING_TIMEOUT_ACTIVE 100
-#define MEI_POLLING_TIMEOUT_IDLE   500
+#define MEI_POLL_ACTIVE_MS 100
+#define MEI_POLL_IDLE_MS   500
 
 /**
  * mei_me_polling_thread - interrupt register polling thread
@@ -1420,48 +1428,59 @@ EXPORT_SYMBOL_GPL(mei_me_irq_thread_handler);
  * @_dev: mei device
  *
  * The thread monitors the interrupt source register and calls
- * mei_me_irq_thread_handler() to handle the firmware
+ * __mei_me_irq_thread_handler() to handle the firmware
  * input.
  *
- * The function polls in MEI_POLLING_TIMEOUT_ACTIVE timeout
+ * The function polls in MEI_POLL_ACTIVE_MS timeout
  * in case there was an event, in idle case the polling
- * time increases yet again by MEI_POLLING_TIMEOUT_ACTIVE
- * up to MEI_POLLING_TIMEOUT_IDLE.
+ * time increases yet again by MEI_POLL_ACTIVE_MS
+ * up to MEI_POLL_IDLE_MS.
  *
  * Return: always 0
  */
 int mei_me_polling_thread(void *_dev)
 {
 	struct mei_device *dev = _dev;
-	irqreturn_t irq_ret;
-	long polling_timeout = MEI_POLLING_TIMEOUT_ACTIVE;
+	long polling_timeout = MEI_POLL_ACTIVE_MS;
+	bool have_interrupt;
 
 	dev_dbg(&dev->dev, "kernel thread is running\n");
 	while (!kthread_should_stop()) {
 		struct mei_me_hw *hw = to_me_hw(dev);
 		u32 hcsr;
 
-		wait_event_interruptible_timeout(hw->wait_active,
-						 hw->is_active || kthread_should_stop(),
-						 msecs_to_jiffies(MEI_POLLING_TIMEOUT_IDLE));
+		if (!hw->is_active)
+			wait_event_interruptible(hw->wait_active,
+						 hw->is_active || kthread_should_stop());
+		else
+			wait_event_interruptible_timeout(hw->wait_active,
+							 hw->is_active || kthread_should_stop(),
+							 msecs_to_jiffies(MEI_POLL_IDLE_MS));
 
 		if (kthread_should_stop())
 			break;
 
-		hcsr = mei_hcsr_read(dev);
-		if (me_intr_src(hcsr)) {
-			polling_timeout = MEI_POLLING_TIMEOUT_ACTIVE;
-			irq_ret = mei_me_irq_thread_handler(1, dev);
-			if (irq_ret != IRQ_HANDLED)
-				dev_err(&dev->dev, "irq_ret %d\n", irq_ret);
-		} else {
-			/*
-			 * Increase timeout by MEI_POLLING_TIMEOUT_ACTIVE
-			 * up to MEI_POLLING_TIMEOUT_IDLE
-			 */
-			polling_timeout = clamp_val(polling_timeout + MEI_POLLING_TIMEOUT_ACTIVE,
-						    MEI_POLLING_TIMEOUT_ACTIVE,
-						    MEI_POLLING_TIMEOUT_IDLE);
+		scoped_guard(mutex, &dev->device_lock) {
+			if (!hw->is_active) {
+				have_interrupt = false;
+			} else {
+				hcsr = mei_hcsr_read(dev);
+				have_interrupt = !!me_intr_src(hcsr);
+			}
+
+			if (have_interrupt) {
+				polling_timeout = MEI_POLL_ACTIVE_MS;
+				dev_dbg(&dev->dev, "polling interrupt processing\n");
+				__mei_me_irq_thread_handler(dev);
+			} else {
+				/*
+				 * Increase timeout by MEI_POLL_ACTIVE_MS
+				 * up to MEI_POLL_IDLE_MS
+				 */
+				polling_timeout = clamp_val(polling_timeout + MEI_POLL_ACTIVE_MS,
+							    MEI_POLL_ACTIVE_MS,
+							    MEI_POLL_IDLE_MS);
+			}
 		}
 
 		schedule_timeout_interruptible(msecs_to_jiffies(polling_timeout));

-- 
2.53.0

