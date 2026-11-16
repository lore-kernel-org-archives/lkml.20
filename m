Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833979;
	b=KU0CV3A7TPbucJpTN59r/5yhRhiP+JVyERcPfV8/scnMLuQySi2zCQ7gnbzsuA8Mk85D
	 O/uY/xuMK+ErW75O7QU/cyfL5FmeprXRVupS7l/bFjAzOZsRKK45LhS+YCag8Q1wgci+w
	 jrTkvWJocww2aXTst4kz80GHZcNL6HIzD0XGVZHEcyrSvcrSLLz13oCxhjlu9wepAb0wm
	 kJUopjReQuK2uExjneFxv51SdJz8CU9hNqWQbtrjWolUnlJuuzU3YVhNS7131Mdtv1NqO
	 rqiv4wfE3Lw1NjbYZD/vETTfbPmaWVCjmAQaHoKPibRqogzEjfwSeqOngHuPu4nQIHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833979;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BZuvOO3l4YXoHMHZrXA91BbfmYslsw+cbniafIIYhws=;
	b=icrAW+zIxKfbpuq8nu4ZkzNhYMOTQmgLnmwfGPVW6+gUFtBCJyjwB52XdRFTNUIy0mdJ
	 diJA5elF80Th2lrQ0CZC55ALx0b9ETKG+IM/oOZQssSVoS7KZ0DSqFg110WcbrhfaqTFI
	 dpYCptw8BlLNpyxP2tqAFkFG3V8X7P7/BJUFAL7RHGg1Gnx0PYQEZeoK1GZg3GSTZZ4ky
	 +enN2JFRz3s/bXk1R2mweA3NX6iriO9uUHh2sY3Ddv7sm8FFDigxWg/BWSSx9wqB20iB2
	 Fi514fJ0SrTP8u+cyGZ83SF7P73Mhr1uzTTK+sb+lkL+oZORE05zLhKDV4muHmjjk5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OxiujV3n;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D404606A337;
	Mon, 16 Nov 2026 12:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D404606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OxiujV3n
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BZuvOO3l4YXoHMHZrXA91BbfmYslsw+cbniafIIYhws=;
	b=OxiujV3neXKGHFcnXIEzDDb1UlMyMYkPzj+FjQNTnXng6MnFFcRj+vlBfT2wNRREXifCHGKEb
	N7Puk2GmboNT7y1NxEtWwKLqPaUm7Y+9rJaaLdDJmI+RLKmFM5kBH5pSdRRcsWlRB7WU3HWJ8pb
	y8lMhbhGmiAtruX/c5VQ/9M=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxl4TL3z1K96X;
	Mon, 16 Nov 2026 20:59:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 16DD040563;
	Mon, 16 Nov 2026 20:59:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 07/19] x86,fs/resctrl: Track monitor events by scope
Date: Mon, 16 Nov 2026 20:59:02 +0800
Message-ID: <20261116125914.498841-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Monitor data is shown in directories named after the scope where the
counters live: "mon_L3_xx" holds "llc_occupancy" from the L3 resource
and "mbm_total_bytes" from the memory bandwidth resource. resctrl has
been using L3 as both the resource name and the scope name, but they
are not the same thing. A monitor can be shown at a scope that is not
the scope of the resource that implements it, for example memory
bandwidth on a CPU-less node.

L2 and L3 caches support the same monitor event types, so the event ID
alone no longer says which scope an event belongs to.

Index the event table by scope and event ID, and pass the resource to
the helpers that need to find an event: resctrl_is_mon_event_enabled()
and resctrl_get_mon_evt_cfg(). Code that only needs to know whether any
resource has an event uses the new resctrl_is_mon_event_enabled_any().

SNC slices remain part of the L3 scope.

No functional change.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/cpu/resctrl/core.c    |   3 +-
 arch/x86/kernel/cpu/resctrl/monitor.c |   4 +-
 fs/resctrl/ctrlmondata.c              |   5 +-
 fs/resctrl/internal.h                 |  52 +++++++++-
 fs/resctrl/monitor.c                  | 143 +++++++++++++++-----------
 fs/resctrl/rdtgroup.c                 |  46 ++++-----
 include/linux/resctrl.h               |   6 +-
 include/linux/resctrl_types.h         |   7 +-
 8 files changed, 169 insertions(+), 97 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 707fa4e7ed24..e6c1ac5daeda 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -432,12 +432,13 @@ static int domain_setup_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *
  */
 static int l3_mon_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_l3_mon_domain *hw_dom)
 {
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 	size_t tsize = sizeof(*hw_dom->arch_mbm_states[0]);
 	enum resctrl_event_id eventid;
 	int idx;
 
 	for_each_mbm_event_id(eventid) {
-		if (!resctrl_is_mon_event_enabled(eventid))
+		if (!resctrl_is_mon_event_enabled(r, eventid))
 			continue;
 		idx = MBM_STATE_IDX(eventid);
 		hw_dom->arch_mbm_states[idx] = kcalloc(num_rmid, tsize, GFP_KERNEL);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a6a9090c4808..e9c2b4ae9ed4 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -202,7 +202,7 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_domai
 	int idx;
 
 	for_each_mbm_event_id(eventid) {
-		if (!resctrl_is_mon_event_enabled(eventid))
+		if (!resctrl_is_mon_event_enabled(r, eventid))
 			continue;
 		idx = MBM_STATE_IDX(eventid);
 		memset(hw_dom->arch_mbm_states[idx], 0,
@@ -561,7 +561,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 	abmc_cfg.split.cntr_id = cntr_id;
 	abmc_cfg.split.bw_src = rmid;
 	if (assign)
-		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
+		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(r, evtid);
 
 	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
 
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index c70a9939d126..2503970a1479 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -465,6 +465,7 @@ static int smp_mon_event_count(void *arg)
 ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 				      char *buf, size_t nbytes, loff_t off)
 {
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdtgroup *rdtgrp;
 	int ret = 0;
 
@@ -484,12 +485,12 @@ ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 	buf[nbytes - 1] = '\0';
 
 	if (!strcmp(buf, "mbm_local_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_MBM_LOCAL_EVENT_ID;
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "mbm_total_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_MBM_TOTAL_EVENT_ID;
 		else
 			ret = -EINVAL;
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index f7815e4fb53e..fc98c8e7a2d8 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -54,8 +54,8 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
 /**
  * struct mon_evt - Properties of a monitor event
  * @evtid:		event id
- * @rid:		resource that implements this event, recorded by the
- *			architecture when it enables the event
+ * @rid:		resource that implements this event. This is not
+ *			necessarily the scope the event is shown in.
  * @name:		name of the event
  * @evt_cfg:		Event configuration value that represents the
  *			memory transactions (e.g., READS_TO_LOCAL_MEM,
@@ -84,10 +84,52 @@ struct mon_evt {
 	void			*arch_priv;
 };
 
-extern struct mon_evt mon_event_all[QOS_NUM_EVENTS];
+/*
+ * Monitor scopes. A scope is where the counters live, and is what the
+ * "mon_<name>_<id>" directories and the "<NAME>_MON" directories are named
+ * after. The resource that implements an event is recorded in mon_evt::rid
+ * and may be different from the scope, for example "mbm_total_bytes" is
+ * implemented by the memory bandwidth resource but shown at L3 scope.
+ *
+ * SNC slices are domains of the L3 scope, so RESCTRL_L3_NODE maps to the
+ * L3 row.
+ */
+enum resctrl_mon_scope {
+	RESCTRL_MON_SCOPE_NONE,
+	RESCTRL_MON_SCOPE_L2,
+	RESCTRL_MON_SCOPE_L3,
+	RESCTRL_MON_SCOPE_PACKAGE,
+	RESCTRL_MON_SCOPE_NUM,
+};
+
+static inline int resctrl_mon_scope_idx(enum resctrl_scope scope)
+{
+	switch (scope) {
+	case RESCTRL_L2_CACHE:
+		return RESCTRL_MON_SCOPE_L2;
+	case RESCTRL_L3_CACHE:
+	case RESCTRL_L3_NODE:
+		return RESCTRL_MON_SCOPE_L3;
+	case RESCTRL_PACKAGE:
+		return RESCTRL_MON_SCOPE_PACKAGE;
+	default:
+		return RESCTRL_MON_SCOPE_NONE;
+	}
+}
+
+extern struct mon_evt mon_event_all[RESCTRL_MON_SCOPE_NUM][QOS_NUM_EVENTS];
+
+bool resctrl_is_mon_event_enabled_any(enum resctrl_event_id eventid);
+
+static inline struct mon_evt *resctrl_mon_evt(struct rdt_resource *r,
+					      enum resctrl_event_id evtid)
+{
+	return &mon_event_all[resctrl_mon_scope_idx(r->mon_scope)][evtid];
+}
 
-#define for_each_mon_event(mevt) for (mevt = &mon_event_all[QOS_FIRST_EVENT];	\
-				      mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++)
+#define for_each_mon_event(r, mevt)					\
+	for (mevt = resctrl_mon_evt(r, QOS_FIRST_EVENT);		\
+	     mevt < resctrl_mon_evt(r, QOS_NUM_EVENTS); mevt++)
 
 /* Limit for mon_evt::binary_bits */
 #define MAX_BINARY_BITS	27
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 23c1838a7661..ae6c5ecc1019 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -141,7 +141,7 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 	void *arch_priv;
 	u64 val = 0;
 
-	arch_priv = mon_event_all[QOS_OCCUP_EVENT_ID].arch_priv;
+	arch_priv = resctrl_mon_evt(r, QOS_OCCUP_EVENT_ID)->arch_priv;
 	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_OCCUP_EVENT_ID);
 	if (IS_ERR(arch_mon_ctx)) {
 		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
@@ -345,7 +345,7 @@ void free_rmid(u32 closid, u32 rmid)
 
 	entry = __rmid_entry(idx);
 
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
+	if (resctrl_is_mon_event_enabled_any(QOS_OCCUP_EVENT_ID))
 		add_rmid_to_limbo(entry);
 	else
 		list_add_tail(&entry->list, &rmid_free_lru);
@@ -769,7 +769,7 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 
 	rr.r = r;
 	rr.hdr = &d->hdr;
-	rr.evt = &mon_event_all[evtid];
+	rr.evt = resctrl_mon_evt(r, evtid);
 	if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
 		rr.is_mbm_cntr = true;
 	} else {
@@ -797,15 +797,16 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 static void mbm_update(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 		       struct rdtgroup *rdtgrp)
 {
+	enum resctrl_event_id evtid;
+
 	/*
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_MBM_TOTAL_EVENT_ID);
-
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_MBM_LOCAL_EVENT_ID);
+	for_each_mbm_event_id(evtid) {
+		if (resctrl_is_mon_event_enabled(r, evtid))
+			mbm_update_one_event(r, d, rdtgrp, evtid);
+	}
 }
 
 /*
@@ -1023,25 +1024,30 @@ void free_rmid_lru_list(void)
 }
 
 /*
- * All available events. Architecture code marks the ones that
- * are supported by a system using resctrl_enable_mon_event()
- * to set .enabled.
+ * All available events, indexed by monitor scope and event type. Architecture
+ * code marks the ones that are supported by a system using
+ * resctrl_enable_mon_event() to set .enabled. An entity supports an event
+ * when the entry has a name.
  */
-struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
-	MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	false),
-	MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	false),
-	MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	false),
-	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		true),
-	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		true),
-	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	false),
-	MON_EVENT(PMT_EVENT_C1_RES,			"c1_res",		false),
-	MON_EVENT(PMT_EVENT_UNHALTED_CORE_CYCLES,	"unhalted_core_cycles",	false),
-	MON_EVENT(PMT_EVENT_STALLS_LLC_MISS,		"stalls_llc_miss",	false),
-	MON_EVENT(PMT_EVENT_AUTO_C6_RES,		"c6_res",		false),
-	MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES,	"unhalted_ref_cycles",	false),
-	MON_EVENT(PMT_EVENT_UOPS_RETIRED,		"uops_retired",		false),
-	MON_EVENT(PMT_EVENT_INST_RETIRED,		"inst_retired",		false),
-	MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			false),
+struct mon_evt mon_event_all[RESCTRL_MON_SCOPE_NUM][QOS_NUM_EVENTS] = {
+	[RESCTRL_MON_SCOPE_L3] = {
+		MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	false),
+		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	false),
+		MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	false),
+	},
+	[RESCTRL_MON_SCOPE_PACKAGE] = {
+		MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		true),
+		MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		true),
+		MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	false),
+		MON_EVENT(PMT_EVENT_C1_RES,			"c1_res",		false),
+		MON_EVENT(PMT_EVENT_UNHALTED_CORE_CYCLES,	"unhalted_core_cycles",	false),
+		MON_EVENT(PMT_EVENT_STALLS_LLC_MISS,		"stalls_llc_miss",	false),
+		MON_EVENT(PMT_EVENT_AUTO_C6_RES,		"c6_res",		false),
+		MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES,	"unhalted_ref_cycles",	false),
+		MON_EVENT(PMT_EVENT_UOPS_RETIRED,		"uops_retired",		false),
+		MON_EVENT(PMT_EVENT_INST_RETIRED,		"inst_retired",		false),
+		MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			false),
+	},
 };
 
 bool resctrl_enable_mon_event(struct rdt_resource *r,
@@ -1054,10 +1060,14 @@ bool resctrl_enable_mon_event(struct rdt_resource *r,
 			 binary_bits > MAX_BINARY_BITS))
 		return false;
 
-	mevt = &mon_event_all[eventid];
+	mevt = resctrl_mon_evt(r, eventid);
+	if (!mevt->name) {
+		pr_warn("Resource %d does not support event %d\n", r->rid, eventid);
+		return false;
+	}
 	if (mevt->enabled) {
-		pr_warn("Duplicate enable for event %d on resource %d\n",
-			eventid, r->rid);
+		pr_warn("Duplicate enable for event %d at scope %d\n",
+			eventid, resctrl_mon_scope_idx(r->mon_scope));
 		return false;
 	}
 	if (binary_bits && !mevt->is_floating_point) {
@@ -1074,15 +1084,31 @@ bool resctrl_enable_mon_event(struct rdt_resource *r,
 	return true;
 }
 
-bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid)
+bool resctrl_is_mon_event_enabled(struct rdt_resource *r,
+				  enum resctrl_event_id eventid)
 {
 	return eventid >= QOS_FIRST_EVENT && eventid < QOS_NUM_EVENTS &&
-	       mon_event_all[eventid].enabled;
+	       resctrl_mon_evt(r, eventid)->enabled;
+}
+
+bool resctrl_is_mon_event_enabled_any(enum resctrl_event_id eventid)
+{
+	int scope;
+
+	if (eventid < QOS_FIRST_EVENT || eventid >= QOS_NUM_EVENTS)
+		return false;
+
+	for (scope = 0; scope < RESCTRL_MON_SCOPE_NUM; scope++) {
+		if (mon_event_all[scope][eventid].enabled)
+			return true;
+	}
+
+	return false;
 }
 
-u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id evtid)
+u32 resctrl_get_mon_evt_cfg(struct rdt_resource *r, enum resctrl_event_id evtid)
 {
-	return mon_event_all[evtid].evt_cfg;
+	return resctrl_mon_evt(r, evtid)->evt_cfg;
 }
 
 /**
@@ -1216,7 +1242,7 @@ static void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_dom
 	int idx;
 
 	for_each_mbm_event_id(evt) {
-		if (!resctrl_is_mon_event_enabled(evt))
+		if (!resctrl_is_mon_event_enabled(r, evt))
 			continue;
 		idx = MBM_STATE_IDX(evt);
 		memset(d->mbm_states[idx], 0, sizeof(*d->mbm_states[0]) * idx_limit);
@@ -1325,13 +1351,13 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 	    !r->mon.mbm_assign_on_mkdir)
 		return;
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
+					   resctrl_mon_evt(r, QOS_MBM_TOTAL_EVENT_ID));
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
+					   resctrl_mon_evt(r, QOS_MBM_LOCAL_EVENT_ID));
 }
 
 /*
@@ -1383,13 +1409,13 @@ void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
 		return;
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
+					     resctrl_mon_evt(r, QOS_MBM_TOTAL_EVENT_ID));
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
+					     resctrl_mon_evt(r, QOS_MBM_LOCAL_EVENT_ID));
 }
 
 static int resctrl_parse_mem_transactions(char *tok, u32 *val)
@@ -1600,10 +1626,10 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 		 * Initialize the default memory transaction values for
 		 * total and local events.
 		 */
-		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
+			resctrl_mon_evt(r, QOS_MBM_TOTAL_EVENT_ID)->evt_cfg = r->mon.mbm_cfg_mask;
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
+			resctrl_mon_evt(r, QOS_MBM_LOCAL_EVENT_ID)->evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
@@ -1710,8 +1736,8 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 		goto out_unlock;
 	}
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
 			continue;
 
 		sep = false;
@@ -1744,9 +1770,8 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
 {
 	struct mon_evt *mevt;
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid == r->rid && mevt->enabled &&
-		    resctrl_is_mbm_event(mevt->evtid) &&
+	for_each_mon_event(r, mevt) {
+		if (mevt->enabled && resctrl_is_mbm_event(mevt->evtid) &&
 		    !strcmp(mevt->name, name))
 			return mevt;
 	}
@@ -1943,26 +1968,26 @@ int resctrl_l3_mon_resource_init(void)
 		return ret;
 
 	if (resctrl_arch_is_evt_configurable(QOS_MBM_TOTAL_EVENT_ID)) {
-		mon_event_all[QOS_MBM_TOTAL_EVENT_ID].configurable = true;
+		resctrl_mon_evt(r, QOS_MBM_TOTAL_EVENT_ID)->configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_MBM_LOCAL_EVENT_ID)) {
-		mon_event_all[QOS_MBM_LOCAL_EVENT_ID].configurable = true;
+		resctrl_mon_evt(r, QOS_MBM_LOCAL_EVENT_ID)->configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		mba_mbps_default_event = QOS_MBM_LOCAL_EVENT_ID;
-	else if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+	else if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_MBM_TOTAL_EVENT_ID;
 
 	if (r->mon.mbm_cntr_assignable) {
-		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
+			resctrl_mon_evt(r, QOS_MBM_TOTAL_EVENT_ID)->evt_cfg = r->mon.mbm_cfg_mask;
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
+			resctrl_mon_evt(r, QOS_MBM_LOCAL_EVENT_ID)->evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 92f0e3b68784..8154e02b3d1c 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -122,10 +122,10 @@ void rdt_staged_configs_clear(void)
 	}
 }
 
-static bool resctrl_is_mbm_enabled(void)
+static bool resctrl_is_mbm_enabled(struct rdt_resource *r)
 {
-	return (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID) ||
-		resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID));
+	return (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID) ||
+		resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID));
 }
 
 /*
@@ -191,7 +191,7 @@ static int closid_alloc(void)
 	lockdep_assert_held(&rdtgroup_mutex);
 
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
-	    resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID)) {
+	    resctrl_is_mon_event_enabled_any(QOS_OCCUP_EVENT_ID)) {
 		cleanest_closid = resctrl_find_cleanest_closid();
 		if (cleanest_closid < 0)
 			return cleanest_closid;
@@ -1208,8 +1208,8 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 
 	if (!info_kn_lock(of->kn))
 		return -ENOENT;
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled)
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled)
 			continue;
 		seq_printf(seq, "%s\n", mevt->name);
 		if (mevt->configurable &&
@@ -2426,8 +2426,8 @@ static int resctrl_mkdir_event_configs(struct rdt_resource *r, struct kernfs_nod
 	if (ret)
 		return ret;
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
 			continue;
 
 		kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name, kn_subdir->mode, mevt);
@@ -2620,7 +2620,7 @@ static bool supports_mba_mbps(void)
 	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
 
-	return (resctrl_is_mbm_enabled() &&
+	return (resctrl_is_mbm_enabled(rmbm) &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
 		!rmbm->mon.mbm_cntr_assignable);
@@ -3254,8 +3254,8 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (resctrl_arch_alloc_capable() || resctrl_arch_mon_capable())
 		resctrl_mounted = true;
 
-	if (resctrl_is_mbm_enabled()) {
-		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	if (resctrl_is_mbm_enabled(r)) {
 		list_for_each_entry_rcu(dom, &r->mon_domains, hdr.list, lockdep_is_cpus_held())
 			mbm_setup_overflow_handler(dom, MBM_OVERFLOW_INTERVAL,
 						   RESCTRL_PICK_ANY_CPU);
@@ -3520,8 +3520,8 @@ static struct kernfs_node *_mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	if (ret)
 		goto out_destroy;
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled)
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled)
 			continue;
 		priv = mon_get_kn_priv(r->rid, domid, mevt, !hdr);
 		if (WARN_ON_ONCE(!priv)) {
@@ -4559,9 +4559,9 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 	if (r->rid == RDT_RESOURCE_L3 &&
 	    domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
 		d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
-		if (resctrl_is_mbm_enabled())
+		if (resctrl_is_mbm_enabled(r))
 			cancel_delayed_work_sync(&d->mbm_over);
-		if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
 			cancel_delayed_work_sync(&d->cqm_limbo);
 	}
 
@@ -4581,7 +4581,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
+	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
 		/*
 		 * When a package is going down, forcefully
 		 * decrement rmid->ebusy. There is no way to know
@@ -4624,14 +4624,14 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 	enum resctrl_event_id eventid;
 	int idx;
 
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID)) {
+	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID)) {
 		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
 		if (!d->rmid_busy_llc)
 			return -ENOMEM;
 	}
 
 	for_each_mbm_event_id(eventid) {
-		if (!resctrl_is_mon_event_enabled(eventid))
+		if (!resctrl_is_mon_event_enabled(r, eventid))
 			continue;
 		idx = MBM_STATE_IDX(eventid);
 		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
@@ -4639,7 +4639,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 			goto cleanup;
 	}
 
-	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
+	if (resctrl_is_mbm_enabled(r) && r->mon.mbm_cntr_assignable) {
 		tsize = sizeof(*d->cntr_cfg);
 		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
 		if (!d->cntr_cfg)
@@ -4691,13 +4691,13 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 	if (err)
 		goto out_unlock;
 
-	if (resctrl_is_mbm_enabled()) {
+	if (resctrl_is_mbm_enabled(r)) {
 		INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
 		mbm_setup_overflow_handler(d, MBM_OVERFLOW_INTERVAL,
 					   RESCTRL_PICK_ANY_CPU);
 	}
 
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
 		INIT_DELAYED_WORK(&d->cqm_limbo, cqm_handle_limbo);
 
 mkdir:
@@ -4770,13 +4770,13 @@ void resctrl_offline_cpu(unsigned int cpu)
 
 	d = get_mon_domain_from_cpu(cpu, l3);
 	if (d) {
-		if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
+		if (resctrl_is_mbm_enabled(l3) && cpu == d->mbm_work_cpu) {
 			mutex_unlock(&rdtgroup_mutex);
 			cancel_delayed_work_sync(&d->mbm_over);
 			mutex_lock(&rdtgroup_mutex);
 			mbm_setup_overflow_handler(d, 0, cpu);
 		}
-		if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID) &&
+		if (resctrl_is_mon_event_enabled(l3, QOS_OCCUP_EVENT_ID) &&
 		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
 			mutex_unlock(&rdtgroup_mutex);
 			cancel_delayed_work_sync(&d->cqm_limbo);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index f09169c964e6..0a60372299c5 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -423,7 +423,8 @@ bool resctrl_enable_mon_event(struct rdt_resource *r,
 			      enum resctrl_event_id eventid, bool any_cpu,
 			      unsigned int binary_bits, void *arch_priv);
 
-bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid);
+bool resctrl_is_mon_event_enabled(struct rdt_resource *r,
+				  enum resctrl_event_id eventid);
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
@@ -433,7 +434,8 @@ static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
 		eventid <= QOS_MBM_LOCAL_EVENT_ID);
 }
 
-u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
+u32 resctrl_get_mon_evt_cfg(struct rdt_resource *r,
+			    enum resctrl_event_id eventid);
 
 /* Iterate over all memory bandwidth events */
 #define for_each_mbm_event_id(eventid)				\
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index d0e56de038f0..307a74d3c928 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -43,9 +43,10 @@ enum resctrl_event_id {
 	QOS_FIRST_EVENT			= 0x01,
 
 	/*
-	 * Monitor event types. The resource an event belongs to is tracked
-	 * separately. These values match those used to program IA32_QM_EVTSEL
-	 * before reading IA32_QM_CTR on RDT systems.
+	 * Monitor event types. More than one resource may support the same
+	 * event type; the resource supplies the scope. These values match
+	 * those used to program IA32_QM_EVTSEL before reading IA32_QM_CTR on
+	 * RDT systems.
 	 */
 	QOS_OCCUP_EVENT_ID		= 0x01,
 	QOS_MBM_TOTAL_EVENT_ID		= 0x02,
-- 
2.34.1

