Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F21647FAFB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350787; cv=none; b=RPS/MkbIUEM/WSmzbbJKYmDi8Xnr2xIqthnXygWJUNTEKP9oztMxyZN5CCcc1Y6Xg5sMh/Vxfz8+T39IyOSE9fqM/4HOdVleQ3O2o30pi4qZdnzvZfxTsv9LSWjhR5iAf2XE3xuiRAMGABFH1iMiVGCJI2TFQGg89clqC3iU9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350787; c=relaxed/simple;
	bh=lvlCLNQVujjMQSIgfLSLh2/buoD99StTZ0GkEqHxmLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ik/Zy6ICs3046oJT7w3ho+U5ICwn9rnn/2YOrDHgFXHaTt48lUvesZRLPSe9yfSsymOBIFZyTvqqjeczYWiG4dfjHqMwpTGMkLfO9qlpKIyFrHRwZiB7EnTwIgnAzrg6S2VJHOEusOEmtdo46+fShCG71E2ezLFBdwITtpVgmFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSHn2dKj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSHn2dKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788350777; x=1819886777;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=lvlCLNQVujjMQSIgfLSLh2/buoD99StTZ0GkEqHxmLw=;
  b=jSHn2dKjm9RbSRnuC5lkFBt64OxCfsh3mnLEnmE35SMoGbdX5HA+E7ah
   THfK2Gj69H9FUro6yVhTQZtYPuFaRrdZHWGxx3G3GArbZQ0HuzI9DE93l
   Lz/MU8eMmoMH0HJkz7LKTbItWeQSc3Mlck6lZDpG2bXDsJE2MAWp9xcZC
   olQxbcgaEFlj8w5/AjcNmT4P9mqdYaLaMtdvOtTy4m5f4Lhh4fbDMLjUF
   4Oz8cyZbZRcdzlYpiV+yq+05iPHOc8bkS2qZw9ZzKIMpe/T9RP1GvTViE
   Pg4VIkMZ6qGOhuiAybsvN7aLl7dCC43JPz7wkV4SqTSIwPKmmrBgqvppy
   A==;
X-CSE-ConnectionGUID: /YFQhjxrQwyM4YxZICYE6Q==
X-CSE-MsgGUID: kzg/bCdWSRiv2/BPowMhYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100160529"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100160529"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:06:12 -0700
X-CSE-ConnectionGUID: rshzw9rkTeywBEMz8f+hhQ==
X-CSE-MsgGUID: 1sHQ2pc8SK+MrZBnS3qqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269411651"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:06:10 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 02 Sep 2026 15:05:50 +0300
Subject: [PATCH char-misc-next] mei: csc: add pci error handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-cri_aer-v1-1-b0571c399265@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBAAf0X7bOusKH5F0rlb7IOjPUnJvzsep
 2bmhsgqHKHNblA+JcoWEhR5Bm6xYWYUnxjIUG0aQ+hUBsuKZH1dNjSOlfWQ7F15kus/dV+quEp
 0GPg6oH+eFz4t4RppAAAA
X-Change-ID: 20260902-cri_aer-2ad6392bb5ad
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788350770; l=5374;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=lvlCLNQVujjMQSIgfLSLh2/buoD99StTZ0GkEqHxmLw=;
 b=pz9UpTaYmuXvlvQuN2KaEBhQTbjQ7QNnPhgXcTGq5WdnkQ5opfGSfdEy+VEHizWm0eVlpNZS5
 GrfpV8SEkH/BGFf+WZfZWo4HhvNDVcp7IrvX09hGwumcL2ejVIh6MY5
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add PCI error handler callbacks.
Stop and disable communication when error is detected;
reset the link and re-enable communication then device is
restored.

Co-developed-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/init.c    | 33 +++++++++++++++++++--
 drivers/misc/mei/mei_dev.h |  1 +
 drivers/misc/mei/pci-csc.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mei/init.c b/drivers/misc/mei/init.c
index 766f119f7ed0..82444d67db2a 100644
--- a/drivers/misc/mei/init.c
+++ b/drivers/misc/mei/init.c
@@ -305,10 +305,8 @@ static void mei_reset_work(struct work_struct *work)
 		schedule_work(&dev->reset_work);
 }
 
-void mei_stop(struct mei_device *dev)
+static void __mei_stop(struct mei_device *dev)
 {
-	dev_dbg(&dev->dev, "stopping the device.\n");
-
 	mutex_lock(&dev->device_lock);
 	mei_set_devstate(dev, MEI_DEV_POWERING_DOWN);
 	mutex_unlock(&dev->device_lock);
@@ -318,6 +316,35 @@ void mei_stop(struct mei_device *dev)
 	mutex_unlock(&dev->device_lock);
 
 	mei_cancel_work(dev);
+}
+
+/**
+ * mei_stop_fast - stop driver, clean bus and disable driver without resetting HW link
+ *
+ * @dev: the device structure
+ */
+void mei_stop_fast(struct mei_device *dev)
+{
+	dev_dbg(&dev->dev, "stopping the device fast.\n");
+
+	__mei_stop(dev);
+
+	mutex_lock(&dev->device_lock);
+	mei_set_devstate(dev, MEI_DEV_DISABLED);
+	mutex_unlock(&dev->device_lock);
+}
+EXPORT_SYMBOL_GPL(mei_stop_fast);
+
+/**
+ * mei_stop - stop driver, clean bus and disable driver with resetting HW link
+ *
+ * @dev: the device structure
+ */
+void mei_stop(struct mei_device *dev)
+{
+	dev_dbg(&dev->dev, "stopping the device.\n");
+
+	__mei_stop(dev);
 
 	mei_clear_interrupts(dev);
 	mei_synchronize_irq(dev);
diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index e651b06704a1..79a7c3e63397 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -736,6 +736,7 @@ int mei_reset(struct mei_device *dev);
 int mei_start(struct mei_device *dev);
 int mei_restart(struct mei_device *dev);
 void mei_stop(struct mei_device *dev);
+void mei_stop_fast(struct mei_device *dev);
 void mei_cancel_work(struct mei_device *dev);
 
 void mei_set_devstate(struct mei_device *dev, enum mei_dev_state state);
diff --git a/drivers/misc/mei/pci-csc.c b/drivers/misc/mei/pci-csc.c
index 6e1e8008f267..dacbd5e0e9d7 100644
--- a/drivers/misc/mei/pci-csc.c
+++ b/drivers/misc/mei/pci-csc.c
@@ -230,6 +230,77 @@ static int mei_csc_pm_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static pci_ers_result_t mei_csc_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
+{
+	struct mei_device *mdev = pci_get_drvdata(pdev);
+	struct mei_me_hw *hw = to_me_hw(mdev);
+
+	dev_info(&pdev->dev, "error recovery: error detected. state %d\n", state);
+
+	scoped_guard(mutex, &mdev->device_lock)
+		if (mei_me_hw_use_polling(hw))
+			hw->is_active = false;
+
+	mei_synchronize_irq(mdev);
+	mei_stop_fast(mdev);
+	pci_disable_device(pdev);
+
+	switch (state) {
+	case pci_channel_io_normal:
+		return PCI_ERS_RESULT_CAN_RECOVER;
+	case pci_channel_io_perm_failure:
+		return PCI_ERS_RESULT_DISCONNECT;
+	case pci_channel_io_frozen:
+		return PCI_ERS_RESULT_NEED_RESET;
+	default:
+		dev_err(&pdev->dev, "Unknown state %d\n", state);
+		return PCI_ERS_RESULT_NEED_RESET;
+	}
+}
+
+static pci_ers_result_t mei_csc_pci_error_slot_reset(struct pci_dev *pdev)
+{
+	int err;
+
+	pci_restore_state(pdev);
+	pci_set_master(pdev);
+
+	err = pci_enable_device(pdev);
+	if (err < 0) {
+		dev_err(&pdev->dev, "Cannot re-enable PCI device after reset. err = %d\n", err);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void mei_csc_pci_error_resume(struct pci_dev *pdev)
+{
+	struct mei_device *mdev = pci_get_drvdata(pdev);
+	struct mei_me_hw *hw = to_me_hw(mdev);
+
+	dev_info(&pdev->dev, "error recovery: resume\n");
+
+	scoped_guard(mutex, &mdev->device_lock) {
+		if (mei_me_hw_use_polling(hw)) {
+			hw->is_active = true;
+			wake_up_interruptible(&hw->wait_active);
+		}
+	}
+
+	if (mei_restart(mdev))
+		return;
+
+	/* Start timer if stopped in error */
+	schedule_delayed_work(&mdev->timer_work, HZ);
+}
+
+static const struct pci_error_handlers mei_csc_pci_error_handlers = {
+	.error_detected = mei_csc_pci_error_detected,
+	.slot_reset     = mei_csc_pci_error_slot_reset,
+	.resume         = mei_csc_pci_error_resume,
+};
+
 static const struct dev_pm_ops mei_csc_pm_ops = {
 	.prepare = pm_sleep_ptr(mei_csc_pci_prepare),
 	.complete = pm_sleep_ptr(mei_csc_pci_complete),
@@ -250,6 +321,7 @@ static struct pci_driver mei_csc_driver = {
 	.probe = mei_csc_probe,
 	.remove = mei_csc_remove,
 	.shutdown = mei_csc_shutdown,
+	.err_handler = &mei_csc_pci_error_handlers,
 	.driver = {
 		.pm = &mei_csc_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260902-cri_aer-2ad6392bb5ad

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

