Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440011;
	b=f1LQzysad0te0cI17P/OyBwGgIubHjoO8+LUmLgD2MosQQhb7j6XLndAZcTWoPjDUuwr
	 +FCVK61p9lQQg6qJ3PB721oaF8b4TPr7J3jaMTXfKzxv1AVaxkgA4Otbn9moNSHP42O7G
	 PxxLNPsesZJgPVJASkoFhSDUjLOhagSpbOf3Ljl5we/Ssq8zePv98NMu8kGHJbhYmW/eN
	 ke2V6y0n1GqbLbLqZxVcYCpo49Y5SZ0F5z0JpAqWi2uRafa+Zsux0KPNlecNzzilvJHeE
	 S/OmiIlh+Ky7KjO+KUqxTTwGw/AmBh2m+ytW2I1uEDE2Rjo/wlclYs1UBxWAtVLNq6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440011;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=7bm3t/C8KJVAAPnP4IdqHCepXp4mEsI41K4jjOhVEPo=;
	b=kmUKmUj9NicSJWQgGxAgjkqorQ9/a/Tlkh/3p235Ab/hmZ1HdxtxEedCIYRzRJExHhc6
	 M9+S6w0o4eCWduKFo0BtjmpjYYlw8ZK3uFTid6feXhd9M6J+UwlI3h/xjHIFFraJWL71G
	 rjBY1Xb7yfMPaDoGIgglZk+RaqqsQepAnQGq7au3jdrWeFfyAgcMQ0bi6Bh7i+dF6KjVP
	 qR7mz1q477+9NwMzF98BLbyP1CM0yeXymzQPsGEkApbhSrKmmXzzMmFvj72rQGPjK9meo
	 Zk5k/dDHu3cfMSpldFniDloJasz+MFp5q9xQcHxUXt7K7/ycdhAGfJUNe4zMMG2sRaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="iY0y/S4u";
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60926606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60926606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=iY0y/S4u
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7bm3t/C8KJVAAPnP4IdqHCepXp4mEsI41K4jjOhVEPo=;
	b=iY0y/S4u0uycZ0SpAIvYpY3kOfA77Hfp0TXtBKbvtuWXeHoNifYj9UsOj/89MRhR//N8dY0jJ
	A2D7Mzrz5FjRye07mJyIno2dWOseLCvYidny3VDw/nHML0avW0W7LUrtqqgfc0IocxqTlO+byP+
	3PC36X4fUmnuHrjc3I3tl8k=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jGtQY4q9szmV8Y;
	Sat, 31 Oct 2026 17:46:29 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DDD6B4055B;
	Sat, 31 Oct 2026 17:46:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 17:46:37 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <jic23@kernel.org>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] fs/resctrl: Unmount resctrl with the CDP state it was mounted with
Date: Sat, 31 Oct 2026 17:46:16 +0800
Message-ID: <20261031094616.1691026-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Busy RMIDs of a monitor domain are normally released by the limbo handler
once their cache occupancy drops below the threshold. The handler keeps
running after resctrl is unmounted, and  each RMID left in limbo retains
the CLOSID it was allocated with.

When reading the counter for an RMID in limbo, the architecture translates
the CLOSID associated with that RMID into a PARTID. On arm64 MPAM with CDP
enabled, CLOSID c maps to data PARTID 2 * c and code PARTID 2 * c + 1,
so the same CLOSID selects a different PARTID depending on the CDP state.
resctrl_unmount() clears the CDP state before resctrl_fs_teardown() frees
the groups, so an RMID left in limbo is read using the CDP state of the
next mount rather than the state it was allocated under. A CLOSID from the
upper half of the range then produces a PARTID beyond the MSC's range; the
MSC raises an MPAM error interrupt, and mpam_disable() disables MPAM.

Move the CDP disable after the groups have been torn down, so every
CLOSID freed on unmount is translated with the CDP state it was
allocated under. Keep the RMIDs in limbo instead of forcing them back
to the free list, because a quick remount would otherwise reuse RMIDs
whose counters are still dirty. Pause the limbo handler while the
filesystem is unmounted. At mount, release any RMID left in limbo under
a different CDP state without reading its counter, since its CLOSID no
longer selects the same PARTID, and restart the handler.

x86 RMIDs are independent of the CLOSID, so the CDP state does not
change which counter is read. Only arm64 MPAM systems are affected, and
only when CDP is enabled with the cdp mount option (CDP depends on
CONFIG_EXPERT).

Reproduced on QEMU:
- mount resctrl, create four control groups
- unmount, and mount again with -o cdp.

Before this patch, the limbo handler reads the counters for the limbo RMIDs
using the doubled PARTID:

	mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
	mpam:mpam_disable: MPAM disabled due to hardware error interrupt

After this patch the RMIDs are released before their counters are read, and
the same sequence completes without an error.

Rebased on the below fix.
	https://lore.kernel.org/all/20261031063634.1678345-3-ruanjinjie@huawei.com/

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.3.x
Cc: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Babu Moger <babu.moger@amd.com>
---
 fs/resctrl/internal.h |  1 +
 fs/resctrl/monitor.c  | 60 ++++++++++++++++++++++++++++++++++++++++---
 fs/resctrl/rdtgroup.c | 31 +++++++++++++++++-----
 3 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1c85e06f09bf..ccae796a1489 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -373,6 +373,7 @@ void closid_free(int closid);
 int setup_rmid_lru_list(void);
 
 void free_rmid_lru_list(void);
+void resctrl_limbo_pause(void);
 
 int alloc_rmid(u32 closid);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2002c4af1a5c..292f7f334b4c 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -70,6 +70,16 @@ static u32 *closid_num_dirty_rmid;
  */
 static unsigned int rmid_limbo_count;
 
+/*
+ * @limbo_paused - True if the filesystem is unmounted
+ *     The limbo handler must not read counters until the next mount has
+ *     set the CDP state up.
+ * @limbo_cdp - True if the RMIDs currently in limbo were freed with
+ *     CDP enabled.
+ */
+static bool limbo_paused;
+static bool limbo_cdp;
+
 /*
  * @rmid_entry - The entry in the limbo and free lists.
  */
@@ -350,6 +360,8 @@ static void add_rmid_to_limbo(struct rmid_entry *entry)
 		entry->busy++;
 	}
 
+	if (!rmid_limbo_count)
+		limbo_cdp = resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3);
 	rmid_limbo_count++;
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
 		closid_num_dirty_rmid[entry->closid]++;
@@ -852,6 +864,13 @@ void cqm_handle_limbo(struct work_struct *work)
 	 */
 	mutex_lock(&rdtgroup_mutex);
 
+	/*
+	 * The limbo state is kept across mounts, but can't be read while
+	 * the filesystem is unmounted: the CDP state may have changed.
+	 */
+	if (limbo_paused)
+		goto out_unlock;
+
 	/*
 	 * Ensure the worker is dedicated to a CPU as intended and not
 	 * relocated by workqueue subsystem as part of CPU going offline.
@@ -991,6 +1010,8 @@ void mbm_setup_overflow_handler(struct rdt_l3_mon_domain *dom, unsigned long del
 int setup_rmid_lru_list(void)
 {
 	struct rmid_entry *entry = NULL;
+	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
 	u32 idx_limit;
 	u32 idx;
 	int i;
@@ -1001,11 +1022,37 @@ int setup_rmid_lru_list(void)
 	/*
 	 * Called on every mount, but the number of RMIDs cannot change
 	 * after the first mount, so keep using the same set of rmid_ptrs[]
-	 * until resctrl_exit(). Note that the limbo handler continues to
-	 * access rmid_ptrs[] after resctrl is unmounted.
+	 * until resctrl_exit(). The limbo state is kept too, so that dirty
+	 * RMIDs aren't reused after a quick remount.
 	 */
-	if (rmid_ptrs)
+	if (rmid_ptrs) {
+		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+
+		/*
+		 * An entry freed under a different CDP state can't be read
+		 * with the new one: its CLOSID selects a different PARTID.
+		 * Release those without reading them.
+		 */
+		if (resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3) != limbo_cdp) {
+			list_for_each_entry(d, &r->mon_domains, hdr.list) {
+				if (has_busy_rmid(d))
+					release_limbo_rmids(d);
+			}
+		}
+
+		limbo_paused = false;
+
+		/* Restart the handler for the domains that are still busy. */
+		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
+			list_for_each_entry(d, &r->mon_domains, hdr.list) {
+				if (has_busy_rmid(d))
+					cqm_setup_limbo_handler(d, CQM_LIMBOCHECK_INTERVAL,
+								RESCTRL_PICK_ANY_CPU);
+			}
+		}
+
 		return 0;
+	}
 
 	idx_limit = resctrl_arch_system_num_rmid_idx();
 	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
@@ -1030,9 +1077,16 @@ int setup_rmid_lru_list(void)
 	entry = __rmid_entry(idx);
 	list_del(&entry->list);
 
+	limbo_paused = false;
 	return 0;
 }
 
+void resctrl_limbo_pause(void)
+{
+	lockdep_assert_held(&rdtgroup_mutex);
+	limbo_paused = true;
+}
+
 void free_rmid_lru_list(void)
 {
 	if (!resctrl_arch_mon_capable())
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 20c800e678d5..9fa8388099b6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3152,13 +3152,25 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/*
+	 * Stop the limbo handler before the CDP state changes: it reads the
+	 * entries' CLOSID, which selects a different PARTID. The entries are
+	 * kept for the next mount so that dirty RMIDs aren't reused.
+	 */
+	resctrl_limbo_pause();
+
+	/*
+	 * Clear the CDP state last. free_rmid() translates between CLOSID and
+	 * PARTID using the CDP state; clearing it first would make the
+	 * translation inconsistent for the RMIDs being torn down.
+	 */
+	rdt_disable_ctx();
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
@@ -3195,10 +3207,6 @@ static int rdt_get_tree(struct fs_context *fc)
 		goto out;
 	}
 
-	ret = setup_rmid_lru_list();
-	if (ret)
-		goto out;
-
 	ret = rdtgroup_setup_root(ctx);
 	if (ret)
 		goto out;
@@ -3207,6 +3215,11 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (ret)
 		goto out_root;
 
+	/* The limbo state of the previous mount depends on the CDP state. */
+	ret = setup_rmid_lru_list();
+	if (ret)
+		goto out_disable_ctx;
+
 	ret = schemata_list_create();
 	if (ret)
 		goto out_schemata_free;
@@ -3310,6 +3323,12 @@ static int rdt_get_tree(struct fs_context *fc)
 	closid_exit();
 out_schemata_free:
 	schemata_list_destroy();
+out_disable_ctx:
+	/*
+	 * The mount failed after the limbo handler was restarted: stop it
+	 * again before the CDP state is cleared, as in resctrl_unmount().
+	 */
+	resctrl_limbo_pause();
 	rdt_disable_ctx();
 out_root:
 	rdtgroup_destroy_root();
-- 
2.34.1

