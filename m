Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532172E06E6;
	Fri, 18 Sep 2026 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740699; cv=none; b=BuRZJLVXkTqzlE/7kdmDicvyWQrYZyfWAGzT/OKUE2vpZ7Rhxt+PwIrcdmsMwC5f+eWPqWpVgv9DTkTDEG/bAkCpZBhU/gSuz6MK17YYLgyjJ1ZjItaehct5RM9TDA5aYNgvVIctweFqSIT2OPtRrQmFcc+/Qjia1uY7Nqm5sNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740699; c=relaxed/simple;
	bh=tqqHViVw4RtjptjFs9M84wpARYpMZc1L7EOtLQIh1oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XftadRTfsar0jyIU4E+CXKVX2l3nBRmWtnHqq0nZLpqjxvK2la0JFqY+LnrHjFBOBDNWhsIOSfNb8BSzsz9k/cdB6sXhssrutBy7BBDhiIkjN5MDHw2XNrbcfBcUnw97gecc6R6/DQYGgkQ/1R3vy5+63sdzhbfh1p6+yb17QX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YLmw7Nwo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YLmw7Nwo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B52B21E4D;
	Fri, 18 Sep 2026 07:11:32 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CF073F86C;
	Fri, 18 Sep 2026 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740696; bh=tqqHViVw4RtjptjFs9M84wpARYpMZc1L7EOtLQIh1oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YLmw7Nwo80b6aduB5DEetF7b3bjN96QlcDU+DDuMilue4/P/UWwGZXj7+cgSSgiAB
	 +vK7xolsHS6S7ansbLxSMUguVmiqgOUriItR/PIsEwp+bDA3WgfzAwxaVecpy0E+4g
	 TvPPj6M+GMyQnrRryW9okdFmZzx4Ty5aBbfSZoGE=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/8] firmware: smccc: lfa: Register ACPI notification
Date: Fri, 18 Sep 2026 16:11:07 +0200
Message-ID: <20260918141112.2115555-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vedashree Vidwans <vvidwans@nvidia.com>

The Arm LFA spec describes an ACPI notification mechanism, where the
platform (firmware) can notify an LFA client about newly available
firmware imag updates ("pending images" in LFA terms).

Add a faux device after discovering the existence of an LFA agent via
the SMCCC discovery mechnism, and use that device to check for the ACPI
notification description. Register this when one is provided.

The notification just conveys the fact that at least one firmware image
has now a pending update, it doesn't say which, also there could be more
than one pending. Loop through all images to find every which needs to
be activated, and trigger the activation. We need to do this is a loop,
since an activation might change the number and the status of available
images.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
[Andre: convert from platform driver to smccc bus]
Signed-off-by: Andre Przywara <andre.przywar@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 122 +++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index b6ce478d3fc01..bb89fffde6856 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -3,12 +3,14 @@
  * Copyright (C) 2025 Arm Limited
  */
 
+#include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/array_size.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/kobject.h>
 #include <linux/ktime.h>
 #include <linux/list.h>
@@ -18,11 +20,13 @@
 #include <linux/stop_machine.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 
 #include <uapi/linux/psci.h>
 
+#define DRIVER_NAME	"ARM_LFA"
 #undef pr_fmt
 #define pr_fmt(fmt) "Arm LFA: " fmt
 
@@ -733,6 +737,112 @@ static int update_fw_images_tree(void)
 	return 0;
 }
 
+/*
+ * Go through all FW images in a loop and trigger activation
+ * of all activatible and pending images.
+ * We have to restart enumeration after every triggered activation,
+ * since the firmware images might have changed during the activation.
+ */
+static int activate_pending_image(void)
+{
+	struct kobject *kobj;
+	bool found_pending = false;
+	struct fw_image *image;
+	int ret;
+
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		image = kobj_to_fw_image(kobj);
+
+		if (image->fw_seq_id == -1)
+			continue; /* Invalid FW component */
+
+		update_fw_image_pending(image);
+		if (image->activation_capable && image->activation_pending) {
+			found_pending = true;
+			break;
+		}
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	if (!found_pending)
+		return -ENOENT;
+
+	ret = prime_fw_image(image);
+	if (ret)
+		return ret;
+
+	ret = activate_fw_image(image);
+	if (ret)
+		return ret;
+
+	pr_info("%s: automatic activation succeeded\n", get_image_name(image));
+
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void *data)
+{
+	int ret;
+
+	while (!(ret = activate_pending_image()))
+		;
+
+	if (ret != -ENOENT)
+		pr_warn("notified image activation failed: %d\n", ret);
+}
+
+static int lfa_register_acpi(struct device *dev)
+{
+	struct acpi_device *acpi_dev;
+	acpi_handle handle;
+	acpi_status status;
+
+	acpi_dev = acpi_dev_get_first_match_dev("ARML0003", NULL, -1);
+	if (!acpi_dev)
+		return -ENODEV;
+	handle = acpi_device_handle(acpi_dev);
+	if (!handle) {
+		acpi_dev_put(acpi_dev);
+		return -ENODEV;
+	}
+
+	/* Register notify handler that indicates LFA updates are available */
+	status = acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
+					     lfa_acpi_notify_handler, NULL);
+	if (ACPI_FAILURE(status)) {
+		acpi_dev_put(acpi_dev);
+		return -EIO;
+	}
+
+	ACPI_COMPANION_SET(dev, acpi_dev);
+
+	return 0;
+}
+
+static void lfa_remove_acpi(struct device *dev)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
+	acpi_handle handle = acpi_device_handle(acpi_dev);
+
+	if (handle)
+		acpi_remove_notify_handler(handle,
+					   ACPI_DEVICE_NOTIFY,
+					   lfa_acpi_notify_handler);
+	acpi_dev_put(acpi_dev);
+}
+#else	/* !CONFIG_ACPI */
+static int lfa_register_acpi(struct device *dev)
+{
+	return -ENODEV;
+}
+
+static void lfa_remove_acpi(struct device *dev)
+{
+}
+#endif
+
 static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -769,11 +879,21 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		destroy_workqueue(fw_images_update_wq);
 	}
 
-	return err;
+	if (!acpi_disabled) {
+		err = lfa_register_acpi(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA ACPI notification\n");
+		if (err != -ENODEV)
+			return err;
+	}
+
+	return 0;
 }
 
 static void lfa_smccc_remove(struct arm_smccc_device *sdev)
 {
+	if (!acpi_disabled)
+		lfa_remove_acpi(&sdev->dev);
 	clean_fw_images_tree();
 	flush_workqueue(fw_images_update_wq);
 	destroy_workqueue(fw_images_update_wq);
-- 
2.43.0

