Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B13566C4B;
	Fri, 16 Oct 2026 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175258; cv=none; b=FAbupVFFD6jQopUfMhYXirlEw5Vtjojbd64XoToBZlMrCPArhcJM77NrVRnTQPNLMCvQ9I5xJ+uWnh9Ahpkv006KWKZhMdyZP18paxeHqwCNKwjOfR02sDndi2LXuz0HxTWVeu5aWWbyM8OZ3pdRqxOwCwp4AT/4hx3PFYVex/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175258; c=relaxed/simple;
	bh=cA5AJDydZY8QYFGnbcLQewNOkLVTaTjta3LuBWhYHQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ear54TG0P18Fhe3E0COI8lUux3c5EtiDCff+Xw/LbyB9EBRfLrRYjIUg6hpTxUqH+nkBu9Fz86oDmv0ctnkLorLmm+hns1J9zdhvoU07Fw6YWSxCWL46y6jXJighCxnK0VkVpDIbEdNiEWFc14TZzldwmX6YfRfP6nMvXggeM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EzhciGxM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EzhciGxM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A859F1764;
	Fri, 16 Oct 2026 11:27:31 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37FFC3F8C6;
	Fri, 16 Oct 2026 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175254; bh=cA5AJDydZY8QYFGnbcLQewNOkLVTaTjta3LuBWhYHQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EzhciGxMGhEiuLBsnwZ/oARn9e0xHwrCGW+e2xYYVarfSmc9bhF/2ip5eyy3XLmbP
	 Mc8WfuUWGn0wMDGJo3N2q9+J9aYR0aTnujKlhEBhW4LZM47EXxdzSUldcGuSea7sXv
	 oKU7gzt4IZWK7K5+BRwAWg2SqabY215zlstxB+jI=
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
Subject: [PATCH v5 4/8] firmware: smccc: Add support for Live Firmware Activation (LFA)
Date: Fri, 16 Oct 2026 19:27:08 +0100
Message-ID: <20261016182714.1835813-5-andre.przywara@arm.com>
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
and is identified via its UUID. The activation will be triggered by echoing
"1" into the "activate" file:
==========================================
/sys/firmware/lfa # ls -l . 6c*
.:
total 0
drwxr-xr-x    2 0 0       0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
drwxr-xr-x    2 0 0       0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
drwxr-xr-x    2 0 0       0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4

6c0762a6-12f2-4b56-92cb-ba8f633606d9:
total 0
--w-------    1 0 0    4096 Jan 19 11:33 activate
-r--r--r--    1 0 0    4096 Jan 19 11:33 activation_capable
-r--r--r--    1 0 0    4096 Jan 19 11:33 activation_pending
--w-------    1 0 0    4096 Jan 19 11:33 cancel
-r--r--r--    1 0 0    4096 Jan 19 11:33 cpu_rendezvous
-r--r--r--    1 0 0    4096 Jan 19 11:33 current_version
-rw-r--r--    1 0 0    4096 Jan 19 11:33 force_cpu_rendezvous
-r--r--r--    1 0 0    4096 Jan 19 11:33 may_reset_cpu
-r--r--r--    1 0 0    4096 Jan 19 11:33 pending_version
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
grep: activate: Permission denied
activation_capable:1
activation_pending:1
grep: cancel: Permission denied
cpu_rendezvous:1
current_version:0.7
force_cpu_rendezvous:1
may_reset_cpu:0
pending_version:0.8
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
[ 2825.797871] Arm LFA: firmware activation succeeded.
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
==========================================

[1] https://developer.arm.com/documentation/den0147/latest/

Co-developed-by: Vedashree Vidwans <vvidwans@nvidia.com>
Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
Signed-off-by: Salman Nabi <salman.nabi@arm.com>
Co-developed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/Kconfig  |  10 +
 drivers/firmware/smccc/Makefile |   1 +
 drivers/firmware/smccc/lfa_fw.c | 845 ++++++++++++++++++++++++++++++++
 drivers/firmware/smccc/smccc.c  |   5 +
 include/linux/arm-smccc.h       |  15 +
 5 files changed, 876 insertions(+)
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
index 0000000000000..db2a7fe344d5d
--- /dev/null
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -0,0 +1,845 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025-2026 Arm Limited
+ *
+ * Driver for accessing the Arm "Live Firmware Activation" (LFA) services
+ * provided via SMCCC by platform firmware. This allows to activate certain
+ * updated firmware components at runtime, without a reboot, as described in
+ * Arm's DEN0147 specification:
+ * https://developer.arm.com/documentation/den0147/latest/
+ *
+ * An "LFA agent" is running in EL3, providing a list for activate-able
+ * firmware components via repeated LFA_GET_INVENTORY SMCCC calls. Those
+ * components are identified by a UUID, which this driver uses to name
+ * subdirectories under /sys/firmware/lfa. The properties and controls of each
+ * firmware component are exposed as sysfs files in this directory, for a list
+ * of them see: Documentation/ABI/testing/sysfs-firmware-lfa.
+ *
+ * Each firmware component sets the "activation pending" bit, if an update
+ * image for that component becomes available, either through some host
+ * initiated update process (UEFI capsule update), or via some out-of-band,
+ * BMC controlled update. The latter can be signalled via an interrupt or
+ * an ACPI notification.
+ * The actual activation process is split in two phases: LFA_PRIME prepares
+ * the activation, it can take longer and might require multiple calls to it.
+ * The real handover happens with LFA_ACTIVATE then. Some firmware components'
+ * update procedure might require to gather all CPUs in EL3 during the
+ * LFA_ACTIVATE call, to prevent them from doing any service calls to the
+ * firmware component being updated, but also to allow the updating firmware
+ * component to initialise itself on each available CPU. This is called
+ * "CPU rendezvous", some firmware components require that for their
+ * activation. This driver chooses to do so regardless, to prevent stray
+ * firmware accesses from the kernel during the update phase. This can be
+ * skipped by setting the force_cpu_rendezvous sysfs file to false.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/ktime.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/nmi.h>
+#include <linux/psci.h>
+#include <linux/rwsem.h>
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
+#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
+#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
+#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
+#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
+
+/* LFA return values */
+#define LFA_SUCCESS			0
+#define LFA_NOT_SUPPORTED		-1
+#define LFA_BUSY			-2
+#define LFA_AUTH_ERROR			-3
+#define LFA_NO_MEMORY			-4
+#define LFA_CRITICAL_ERROR		-5
+#define LFA_DEVICE_ERROR		-6
+#define LFA_WRONG_STATE			-7
+#define LFA_INVALID_PARAMETERS		-8
+#define LFA_COMPONENT_WRONG_STATE	-9
+#define LFA_INVALID_ADDRESS		-10
+#define LFA_ACTIVATION_FAILED		-11
+
+#define CASE_LFA_ERROR(name) 		case name: return #name
+
+static const char *lfa_error_string(s64 error)
+{
+	switch (error) {
+	CASE_LFA_ERROR(LFA_SUCCESS);
+	CASE_LFA_ERROR(LFA_NOT_SUPPORTED);
+	CASE_LFA_ERROR(LFA_BUSY);
+	CASE_LFA_ERROR(LFA_AUTH_ERROR);
+	CASE_LFA_ERROR(LFA_NO_MEMORY);
+	CASE_LFA_ERROR(LFA_CRITICAL_ERROR);
+	CASE_LFA_ERROR(LFA_DEVICE_ERROR);
+	CASE_LFA_ERROR(LFA_WRONG_STATE);
+	CASE_LFA_ERROR(LFA_INVALID_PARAMETERS);
+	CASE_LFA_ERROR(LFA_COMPONENT_WRONG_STATE);
+	CASE_LFA_ERROR(LFA_INVALID_ADDRESS);
+	CASE_LFA_ERROR(LFA_ACTIVATION_FAILED);
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static int lfa_to_linux_errno(s64 lfa_error)
+{
+	switch (lfa_error) {
+	case LFA_SUCCESS:
+		return 0;
+	case LFA_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case LFA_BUSY:
+		return -EBUSY;
+	case LFA_AUTH_ERROR:
+		return -EPERM;
+	case LFA_NO_MEMORY:
+		return -ENOMEM;
+	case LFA_CRITICAL_ERROR:
+		return -EACCES;
+	case LFA_DEVICE_ERROR:
+		return -EIO;
+	case LFA_WRONG_STATE:
+		return -EPROTO;
+	case LFA_INVALID_PARAMETERS:
+		return -EINVAL;
+	case LFA_COMPONENT_WRONG_STATE:
+		return -EPROTO;
+	case LFA_INVALID_ADDRESS:
+		return -ENXIO;
+	case LFA_ACTIVATION_FAILED:
+		return -EIO;
+	default:
+		return -EINVAL;
+	}
+}
+
+enum component_attr_names {
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
+struct fw_component {
+	struct kobject kobj;
+	int fw_seq_id;
+	u64 current_version;
+	u64 pending_version;
+	bool activation_capable;
+	bool activation_pending;
+	bool may_reset_cpu;
+	bool cpu_rendezvous;
+	bool cpu_rendezvous_forced;
+	bool use_cpu_rendezvous;
+	struct kobj_attribute comp_attrs[LFA_ATTR_NR_IMAGES];
+};
+
+static struct fw_component *kobj_to_fw_component(struct kobject *kobj)
+{
+	return container_of(kobj, struct fw_component, kobj);
+}
+
+/* A UUID split over two 64-bit registers */
+struct uuid_regs {
+	u64 uuid_lo;
+	u64 uuid_hi;
+};
+
+static struct kset *lfa_kset;
+static struct workqueue_struct *fw_comps_update_wq;
+static struct work_struct fw_comps_update_work;
+static struct attribute *component_default_attrs[LFA_ATTR_NR_IMAGES + 1];
+
+/*
+ * A successful component activation might change the number of available
+ * components, leading to a re-order and thus re-assignment of the sequence IDs.
+ * The lock protects the connection between a firmware component (through its
+ * user visible UUID) and the sequence IDs. Anyone doing an SMC call with
+ * a sequence ID needs to take the readers lock. Doing an activation requires
+ * the writer lock, as that process might change the assocications.
+ */
+struct rw_semaphore smc_lock;
+
+static const struct attribute_group comp_attr_group = {
+	.attrs = component_default_attrs,
+};
+
+static const struct attribute_group *comp_default_groups[] = {
+	&comp_attr_group,
+	NULL
+};
+
+static void component_release(struct kobject *kobj)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	kfree(comp);
+}
+
+static const struct kobj_type component_ktype = {
+	.release = component_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = comp_default_groups,
+};
+
+static void delete_fw_component_node(struct fw_component *comp)
+{
+	kobject_del(&comp->kobj);
+	kobject_put(&comp->kobj);
+}
+
+static void remove_invalid_fw_components(struct work_struct *work)
+{
+	struct kobject *kobj, *tmp;
+	struct list_head comps_to_delete = LIST_HEAD_INIT(comps_to_delete);
+
+	/*
+	 * After an activation, firmware components might have been removed
+	 * from the inventory. Move those components into a private temporary
+	 * list, where they can be safely destroyed separately, as kobject_del()
+	 * would be trying to take the same kset->list_lock.
+	 */
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
+		struct fw_component *comp = kobj_to_fw_component(kobj);
+
+		if (comp->fw_seq_id == -1)
+			list_move_tail(&kobj->entry, &comps_to_delete);
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	list_for_each_entry_safe(kobj, tmp, &comps_to_delete, entry) {
+		struct fw_component *comp = kobj_to_fw_component(kobj);
+
+		delete_fw_component_node(comp);
+	}
+}
+
+static void set_component_flags(struct fw_component *comp, int seq_id,
+				u32 comp_flags, u64 reg_current_ver,
+				u64 reg_pending_ver)
+{
+	comp->fw_seq_id = seq_id;
+	comp->current_version = reg_current_ver;
+	comp->pending_version = reg_pending_ver;
+	comp->activation_capable = !!(comp_flags & BIT(0));
+	comp->activation_pending = !!(comp_flags & BIT(1));
+	comp->may_reset_cpu = !!(comp_flags & BIT(2));
+	/* cpu_rendezvous_optional bit has inverse logic in the spec */
+	comp->cpu_rendezvous = !(comp_flags & BIT(3));
+}
+
+static int get_nr_lfa_components(void)
+{
+	struct arm_smccc_1_2_regs regs = {
+		.a0 = ARM_SMCCC_LFA_GET_INFO,
+		.a1 = 0,		 /* lfa_info_selector = 0 */
+	};
+
+	/* No need for the smc_lock, since no sequence IDs are involved. */
+	arm_smccc_1_2_invoke(&regs, &regs);
+	if (regs.a0 != LFA_SUCCESS)
+		return (s64)regs.a0;
+
+	return regs.a1;
+}
+
+static int update_fw_components_node(char *fw_uuid, int seq_id,
+				     u32 comp_flags, u64 reg_current_ver,
+				     u64 reg_pending_ver)
+{
+	struct fw_component *comp;
+	struct kobject *kobj;
+
+	/*
+	 * If a component is already in the components list then we just update
+	 * its flags and seq_id instead of trying to recreate it.
+	 */
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		if (!strcmp(kobject_name(kobj), fw_uuid)) {
+			struct fw_component *comp = kobj_to_fw_component(kobj);
+
+			set_component_flags(comp, seq_id, comp_flags,
+					reg_current_ver, reg_pending_ver);
+			spin_unlock(&lfa_kset->list_lock);
+
+			return 0;
+		}
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	comp = kzalloc_obj(*comp);
+	if (!comp)
+		return -ENOMEM;
+
+	comp->kobj.kset = lfa_kset;
+	comp->cpu_rendezvous_forced = true;
+	set_component_flags(comp, seq_id, comp_flags, reg_current_ver,
+			    reg_pending_ver);
+	if (kobject_init_and_add(&comp->kobj, &component_ktype, NULL,
+				 "%s", fw_uuid)) {
+		kobject_put(&comp->kobj);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/*
+ * Creates/updates the list of components provided by the firmware.
+ * Must be called with the smc_lock held if called outside of initialisation.
+ */
+static int update_fw_components_tree(void)
+{
+	struct arm_smccc_1_2_regs regs = { 0 }, res;
+	struct uuid_regs comp_uuid;
+	struct kobject *kobj;
+	char comp_id_str[40];
+	int ret, num_of_components;
+
+	num_of_components = get_nr_lfa_components();
+	if (num_of_components <= 0) {
+		pr_err("Error getting number of LFA components\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Invalidate fw_seq_ids (-1) for all components as the seq_ids and the
+	 * number of firmware components in the LFA agent may change after a
+	 * successful activation attempt. Negate all components flags as well.
+	 */
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		struct fw_component *comp = kobj_to_fw_component(kobj);
+
+		set_component_flags(comp, -1, 0b1000, 0, 0);
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	regs.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
+	for (int i = 0; i < num_of_components; i++) {
+		regs.a1 = i; /* fw_seq_id to be queried */
+		arm_smccc_1_2_invoke(&regs, &res);
+		if (res.a0 == LFA_SUCCESS) {
+			comp_uuid.uuid_lo = res.a1;
+			comp_uuid.uuid_hi = res.a2;
+
+			snprintf(comp_id_str, sizeof(comp_id_str), "%pUb",
+				 &comp_uuid);
+			ret = update_fw_components_node(comp_id_str, i, res.a3,
+							res.a4, res.a5);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/*
+	 * Removing non-valid component directories at the end of an activation.
+	 * We can't remove the sysfs attributes while in the respective
+	 * _store() handler, so have to postpone the list removal to a
+	 * workqueue.
+	 */
+	queue_work(fw_comps_update_wq, &fw_comps_update_work);
+
+	return 0;
+}
+
+static int lfa_cancel(void *data)
+{
+	struct fw_component *comp = data;
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	down_read(&smc_lock);
+	regs.a0 = ARM_SMCCC_LFA_CANCEL;
+	regs.a1 = comp->fw_seq_id;
+	arm_smccc_1_2_invoke(&regs, &regs);
+	up_read(&smc_lock);
+
+	/*
+	 * When firmware activation is called with "skip_cpu_rendezvous=1",
+	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
+	 * cancelled.
+	 */
+	if (regs.a0 == LFA_SUCCESS) {
+		pr_info("Activation cancelled for component %s\n",
+			kobject_name(&comp->kobj));
+	} else {
+		pr_err("Activation not cancelled for component %s: %s (%ld)\n",
+		       kobject_name(&comp->kobj), lfa_error_string(regs.a0),
+		       regs.a0);
+		return -EINVAL;
+	}
+
+	return regs.a0;
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
+	/*
+	 * Use the cached value of the rendezvous status, to be consistent
+	 * with how we were called (via stop_machine() or not).
+	 * As we do not support updates requiring a CPU reset (yet),
+	 * we can skip the entry point and context ID parameters.
+	 */
+	struct fw_component *comp = data;
+	struct arm_smccc_1_2_regs regs = {
+		.a0 = ARM_SMCCC_LFA_ACTIVATE,
+		.a1 = comp->fw_seq_id,
+		.a2 = !comp->use_cpu_rendezvous,
+		.a3 = 0,	/* unused entry point */
+		.a4 = 0,	/* unused context ID */
+	};
+
+	touch_nmi_watchdog();
+	arm_smccc_1_2_invoke(&regs, &regs);
+	if ((s64)regs.a0 < 0)
+		return lfa_to_linux_errno((s64)regs.a0);
+
+	if (regs.a1 & LFA_ACTIVATE_CALL_AGAIN)
+		return -EAGAIN;
+
+	return 0;
+}
+
+static int activate_fw_component(struct fw_component *comp)
+{
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
+	int ret;
+
+	do {
+		down_write(&smc_lock);
+		/*
+		 * cpu_rendezvous_forced is set by the administrator, via sysfs,
+		 * cpu_rendezvous is dictated by each firmware component.
+		 * All cores call into the firmware with the same arguments.
+		 */
+		comp->use_cpu_rendezvous = comp->cpu_rendezvous_forced ||
+					   comp->cpu_rendezvous;
+		if (comp->use_cpu_rendezvous) {
+			cpus_read_lock();
+			ret = stop_machine(call_lfa_activate, comp,
+					   cpu_online_mask);
+			cpus_read_unlock();
+		} else {
+			ret = call_lfa_activate(comp);
+		}
+		if (!ret)
+			update_fw_components_tree();
+		up_write(&smc_lock);
+
+		if (!ret)
+			return 0;
+
+		if (ret == -EAGAIN || ret == -EBUSY) {
+			if (ktime_before(ktime_get(), end)) {
+				if (msleep_interruptible(LFA_ACTIVATE_DELAY_MS))
+					ret = -EINTR;
+			} else {
+				ret = -ETIMEDOUT;
+			}
+		}
+	} while (ret == -EAGAIN || ret == -EBUSY);
+
+	lfa_cancel(comp);
+
+	pr_err("LFA_ACTIVATE for component %s failed\n",
+	       kobject_name(&comp->kobj));
+
+	return ret;
+}
+
+static int prime_fw_component(struct fw_component *comp)
+{
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
+	bool retry = false;
+	int ret = 0;
+
+	if (comp->may_reset_cpu) {
+		pr_err("CPU reset not supported by kernel driver\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * LFA_PRIME will return 1 in regs.a1 if the firmware priming
+	 * is still in progress. In that case LFA_PRIME will need to
+	 * be called again.
+	 * regs.a1 will become 0 once the prime process completes.
+	 */
+	do {
+		struct arm_smccc_1_2_regs regs = {
+			.a0 = ARM_SMCCC_LFA_PRIME,
+		};
+
+		touch_nmi_watchdog();
+		down_read(&smc_lock);
+		regs.a1 = comp->fw_seq_id;
+		arm_smccc_1_2_invoke(&regs, &regs);
+		up_read(&smc_lock);
+
+		if ((s64)regs.a0 < 0) {
+			pr_err("LFA_PRIME for component %s failed: %s (%ld)\n",
+			       kobject_name(&comp->kobj),
+			       lfa_error_string((s64)regs.a0), regs.a0);
+			return lfa_to_linux_errno((s64)regs.a0);
+		}
+
+		if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) {
+			if (ktime_before(ktime_get(), end)) {
+				if (msleep_interruptible(LFA_PRIME_DELAY_MS)) {
+					ret = -EINTR;
+					break;
+				}
+			} else {
+				pr_err("LFA_PRIME for component %s timed out",
+				       kobject_name(&comp->kobj));
+				ret = -ETIMEDOUT;
+				break;
+			}
+			retry = true;
+		}
+	} while (retry);
+
+	if (ret)
+		lfa_cancel(comp);
+
+	return ret;
+}
+
+static ssize_t activation_capable_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	return sysfs_emit(buf, "%d\n", comp->activation_capable);
+}
+
+/* called with smc_lock held */
+static void _update_fw_component_pending(struct fw_component *comp)
+{
+	struct arm_smccc_1_2_regs regs = {
+		.a0 = ARM_SMCCC_LFA_GET_INVENTORY,
+		.a1 = comp->fw_seq_id,
+	};
+
+	arm_smccc_1_2_invoke(&regs, &regs);
+
+	if (regs.a0 == LFA_SUCCESS)
+		comp->activation_pending = !!(regs.a3 & BIT(1));
+}
+
+static void update_fw_component_pending(struct fw_component *comp)
+{
+	down_read(&smc_lock);
+	_update_fw_component_pending(comp);
+	up_read(&smc_lock);
+}
+
+static ssize_t activation_pending_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	/*
+	 * Activation pending status can change anytime thus we need to update
+	 * and return its current value
+	 */
+	update_fw_component_pending(comp);
+
+	return sysfs_emit(buf, "%d\n", comp->activation_pending);
+}
+
+static ssize_t may_reset_cpu_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	return sysfs_emit(buf, "%d\n", comp->may_reset_cpu);
+}
+
+static ssize_t cpu_rendezvous_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	return sysfs_emit(buf, "%d\n", comp->cpu_rendezvous);
+}
+
+static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+	int ret;
+
+	ret = kstrtobool(buf, &comp->cpu_rendezvous_forced);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	return sysfs_emit(buf, "%d\n", comp->cpu_rendezvous_forced);
+}
+
+static ssize_t current_version_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+	u32 maj, min;
+
+	maj = upper_32_bits(comp->current_version);
+	min = lower_32_bits(comp->current_version);
+
+	return sysfs_emit(buf, "%u.%u\n", maj, min);
+}
+
+static ssize_t pending_version_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	/*
+	 * Similar to activation pending, this value can change following an
+	 * update, we need to retrieve fresh info instead of stale information.
+	 * Update the activation_pending status on the way.
+	 */
+	down_read(&smc_lock);
+	regs.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
+	regs.a1 = comp->fw_seq_id;
+	arm_smccc_1_2_invoke(&regs, &regs);
+	up_read(&smc_lock);
+	if (regs.a0 == LFA_SUCCESS) {
+		comp->activation_pending = !!(regs.a3 & BIT(1));
+		if (regs.a5 != 0 && comp->activation_pending) {
+			u32 maj, min;
+
+			comp->pending_version = regs.a5;
+			maj = upper_32_bits(regs.a5);
+			min = lower_32_bits(regs.a5);
+
+			return sysfs_emit(buf, "%u.%u\n", maj, min);
+		}
+
+		return 0;
+	}
+
+	return lfa_to_linux_errno((s64)regs.a0);
+}
+
+static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
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
+	ret = prime_fw_component(comp);
+	if (ret)
+		return ret;
+
+	ret = activate_fw_component(comp);
+	if (ret)
+		return ret;
+
+	pr_info("%s: successfully activated\n", kobject_name(&comp->kobj));
+
+	return count;
+}
+
+static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
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
+	ret = lfa_cancel(comp);
+	if (ret != 0)
+		return ret;
+
+	return count;
+}
+
+static struct kobj_attribute comp_attrs_group[LFA_ATTR_NR_IMAGES] = {
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
+static void init_component_default_attrs(void)
+{
+	for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++)
+		component_default_attrs[i] = &comp_attrs_group[i].attr;
+	component_default_attrs[LFA_ATTR_NR_IMAGES] = NULL;
+}
+
+static void clean_fw_components_tree(void)
+{
+	struct kobject *kobj, *tmp;
+	struct list_head comp_to_delete;
+
+	INIT_LIST_HEAD(&comp_to_delete);
+
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
+		list_move_tail(&kobj->entry, &comp_to_delete);
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	list_for_each_entry_safe(kobj, tmp, &comp_to_delete, entry) {
+		struct fw_component *comp = kobj_to_fw_component(kobj);
+
+		delete_fw_component_node(comp);
+	}
+}
+
+static bool lfa_smccc_has_all_functions(void)
+{
+	struct arm_smccc_1_2_regs regs = { 0 }, res;
+	u32 fn_id;
+
+	regs.a0 = ARM_SMCCC_LFA_FEATURES;
+
+	for (fn_id = ARM_SMCCC_LFA_GET_INFO;
+	     fn_id <= ARM_SMCCC_LFA_CANCEL;
+	     fn_id++) {
+		regs.a1 = fn_id;
+		arm_smccc_1_2_invoke(&regs, &res);
+		if (res.a0)
+			return false;
+	}
+
+	return true;
+}
+
+static int lfa_smccc_probe(struct arm_smccc_device *sdev)
+{
+	struct arm_smccc_1_2_regs regs = { 0 };
+	int err;
+
+	/* The LFA spec requires SMCCC v1.2 or higher. */
+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
+		return -EOPNOTSUPP;
+
+	regs.a0 = ARM_SMCCC_LFA_VERSION;
+	arm_smccc_1_2_invoke(&regs, &regs);
+	if ((s32)regs.a0 == LFA_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (!lfa_smccc_has_all_functions())
+		return -EOPNOTSUPP;
+
+	pr_info("Live Firmware Activation: detected v%d.%d\n",
+		upper_16_bits(regs.a0), lower_16_bits(regs.a0));
+
+	fw_comps_update_wq = alloc_workqueue("fw_comps_update_wq",
+					     WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
+	if (!fw_comps_update_wq) {
+		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
+		return -ENOMEM;
+	}
+	INIT_WORK(&fw_comps_update_work, remove_invalid_fw_components);
+
+	init_component_default_attrs();
+	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
+	if (!lfa_kset) {
+		destroy_workqueue(fw_comps_update_wq);
+		return -ENOMEM;
+	}
+
+	init_rwsem(&smc_lock);
+
+	err = update_fw_components_tree();
+	if (err != 0) {
+		kset_unregister(lfa_kset);
+		destroy_workqueue(fw_comps_update_wq);
+	}
+
+	return err;
+}
+
+static void lfa_smccc_remove(struct arm_smccc_device *sdev)
+{
+	clean_fw_components_tree();
+	flush_workqueue(fw_comps_update_wq);
+	destroy_workqueue(fw_comps_update_wq);
+	kset_unregister(lfa_kset);
+}
+
+static const struct arm_smccc_device_id lfa_smccc_id_table[] = {
+	{ .func_id = ARM_SMCCC_LFA_VERSION },
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
index 67e503dac409f..8c8074d3f3f2b 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -94,6 +94,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = false,
 		.device_name    = "arm-smccc-trng",
 	},
+	{
+		.func_id        = ARM_SMCCC_LFA_VERSION,
+		.requires_smc   = false,
+		.device_name    = "arm-smccc-lfa",
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2ee..381d527c16a4c 100644
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
+#define ARM_SMCCC_LFA_VERSION		ARM_SMCCC_LFA_FN(0)
+#define ARM_SMCCC_LFA_FEATURES		ARM_SMCCC_LFA_FN(1)
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

