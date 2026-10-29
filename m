Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277405;
	b=jKNAy2cAK2q9I4lJS0zdrhKE4A2s9yGX7NnoqTspI2F30YD+XfNlIaAhc5IfKyxY/Uzv
	 Ro8LircrrPHv+iqCqjPLvCOMMlrgTEpnXL7Qv5cYDgNdQ3RjcaYGFGQx+Yl53Ii0O8mBQ
	 +aPrjPXsCmCsLCHWnABFo6Wmo/fn9waraT+sAD3m1yqmwWpRSduQuMVQkf7O1YotLn+5i
	 +LzonCfD5iddzYtHA2qlMSNFqfySx9oFdjgAqhZ+kMiw6g0tzBaeB6WijzcFo39/fVxuI
	 jS6P61McLhfJ1EdbRW517d6LlfDrQ84iyfRI7m/KeWtO7OiQsGKb1Tf6xLqdJluwuZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277405;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=bPzE7pTkyOVunhqhNwVft516HtyogO1jg7OvvXakX0g=;
	b=zL8a2ul1LpB5cNxnqedZuJWiqxirL0wBERFJIPNa/V6YNZk/U7DnrMrp0YaQJlXDqu8W
	 2E92Qzo5xwGfxddq3rggX8foMLl+6vW7cZrCY510XPJtgXZI2NFyG2F9NpdhRwYNZurTl
	 Hl/g0ViCEtGRgSMFuEzY6UZSiIKNiKchDRakU77NOFtBwsdB5JYq/4MGfzrzPqWmFNglv
	 JLNMSb9iprVbnzRRnXovwhEoErmRE52mQzz4DrYPWpYta7jJO/aV7twxJwTDNfYD03UBL
	 kg4yz0xKEbyiY/uam9SBTabYaEyVnBQx3IExHJSXtfmSrY7JwXAkWWc3CzSurAkKmnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mDf1yAQw;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA60606A325;
	Thu, 29 Oct 2026 12:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA60606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mDf1yAQw
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bPzE7pTkyOVunhqhNwVft516HtyogO1jg7OvvXakX0g=;
	b=mDf1yAQwApkO+gOvF8pX8M41WttmfV/1WMk4TvSeHOm/mghD8OOxYL2hhB1uUt9VkRh2X9B0g
	U9Sxbee9zfyMNUJTd+oibYyl2f5sLAyV7u4PUDopwXIt+qf7P6Z0znFB/CESb9cCMc4AsOC/UR4
	QRP2ceAEO1CL5barESMVkyg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHY65ymzpSyc;
	Thu, 29 Oct 2026 20:36:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 679D24057F;
	Thu, 29 Oct 2026 20:36:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 03/19] fs/resctrl: Rename monitor events to drop the L3 prefix
Date: Thu, 29 Oct 2026 20:35:55 +0800
Message-ID: <20261029123611.1108424-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The monitor event IDs have L3 in their names because L3 was the only
scope resctrl supported. MPAM can count the same things on an L2 cache,
so the scope belongs to the resource, not to the event.

Drop the L3 prefix from the event names and use the new names in
resctrl. The values stay the same: x86 writes them to IA32_QM_EVTSEL,
and MBM_STATE_IDX() needs the two MBM IDs to sit next to each other.
Keep the old names as aliases until the architectures have been
converted.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/ctrlmondata.c      | 12 +++---
 fs/resctrl/monitor.c          | 72 +++++++++++++++++------------------
 fs/resctrl/rdtgroup.c         | 24 ++++++------
 include/linux/resctrl.h       | 16 ++++----
 include/linux/resctrl_types.h | 21 ++++++----
 5 files changed, 76 insertions(+), 69 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index cafebdff70dc..c70a9939d126 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -484,13 +484,13 @@ ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 	buf[nbytes - 1] = '\0';
 
 	if (!strcmp(buf, "mbm_local_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			rdtgrp->mba_mbps_event = QOS_L3_MBM_LOCAL_EVENT_ID;
+		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+			rdtgrp->mba_mbps_event = QOS_MBM_LOCAL_EVENT_ID;
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "mbm_total_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			rdtgrp->mba_mbps_event = QOS_L3_MBM_TOTAL_EVENT_ID;
+		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+			rdtgrp->mba_mbps_event = QOS_MBM_TOTAL_EVENT_ID;
 		else
 			ret = -EINVAL;
 	} else {
@@ -516,10 +516,10 @@ int rdtgroup_mba_mbps_event_show(struct kernfs_open_file *of,
 
 	if (rdtgrp) {
 		switch (rdtgrp->mba_mbps_event) {
-		case QOS_L3_MBM_LOCAL_EVENT_ID:
+		case QOS_MBM_LOCAL_EVENT_ID:
 			seq_puts(s, "mbm_local_bytes\n");
 			break;
-		case QOS_L3_MBM_TOTAL_EVENT_ID:
+		case QOS_MBM_TOTAL_EVENT_ID:
 			seq_puts(s, "mbm_total_bytes\n");
 			break;
 		default:
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 9dc076f82fa4..b9c99c71f4f9 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -141,8 +141,8 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 	void *arch_priv;
 	u64 val = 0;
 
-	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
-	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
+	arch_priv = mon_event_all[QOS_OCCUP_EVENT_ID].arch_priv;
+	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_OCCUP_EVENT_ID);
 	if (IS_ERR(arch_mon_ctx)) {
 		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
 				    arch_mon_ctx);
@@ -163,7 +163,7 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 		entry = __rmid_entry(idx);
 		if (!force_free) {
 			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
-						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
+						   entry->rmid, QOS_OCCUP_EVENT_ID,
 						   arch_priv, &val, arch_mon_ctx)) {
 				rmid_dirty = true;
 			} else {
@@ -192,7 +192,7 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 		cur_idx = idx + 1;
 	}
 
-	resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
+	resctrl_arch_mon_ctx_free(r, QOS_OCCUP_EVENT_ID, arch_mon_ctx);
 }
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d)
@@ -345,7 +345,7 @@ void free_rmid(u32 closid, u32 rmid)
 
 	entry = __rmid_entry(idx);
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
 		add_rmid_to_limbo(entry);
 	else
 		list_add_tail(&entry->list, &rmid_free_lru);
@@ -801,11 +801,11 @@ static void mbm_update(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+		mbm_update_one_event(r, d, rdtgrp, QOS_MBM_TOTAL_EVENT_ID);
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+		mbm_update_one_event(r, d, rdtgrp, QOS_MBM_LOCAL_EVENT_ID);
 }
 
 /*
@@ -1029,9 +1029,9 @@ void free_rmid_lru_list(void)
  * to set .enabled.
  */
 struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
-	MON_EVENT(QOS_L3_OCCUP_EVENT_ID,		"llc_occupancy",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(QOS_L3_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(QOS_L3_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
+	MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	RDT_RESOURCE_L3,	false),
+	MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
+	MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
@@ -1319,13 +1319,13 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 	    !r->mon.mbm_assign_on_mkdir)
 		return;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+					   &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+					   &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
 }
 
 /*
@@ -1377,13 +1377,13 @@ void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
 		return;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+					     &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+					     &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
 }
 
 static int resctrl_parse_mem_transactions(char *tok, u32 *val)
@@ -1594,10 +1594,10 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 		 * Initialize the default memory transaction values for
 		 * total and local events.
 		 */
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
+		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
+		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
@@ -1936,27 +1936,27 @@ int resctrl_l3_mon_resource_init(void)
 	if (ret)
 		return ret;
 
-	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
+	if (resctrl_arch_is_evt_configurable(QOS_MBM_TOTAL_EVENT_ID)) {
+		mon_event_all[QOS_MBM_TOTAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
-	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
+	if (resctrl_arch_is_evt_configurable(QOS_MBM_LOCAL_EVENT_ID)) {
+		mon_event_all[QOS_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
-	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
+	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+		mba_mbps_default_event = QOS_MBM_LOCAL_EVENT_ID;
+	else if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+		mba_mbps_default_event = QOS_MBM_TOTAL_EVENT_ID;
 
 	if (r->mon.mbm_cntr_assignable) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
+		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
+		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..92f0e3b68784 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -124,8 +124,8 @@ void rdt_staged_configs_clear(void)
 
 static bool resctrl_is_mbm_enabled(void)
 {
-	return (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID) ||
-		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID));
+	return (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID) ||
+		resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID));
 }
 
 /*
@@ -191,7 +191,7 @@ static int closid_alloc(void)
 	lockdep_assert_held(&rdtgroup_mutex);
 
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
-	    resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
+	    resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID)) {
 		cleanest_closid = resctrl_find_cleanest_closid();
 		if (cleanest_closid < 0)
 			return cleanest_closid;
@@ -1755,7 +1755,7 @@ static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
 	if (!info_kn_lock(of->kn))
 		return -ENOENT;
 
-	mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
+	mbm_config_show(seq, r, QOS_MBM_TOTAL_EVENT_ID);
 
 	info_kn_unlock(of->kn);
 	return 0;
@@ -1769,7 +1769,7 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
 	if (!info_kn_lock(of->kn))
 		return -ENOENT;
 
-	mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
+	mbm_config_show(seq, r, QOS_MBM_LOCAL_EVENT_ID);
 
 	info_kn_unlock(of->kn);
 	return 0;
@@ -1879,7 +1879,7 @@ static ssize_t mbm_total_bytes_config_write(struct kernfs_open_file *of,
 
 	buf[nbytes - 1] = '\0';
 
-	ret = mon_config_write(r, buf, QOS_L3_MBM_TOTAL_EVENT_ID);
+	ret = mon_config_write(r, buf, QOS_MBM_TOTAL_EVENT_ID);
 
 out_unlock:
 	info_kn_unlock(of->kn);
@@ -1908,7 +1908,7 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 
 	buf[nbytes - 1] = '\0';
 
-	ret = mon_config_write(r, buf, QOS_L3_MBM_LOCAL_EVENT_ID);
+	ret = mon_config_write(r, buf, QOS_MBM_LOCAL_EVENT_ID);
 
 out_unlock:
 	info_kn_unlock(of->kn);
@@ -4561,7 +4561,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
 		if (resctrl_is_mbm_enabled())
 			cancel_delayed_work_sync(&d->mbm_over);
-		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
 			cancel_delayed_work_sync(&d->cqm_limbo);
 	}
 
@@ -4581,7 +4581,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
-	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
+	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
 		/*
 		 * When a package is going down, forcefully
 		 * decrement rmid->ebusy. There is no way to know
@@ -4624,7 +4624,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 	enum resctrl_event_id eventid;
 	int idx;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
+	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID)) {
 		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
 		if (!d->rmid_busy_llc)
 			return -ENOMEM;
@@ -4697,7 +4697,7 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 					   RESCTRL_PICK_ANY_CPU);
 	}
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
 		INIT_DELAYED_WORK(&d->cqm_limbo, cqm_handle_limbo);
 
 mkdir:
@@ -4776,7 +4776,7 @@ void resctrl_offline_cpu(unsigned int cpu)
 			mutex_lock(&rdtgroup_mutex);
 			mbm_setup_overflow_handler(d, 0, cpu);
 		}
-		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
+		if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID) &&
 		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
 			mutex_unlock(&rdtgroup_mutex);
 			cancel_delayed_work_sync(&d->cqm_limbo);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca7f4bf..c844f99fb824 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -198,7 +198,7 @@ struct rdt_l3_mon_domain {
 	struct rdt_domain_hdr		hdr;
 	unsigned int			ci_id;
 	unsigned long			*rmid_busy_llc;
-	struct mbm_state		*mbm_states[QOS_NUM_L3_MBM_EVENTS];
+	struct mbm_state		*mbm_states[QOS_NUM_MBM_EVENTS];
 	struct delayed_work		mbm_over;
 	struct delayed_work		cqm_limbo;
 	int				mbm_work_cpu;
@@ -428,20 +428,20 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
 static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
 {
-	return (eventid >= QOS_L3_MBM_TOTAL_EVENT_ID &&
-		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
+	return (eventid >= QOS_MBM_TOTAL_EVENT_ID &&
+		eventid <= QOS_MBM_LOCAL_EVENT_ID);
 }
 
 u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
 
 /* Iterate over all memory bandwidth events */
 #define for_each_mbm_event_id(eventid)				\
-	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
-	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
+	for (eventid = QOS_MBM_TOTAL_EVENT_ID;		\
+	     eventid <= QOS_MBM_LOCAL_EVENT_ID; eventid++)
 
 /* Iterate over memory bandwidth arrays in domain structures */
 #define for_each_mbm_idx(idx)					\
-	for (idx = 0; idx < QOS_NUM_L3_MBM_EVENTS; idx++)
+	for (idx = 0; idx < QOS_NUM_MBM_EVENTS; idx++)
 
 /**
  * resctrl_arch_mon_event_config_write() - Write the config for an event.
@@ -650,8 +650,8 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
  *				and event details.
  * @r:			Resource structure.
  * @d:			The domain in which counter with ID @cntr_id should be configured.
- * @evtid:		Monitoring event type (e.g., QOS_L3_MBM_TOTAL_EVENT_ID
- *			or QOS_L3_MBM_LOCAL_EVENT_ID).
+ * @evtid:		Monitoring event type (e.g., QOS_MBM_TOTAL_EVENT_ID
+ *			or QOS_MBM_LOCAL_EVENT_ID).
  * @rmid:		RMID.
  * @closid:		CLOSID.
  * @cntr_id:		Counter ID to configure.
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index e2e2cf3d9ff6..8679cbe589ec 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -43,12 +43,13 @@ enum resctrl_event_id {
 	QOS_FIRST_EVENT			= 0x01,
 
 	/*
-	 * These values match those used to program IA32_QM_EVTSEL before
-	 * reading IA32_QM_CTR on RDT systems.
+	 * Monitor event types. The resource an event belongs to is tracked
+	 * separately. These values match those used to program IA32_QM_EVTSEL
+	 * before reading IA32_QM_CTR on RDT systems.
 	 */
-	QOS_L3_OCCUP_EVENT_ID		= 0x01,
-	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
-	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
+	QOS_OCCUP_EVENT_ID		= 0x01,
+	QOS_MBM_TOTAL_EVENT_ID		= 0x02,
+	QOS_MBM_LOCAL_EVENT_ID		= 0x03,
 
 	/* Intel Telemetry Events */
 	PMT_EVENT_ENERGY,
@@ -67,7 +68,13 @@ enum resctrl_event_id {
 	QOS_NUM_EVENTS,
 };
 
-#define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
-#define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
+#define QOS_NUM_MBM_EVENTS	(QOS_MBM_LOCAL_EVENT_ID - QOS_MBM_TOTAL_EVENT_ID + 1)
+#define MBM_STATE_IDX(evt)	((evt) - QOS_MBM_TOTAL_EVENT_ID)
+
+/* Old names, kept until every architecture has been converted. */
+#define QOS_L3_OCCUP_EVENT_ID		QOS_OCCUP_EVENT_ID
+#define QOS_L3_MBM_TOTAL_EVENT_ID	QOS_MBM_TOTAL_EVENT_ID
+#define QOS_L3_MBM_LOCAL_EVENT_ID	QOS_MBM_LOCAL_EVENT_ID
+#define QOS_NUM_L3_MBM_EVENTS		QOS_NUM_MBM_EVENTS
 
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.34.1

