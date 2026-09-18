Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F319E3ACA41;
	Fri, 18 Sep 2026 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740694; cv=none; b=l82IDobRZ3SzhqzmaUDJplAUONkavU70AHsZtWilANMBcV9vWt2cSgkJ00XLwy0W5RmJ82ITq/lEIQvfdMu3NrmoBlFm0jF3bQdVFTcVPkmKJqi3cQTIGwXZtNCQUCRa8BXDXi2YAjia8HpK1v2BgagXhhZPij4+Vv1wGYgJOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740694; c=relaxed/simple;
	bh=w+AXLxZA8eWIp+eXz5q/xp/OJp80clPs0xepQjQhKrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRDxeQZH/79aBAupvVEuZPbbT1I4Lmzu9bFgthJc2CsN0/0c4vKyoRVpqud45rvQ//IeTx4p8khVUBdeq9XBACdWScU8QL/2FpH5yXIBlhokWtQrOlFDgNkYzQvqOHJjhPdt2+oWoZOb8NPKWIpVjlUSK3fwYJgXfffObp8GQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m2wpqo87; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m2wpqo87"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9BCA1D14;
	Fri, 18 Sep 2026 07:11:26 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 482993F86C;
	Fri, 18 Sep 2026 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740690; bh=w+AXLxZA8eWIp+eXz5q/xp/OJp80clPs0xepQjQhKrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m2wpqo87aUHPpdu9RFZSGBvu+SWvvbAx896BidF9jWqeH0IuPS9DGzJcDsH2OU7ls
	 9uxYQi3lorbQDw6Vtzme2MFthOn9ha1AsNvZEr/CUwyX8u5dypqI49aAkNtlP9s1AQ
	 2IBy13PS5Oph4QbjbkCM7D7oc/3LSZCi5skpjHro=
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
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 2/8] firmware: smccc: Add support for Live Firmware Activation (LFA)
Date: Fri, 18 Sep 2026 16:11:05 +0200
Message-ID: <20260918141112.2115555-3-andre.przywara@arm.com>
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

From: Salman Nabi <salman.nabi@arm.com>

The Arm Live Firmware Activation (LFA) is a specification [1] to describe
activating firmware components without a reboot. Those components
(like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
usual way: via fwupd, FF-A or other secure storage methods, or via some
IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
at system runtime, without requiring a reboot.
The specification covers the SMCCC interface to list and query available
components and eventually trigger the activation.

Add a new directory under /sys/firmware to present firmware components
capable of live activation. Each of them is a directory under lfa/,
and is identified via its GUID. The activation will be triggered by echoing
"1" into the "activate" file:
==========================================
/sys/firmware/lfa # ls -l . 6c*
.:
total 0
drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4

6c0762a6-12f2-4b56-92cb-ba8f633606d9:
total 0
--w-------    1 0        0             4096 Jan 19 11:33 activate
-r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
-r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
--w-------    1 0        0             4096 Jan 19 11:33 cancel
-r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
-r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
-rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
-r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
-r--r--r--    1 0        0             4096 Jan 19 11:33 name
-r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
grep: activate: Permission denied
activation_capable:1
activation_pending:1
grep: cancel: Permission denied
cpu_rendezvous:1
current_version:0.0
force_cpu_rendezvous:1
may_reset_cpu:0
name:TF-RMM
pending_version:0.0
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
[ 2825.797871] Arm LFA: firmware activation succeeded.
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
==========================================

[1] https://developer.arm.com/documentation/den0147/latest/

Signed-off-by: Salman Nabi <salman.nabi@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/Kconfig  |  10 +
 drivers/firmware/smccc/Makefile |   1 +
 drivers/firmware/smccc/lfa_fw.c | 766 ++++++++++++++++++++++++++++++++
 drivers/firmware/smccc/smccc.c  |   5 +
 include/linux/arm-smccc.h       |  15 +
 5 files changed, 797 insertions(+)
 create mode 100644 drivers/firmware/smccc/lfa_fw.c

diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
index 15e7466179a62..7fd646d515f86 100644
--- a/drivers/firmware/smccc/Kconfig
+++ b/drivers/firmware/smccc/Kconfig
@@ -23,3 +23,13 @@ config ARM_SMCCC_SOC_ID
 	help
 	  Include support for the SoC bus on the ARM SMCCC firmware based
 	  platforms providing some sysfs information about the SoC variant.
+
+config ARM_LFA
+	tristate "Arm Live Firmware activation support"
+	depends on HAVE_ARM_SMCCC_DISCOVERY && ARM64
+	default y
+	help
+	  Include support for triggering a Live Firmware Activation (LFA),
+	  which allows to upgrade certain firmware components without a reboot.
+	  This is described in the Arm DEN0147 specification, and relies on
+	  a firmware agent running in EL3.
diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
index 68bbff1407b8b..cddf2c460ab9d 100644
--- a/drivers/firmware/smccc/Makefile
+++ b/drivers/firmware/smccc/Makefile
@@ -2,3 +2,4 @@
 #
 obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= bus.o smccc.o kvm_guest.o
 obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
+obj-$(CONFIG_ARM_LFA) += lfa_fw.o
diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
new file mode 100644
index 0000000000000..7cf847e102d5a
--- /dev/null
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -0,0 +1,766 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Arm Limited
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/array_size.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/psci.h>
+#include <linux/stop_machine.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/uuid.h>
+#include <linux/workqueue.h>
+
+#include <uapi/linux/psci.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) "Arm LFA: " fmt
+
+/* CALL_AGAIN flags (returned by SMC) */
+#define LFA_PRIME_CALL_AGAIN		BIT(0)
+#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
+
+/* LFA return values */
+#define LFA_SUCCESS			0
+#define LFA_NOT_SUPPORTED		1
+#define LFA_BUSY			2
+#define LFA_AUTH_ERROR			3
+#define LFA_NO_MEMORY			4
+#define LFA_CRITICAL_ERROR		5
+#define LFA_DEVICE_ERROR		6
+#define LFA_WRONG_STATE			7
+#define LFA_INVALID_PARAMETERS		8
+#define LFA_COMPONENT_WRONG_STATE	9
+#define LFA_INVALID_ADDRESS		10
+#define LFA_ACTIVATION_FAILED		11
+
+#define LFA_ERROR_STRING(name) \
+	[name] = #name
+
+static const char * const lfa_error_strings[] = {
+	LFA_ERROR_STRING(LFA_SUCCESS),
+	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),
+	LFA_ERROR_STRING(LFA_BUSY),
+	LFA_ERROR_STRING(LFA_AUTH_ERROR),
+	LFA_ERROR_STRING(LFA_NO_MEMORY),
+	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),
+	LFA_ERROR_STRING(LFA_DEVICE_ERROR),
+	LFA_ERROR_STRING(LFA_WRONG_STATE),
+	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),
+	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),
+	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),
+	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)
+};
+
+static const char *lfa_error_string(long error)
+{
+	if (error > 0)
+		return lfa_error_strings[LFA_SUCCESS];
+
+	error = -error;
+	if (error < ARRAY_SIZE(lfa_error_strings))
+		return lfa_error_strings[error];
+
+	return lfa_error_strings[LFA_DEVICE_ERROR];
+}
+
+static const int lfa_error_map[] = {
+	[LFA_SUCCESS]			= 0,
+	[LFA_NOT_SUPPORTED]		= -EOPNOTSUPP,
+	[LFA_BUSY]			= -EBUSY,
+	[LFA_AUTH_ERROR]		= -EPERM,
+	[LFA_NO_MEMORY]			= -ENOMEM,
+	[LFA_CRITICAL_ERROR]		= -EACCES,
+	[LFA_DEVICE_ERROR]		= -EIO,
+	[LFA_WRONG_STATE]		= -EPROTO,
+	[LFA_INVALID_PARAMETERS]	= -EINVAL,
+	[LFA_COMPONENT_WRONG_STATE]	= -EPROTO,
+	[LFA_INVALID_ADDRESS]		= -ENXIO,
+	[LFA_ACTIVATION_FAILED]		= -EIO,
+};
+
+static int lfa_to_linux_errno(long lfa_error)
+{
+	if (lfa_error > 0)
+		return -EINVAL;
+
+	if (-lfa_error > LFA_ACTIVATION_FAILED)
+		return -EINVAL;
+
+	return lfa_error_map[-lfa_error];
+}
+
+enum image_attr_names {
+	LFA_ATTR_NAME,
+	LFA_ATTR_CURRENT_VERSION,
+	LFA_ATTR_PENDING_VERSION,
+	LFA_ATTR_ACT_CAPABLE,
+	LFA_ATTR_ACT_PENDING,
+	LFA_ATTR_MAY_RESET_CPU,
+	LFA_ATTR_CPU_RENDEZVOUS,
+	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
+	LFA_ATTR_ACTIVATE,
+	LFA_ATTR_CANCEL,
+	LFA_ATTR_NR_IMAGES
+};
+
+struct fw_image {
+	struct kobject kobj;
+	const char *image_name;
+	int fw_seq_id;
+	u64 current_version;
+	u64 pending_version;
+	bool activation_capable;
+	bool activation_pending;
+	bool may_reset_cpu;
+	bool cpu_rendezvous;
+	bool cpu_rendezvous_forced;
+	bool use_cpu_rendezvous;
+	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
+};
+
+static struct fw_image *kobj_to_fw_image(struct kobject *kobj)
+{
+	return container_of(kobj, struct fw_image, kobj);
+}
+
+/* A UUID split over two 64-bit registers */
+struct uuid_regs {
+	u64 uuid_lo;
+	u64 uuid_hi;
+};
+
+/* A list of known GUIDs, to be shown in the "name" sysfs file. */
+static const struct fw_image_uuid {
+	const char *name;
+	const char *uuid;
+} fw_images_uuids[] = {
+	{
+		.name = "TF-A BL31 runtime",
+		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
+	},
+	{
+		.name = "BL33 non-secure payload",
+		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
+	},
+	{
+		.name = "TF-RMM",
+		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
+	},
+};
+
+static struct kset *lfa_kset;
+static struct workqueue_struct *fw_images_update_wq;
+static struct work_struct fw_images_update_work;
+static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];
+
+static const struct attribute_group image_attr_group = {
+	.attrs = image_default_attrs,
+};
+
+static const struct attribute_group *image_default_groups[] = {
+	&image_attr_group,
+	NULL
+};
+
+static int update_fw_images_tree(void);
+
+static void image_release(struct kobject *kobj)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	kfree(image);
+}
+
+static const struct kobj_type image_ktype = {
+	.release = image_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = image_default_groups,
+};
+
+static void delete_fw_image_node(struct fw_image *image)
+{
+	kobject_del(&image->kobj);
+	kobject_put(&image->kobj);
+}
+
+static void remove_invalid_fw_images(struct work_struct *work)
+{
+	struct kobject *kobj, *tmp;
+	struct list_head images_to_delete = LIST_HEAD_INIT(images_to_delete);
+
+	/*
+	 * Remove firmware images including directories that are no longer
+	 * present in the LFA agent after updating the existing ones.
+	 * Delete list images before calling kobject_del() and kobject_put() on
+	 * them. Kobject_del() uses kset->list_lock itself which can cause lock
+	 * recursion, and kobject_put() may sleep.
+	 */
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
+		struct fw_image *image = kobj_to_fw_image(kobj);
+
+		if (image->fw_seq_id == -1)
+			list_move_tail(&kobj->entry, &images_to_delete);
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	/*
+	 * Now safely remove the sysfs kobjects for the deleted list items
+	 */
+	list_for_each_entry_safe(kobj, tmp, &images_to_delete, entry) {
+		struct fw_image *image = kobj_to_fw_image(kobj);
+
+		delete_fw_image_node(image);
+	}
+}
+
+static void set_image_flags(struct fw_image *image, int seq_id,
+			    u32 image_flags, u64 reg_current_ver,
+			    u64 reg_pending_ver)
+{
+	image->fw_seq_id = seq_id;
+	image->current_version = reg_current_ver;
+	image->pending_version = reg_pending_ver;
+	image->activation_capable = !!(image_flags & BIT(0));
+	image->activation_pending = !!(image_flags & BIT(1));
+	image->may_reset_cpu = !!(image_flags & BIT(2));
+	/* cpu_rendezvous_optional bit has inverse logic in the spec */
+	image->cpu_rendezvous = !(image_flags & BIT(3));
+}
+
+static unsigned long get_nr_lfa_components(void)
+{
+	struct arm_smccc_1_2_regs reg = { 0 };
+
+	reg.a0 = ARM_SMCCC_LFA_GET_INFO;
+	reg.a1 = 0; /* lfa_info_selector = 0 */
+
+	arm_smccc_1_2_invoke(&reg, &reg);
+	if (reg.a0 != LFA_SUCCESS)
+		return reg.a0;
+
+	return reg.a1;
+}
+
+static const char *get_image_name(const struct fw_image *image)
+{
+	if (image->image_name && image->image_name[0] != '\0')
+		return image->image_name;
+
+	return kobject_name(&image->kobj);
+}
+
+static int lfa_cancel(void *data)
+{
+	struct fw_image *image = data;
+	struct arm_smccc_1_2_regs reg = { 0 };
+
+	reg.a0 = ARM_SMCCC_LFA_CANCEL;
+	reg.a1 = image->fw_seq_id;
+	arm_smccc_1_2_invoke(&reg, &reg);
+
+	/*
+	 * When firmware activation is called with "skip_cpu_rendezvous=1",
+	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
+	 * cancelled.
+	 */
+	if (reg.a0 == LFA_SUCCESS) {
+		pr_info("Activation cancelled for image %s\n",
+			get_image_name(image));
+	} else {
+		pr_err("Activation not cancelled for image %s: %s\n",
+		       get_image_name(image), lfa_error_string(reg.a0));
+		return -EINVAL;
+	}
+
+	return reg.a0;
+}
+
+/*
+ * Try a single activation call. The smc_lock writer lock must be held,
+ * and it must be called from inside stop_machine() when CPU rendezvous is
+ * required.
+ * Returns a Linux error code, not an LFA one.
+ */
+static int call_lfa_activate(void *data)
+{
+	struct fw_image *image = data;
+	struct arm_smccc_1_2_regs reg = { 0 }, res;
+
+	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
+	reg.a1 = image->fw_seq_id;
+	/*
+	 * As we do not support updates requiring a CPU reset (yet),
+	 * we pass 0 in reg.a3 and reg.a4, holding the entry point and
+	 * context ID respectively.
+	 * Use the cached value of the rendezvous status, to be consistent
+	 * with how we were called (via stop_machine() or not).
+	 */
+	reg.a2 = !image->use_cpu_rendezvous;
+	arm_smccc_1_2_invoke(&reg, &res);
+
+	if ((long)res.a0 < 0)
+		return lfa_to_linux_errno((long)res.a0);
+
+	if (res.a1 & LFA_ACTIVATE_CALL_AGAIN)
+		return -EAGAIN;
+
+	return 0;
+}
+
+static int activate_fw_image(struct fw_image *image)
+{
+	int ret;
+
+retry:
+	/*
+	 * cpu_rendezvous_forced is set by the administrator, via sysfs,
+	 * cpu_rendezvous is dictated by each firmware component.
+	 */
+	image->use_cpu_rendezvous = image->cpu_rendezvous_forced ||
+				    image->cpu_rendezvous;
+	if (image->use_cpu_rendezvous)
+		ret = stop_machine(call_lfa_activate, image, cpu_online_mask);
+	else
+		ret = call_lfa_activate(image);
+
+	if (!ret) {
+		update_fw_images_tree();
+
+		return 0;
+	}
+
+	/* SMC returned with call_again flag set, or with LFA_BUSY */
+	if (ret == -EAGAIN || ret == -EBUSY)
+		goto retry;
+
+	lfa_cancel(image);
+
+	pr_err("LFA_ACTIVATE for image %s failed\n", get_image_name(image));
+
+	return ret;
+}
+
+static int prime_fw_image(struct fw_image *image)
+{
+	struct arm_smccc_1_2_regs reg = { 0 }, res;
+	int ret;
+
+	if (image->may_reset_cpu) {
+		pr_err("CPU reset not supported by kernel driver\n");
+
+		return -EINVAL;
+	}
+
+	reg.a0 = ARM_SMCCC_LFA_PRIME;
+retry:
+	/*
+	 * LFA_PRIME will return 1 in reg.a1 if the firmware priming
+	 * is still in progress. In that case LFA_PRIME will need to
+	 * be called again.
+	 * reg.a1 will become 0 once the prime process completes.
+	 */
+	reg.a1 = image->fw_seq_id;
+	arm_smccc_1_2_invoke(&reg, &res);
+	if ((long)res.a0 < 0) {
+		pr_err("LFA_PRIME for image %s failed: %s\n",
+		       get_image_name(image),
+		       lfa_error_string((long)res.a0));
+
+		return lfa_to_linux_errno((long)res.a0);
+	}
+
+	if (res.a1 & LFA_PRIME_CALL_AGAIN)
+		goto retry;
+
+	return 0;
+}
+
+static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%s\n", image->image_name);
+}
+
+static ssize_t activation_capable_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%d\n", image->activation_capable);
+}
+
+static void update_fw_image_pending(struct fw_image *image)
+{
+	struct arm_smccc_1_2_regs reg = { 0 };
+
+	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
+	reg.a1 = image->fw_seq_id;
+	arm_smccc_1_2_invoke(&reg, &reg);
+
+	if (reg.a0 == LFA_SUCCESS)
+		image->activation_pending = !!(reg.a3 & BIT(1));
+}
+
+static ssize_t activation_pending_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	/*
+	 * Activation pending status can change anytime thus we need to update
+	 * and return its current value
+	 */
+	update_fw_image_pending(image);
+
+	return sysfs_emit(buf, "%d\n", image->activation_pending);
+}
+
+static ssize_t may_reset_cpu_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%d\n", image->may_reset_cpu);
+}
+
+static ssize_t cpu_rendezvous_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%d\n", image->cpu_rendezvous);
+}
+
+static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	int ret;
+
+	ret = kstrtobool(buf, &image->cpu_rendezvous_forced);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%d\n", image->cpu_rendezvous_forced);
+}
+
+static ssize_t current_version_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	u32 maj, min;
+
+	maj = image->current_version >> 32;
+	min = image->current_version & 0xffffffff;
+
+	return sysfs_emit(buf, "%u.%u\n", maj, min);
+}
+
+static ssize_t pending_version_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	struct arm_smccc_1_2_regs reg = { 0 };
+
+	/*
+	 * Similar to activation pending, this value can change following an
+	 * update, we need to retrieve fresh info instead of stale information.
+	 */
+	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
+	reg.a1 = image->fw_seq_id;
+	arm_smccc_1_2_invoke(&reg, &reg);
+	if (reg.a0 == LFA_SUCCESS) {
+		if (reg.a5 != 0 && image->activation_pending) {
+			u32 maj, min;
+
+			image->pending_version = reg.a5;
+			maj = reg.a5 >> 32;
+			min = reg.a5 & 0xffffffff;
+
+			return sysfs_emit(buf, "%u.%u\n", maj, min);
+		}
+	}
+
+	return sysfs_emit(buf, "N/A\n");
+}
+
+static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	bool activate;
+	int ret;
+
+	ret = kstrtobool(buf, &activate);
+	if (ret)
+		return ret;
+
+	if (!activate)
+		return count;
+
+	ret = prime_fw_image(image);
+	if (ret)
+		return ret;
+
+	ret = activate_fw_image(image);
+	if (ret)
+		return ret;
+
+	pr_info("%s: successfully activated\n", get_image_name(image));
+
+	return count;
+}
+
+static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	bool cancel;
+	int ret;
+
+	ret = kstrtobool(buf, &cancel);
+	if (ret)
+		return ret;
+
+	if (!cancel)
+		return count;
+
+	ret = lfa_cancel(image);
+	if (ret != 0)
+		return ret;
+
+	return count;
+}
+
+static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
+	[LFA_ATTR_NAME]			= __ATTR_RO(name),
+	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
+	[LFA_ATTR_PENDING_VERSION]	= __ATTR_RO(pending_version),
+	[LFA_ATTR_ACT_CAPABLE]		= __ATTR_RO(activation_capable),
+	[LFA_ATTR_ACT_PENDING]		= __ATTR_RO(activation_pending),
+	[LFA_ATTR_MAY_RESET_CPU]	= __ATTR_RO(may_reset_cpu),
+	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
+	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
+	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+};
+
+static void init_image_default_attrs(void)
+{
+	for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++)
+		image_default_attrs[i] = &image_attrs_group[i].attr;
+	image_default_attrs[LFA_ATTR_NR_IMAGES] = NULL;
+}
+
+static void clean_fw_images_tree(void)
+{
+	struct kobject *kobj, *tmp;
+	struct list_head images_to_delete;
+
+	INIT_LIST_HEAD(&images_to_delete);
+
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
+		list_move_tail(&kobj->entry, &images_to_delete);
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	list_for_each_entry_safe(kobj, tmp, &images_to_delete, entry) {
+		struct fw_image *image = kobj_to_fw_image(kobj);
+
+		delete_fw_image_node(image);
+	}
+}
+
+static int update_fw_image_node(char *fw_uuid, int seq_id,
+				u32 image_flags, u64 reg_current_ver,
+				u64 reg_pending_ver)
+{
+	const char *image_name = "";
+	struct fw_image *image;
+	struct kobject *kobj;
+	int i;
+
+	/*
+	 * If a fw_image is already in the images list then we just update
+	 * its flags and seq_id instead of trying to recreate it.
+	 */
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		if (!strcmp(kobject_name(kobj), fw_uuid)) {
+			struct fw_image *image = kobj_to_fw_image(kobj);
+
+			set_image_flags(image, seq_id, image_flags,
+					reg_current_ver, reg_pending_ver);
+			spin_unlock(&lfa_kset->list_lock);
+
+			return 0;
+		}
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	image = kzalloc_obj(*image);
+	if (!image)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
+		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid)) {
+			image_name = fw_images_uuids[i].name;
+			break;
+		}
+	}
+
+	image->kobj.kset = lfa_kset;
+	image->image_name = image_name;
+	image->cpu_rendezvous_forced = true;
+	set_image_flags(image, seq_id, image_flags, reg_current_ver,
+			reg_pending_ver);
+	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
+				 "%s", fw_uuid)) {
+		kobject_put(&image->kobj);
+
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int update_fw_images_tree(void)
+{
+	struct arm_smccc_1_2_regs reg = { 0 }, res;
+	struct uuid_regs image_uuid;
+	struct kobject *kobj;
+	char image_id_str[40];
+	int ret, num_of_components;
+
+	num_of_components = get_nr_lfa_components();
+	if (num_of_components <= 0) {
+		pr_err("Error getting number of LFA components\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
+	 * number of firmware images in the LFA agent may change after a
+	 * successful activation attempt. Negate all image flags as well.
+	 */
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		struct fw_image *image = kobj_to_fw_image(kobj);
+
+		set_image_flags(image, -1, 0b1000, 0, 0);
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
+	for (int i = 0; i < num_of_components; i++) {
+		reg.a1 = i; /* fw_seq_id to be queried */
+		arm_smccc_1_2_invoke(&reg, &res);
+		if (res.a0 == LFA_SUCCESS) {
+			image_uuid.uuid_lo = res.a1;
+			image_uuid.uuid_hi = res.a2;
+
+			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
+				 &image_uuid);
+			ret = update_fw_image_node(image_id_str, i, res.a3,
+						   res.a4, res.a5);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/*
+	 * Removing non-valid image directories at the end of an activation.
+	 * We can't remove the sysfs attributes while in the respective
+	 * _store() handler, so have to postpone the list removal to a
+	 * workqueue.
+	 */
+	queue_work(fw_images_update_wq, &fw_images_update_work);
+
+	return 0;
+}
+
+static int lfa_smccc_probe(struct arm_smccc_device *sdev)
+{
+	struct arm_smccc_1_2_regs reg = { 0 };
+	int err;
+
+	reg.a0 = ARM_SMCCC_LFA_GET_VERSION;
+	arm_smccc_1_2_invoke(&reg, &reg);
+	if ((s32)reg.a0 == -LFA_NOT_SUPPORTED)
+		return -ENODEV;
+
+	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
+		reg.a0 >> 16, reg.a0 & 0xffff);
+
+	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
+					      WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
+	if (!fw_images_update_wq) {
+		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
+
+		return -ENOMEM;
+	}
+	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
+
+	init_image_default_attrs();
+	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
+	if (!lfa_kset) {
+		destroy_workqueue(fw_images_update_wq);
+
+		return -ENOMEM;
+	}
+
+	err = update_fw_images_tree();
+	if (err != 0) {
+		kset_unregister(lfa_kset);
+		destroy_workqueue(fw_images_update_wq);
+	}
+
+	return err;
+}
+
+static void lfa_smccc_remove(struct arm_smccc_device *sdev)
+{
+	clean_fw_images_tree();
+	flush_workqueue(fw_images_update_wq);
+	destroy_workqueue(fw_images_update_wq);
+	kset_unregister(lfa_kset);
+}
+
+static const struct arm_smccc_device_id lfa_smccc_id_table[] = {
+	{ .func_id = ARM_SMCCC_LFA_GET_VERSION },
+	{}
+};
+MODULE_DEVICE_TABLE(arm_smccc, lfa_smccc_id_table);
+
+static struct arm_smccc_driver smccc_lfa_driver = {
+	.name		= KBUILD_MODNAME,
+	.probe		= lfa_smccc_probe,
+	.remove		= lfa_smccc_remove,
+	.id_table	= lfa_smccc_id_table,
+};
+
+module_arm_smccc_driver(smccc_lfa_driver);
+
+MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 5ea3478be9d3c..d7cd01e5c92b8 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -94,6 +94,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = false,
 		.device_name    = "arm-smccc-trng",
 	},
+	{
+		.func_id        = ARM_SMCCC_LFA_GET_VERSION,
+		.requires_smc   = false,
+		.device_name    = "arm-smccc-lfa",
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2ee..956a5af96c702 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -304,6 +304,21 @@
 			   ARM_SMCCC_OWNER_STANDARD,		\
 			   0x53)
 
+/* Live Firmware Activation (LFA) calls (defined by ARM DEN0147) */
+#define ARM_SMCCC_LFA_FN_BASE					\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
+			   ARM_SMCCC_SMC_64,			\
+			   ARM_SMCCC_OWNER_STANDARD,		\
+			   0x2e0)
+#define ARM_SMCCC_LFA_FN(n)		(ARM_SMCCC_LFA_FN_BASE + (n))
+#define ARM_SMCCC_LFA_GET_VERSION	ARM_SMCCC_LFA_FN(0)
+#define ARM_SMCCC_LFA_CHECK_FEATURE	ARM_SMCCC_LFA_FN(1)
+#define ARM_SMCCC_LFA_GET_INFO		ARM_SMCCC_LFA_FN(2)
+#define ARM_SMCCC_LFA_GET_INVENTORY	ARM_SMCCC_LFA_FN(3)
+#define ARM_SMCCC_LFA_PRIME		ARM_SMCCC_LFA_FN(4)
+#define ARM_SMCCC_LFA_ACTIVATE		ARM_SMCCC_LFA_FN(5)
+#define ARM_SMCCC_LFA_CANCEL		ARM_SMCCC_LFA_FN(6)
+
 /*
  * Return codes defined in ARM DEN 0070A
  * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
-- 
2.43.0

