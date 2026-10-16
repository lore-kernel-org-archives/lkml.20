Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ACF59C967;
	Fri, 16 Oct 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175260; cv=none; b=M5+svgAciDvnU4eeRsJsA41CH4Ghn3341kYdBjMweTG6BUfK3CtpAEmDZgS/RxC/0vwuvzR9kn7RRnV90ExSR3/AVe6t5ivAIEYDtLqFeAgT3pdGusU6JJswVTLCD9JmJ++UO16wV6gMXUi6OXhan4BqqMmWF4cUkBAGrAeMypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175260; c=relaxed/simple;
	bh=TTQVKzHFqone59X5Z0GG6n5IMSWDCJV3150KBk/mdwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWrUIfytlK/+ceMYHm1Wh3exPa/gmPe3ldp5ZQbMxPIYABNG0EKysdtpaR1MPy1Gkg0UhkATp2PoqsIDHeqa4qFE1hXoUEELeru9CpTwk0NkKJ2x6euRbN7oBWlLYoUgFdDLHrrf8tf+aCpdC6soGWjJFACpKBz9Ta0sztmoyXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FD7+wz3f; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FD7+wz3f"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3BA214BF;
	Fri, 16 Oct 2026 11:27:34 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3943D3F7B4;
	Fri, 16 Oct 2026 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175257; bh=TTQVKzHFqone59X5Z0GG6n5IMSWDCJV3150KBk/mdwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FD7+wz3f89LH8b1kA5vozeoHQ5JyRaFooCXT/TTGikY8OvkEgDF7ATE3cetYLxj0w
	 jNNGGMKd72dsHevpCCCH9pNsXD5KQsRCkpkJltxl0Hsb6HG4Icrwo/8VZTKy6ihW1n
	 L/HYiNV4SeF2S9qwKpjm2WTyt3zzLJ4OM4bVn2dw=
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
Subject: [PATCH v5 5/8] firmware: smccc: lfa: Register ACPI notification
Date: Fri, 16 Oct 2026 19:27:09 +0100
Message-ID: <20261016182714.1835813-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
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
 drivers/firmware/smccc/lfa_fw.c | 154 +++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index db2a7fe344d5d..4b4daf79611bb 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -33,12 +33,14 @@
  * skipped by setting the force_cpu_rendezvous sysfs file to false.
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
@@ -49,11 +51,13 @@
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
 
@@ -753,6 +757,135 @@ static void clean_fw_components_tree(void)
 	}
 }
 
+/*
+ * Iterate over all FW components and trigger activation of all activatible and
+ * pending components.
+ * Since we would need to re-enumerate the list of all components after a
+ * successful activation, and this could trigger infinite loops if a firmware
+ * component still appears as pending, we create an array of update candidates
+ * first, then activate each one of them.
+ */
+static void activate_pending_components(void)
+{
+	struct fw_component **all_comps;
+	struct fw_component *comp;
+	struct kobject *kobj;
+	int nr_comps = 0;
+	int ret, i;
+
+	down_read(&smc_lock);
+	spin_lock(&lfa_kset->list_lock);
+	all_comps = kmalloc_array(list_count_nodes(&lfa_kset->list),
+				  sizeof(*all_comps), GFP_NOWAIT);
+	if (!all_comps) {
+		spin_unlock(&lfa_kset->list_lock);
+		up_read(&smc_lock);
+		pr_warn("LFA: automatic activation failed: -ENOMEM\n");
+		return;
+	}
+
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		comp = kobj_to_fw_component(kobj);
+
+		if (comp->fw_seq_id == -1)
+			continue; /* Invalid FW component */
+
+		_update_fw_component_pending(comp);
+		if (comp->activation_capable && comp->activation_pending) {
+			kobject_get(&comp->kobj);
+			all_comps[nr_comps++] = comp;
+		}
+	}
+	spin_unlock(&lfa_kset->list_lock);
+	up_read(&smc_lock);
+
+	for (i = 0; i < nr_comps; i++) {
+		comp = all_comps[i];
+
+		ret = prime_fw_component(comp);
+		if (ret) {
+			pr_warn("LFA: LFA_PRIME failed for component %s\n",
+				kobject_name(&comp->kobj));
+			kobject_put(&comp->kobj);
+			continue;
+		}
+
+		ret = activate_fw_component(comp);
+		if (ret) {
+			pr_warn("LFA: LFA_ACTIVATE failed for component %s\n",
+				kobject_name(&comp->kobj));
+			kobject_put(&comp->kobj);
+			continue;
+		}
+
+		pr_info("%s: automatic activation succeeded\n",
+			kobject_name(&comp->kobj));
+		kobject_put(&comp->kobj);
+	}
+
+	kfree(all_comps);
+}
+
+#ifdef CONFIG_ACPI
+static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void *data)
+{
+	/* The spec explicitly mentions 0x80 only for the update event. */
+	if (event != 0x80)
+		return;
+
+	activate_pending_components();
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
 static bool lfa_smccc_has_all_functions(void)
 {
 	struct arm_smccc_1_2_regs regs = { 0 }, res;
@@ -813,13 +946,32 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 	if (err != 0) {
 		kset_unregister(lfa_kset);
 		destroy_workqueue(fw_comps_update_wq);
+		return err;
+	}
+
+	if (!acpi_disabled) {
+		err = lfa_register_acpi(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA ACPI notification\n");
+	}
+
+	/*
+	 * An ACPI notification or an interrupt are optional, but we must
+	 * handle errors that occurred during their setup.
+	 */
+	if (err != -ENODEV) {
+		kset_unregister(lfa_kset);
+		destroy_workqueue(fw_comps_update_wq);
+		return err;
 	}
 
-	return err;
+	return 0;
 }
 
 static void lfa_smccc_remove(struct arm_smccc_device *sdev)
 {
+	if (!acpi_disabled)
+		lfa_remove_acpi(&sdev->dev);
 	clean_fw_components_tree();
 	flush_workqueue(fw_comps_update_wq);
 	destroy_workqueue(fw_comps_update_wq);
-- 
2.43.0

