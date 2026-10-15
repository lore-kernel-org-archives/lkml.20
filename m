Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5D3E92BD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042143; cv=none; b=gyrQsIynGtKHCmEMqnjRoweViqU7RK0DdQjD9zGO9xWIvTvV+EcYKqQ8MpCI8tHbvNs3r9pfzIzCb8FLoNk9Cvtwm1gTIdum0iaat9OocSmeUqurcgeqWuFqlXJEbJwNaWS4J9v29DKsAHDuia1o4n5bYssR/KgwBLy5WbdJF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042143; c=relaxed/simple;
	bh=TjACt8rjqB8NxyUqd9a5H3W7kowL3YKTLT0cwjedGKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kCRmFz3mAdh9IWBceuLmC2Iln/49zSFdJTucVQIwny5wPf57KNKhP/G1fJvbT+VkisoMUZgBprps/pplulSRoYraDvwNgWQgE36nxRLD6//EF7iAKciZhk8UMny+WK+Sg50OMWUL2nBgtqByHrA3wMi55fwb6nSfD8FccCWQLFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRgncKrt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRgncKrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792042141; x=1823578141;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=TjACt8rjqB8NxyUqd9a5H3W7kowL3YKTLT0cwjedGKU=;
  b=SRgncKrtYqjW46WTfNZhDafexFQ71hB/XuRbxqhUmriTDM8Ikl8e46kz
   emiEFp4IgovvPBZIcKGK1VeRRWy9ZOnG13byviwzKtCGvXMr1parZIj8A
   v/qwHYqU7A0U5sBjftDJ6D0UxZLbIIaB8/WTLzqlY45kqL9JZ6jgne328
   D6zQ1f1C6bWf9p/2LAA8IXDVrHXv0rRUyxAuZnmRxhH6eRPNjRJVy1I/2
   t6pOKCfTik8gWpyrHajnMLtnLfn1vEAglYmHteYeZX5npOfHGYLJIksPk
   sppbya3TdhUwYz+gYYFgqtFIuqhtHW1JwDzZXB0BqUeSnLu3l8zNHMWVt
   A==;
X-CSE-ConnectionGUID: 5ZT6EPl9T1uJQbPYQw0a1g==
X-CSE-MsgGUID: atUA+hIIS9ac993pyH9Q3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="813101"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="813101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:29:01 -0700
X-CSE-ConnectionGUID: 7o/mSPaoTQ2Bzmi1LgZJHQ==
X-CSE-MsgGUID: Q0TFBVGGRWmY35GwR7TZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1928843"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:29:00 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 15 Oct 2026 08:28:42 +0300
Subject: [PATCH char-misc-next 2/4] issei: add runtime pm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-issei_pm_and_itf-v1-2-8212238a57a4@intel.com>
References: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
In-Reply-To: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792042134; l=12792;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=TjACt8rjqB8NxyUqd9a5H3W7kowL3YKTLT0cwjedGKU=;
 b=9E5SNvAlntIhvcVCJBdW9cZuXMCbhPCIcxkKb1247F0xx14OdmJZkKdDWxn/lXqYKvVkGFhwc
 qDQyPUdhs2hDMlFNgzEWikEGYkW21k49NKLdPJWvAQqbTCHiSElE0gi
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add support for runtime power management.
ISSE communication is based on send-receive transaction.
Allow autosuspend with 60 seconds grace as firmware required
to answer inside this timeframe.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/issei/host_client.c |   4 +
 drivers/misc/issei/hw_heci.c     |  21 +++-
 drivers/misc/issei/main.c        | 229 +++++++++++++++++++++------------------
 drivers/misc/issei/pci_heci.c    |  21 ++++
 4 files changed, 168 insertions(+), 107 deletions(-)

diff --git a/drivers/misc/issei/host_client.c b/drivers/misc/issei/host_client.c
index 8f36d1c319ec..d16b5835c619 100644
--- a/drivers/misc/issei/host_client.c
+++ b/drivers/misc/issei/host_client.c
@@ -7,6 +7,7 @@
 #include <linux/kobject.h>
 #include <linux/list.h>
 #include <linux/overflow.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -73,6 +74,7 @@ static void __issei_cl_clean_all_wbuf(struct issei_device *idev, struct issei_ho
 		}
 	}
 	cl->write_in_progress = false;
+	pm_runtime_put_autosuspend(idev->parent);
 	/* synchronized under host client mutex */
 	if (waitqueue_active(&cl->write_wait))
 		wake_up_interruptible(&cl->write_wait);
@@ -309,6 +311,7 @@ ssize_t issei_cl_write(struct issei_host_client *cl, const u8 *buf, size_t buf_s
 	list_add_tail(&wbuf->list, &idev->write_queue);
 	cl->write_in_progress = true;
 	cl_dbg(idev, cl, "Write queued %zu bytes\n", buf_size);
+	pm_runtime_get(idev->parent);
 
 	issei_poke_process_thread(idev);
 
@@ -353,6 +356,7 @@ int issei_cl_write_from_queue(struct issei_device *idev)
 	if (ret >= 0)
 		idev->ops->irq_write_generate(idev);
 	cl->write_in_progress = false;
+	pm_runtime_put_autosuspend(idev->parent);
 	/* synchronized under host client mutex */
 	if (waitqueue_active(&cl->write_wait))
 		wake_up_interruptible(&cl->write_wait);
diff --git a/drivers/misc/issei/hw_heci.c b/drivers/misc/issei/hw_heci.c
index 501774aa95ff..1e39b285d4db 100644
--- a/drivers/misc/issei/hw_heci.c
+++ b/drivers/misc/issei/hw_heci.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/sizes.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -501,12 +502,20 @@ irqreturn_t issei_heci_irq_quick_handler(int irq, void *dev_id)
 {
 	struct issei_device *idev = dev_id;
 	struct issei_heci_hw *hw = to_heci_hw(idev);
+	irqreturn_t ret;
+	int active;
 	u32 reg;
 
-	reg = heci_hcsr_read(idev);
-	if (!heci_irq_src(reg))
+	active = pm_runtime_get_if_active(idev->parent);
+	if (!active)
 		return IRQ_NONE;
 
+	reg = heci_hcsr_read(idev);
+	if (!heci_irq_src(reg)) {
+		ret = IRQ_NONE;
+		goto out;
+	}
+
 	scoped_guard(spinlock_irqsave, &hw->access_lock) {
 		reg = heci_hcsr_read(idev);
 		heci_irq_clear(idev, reg);
@@ -519,7 +528,13 @@ irqreturn_t issei_heci_irq_quick_handler(int irq, void *dev_id)
 
 	issei_poke_process_thread(idev);
 
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out:
+	if (active > 0)
+		pm_runtime_put_autosuspend(idev->parent);
+
+	return ret;
 }
 
 static const struct hw_heci_cfg hw_heci_pch_cfg = {
diff --git a/drivers/misc/issei/main.c b/drivers/misc/issei/main.c
index 8aaf2d47392b..c0b8606b17b3 100644
--- a/drivers/misc/issei/main.c
+++ b/drivers/misc/issei/main.c
@@ -7,6 +7,7 @@
 #include <linux/export.h>
 #include <linux/jiffies.h>
 #include <linux/kthread.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 
@@ -83,132 +84,152 @@ static int issei_process_write_msg(struct issei_device *idev)
 	return issei_cl_write_from_queue(idev);
 }
 
-static int issei_process_thread(void *_dev)
+static bool issei_process_thread_worker(struct issei_device *idev, bool power_down,
+					long *timeout, long *old_timeout)
 {
-	long timeout, old_timeout = MAX_SCHEDULE_TIMEOUT;
-	struct issei_device *idev = _dev;
-	bool power_down;
 	int ret;
 
-	while (!kthread_should_stop()) {
-		dev_dbg(&idev->dev, "process_work in %d\n", idev->rst_state);
-		WRITE_ONCE(idev->has_data, false);
-		power_down = idev->power_down; /* to save state */
-		if (!idev->ops->hw_is_ready(idev) && idev->rst_state > ISSEI_RST_STATE_HW_READY) {
-			if (!power_down)
-				dev_dbg(&idev->dev, "HW not ready, resetting\n");
-			idev->rst_state = ISSEI_RST_STATE_INIT;
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(idev->parent, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret) {
+		dev_err(&idev->dev, "Failed to acquire pm %d\n", ret);
+		idev->rst_state = ISSEI_RST_STATE_INIT;
+		return false;
+	}
+
+	if (!idev->ops->hw_is_ready(idev) && idev->rst_state > ISSEI_RST_STATE_HW_READY) {
+		if (!power_down)
+			dev_dbg(&idev->dev, "HW not ready, resetting\n");
+		idev->rst_state = ISSEI_RST_STATE_INIT;
+	}
+	if (power_down)
+		idev->rst_state = ISSEI_RST_STATE_INIT;
+	dev_dbg(&idev->dev, "reset_step in %d\n", idev->rst_state);
+	*timeout = MAX_SCHEDULE_TIMEOUT;
+	ret = 0;
+	switch (idev->rst_state) {
+	case ISSEI_RST_STATE_DISABLED:
+		if (power_down) {
+			dev_dbg(&idev->dev, "Interrupt in power down?\n");
+			break;
 		}
-		if (power_down)
-			idev->rst_state = ISSEI_RST_STATE_INIT;
-		dev_dbg(&idev->dev, "reset_step in %d\n", idev->rst_state);
-		timeout = MAX_SCHEDULE_TIMEOUT;
-		ret = 0;
-		switch (idev->rst_state) {
-		case ISSEI_RST_STATE_DISABLED:
-			if (power_down) {
-				dev_dbg(&idev->dev, "Interrupt in power down?\n");
+		idev->rst_state = ISSEI_RST_STATE_INIT;
+		idev->reset_count = 0;
+		fallthrough;
+
+	case ISSEI_RST_STATE_INIT:
+		idev->ops->irq_clear(idev);
+		idev->ops->irq_sync(idev);
+
+		if (!power_down) {
+			if (!idev->reset_count)
+				pm_runtime_get_noresume(idev->parent);
+			idev->reset_count++;
+			if (idev->reset_count > ISSEI_MAX_CONSEC_RESET) {
+				dev_err(&idev->dev, "reset: reached maximal consecutive resets: disabling the device\n");
+				issei_rst_state_set(idev, ISSEI_RST_STATE_DISABLED);
+				pm_runtime_put_noidle(idev->parent);
 				break;
 			}
-			idev->rst_state = ISSEI_RST_STATE_INIT;
-			fallthrough;
-
-		case ISSEI_RST_STATE_INIT:
-			idev->ops->irq_clear(idev);
-			idev->ops->irq_sync(idev);
-
-			if (!power_down) {
-				idev->reset_count++;
-				if (idev->reset_count > ISSEI_MAX_CONSEC_RESET) {
-					dev_err(&idev->dev, "reset: reached maximal consecutive resets: disabling the device\n");
-					issei_rst_state_set(idev, ISSEI_RST_STATE_DISABLED);
-					break;
-				}
-			}
-
-			ret = issei_reset(idev, power_down);
-			if (power_down) {
-				dev_dbg(&idev->dev, "Powering down\n");
-				return 0;
-			}
-			if (ret)
-				break;
+		}
 
-			idev->rst_state = ISSEI_RST_STATE_HW_READY;
-			timeout = msecs_to_jiffies(ISSEI_RST_HW_READY_TIMEOUT_MSEC);
+		ret = issei_reset(idev, power_down);
+		if (power_down) {
+			dev_dbg(&idev->dev, "Powering down\n");
+			return true;
+		}
+		if (ret)
 			break;
 
-		case ISSEI_RST_STATE_HW_READY:
-			if (!idev->ops->hw_is_ready(idev)) {
-				dev_dbg(&idev->dev, "HW is not ready?\n");
-				timeout = old_timeout;
-				break;
-			}
-
-			dev_dbg(&idev->dev, "HW is ready\n");
-			idev->ops->hw_reset_release(idev);
-			idev->ops->host_set_ready(idev);
-			ret = idev->ops->setup_message_send(idev);
-			if (ret)
-				break;
+		idev->rst_state = ISSEI_RST_STATE_HW_READY;
+		*timeout = msecs_to_jiffies(ISSEI_RST_HW_READY_TIMEOUT_MSEC);
+		break;
 
-			idev->rst_state = ISSEI_RST_STATE_SETUP;
-			timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
+	case ISSEI_RST_STATE_HW_READY:
+		if (!idev->ops->hw_is_ready(idev)) {
+			dev_dbg(&idev->dev, "HW is not ready?\n");
+			*timeout = *old_timeout;
 			break;
+		}
 
-		case ISSEI_RST_STATE_SETUP:
-			ret = idev->ops->setup_message_recv(idev);
-			if (ret) {
-				if (ret == -ENODATA) {
-					ret = 0;
-					timeout = old_timeout;
-				}
-			} else {
-				timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
-				ret = issei_ham_send_start_req(idev);
-				idev->rst_state = ISSEI_RST_STATE_START;
-			}
+		dev_dbg(&idev->dev, "HW is ready\n");
+		idev->ops->hw_reset_release(idev);
+		idev->ops->host_set_ready(idev);
+		ret = idev->ops->setup_message_send(idev);
+		if (ret)
 			break;
 
-		case ISSEI_RST_STATE_START:
-			ret = issei_process_read_msg(idev);
-			if (!ret) {
-				timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
-				idev->rst_state = ISSEI_RST_STATE_CLIENT_ENUM;
-			} else if (ret == -ENODATA) {
+		idev->rst_state = ISSEI_RST_STATE_SETUP;
+		*timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
+		break;
+
+	case ISSEI_RST_STATE_SETUP:
+		ret = idev->ops->setup_message_recv(idev);
+		if (ret) {
+			if (ret == -ENODATA) {
 				ret = 0;
-				timeout = old_timeout;
+				*timeout = *old_timeout;
 			}
-			break;
+		} else {
+			*timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
+			ret = issei_ham_send_start_req(idev);
+			idev->rst_state = ISSEI_RST_STATE_START;
+		}
+		break;
+
+	case ISSEI_RST_STATE_START:
+		ret = issei_process_read_msg(idev);
+		if (!ret) {
+			*timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
+			idev->rst_state = ISSEI_RST_STATE_CLIENT_ENUM;
+		} else if (ret == -ENODATA) {
+			ret = 0;
+			*timeout = *old_timeout;
+		}
+		break;
 
-		case ISSEI_RST_STATE_CLIENT_ENUM:
-			ret = issei_process_read_msg(idev);
-			if (ret) {
-				if (ret == -ENODATA) {
-					ret = 0;
-					timeout = old_timeout;
-				}
-			} else {
-				idev->reset_count = 0;
-				idev->rst_state = ISSEI_RST_STATE_DONE;
-				dev_dbg(&idev->dev, "Reset finished successfully\n");
+	case ISSEI_RST_STATE_CLIENT_ENUM:
+		ret = issei_process_read_msg(idev);
+		if (ret) {
+			if (ret == -ENODATA) {
+				ret = 0;
+				*timeout = *old_timeout;
 			}
+		} else {
+			idev->reset_count = 0;
+			issei_rst_state_set(idev, ISSEI_RST_STATE_DONE);
+			pm_runtime_put_autosuspend(idev->parent);
+			dev_dbg(&idev->dev, "Reset finished successfully\n");
+		}
+		break;
+
+	case ISSEI_RST_STATE_DONE:
+		ret = issei_process_read_msg(idev);
+		if (ret != 0 && ret != -ENODATA)
 			break;
 
-		case ISSEI_RST_STATE_DONE:
-			ret = issei_process_read_msg(idev);
-			if (ret != 0 && ret != -ENODATA)
-				break;
+		ret = issei_process_write_msg(idev);
+		break;
+	}
 
-			ret = issei_process_write_msg(idev);
-			break;
-		}
+	if (ret) {
+		dev_warn(&idev->dev, "Process failed ret = %d\n", ret);
+		idev->rst_state = ISSEI_RST_STATE_INIT;
+	}
+	return false;
+}
 
-		if (ret) {
-			dev_warn(&idev->dev, "Process failed ret = %d\n", ret);
-			idev->rst_state = ISSEI_RST_STATE_INIT;
-			continue;
-		}
+static int issei_process_thread(void *_dev)
+{
+	long timeout, old_timeout = MAX_SCHEDULE_TIMEOUT;
+	struct issei_device *idev = _dev;
+
+	while (!kthread_should_stop()) {
+		dev_dbg(&idev->dev, "process_work in %d\n", idev->rst_state);
+		WRITE_ONCE(idev->has_data, false);
+
+		if (issei_process_thread_worker(idev, idev->power_down, &timeout, &old_timeout))
+			return 0;
 
 		/*
 		 * Every thread that has data to process sets the 'has_data' flag and
diff --git a/drivers/misc/issei/pci_heci.c b/drivers/misc/issei/pci_heci.c
index 86c567a4bf0f..c58b51b3aad3 100644
--- a/drivers/misc/issei/pci_heci.c
+++ b/drivers/misc/issei/pci_heci.c
@@ -8,11 +8,15 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/time.h>
 
 #include "cdev.h"
 #include "hw_heci.h"
 #include "hw_heci_regs.h"
 
+#define HW_HECI_RPM_TIMEOUT_MSEC (60 * MSEC_PER_SEC)
+
 static int issei_heci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct device *dev = &pdev->dev;
@@ -70,6 +74,18 @@ static int issei_heci_probe(struct pci_dev *pdev, const struct pci_device_id *en
 		goto free_irq;
 	}
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, HW_HECI_RPM_TIMEOUT_MSEC);
+
+	/*
+	 * ISSEI requires to resume from runtime suspend mode
+	 * in order to perform link reset flow upon system suspend.
+	 */
+	dev_pm_set_driver_flags(dev, DPM_FLAG_NO_DIRECT_COMPLETE);
+
+	pm_runtime_put_noidle(dev);
+	pm_runtime_allow(dev);
+
 	return 0;
 
 free_irq:
@@ -86,6 +102,11 @@ static void issei_heci_shutdown(struct pci_dev *pdev)
 {
 	struct issei_device *idev = pci_get_drvdata(pdev);
 	struct issei_heci_hw *hw = to_heci_hw(idev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_forbid(dev);
+	pm_runtime_get_noresume(dev);
 
 	issei_stop(idev);
 

-- 
2.53.0

