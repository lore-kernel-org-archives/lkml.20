Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558927;
	b=0vxe6ZgMAXYaBf1uXV0TqBXha0SlXqwbruT+1K6a/HsW3+wPfAqYsr4QywhroemZwb5R
	 iKonulW0gkhEIusp526GV+KvwfwrEfr0oMssi18X8lbhysguJKtbdGeK+i5yA209fT8Re
	 e1ZaRnw3Sh3ZV/2m74xIpCwtS8rEgNI8Jqjke01LWaspafyKyRokkNxId+vtMKQfEo1qp
	 DCqV8wbDkw7bBBjh3UqV71UEZ9IoJTAwhxWCYdNOO/XHfMvx3a8AtvD/HhJnxL7OUNzjs
	 0zDHnjHAoTql+kC2W4NwFh5XcVpTlkwKrTAZC7Wc1HBvPKIx4pFlK4KfeRfE+YGQSdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558927;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+5qlaDWMaYZq+g/zT+X8W1R4ZTg8PwB4I/CFVXlo+mg=;
	b=5ngjfUtT7kyBlR3p9+6kEhOOZINcmMeNV3u/Zs+hR2E/eN3pbQ395qJ7FVZQOM1twYxS
	 6N6tOarFdQMCmG8FkkISMseLyvqAZe/HtKKiw+jxTH1fZvNrA38Q+/v/R2q4HRZek4T+k
	 Qdfjtcp8gfi8vGhyaIY93Zv9X5xzabfKs4aJUdoRLE456OIJXkO2sz2VYVjQRME6ZcK85
	 Our+e1Hw/gSy5YWvXK2Y68QS3wqavCMZv7tOfMhzANi9J6gkB0cED3BVnY19uHtsX+jLj
	 27bBfk92oNdYsN3ImWCc/66HjVmoVt63/lVZIhQpUlxUkZisWE7BgAJrWLt8j+ApBoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LU634DaR;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB29606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LU634DaR
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+5qlaDWMaYZq+g/zT+X8W1R4ZTg8PwB4I/CFVXlo+mg=;
	b=LU634DaR63ZesVaYZ+jlGPZBfBNj+SBPEVNDDTAgsmdeZf06CGsZkhvMuheicdkIGkTVeHHz5
	2IyqIdKGasOG1nptmBCivKsCjIVNLfYH8J59JYNs6UUEIEU9Lz4vfsrgizzdx73TZ1X1WbQEHu+
	VNrQCh3UwXnHeHUdfCHhV+o=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jQrDF2ZQMzRhS5;
	Fri, 13 Nov 2026 16:35:09 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E3841203AB;
	Fri, 13 Nov 2026 16:35:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 16:35:20 +0800
From: tizi4590 <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <will@kernel.org>, <jic23@kernel.org>,
	<gshan@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 1/2] arm_mpam: resctrl: Use the domain's counter ID
Date: Fri, 13 Nov 2026 16:35:05 +0800
Message-ID: <20261113083506.4129060-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113083506.4129060-1-ruanjinjie@huawei.com>
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

From: Jinjie Ruan <ruanjinjie@huawei.com>

resctrl assigns MBM counters per domain: mbm_L3_assignments takes a
domain ID, a group can have a counter in one domain and none in
another, and resctrl_arch_cntr_read() and resctrl_arch_reset_cntr()
are given the counter to use.

The driver ignores that counter and looks the monitor up in
mbwu_idx_to_mon[], indexed by CLOSID and RMID.
resctrl_arch_config_cntr() fills that array without looking at the
domain, so each group has one monitor for the whole resource.
Whichever assignment is written last selects the monitor the group
reads in every domain.

For example, with the counter ID each group uses for mbm_total_bytes
on each domain and "_" for none:

                                domain 0         domain 1
  mount, mkdir g1               default=0 g1=1   default=0 g1=1
  unassign both on domain 1     default=0 g1=1   default=_ g1=_
  assign g1 on domain 1         default=0 g1=1   default=_ g1=0

g1 is assigned the lowest free counter on domain 1, counter 0. That
assignment is the last one written for g1, so it selects the monitor
g1 reads in every domain. On domain 0, g1 uses counter 1, but reads
the monitor of counter 0:

                      counter whose monitor is read on domain 0
                      default      g1
  expected            0            1
  actual              0            0

That is the default group's monitor.

Translate the counter ID with assigned_counters[], which maps a counter
ID to a monitor of the class and is valid in every domain, and drop
mbwu_idx_to_mon[] with the lookups in __read_mon() and __reset_mon().
With nothing left to record, resctrl_arch_config_cntr() only resets the
monitors of a counter when it is assigned.

Nothing consumes USE_PRE_ALLOCATED, the marker that triggered those
lookups, once they are gone. resctrl only allocates a monitor context
for an MBM event when resctrl_arch_mbm_cntr_assign_enabled() reports
false, and this driver always reports true for the L3, so the MBM
events are always read as assigned counters. Remove the marker, and
the MBM cases of resctrl_arch_mon_ctx_alloc_no_wait() that returned it.

Fixes: a5ff6ef2d73e ("arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
 drivers/resctrl/mpam_internal.h |  15 ---
 drivers/resctrl/mpam_resctrl.c  | 195 ++++++++++++--------------------
 2 files changed, 71 insertions(+), 139 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..e1348d958d05 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -30,14 +30,6 @@ struct platform_device;
 #define PACKED_FOR_KUNIT
 #endif
 
-/*
- * This 'mon' values must not alias an actual monitor, so must be larger than
- * U16_MAX, but not be confused with an errno value, so smaller than
- * (u32)-SZ_4K.
- * USE_PRE_ALLOCATED is used to avoid confusion with an actual monitor.
- */
-#define USE_PRE_ALLOCATED	(U16_MAX + 1)
-
 static inline bool mpam_is_enabled(void)
 {
 	return static_branch_likely(&mpam_enabled);
@@ -309,10 +301,6 @@ enum mon_filter_options {
 };
 
 struct mon_cfg {
-	/*
-	 * mon must be large enough to hold out of range values like
-	 * USE_PRE_ALLOCATED
-	 */
 	u32			mon;
 	u8			pmg;
 	bool			match_pmg;
@@ -455,9 +443,6 @@ struct mpam_resctrl_res {
 struct mpam_resctrl_mon {
 	struct mpam_class	*class;
 
-	/* Array of allocated MBWU monitors, indexed by (closid, rmid). */
-	int			*mbwu_idx_to_mon;
-
 	/* Array of assigned MBWU monitors, indexed by resctrl's cntr_id. */
 	int			*assigned_counters;
 };
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index b28c5c04a87c..05c1bf97c43d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -397,20 +397,13 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
-	if (!mpam_is_enabled())
-		return -EINVAL;
-
-	if (!mon->class)
+	if (!mpam_is_enabled() || !mon->class)
 		return -EINVAL;
 
-	switch (evtid) {
-	case QOS_L3_OCCUP_EVENT_ID:
+	if (evtid == QOS_L3_OCCUP_EVENT_ID) {
 		/* With CDP, one monitor gets used for both code/data reads */
 		return mpam_alloc_csu_mon(mon->class);
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
-		return USE_PRE_ALLOCATED;
-	default:
+	} else {
 		return -EOPNOTSUPP;
 	}
 }
@@ -464,9 +457,15 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
 }
 
-static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
-		      enum mpam_device_features mon_type,
-		      int mon_idx,
+/* The monitor resctrl's counter @cntr_id uses for @cdp_type. */
+static int mon_for_cntr(struct mpam_resctrl_mon *mon, int cntr_id,
+			enum resctrl_conf_type cdp_type)
+{
+	return mon->assigned_counters[resctrl_get_config_index(cntr_id, cdp_type)];
+}
+
+static int __read_mon(struct mpam_component *mon_comp,
+		      enum mpam_device_features mon_type, int mon_idx,
 		      enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
 {
 	struct mon_cfg cfg;
@@ -477,14 +476,6 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 	/* Shift closid to account for CDP */
 	closid = resctrl_get_config_index(closid, cdp_type);
 
-	if (mon_idx == USE_PRE_ALLOCATED) {
-		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
-
-		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
-		if (mon_idx == -1)
-			return -ENOENT;
-	}
-
 	if (irqs_disabled()) {
 		/* Check if we can access this domain without an IPI */
 		return -EIO;
@@ -500,32 +491,6 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 	return mpam_msmon_read(mon_comp, &cfg, mon_type, val);
 }
 
-static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
-			     enum mpam_device_features mon_type,
-			     int mon_idx, u32 closid, u32 rmid, u64 *val)
-{
-	if (cdp_enabled) {
-		u64 code_val = 0, data_val = 0;
-		int err;
-
-		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
-				 CDP_CODE, closid, rmid, &code_val);
-		if (err)
-			return err;
-
-		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
-				 CDP_DATA, closid, rmid, &data_val);
-		if (err)
-			return err;
-
-		*val = code_val + data_val;
-		return 0;
-	}
-
-	return __read_mon(mon, mon_comp, mon_type, mon_idx,
-			  CDP_NONE, closid, rmid, val);
-}
-
 /* MBWU when not in ABMC mode (not supported), and CSU counters. */
 int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
@@ -553,13 +518,31 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 
 	mon_type = mpam_feat_msmon_csu;
 
-	return read_mon_cdp_safe(mon, mon_comp, mon_type, mon_idx,
-				 closid, rmid, val);
+	if (cdp_enabled) {
+		u64 code_val = 0, data_val = 0;
+		int err;
+
+		err = __read_mon(mon_comp, mon_type, mon_idx,
+				 CDP_CODE, closid, rmid, &code_val);
+		if (err)
+			return err;
+
+		err = __read_mon(mon_comp, mon_type, mon_idx,
+				 CDP_DATA, closid, rmid, &data_val);
+		if (err)
+			return err;
+
+		*val = code_val + data_val;
+		return 0;
+	}
+
+	return __read_mon(mon_comp, mon_type, mon_idx,
+			  CDP_NONE, closid, rmid, val);
 }
 
 /* MBWU counters when in ABMC mode */
 int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
-			   u32 closid, u32 rmid, int mon_idx,
+			   u32 closid, u32 rmid, int cntr_id,
 			   enum resctrl_event_id eventid, u64 *val)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
@@ -575,43 +558,38 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
-				 USE_PRE_ALLOCATED, closid, rmid, val);
-}
-
-static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
-			int mon_idx,
-			enum resctrl_conf_type cdp_type, u32 closid, u32 rmid)
-{
-	struct mon_cfg cfg = { };
-
-	if (!mpam_is_enabled())
-		return;
+	if (cdp_enabled) {
+		u64 code_val = 0, data_val = 0;
+		int err;
 
-	/* Shift closid to account for CDP */
-	closid = resctrl_get_config_index(closid, cdp_type);
+		err = __read_mon(mon_comp, mpam_feat_msmon_mbwu,
+				 mon_for_cntr(mon, cntr_id, CDP_CODE),
+				 CDP_CODE, closid, rmid, &code_val);
+		if (err)
+			return err;
 
-	if (mon_idx == USE_PRE_ALLOCATED) {
-		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+		err = __read_mon(mon_comp, mpam_feat_msmon_mbwu,
+				 mon_for_cntr(mon, cntr_id, CDP_DATA),
+				 CDP_DATA, closid, rmid, &data_val);
+		if (err)
+			return err;
 
-		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
+		*val = code_val + data_val;
+		return 0;
 	}
 
-	if (mon_idx == -1)
-		return;
-	cfg.mon = mon_idx;
-	mpam_msmon_reset_mbwu(mon_comp, &cfg);
+	return __read_mon(mon_comp, mpam_feat_msmon_mbwu,
+			  mon_for_cntr(mon, cntr_id, CDP_NONE),
+			  CDP_NONE, closid, rmid, val);
 }
 
-static void reset_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
-			       int mon_idx, u32 closid, u32 rmid)
+/* Reset the monitor resctrl's counter @cntr_id uses for @cdp_type. */
+static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
+			int cntr_id, enum resctrl_conf_type cdp_type)
 {
-	if (cdp_enabled) {
-		__reset_mon(mon, mon_comp, mon_idx, CDP_CODE, closid, rmid);
-		__reset_mon(mon, mon_comp, mon_idx, CDP_DATA, closid, rmid);
-	} else {
-		__reset_mon(mon, mon_comp, mon_idx, CDP_NONE, closid, rmid);
-	}
+	struct mon_cfg cfg = { .mon = mon_for_cntr(mon, cntr_id, cdp_type) };
+
+	mpam_msmon_reset_mbwu(mon_comp, &cfg);
 }
 
 /* Reset an assigned counter */
@@ -632,7 +610,12 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
+	if (cdp_enabled) {
+		__reset_mon(mon, mon_comp, cntr_id, CDP_CODE);
+		__reset_mon(mon, mon_comp, cntr_id, CDP_DATA);
+	} else {
+		__reset_mon(mon, mon_comp, cntr_id, CDP_NONE);
+	}
 }
 
 /*
@@ -1170,22 +1153,6 @@ static void mpam_resctrl_pick_counters(void)
 	}
 }
 
-static void __config_cntr(struct mpam_resctrl_mon *mon, u32 cntr_id,
-			  enum resctrl_conf_type cdp_type, u32 closid, u32 rmid,
-			  bool assign)
-{
-	/* Same CDP index remap as closid; maps cntr_id to assigned_counters[]. */
-	u32 mbwu_idx, mon_idx = resctrl_get_config_index(cntr_id, cdp_type);
-
-	closid = resctrl_get_config_index(closid, cdp_type);
-	mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
-
-	if (assign)
-		mon->mbwu_idx_to_mon[mbwu_idx] = mon->assigned_counters[mon_idx];
-	else
-		mon->mbwu_idx_to_mon[mbwu_idx] = -1;
-}
-
 void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
 			      u32 cntr_id, bool assign)
@@ -1197,19 +1164,13 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 		return;
 	}
 
-	if (!mon->mbwu_idx_to_mon || !mon->assigned_counters) {
-		pr_debug("monitor arrays not allocated\n");
+	if (!mon->assigned_counters) {
+		pr_debug("monitor array not allocated\n");
 		return;
 	}
 
-	if (cdp_enabled) {
-		__config_cntr(mon, cntr_id, CDP_CODE, closid, rmid, assign);
-		__config_cntr(mon, cntr_id, CDP_DATA, closid, rmid, assign);
-	} else {
-		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
-	}
-
-	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+	if (assign)
+		resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
@@ -1296,25 +1257,16 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 {
 	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
 	struct rdt_resource *l3 = &res->resctrl_res;
 	struct mpam_class *class = mon->class;
 	u16 num_mbwu_mon;
 	int *cntrs;
 
-	int *rmid_array __free(kvfree) = kvmalloc_objs(*rmid_array, num_rmid);
-	if (!rmid_array) {
-		pr_debug("Failed to allocate RMID array\n");
-		return -ENOMEM;
-	}
-	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
-
 	num_mbwu_mon = class->props.num_mbwu_mon;
 	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
 	if (IS_ERR(cntrs))
 		return PTR_ERR(cntrs);
 	mon->assigned_counters = cntrs;
-	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
 
 	l3->mon.mbm_cntr_assignable = true;
 	l3->mon.mbm_assign_on_mkdir = true;
@@ -1943,17 +1895,12 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
 {
 	u32 num_mbwu_mon = class->props.num_mbwu_mon;
 
-	if (!mon->mbwu_idx_to_mon)
+	if (!mon->assigned_counters)
 		return;
 
-	if (mon->assigned_counters) {
-		__free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
-		kvfree(mon->assigned_counters);
-		mon->assigned_counters = NULL;
-	}
-
-	kvfree(mon->mbwu_idx_to_mon);
-	mon->mbwu_idx_to_mon = NULL;
+	__free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
+	kvfree(mon->assigned_counters);
+	mon->assigned_counters = NULL;
 }
 
 void mpam_resctrl_teardown_class(struct mpam_class *class)
-- 
2.34.1

