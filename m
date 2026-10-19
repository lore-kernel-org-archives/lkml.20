Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443067;
	b=UNbqRPhENjclcQG5IlDKeDN651dhbQpIDegQodAzOuMlshLH9gacBqabU5MJdCGodrG4
	 vG+4iH4mSE2dMZL1RIRzFr6RCd5d9lp6LYe4fpxEkjBzqb7Jy/woztdYMdKm8qrkMsEQ4
	 u9t+Pzs1ItTGgO5kLMDSBQJt3ezoV+NyUza09uyuPGfO0EWFmryecNm7LjmoFXwKKXus+
	 epY4rT94eU4tNMmvdLFCL4RLE5xAHF0pBYqtY3KaiDWUFYBBX3MpmTUa3c2UXT6mIFzSo
	 3c57MiCIfKw/CS7cpSibPC9w4NQOxWCL5ajFpy2pFT5he7Nwvw2oGpTtiSl1bSRuOgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443067;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=29jW1T2Wde6r+b3ftLpzYibbW3UiM/6rVacZC5c/cNg=;
	b=gqtXr///R4viTlLKtDSiTLWO1BANh7/K/cb72NhMwuc8pNCy1e5lyhdS7yjVRenwbpGT
	 Hx99lOsocNUuw2kiXq5PaNlcMWbHVLjjlcL4pxjHsqOX7bb3jW63RGJ1KhhbESLfBsV3J
	 lJ2xDLMP7AxFv5rCL25T4Duw6TKxw8VGeIgpovEq4Q3U1jUZO01UpShnYT8/pjlpnQDmO
	 r3pZLT/zf078+umiDUo0RjisveTAVfYO5ErDEiIgOU0IrEfaByaFlsmXvg7YamLJMcM2t
	 Lp3PkvLPUTODYTnt1H7U0UrdQBhJG9ZRkfnsh5CXyjUdGLA6wcJFNfA+AgT6+oLzkQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Khz/zPVZ";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964160A2611
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2964160A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Khz/zPVZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443067; x=1823979067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dyMqtZ7sXS36KbsOSwN4WsIM147R1QE5b2xvHYSGPE8=;
  b=Khz/zPVZnJ1JNss+nxDSFfdkwckWjxGn3k+kOvYlqwoQzKcbNR4OyI2x
   a4S62pa15sBP0brlbkwQ0r5mZ5fvxSwqOW51+2Sf1xHlmUWORB5PaD/ha
   EEfrcMdh0qhhDNWdqpPnX5VaiU4Bq1nx5v75RrvWxBhbwyME/yfBpwN3c
   ymhbb+24dADYDNrF3PUln6nxNT/S0h4X8UoLdjZ1D5kOblLRCN+lhj0+x
   z/nf/ykEXvS58LAC3gurEygSf+YCtA9Ih+SmUOT6TSpSBu1hmOB/wUcRi
   Gjfpb2XTfMjKx1R1Q64K1kWBo4ZpZ1kElrF9HbbjT6b0z/5V2CSNBwvrZ
   Q==;
X-CSE-ConnectionGUID: ulg9/H5NQoi7qxGpVlcPvA==
X-CSE-MsgGUID: A/mVIIOHQz29c6Q2eob7uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131273"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131273"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
X-CSE-ConnectionGUID: naJ6/7o1Q7mLDOsGiWu3IA==
X-CSE-MsgGUID: gHcYs1cHQm+xwL2y1DyBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008677"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v14 18/24] arm,x86,fs/resctrl: Enumerate AET on every resctrl mount
Date: Mon, 19 Oct 2026 13:50:25 -0700
Message-ID: <20261019205031.16977-19-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019205031.16977-1-tony.luck@intel.com>
References: <20261019205031.16977-1-tony.luck@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Application Energy Telemetry (AET) is enumerated only on the first mount of
the resctrl file system. A successful enumeration takes a reference on the
pmt_telemetry module that is never dropped. This is harmless only because
AET support requires pmt_telemetry to be built in.

In preparation for pmt_telemetry being built as a module, hold the module
reference only while resctrl is mounted. resctrl must then enumerate AET on
every mount and release everything obtained from pmt_telemetry on every
unmount.

Call resctrl_arch_pre_mount() on every mount attempt. Add
resctrl_arch_unmount() for the architecture to undo it after a failed mount
or on unmount. Serialize both hooks with each other and with the check that
resctrl is not already mounted, so that enumeration only happens while
resctrl is not mounted. Use a new mutex because the hooks take
cpus_read_lock(), which nests outside rdtgroup_mutex.

On x86, if AET was enumerated, unmount disables the AET events, returns the
telemetry data to pmt_telemetry, drops the module reference and removes
the AET monitoring domains. Cleanup at resctrl exit is no longer needed.

Do not re-enable an event group that was disabled during mount because the
system supports too few RMIDs for it. The same check would disable it again
on the next mount.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	New commit comment.
	aet_register_lock name changed to aet_lock.
	Babu: Add commit comment about event_group::force_off
---
 include/linux/resctrl.h                 | 10 +++++++--
 arch/x86/kernel/cpu/resctrl/internal.h  |  4 ++--
 arch/x86/kernel/cpu/resctrl/core.c      | 21 +++++++++++++++--
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 29 +++++++++++++++++++-----
 drivers/resctrl/mpam_resctrl.c          |  4 ++++
 fs/resctrl/rdtgroup.c                   | 30 ++++++++++++++++++++-----
 6 files changed, 81 insertions(+), 17 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index c77e24c0d8b6..c40d72e4a957 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -611,11 +611,17 @@ void resctrl_online_cpu(unsigned int cpu);
 void resctrl_offline_cpu(unsigned int cpu);
 
 /*
- * Architecture hook called at beginning of first file system mount attempt.
- * No locks are held.
+ * Architecture hook called at beginning of each file system mount attempt.
+ * Serialized against other mount and unmount attempts.
  */
 void resctrl_arch_pre_mount(void);
 
+/*
+ * Architecture hook called when mount fails, or on unmount.
+ * Serialized against other mount and unmount attempts.
+ */
+void resctrl_arch_unmount(void);
+
 /**
  * resctrl_arch_rmid_read() - Read the eventid counter corresponding to rmid
  *			      for this resource and domain.
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 8406addc05f5..c66954bc01e7 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -234,15 +234,15 @@ void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
 void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
 #ifdef CONFIG_X86_CPU_RESCTRL_INTEL_AET
-void __exit intel_aet_exit(void);
 bool intel_aet_pre_mount(void);
+void intel_aet_unmount(void);
 int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val);
 void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resource *r,
 				struct list_head *add_pos);
 bool intel_handle_aet_option(bool force_off, char *tok);
 #else
-static inline void __exit intel_aet_exit(void) { }
 static inline bool intel_aet_pre_mount(void) { return false; }
+static inline void intel_aet_unmount(void) { }
 static inline int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val)
 {
 	return -EINVAL;
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index ac67b4523b2d..40466f29e48e 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -811,6 +811,25 @@ void resctrl_arch_pre_mount(void)
 	cpus_read_unlock();
 }
 
+void resctrl_arch_unmount(void)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
+	int cpu;
+
+	if (!r->mon_capable)
+		return;
+
+	intel_aet_unmount();
+
+	cpus_read_lock();
+	mutex_lock(&domain_list_lock);
+	for_each_online_cpu(cpu)
+		domain_remove_cpu_mon(cpu, r);
+	r->mon_capable = false;
+	mutex_unlock(&domain_list_lock);
+	cpus_read_unlock();
+}
+
 enum {
 	RDT_FLAG_CMT,
 	RDT_FLAG_MBM_TOTAL,
@@ -1161,8 +1180,6 @@ late_initcall(resctrl_arch_late_init);
 
 static void __exit resctrl_arch_exit(void)
 {
-	intel_aet_exit();
-
 	cpuhp_remove_state(rdt_online);
 
 	resctrl_exit();
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 26406e18d5ed..75cd602d65ae 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -331,7 +331,7 @@ static enum pmt_feature_id lookup_pfid(const char *pfname)
 
 /*
  * Serialises AET's view of pmt_telemetry:
- *   - pmt_module, get_feature, put_feature
+ *   - pmt_module, get_feature, put_feature, pmt_in_use
  *   - every event_group's ->pfg
  *
  * Lock ordering with pmt/telemetry.c's ep_lock is ep_lock -> aet_lock.
@@ -345,6 +345,11 @@ static struct module *pmt_module;
 static struct pmt_feature_group *(*get_feature)(enum pmt_feature_id id);
 static void (*put_feature)(struct pmt_feature_group *p);
 
+/*
+ * Track whether pmt_telemetry enumeration succeeded during mount for use during unmount.
+ */
+static bool pmt_in_use;
+
 /*
  * Request a copy of struct pmt_feature_group for each event group. If there is
  * one, the returned structure has an array of telemetry_region structures,
@@ -429,19 +434,33 @@ bool intel_aet_pre_mount(void)
 		return false;
 	}
 
+	pmt_in_use = true;
+
 	return true;
 }
 
-void __exit intel_aet_exit(void)
+void intel_aet_unmount(void)
 {
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
 	struct event_group **peg;
 
+	guard(mutex)(&aet_lock);
+	if (!pmt_in_use)
+		return;
+
 	for_each_event_group(peg) {
-		if ((*peg)->pfg) {
-			put_feature((*peg)->pfg);
-			(*peg)->pfg = NULL;
+		struct event_group *e = *peg;
+
+		if (e->pfg) {
+			for (int i = 0; i < e->num_events; i++)
+				resctrl_disable_mon_event(e->evts[i].id);
+			put_feature(e->pfg);
+			e->pfg = NULL;
 		}
 	}
+	module_put(pmt_module);
+	pmt_in_use = false;
+	r->mon.num_rmid = 0;
 }
 
 #define DATA_VALID	BIT_ULL(63)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 360a50eb0cd3..ecea2239afa4 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -121,6 +121,10 @@ void resctrl_arch_pre_mount(void)
 {
 }
 
+void resctrl_arch_unmount(void)
+{
+}
+
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 {
 	return mpam_resctrl_controls[rid].cdp_enabled;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index ecdb5da50179..20e579067570 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -30,6 +30,9 @@
 
 #include "internal.h"
 
+/* Mutex protecting resctrl_mounted and mount/unmount operations */
+static DEFINE_MUTEX(resctrl_mount_lock);
+
 /* Mutex to protect rdtgroup access. */
 DEFINE_MUTEX(rdtgroup_mutex);
 
@@ -48,7 +51,10 @@ LIST_HEAD(resctrl_schema_all);
  */
 static LIST_HEAD(mon_data_kn_priv_list);
 
-/* The filesystem can only be mounted once. */
+/*
+ * The filesystem can only be mounted once. Can only be updated
+ * while holding both resctrl_mount_lock and rdtgroup_mutex.
+ */
 bool resctrl_mounted;
 
 /* Kernel fs node for "info" directory under root */
@@ -3147,6 +3153,7 @@ static void resctrl_unmount(void)
 {
 	struct rdt_resource *r;
 
+	mutex_lock(&resctrl_mount_lock);
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
@@ -3164,6 +3171,8 @@ static void resctrl_unmount(void)
 	resctrl_mounted = false;
 	mutex_unlock(&rdtgroup_mutex);
 	cpus_read_unlock();
+	resctrl_arch_unmount();
+	mutex_unlock(&resctrl_mount_lock);
 }
 
 static int rdt_get_tree(struct fs_context *fc)
@@ -3175,24 +3184,27 @@ static int rdt_get_tree(struct fs_context *fc)
 	struct rdt_resource *r;
 	int ret;
 
-	DO_ONCE_SLEEPABLE(resctrl_arch_pre_mount);
+	mutex_lock(&resctrl_mount_lock);
 
-	cpus_read_lock();
-	mutex_lock(&rdtgroup_mutex);
 	/*
 	 * resctrl file system can only be mounted once.
 	 */
 	if (resctrl_mounted) {
 		ret = -EBUSY;
-		goto out;
+		goto out_mount_unlock;
 	}
 
 	/* Avoid races from pending operations from a previous mount */
 	if (atomic_read(&rdtgroup_default.waitcount) != 0) {
 		ret = -EBUSY;
-		goto out;
+		goto out_mount_unlock;
 	}
 
+	resctrl_arch_pre_mount();
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
 	if (!resctrl_alloc_capable() && !resctrl_mon_capable()) {
 		ret = invalfc(fc, "No allocation or monitoring features are available or enabled");
 		goto out;
@@ -3287,6 +3299,8 @@ static int rdt_get_tree(struct fs_context *fc)
 	mutex_unlock(&rdtgroup_mutex);
 	cpus_read_unlock();
 
+	mutex_unlock(&resctrl_mount_lock);
+
 	ret = kernfs_get_tree(fc);
 	/*
 	 * resctrl can only be mounted once, new superblock only expected
@@ -3318,6 +3332,10 @@ static int rdt_get_tree(struct fs_context *fc)
 out:
 	mutex_unlock(&rdtgroup_mutex);
 	cpus_read_unlock();
+	resctrl_arch_unmount();
+out_mount_unlock:
+	mutex_unlock(&resctrl_mount_lock);
+
 	return ret;
 }
 
-- 
2.56.0

