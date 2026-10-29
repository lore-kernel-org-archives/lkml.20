Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277413;
	b=fe3Y/hNi2TMggg0saA1+rwOkgz+pxldCB7TCShZDKNteeLi5C7oAKLF+YjyrXiyUXBzD
	 YReRiV6vHlONmG3/TUwwgSrPJfp8O8qJ3hPFvL9NXyAqHnDuHjZIkuxpC+yLYM3du+Ezz
	 8CBLFLG64wrrkmERQbofLBTgzfGLnNpLVu3xqleBZZ4apSTYRFhOzWCq20xBrsB+YWOK1
	 0ZgQGWS4+pclICGvCC8HzMzf6m7egv6TcvZszbqxjOJRJMtW08YyUsVt6eYh8xUrfVW+c
	 XqgiHFf6exUaVjMJsed4SjorscY/e9S+2IY5NzSQ63OquRIZse0FR1LTu2y9WmOAHEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277413;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Agob3mxTkSGaZEZx4j5S6+DBpuThzoNSaaqrk8jqMB0=;
	b=E5+DIztngdyOxVmPo1LHrvPUj/KtkrbIlIop2lTa50X3g0QakzD+1dlGTdsWlTgLFy6y
	 x3psQ38/xcHFy9UMlsR56NHJbu7/hvmYkpvoryO6AGiHDsZcLk09EFfwrd25CoG6dc8QC
	 N2Kdje6hxbJVwa7Xb8eUK7TCS3QE2mSnmlFbOncIwcCWa5fZV0pspEbI9MpKJM2tvzqUG
	 tk3uYhdlXDJ2Jrgi2EPuYWkfscBTf7UJwbNAidJhP3KkcaRdYDit7LVjm0/7IxdH3Uoba
	 zYSdjFqoCziOLICXBoBcVBzmHDFvj81fLEjoikG7n6gyUjBtZLTM9K5QxzuqTW3/Szw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=k67Btizv;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511C7606A31E;
	Thu, 29 Oct 2026 12:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 511C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=k67Btizv
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Agob3mxTkSGaZEZx4j5S6+DBpuThzoNSaaqrk8jqMB0=;
	b=k67Btizv1fAQItPylmcBlD0pIsexbpL9ZSdTgZyatxhSmAEaEiWO/67ei17si3r2oeut3cxfJ
	Zld1/NcXkOpWSd4DssLH8oWXlRCceQTA61vsE0sWLEzqazlLI2UkhjwjTonVqR15JzQ6baPph+t
	AYactcV8YYmWKgIGyRnPKQk=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHs3wycz1cyNp;
	Thu, 29 Oct 2026 20:36:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 00A1140578;
	Thu, 29 Oct 2026 20:36:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:48 +0800
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
Subject: [RFC PATCH v2 14/19] fs/resctrl: Manage assignable counters for every monitor resource
Date: Thu, 29 Oct 2026 20:36:06 +0800
Message-ID: <20261029123611.1108424-15-ruanjinjie@huawei.com>
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

Creating or removing a monitor group only assigns or frees counters for
the L3 MBM events. Walk every resource that has assignable counters and
handle each of its MBM events.

Set the default event filter for each such resource, build the BMEC file
names from the event names, and register the shared info files once.
resctrl_l3_mon_resource_init() now covers more than the L3, so drop L3
from its name. mbm_L3_assignments keeps its name and stays L3 only.

No functional change as only the L3 can have assignable counters.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/internal.h |  4 +-
 fs/resctrl/monitor.c  | 94 ++++++++++++++++++++++++++-----------------
 fs/resctrl/rdtgroup.c | 28 +++++++------
 3 files changed, 74 insertions(+), 52 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index f84152734fd1..32bc6bda31b7 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -381,9 +381,9 @@ int alloc_rmid(u32 closid);
 
 void free_rmid(u32 closid, u32 rmid);
 
-int resctrl_l3_mon_resource_init(void);
+int resctrl_mon_resource_init(void);
 
-void resctrl_l3_mon_resource_exit(void);
+void resctrl_mon_resource_exit(void);
 
 void mon_event_count(void *info);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 739134e2ff77..9032456ad7c9 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1356,19 +1356,20 @@ static int rdtgroup_assign_cntr_event(struct rdt_l3_mon_domain *d, struct rdtgro
  */
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
-	    !r->mon.mbm_assign_on_mkdir)
-		return;
+	struct mon_evt *mevt;
+	struct rdt_resource *r;
 
-	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID]);
+	for_each_mon_capable_rdt_resource(r) {
+		if (!resctrl_arch_mbm_cntr_assign_enabled(r) ||
+		    !r->mon.mbm_assign_on_mkdir)
+			continue;
 
-	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID]);
+		for_each_mon_event(r, mevt) {
+			if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+			rdtgroup_assign_cntr_event(NULL, rdtgrp, mevt);
+		}
+	}
 }
 
 /*
@@ -1415,18 +1416,19 @@ static void rdtgroup_unassign_cntr_event(struct rdt_l3_mon_domain *d, struct rdt
  */
 void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
-		return;
+	struct mon_evt *mevt;
+	struct rdt_resource *r;
 
-	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID]);
+	for_each_mon_capable_rdt_resource(r) {
+		if (!resctrl_arch_mbm_cntr_assign_enabled(r))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID]);
+		for_each_mon_event(r, mevt) {
+			if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+			rdtgroup_unassign_cntr_event(NULL, rdtgrp, mevt);
+		}
+	}
 }
 
 static int resctrl_parse_mem_transactions(char *tok, u32 *val)
@@ -1954,7 +1956,7 @@ static void closid_num_dirty_rmid_free(void)
 }
 
 /**
- * resctrl_l3_mon_resource_init() - Initialise global monitoring structures.
+ * resctrl_mon_resource_init() - Initialise global monitoring structures.
  *
  * Allocate and initialise global monitor resources that do not belong to a
  * specific domain. i.e. the closid_num_dirty_rmid[] used to find the CLOSID
@@ -1964,37 +1966,49 @@ static void closid_num_dirty_rmid_free(void)
  * Resctrl's cpuhp callbacks may be called before this point to bring a domain
  * online.
  *
+ * The L3 events remain the backing for the MBA software controller and for the
+ * event configuration files, which are named after the L3 events.
+ *
  * Return: 0 for success, or -ENOMEM.
  */
-int resctrl_l3_mon_resource_init(void)
+int resctrl_mon_resource_init(void)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	bool assignable = false, configurable = false;
+	struct rdt_resource *r;
 	int ret;
 
-	if (!r->mon_capable)
+	if (!resctrl_arch_mon_capable())
 		return 0;
 
-	ret = closid_num_dirty_rmid_alloc(r);
+	ret = closid_num_dirty_rmid_alloc(l3);
 	if (ret)
 		return ret;
 
+	/*
+	 * BMEC is L3 only: resctrl_arch_is_evt_configurable() has no resource
+	 * argument. The L2 events are not configurable.
+	 */
 	if (resctrl_arch_is_evt_configurable(QOS_MBM_TOTAL_EVENT_ID)) {
-		mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID].configurable = true;
+		mon_event_all[l3->rid][QOS_MBM_TOTAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_MBM_LOCAL_EVENT_ID)) {
-		mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID].configurable = true;
+		mon_event_all[l3->rid][QOS_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 
-	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(l3, QOS_MBM_LOCAL_EVENT_ID))
 		mba_mbps_default_event = QOS_MBM_LOCAL_EVENT_ID;
-	else if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
+	else if (resctrl_is_mon_event_enabled(l3, QOS_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_MBM_TOTAL_EVENT_ID;
 
-	if (r->mon.mbm_cntr_assignable) {
+	for_each_mon_capable_rdt_resource(r) {
+		if (!r->mon.mbm_cntr_assignable)
+			continue;
+
 		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 			mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
 		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
@@ -2003,26 +2017,32 @@ int resctrl_l3_mon_resource_init(void)
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
 		r->mon.mbm_assign_on_mkdir = true;
+		assignable = true;
+		configurable |= r->mon.mbm_cntr_configurable;
+	}
+
+	if (assignable) {
 		resctrl_file_fflags_init("num_mbm_cntrs",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 		resctrl_file_fflags_init("available_mbm_cntrs",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
-		if (r->mon.mbm_cntr_configurable)
+		if (configurable)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 RFTYPE_RES_CACHE);
-		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 	}
 
+	/* The counter assignment interface is named after the L3 events. */
+	if (l3->mon.mbm_cntr_assignable)
+		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+
 	return 0;
 }
 
-void resctrl_l3_mon_resource_exit(void)
+void resctrl_mon_resource_exit(void)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-
-	if (!r->mon_capable)
+	if (!resctrl_arch_mon_capable())
 		return;
 
 	closid_num_dirty_rmid_free();
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b992f4b5270f..ba36b6b0c085 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1927,6 +1927,7 @@ void resctrl_bmec_files_show(struct rdt_resource *r, struct kernfs_node *l3_mon_
 			     bool show)
 {
 	struct kernfs_node *kn_config, *mon_kn = NULL;
+	struct mon_evt *mevt;
 	char name[32];
 
 	if (!l3_mon_kn) {
@@ -1937,14 +1938,15 @@ void resctrl_bmec_files_show(struct rdt_resource *r, struct kernfs_node *l3_mon_
 		l3_mon_kn = mon_kn;
 	}
 
-	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_total_bytes_config");
-	if (kn_config) {
-		kernfs_show(kn_config, show);
-		kernfs_put(kn_config);
-	}
+	for_each_mon_event(r, mevt) {
+		if (!mevt->configurable)
+			continue;
+
+		sprintf(name, "%s_config", mevt->name);
+		kn_config = kernfs_find_and_get(l3_mon_kn, name);
+		if (!kn_config)
+			continue;
 
-	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_local_bytes_config");
-	if (kn_config) {
 		kernfs_show(kn_config, show);
 		kernfs_put(kn_config);
 	}
@@ -4613,7 +4615,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
  * Called when the first CPU of a domain comes online, regardless of whether
  * the filesystem is mounted.
  * During boot this may be called before global allocations have been made by
- * resctrl_l3_mon_resource_init().
+ * resctrl_mon_resource_init().
  *
  * Called during CPU online that may run as soon as CPU online callbacks
  * are set up during resctrl initialization. The number of supported RMIDs
@@ -4812,13 +4814,13 @@ int resctrl_init(void)
 
 	io_alloc_init();
 
-	ret = resctrl_l3_mon_resource_init();
+	ret = resctrl_mon_resource_init();
 	if (ret)
 		return ret;
 
 	ret = sysfs_create_mount_point(fs_kobj, "resctrl");
 	if (ret) {
-		resctrl_l3_mon_resource_exit();
+		resctrl_mon_resource_exit();
 		return ret;
 	}
 
@@ -4853,7 +4855,7 @@ int resctrl_init(void)
 
 cleanup_mountpoint:
 	sysfs_remove_mount_point(fs_kobj, "resctrl");
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_resource_exit();
 
 	return ret;
 }
@@ -4889,7 +4891,7 @@ static bool resctrl_online_domains_exist(void)
  * When called by the architecture code, all CPUs and resctrl domains must be
  * offline. This ensures the limbo and overflow handlers are not scheduled to
  * run, meaning the data structures they access can be freed by
- * resctrl_l3_mon_resource_exit().
+ * resctrl_mon_resource_exit().
  *
  * After resctrl_exit() returns, the architecture code should return an
  * error from all resctrl_arch_ functions that can do this.
@@ -4916,6 +4918,6 @@ void resctrl_exit(void)
 	 * it can be used to umount resctrl.
 	 */
 
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_resource_exit();
 	free_rmid_lru_list();
 }
-- 
2.34.1

