Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833980;
	b=sQA7E/WAxck+Kf39tXFdv5QF8w7wweGtXmGBphR7IFQybGSklGzHv/kWBaQdMft0JN+B
	 YSCLt7g7vLQ1Z17O/6PpJL8AgdyVYEbtWkqmxB4WZHqpQV5YH79Wy0xZCQK6c9W8LQYsm
	 rHByUB/4JHE00n1CPnJDfgBghH+nE2/gPpB1LwY7syWF01MKmr54xqsiVl7tkVATapAum
	 o9OlSw2UblmLrkE/yxcFUfUsHLdNPNRNYr+NGfnSG9pNykai2wReBLVlrEgC9xbkqaTVN
	 D8KPquuLLopt7HHROXhzkLRrfDq0kyBzMkBuc2cyi0s1AXe2EQFkK+Z7vJ1K++Qc8og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833980;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=JmN8cB8B58PKb7JwI7Ve+4GxeEyqqosAfqMfFIjSvsk=;
	b=yXjrcT7YsevBsoo/OskNokEHZYmIDJfpd3zMhDhdm0da44hyxPdLHESAs8kdp1zn56vC
	 iaRYo5jwzMl7/Hdye1j6zoepG/UEvnIOEFfZkqXEmkLZLgUgzXj7kP66/S+9vrhz33AmY
	 fM9IPux8Rf0x3ShA6piNnDXCmV+NLAuOTwL2T8/mGbUJoJywKQ9PRc65qq2BfVDcpDhyg
	 xE6GJCUXM8oIcHuBQZIC0X0MI7SF4gARgOpITeib2QxDBWYl1ycqkq3kJu9uTPXWdZUPg
	 /Vgkp/XAwmuTdr4ta3uZFsw+E70A8px1siak6nVYaTlP1kXBeQisHilagXHNaIAWj/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RfO+wWNP;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FB606A88A;
	Mon, 16 Nov 2026 12:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783FB606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RfO+wWNP
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JmN8cB8B58PKb7JwI7Ve+4GxeEyqqosAfqMfFIjSvsk=;
	b=RfO+wWNPbYEZ2kyWdbDuiZvJ5hOyoQFN0327rLbcYteHutM2wxVqRtU10AiUKHEq9v1tme0cX
	x/0dVYiHifW0u5dWn+Jp4GHUws7ZTWu+NCykPADHUoBAXrGE1cD8pg5Jbiz0g+5JCbxZHyTQQbU
	6Aimj8X68FHiiu02YRZCWIM=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jSny66WF2z12LDl;
	Mon, 16 Nov 2026 20:59:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0895740679;
	Mon, 16 Nov 2026 20:59:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:34 +0800
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
Subject: [RFC PATCH v3 05/19] arm_mpam: resctrl: Index monitor state by resource and event
Date: Mon, 16 Nov 2026 20:59:00 +0800
Message-ID: <20261116125914.498841-6-ruanjinjie@huawei.com>
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

Currently, the picked monitor class and assignable counter state are
stored in an array indexed solely by event ID, and every monitor
domain's component array is populated with all events.

Since the monitor class implementing an event is a property of the
resource rather than the display scope, index the array by both
resource and event, and populate each domain using only the events
belonging to its resource.

Also replace the MPAM_MAX_EVENT bound with QOS_NUM_EVENTS to prevent
out-of-bounds array indexing by event ID.

This is done in preparation for L2 support.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 146 ++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 64 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a31c36c302d8..385c54604872 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -37,21 +37,30 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 	     rid++, res = &mpam_resctrl_controls[rid])
 
 /*
- * The classes we've picked to map to resctrl events.
- * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
- * array lets us find the actual class backing the event counters. e.g.
+ * The classes we've picked to map to resctrl events, for each resource.
+ * This array lets us find the actual class backing the event counters. e.g.
  * the only memory bandwidth counters may be on the memory controller, but to
- * make use of them, we pretend they are on L3. Restrict the events considered
- * to those supported by MPAM.
+ * make use of them, we pretend they are on L3.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_MBM_TOTAL_EVENT_ID
-static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
+static struct mpam_resctrl_mon mpam_resctrl_counters[RDT_NUM_RESOURCES][QOS_NUM_EVENTS];
 
-#define for_each_mpam_resctrl_mon(mon, eventid)					\
-	for (eventid = QOS_FIRST_EVENT, mon = &mpam_resctrl_counters[eventid];	\
-	     eventid <= MPAM_MAX_EVENT;						\
-	     eventid++, mon = &mpam_resctrl_counters[eventid])
+static struct mpam_resctrl_mon *
+mpam_resctrl_mon_by_rid(enum resctrl_res_level rid, enum resctrl_event_id evtid)
+{
+	return &mpam_resctrl_counters[rid][evtid];
+}
+
+static struct mpam_resctrl_mon *
+mpam_resctrl_mon(struct rdt_resource *r, enum resctrl_event_id evtid)
+{
+	return mpam_resctrl_mon_by_rid(r->rid, evtid);
+}
+
+#define for_each_mpam_resctrl_mon(mon, r, eventid)				\
+	for (eventid = QOS_FIRST_EVENT, mon = mpam_resctrl_mon(r, eventid);	\
+	     eventid < QOS_NUM_EVENTS;						\
+	     eventid++, mon = mpam_resctrl_mon(r, eventid))
 
 /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
 static DEFINE_MUTEX(domain_list_lock);
@@ -171,9 +180,9 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
-static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_MBM_TOTAL_EVENT_ID];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, QOS_MBM_TOTAL_EVENT_ID);
 
 	if (!mon->class)
 		return;
@@ -181,9 +190,9 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 	if (!mon->assigned_counters)
 		return;
 
-	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
+	r->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
 	if (cdp_enabled)
-		l3->mon.num_mbm_cntrs /= 2;
+		r->mon.num_mbm_cntrs /= 2;
 
 	/*
 	 * Continue as normal even if enabling cdp causes there to be
@@ -377,9 +386,10 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 	return &mpam_resctrl_controls[l].resctrl_res;
 }
 
-static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
+static int resctrl_arch_mon_ctx_alloc_no_wait(struct rdt_resource *r,
+					      enum resctrl_event_id evtid)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, evtid);
 
 	if (!mpam_is_enabled())
 		return -EINVAL;
@@ -412,7 +422,7 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 	do {
 		prepare_to_wait(&resctrl_mon_ctx_waiters, &wait,
 				TASK_INTERRUPTIBLE);
-		*ret = resctrl_arch_mon_ctx_alloc_no_wait(evtid);
+		*ret = resctrl_arch_mon_ctx_alloc_no_wait(r, evtid);
 		if (*ret == -ENOSPC)
 			schedule();
 	} while (*ret == -ENOSPC && !signal_pending(current));
@@ -421,10 +431,11 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 	return ret;
 }
 
-static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
+static void resctrl_arch_mon_ctx_free_no_wait(struct rdt_resource *r,
+					      enum resctrl_event_id evtid,
 					      u32 mon_idx)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, evtid);
 
 	if (!mpam_is_enabled())
 		return;
@@ -445,7 +456,7 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 
 	kfree(arch_mon_ctx);
 
-	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
+	resctrl_arch_mon_ctx_free_no_wait(r, evtid, mon_idx);
 }
 
 static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
@@ -519,7 +530,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	struct mpam_component *mon_comp;
 	u32 mon_idx = *(u32 *)arch_mon_ctx;
 	enum mpam_device_features mon_type;
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, eventid);
 
 	resctrl_arch_rmid_read_context_check();
 
@@ -546,7 +557,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 			   u32 closid, u32 rmid, int mon_idx,
 			   enum resctrl_event_id eventid, u64 *val)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, eventid);
 	struct mpam_resctrl_dom *l3_dom;
 	struct mpam_component *mon_comp;
 
@@ -603,7 +614,7 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 			     u32 closid, u32 rmid, int cntr_id,
 			     enum resctrl_event_id eventid)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, eventid);
 	struct mpam_resctrl_dom *l3_dom;
 	struct mpam_component *mon_comp;
 
@@ -1075,10 +1086,11 @@ static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
 	return_ptr(array);
 }
 
-static void counter_update_class(enum resctrl_event_id evt_id,
+static void counter_update_class(enum resctrl_res_level rid,
+				 enum resctrl_event_id evt_id,
 				 struct mpam_class *class)
 {
-	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
+	struct mpam_class *existing_class = mpam_resctrl_mon_by_rid(rid, evt_id)->class;
 
 	if (existing_class) {
 		if (existing_class->level == 3) {
@@ -1093,7 +1105,7 @@ static void counter_update_class(enum resctrl_event_id evt_id,
 		}
 	}
 
-	mpam_resctrl_counters[evt_id].class = class;
+	mpam_resctrl_mon_by_rid(rid, evt_id)->class = class;
 }
 
 static void mpam_resctrl_pick_counters(void)
@@ -1127,7 +1139,7 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(QOS_OCCUP_EVENT_ID, class);
+				counter_update_class(RDT_RESOURCE_L3, QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
@@ -1149,7 +1161,7 @@ static void mpam_resctrl_pick_counters(void)
 			 * and it's equivalent to mbm_total and so always use
 			 * mbm_total.
 			 */
-			counter_update_class(QOS_MBM_TOTAL_EVENT_ID, class);
+			counter_update_class(RDT_RESOURCE_L3, QOS_MBM_TOTAL_EVENT_ID, class);
 		}
 	}
 }
@@ -1174,7 +1186,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
 			      u32 cntr_id, bool assign)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, evtid);
 
 	if (evtid != QOS_MBM_TOTAL_EVENT_ID) {
 		pr_debug("unexpected event id\n");
@@ -1277,11 +1289,10 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
  * This must run after all event counters have been picked so that any free
  * running counters have already been allocated.
  */
-static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
+static int mpam_resctrl_monitor_init_abmc(struct rdt_resource *r,
+					  struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
-	struct rdt_resource *l3 = &res->resctrl_res;
 	struct mpam_class *class = mon->class;
 	u16 num_mbwu_mon;
 	int *cntrs;
@@ -1300,21 +1311,22 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	mon->assigned_counters = cntrs;
 	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
 
-	l3->mon.mbm_cntr_assignable = true;
-	l3->mon.mbm_assign_on_mkdir = true;
-	l3->mon.mbm_cntr_configurable = false;
-	l3->mon.mbm_cntr_assign_fixed = true;
+	r->mon.mbm_cntr_assignable = true;
+	r->mon.mbm_assign_on_mkdir = true;
+	r->mon.mbm_cntr_configurable = false;
+	r->mon.mbm_cntr_assign_fixed = true;
 
-	mpam_resctrl_monitor_sync_abmc_vals(l3);
+	mpam_resctrl_monitor_sync_abmc_vals(r);
 
 	return 0;
 }
 
-static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
+static int mpam_resctrl_monitor_init(struct rdt_resource *r,
 				     enum resctrl_event_id type)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_resctrl_res *res = container_of(r, struct mpam_resctrl_res,
+						    resctrl_res);
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, type);
 
 	lockdep_assert_cpus_held();
 
@@ -1333,7 +1345,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 */
 	if (!res->class) {
 		pr_warn_once("Faking L3 MSC to enable counters.\n");
-		res->class = mpam_resctrl_counters[type].class;
+		res->class = mon->class;
 	}
 
 	/*
@@ -1341,8 +1353,8 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * monitoring class.
 	 * Setting name is necessary on monitor only platforms.
 	 */
-	l3->name = "L3";
-	l3->mon_scope = RESCTRL_L3_CACHE;
+	r->name = "L3";
+	r->mon_scope = RESCTRL_L3_CACHE;
 
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
@@ -1352,23 +1364,23 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * this does mean userspace needs to know the architecture to correctly
 	 * interpret this value.
 	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
 	if (type == QOS_MBM_TOTAL_EVENT_ID) {
 		int err;
 
-		err = mpam_resctrl_monitor_init_abmc(mon);
+		err = mpam_resctrl_monitor_init_abmc(r, mon);
 		if (err)
 			return err;
 
 		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
-		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
 	if (!resctrl_enable_mon_event(type, false, 0, NULL))
 		return -EINVAL;
 
-	l3->mon_capable = true;
+	r->mon_capable = true;
 
 	return 0;
 }
@@ -1679,7 +1691,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		 * overlapping CPUs and set up the dom->mon_comp array.
 		 */
 
-		for_each_mpam_resctrl_mon(mon, eventid) {
+		for_each_mpam_resctrl_mon(mon, r, eventid) {
 			struct mpam_component *mon_comp;
 
 			if (!mon->class)
@@ -1855,11 +1867,12 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 
 int mpam_resctrl_setup(void)
 {
-	int err = 0;
+	enum resctrl_event_id eventid;
 	struct mpam_resctrl_res *res;
-	enum resctrl_res_level rid;
 	struct mpam_resctrl_mon *mon;
-	enum resctrl_event_id eventid;
+	enum resctrl_res_level rid;
+	struct rdt_resource *r;
+	int err = 0;
 
 	wait_event(wait_cacheinfo_ready, cacheinfo_ready);
 
@@ -1889,14 +1902,16 @@ int mpam_resctrl_setup(void)
 	/* Find some classes to use for monitors */
 	mpam_resctrl_pick_counters();
 
-	for_each_mpam_resctrl_mon(mon, eventid) {
-		if (!mon->class)
-			continue;	// dummy resource
+	for_each_rdt_resource(r) {
+		for_each_mpam_resctrl_mon(mon, r, eventid) {
+			if (!mon->class)
+				continue;	// dummy resource
 
-		err = mpam_resctrl_monitor_init(mon, eventid);
-		if (err) {
-			pr_debug("Failed to initialise event %u\n", eventid);
-			goto internal_error;
+			err = mpam_resctrl_monitor_init(r, eventid);
+			if (err) {
+				pr_debug("Failed to initialise event %u\n", eventid);
+				goto internal_error;
+			}
 		}
 	}
 
@@ -1950,10 +1965,11 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
 
 void mpam_resctrl_teardown_class(struct mpam_class *class)
 {
+	enum resctrl_event_id eventid;
+	struct mpam_resctrl_mon *mon;
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
-	struct mpam_resctrl_mon *mon;
-	enum resctrl_event_id eventid;
+	struct rdt_resource *r;
 
 	might_sleep();
 
@@ -1961,10 +1977,12 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
 		if (res->class == class)
 			res->class = NULL;
 	}
-	for_each_mpam_resctrl_mon(mon, eventid) {
-		if (mon->class == class) {
-			mon->class = NULL;
+	for_each_rdt_resource(r) {
+		for_each_mpam_resctrl_mon(mon, r, eventid) {
+			if (mon->class != class)
+				continue;
 
+			mon->class = NULL;
 			mpam_resctrl_teardown_mon(mon, class);
 		}
 	}
-- 
2.34.1

