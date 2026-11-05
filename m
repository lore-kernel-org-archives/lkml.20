Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862605;
	b=Yf6u4XPYxAmd/IzbIFlFPZllN5qHzFLS+SwO3oMR4nWxYkPLev13Gy7xXZektqDqDx1H
	 ituDJRx3p97siTlRgdjP7cxu/t2oY3lqVAO5ht2eOzLbfg59qgx2f9ssBGkZXdei/3kkF
	 pZPcwquWVehwNopz4/dt0fa8TccK6sLE9qhuGCIBTBo60vGWD2YehT0IP3TfNUk2h9PMU
	 Qs+7FIwapdRr5X86BNgbCrUBq+/ZQb0idStcxSpdZWz9AP5ikjc7SyuRZkewh1vsx5oJ4
	 PMgHraz/V5Or2YFsiJMKIvUqMwMHFxlMq4PHfxzGhkHr+dKyCmKTi3RqIagOGwvHlZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862605;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=yKft9jvOXTMdxLJIwsVqt3lnkE9AEpuQmHsPoliL84A=;
	b=LW0+EuuTcnf+9sKhDC7UUa7NIoPHUwRi1vAuSm7JY2O/rFdwhV2cQRoZvVxg/rSS3jgt
	 KQ/Q+xudSSunvvp0079UZiq00HynUXdiRYF1gB0EU/MAOP6wOiJ/YyPFuWgm8wyiUj//e
	 0TBb87/mMttLOhNfUEBHOMvNZZohgEGNKNAN5OrO0zpbdeXPE9Bfc0Znc66BHd6e5iuol
	 ChwOy1xxhLqaHw2hQLmRF/3Ycsg8WX5N9niOZggCmw1hF410+idmRU7X8IBsGyP+gguMB
	 2HxNhBsFAKxBZ3HK/kIeCr1AE7Kdfbt69kTYvMcbZz4f47naCarIdnIerRbvrHVY1wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dLcxkVd3;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA8606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDA8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dLcxkVd3
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yKft9jvOXTMdxLJIwsVqt3lnkE9AEpuQmHsPoliL84A=;
	b=dLcxkVd3bpYffuUDyJR1xdF7NgESCpUIrfi3FJrTO7oisaz26Z4+kDP3LxpPZxEp9EnGGQcBM
	faZvqCYDZYg6FeZyEG+zbtVrW3onXE6juK4lsSMkAfSRnYpqSfm1EMufOcsnOGTtwYiHZCMiZB9
	pJSJWZQzsR3ALfQfd7pq+qQ=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jKtj745WPzpSvl;
	Thu,  5 Nov 2026 15:09:31 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 30E532011D;
	Thu,  5 Nov 2026 15:09:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:09:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <ben.horgan@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 3/3] fs/resctrl: Unmount resctrl with the CDP state it was mounted with
Date: Thu, 5 Nov 2026 15:09:34 +0800
Message-ID: <20261105070934.2258613-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105070934.2258613-1-ruanjinjie@huawei.com>
References: <20261105070934.2258613-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

resctrl can be mounted without CDP, unmounted, and mounted again with
CDP enabled. A group's RMID is not returned to the free list when the
group is removed: it stays in limbo until the cache lines tagged with it
are evicted, and a limbo worker reads its occupancy counter in the
meantime. When resctrl is mounted again, the worker reads the RMIDs of
the groups removed by the unmount.

On MPAM the counter is selected by the PARTID of the CLOSID that owned
the RMID. Without CDP, CLOSID c is PARTID c; with CDP it is PARTIDs 2c
and 2c+1. resctrl_unmount() clears the CDP state before it removes the
groups, so their monitor configuration is also removed with a different
CLOSID to PARTID mapping. With 5 PARTIDs:

  mount                  CDP off, CLOSID c -> PARTID c
  mkdir g1..g4           CLOSIDs 1..4
  umount
    rdt_disable_ctx()    clear CDP
    remove g1..g4        RMIDs enter limbo with CLOSIDs 1..4
  mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
  limbo worker           reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
                         MSC error interrupt, mpam_disable()

The groups are removed after rdt_disable_ctx() clears CDP, so their
monitor configuration is cleared with a CLOSID to PARTID mapping that
differs from the one used to set it up.

Clear the CDP state after the groups are removed. While resctrl is
unmounted, don't read the RMIDs in limbo. When resctrl is mounted,
return the RMIDs freed under the other CDP state to the free list
without reading their counters, then restart the limbo worker unless it
is already queued. The RMIDs stay in limbo across the unmount so that a
quick remount does not give a new group an RMID that cache lines from
the removed group still carry.

Only MPAM with CDP enabled through the cdp or cdpl2 mount option is
affected; CDP depends on CONFIG_EXPERT. x86 is not affected as its RMID
does not depend on the CLOSID.

Reproduced on QEMU with the sequence above:

	mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
	mpam:mpam_disable: MPAM disabled due to hardware error interrupt

With the change the sequence completes without an error.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Cc: <stable@vger.kernel.org> # 7.1+
Cc: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Babu Moger <babu.moger@amd.com>
Link: https://lore.kernel.org/all/20261020134239.3921377-7-ruanjinjie@huawei.com/
---
v4:
- Use resctrl_mounted instead of a separate limbo_paused flag, as the MBM
  overflow handler does.
- Record the CDP state once when resctrl is mounted instead of on every
  RMID that is freed.
- Add resctrl_limbo_resume(), called once resctrl_mounted is set.
- Treat CDP enabled on either cache as a change of the CDP state.
- Only release RMIDs where the RMID depends on the CLOSID, and skip
  domains that have no occupancy bitmap.
- Restart the limbo worker only when it is not already queued.
- Start the limbo handler without a delay.
- Update cqm_work_cpu only when schedule_delayed_work_on() queued the
  work, so it always names the CPU the work is queued on.
- Previous Link: https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/
---
 fs/resctrl/internal.h |  1 +
 fs/resctrl/monitor.c  | 71 ++++++++++++++++++++++++++++++++++++++-----
 fs/resctrl/rdtgroup.c |  7 +++--
 3 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1c85e06f09bf..c95fa6ce62e6 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -373,6 +373,7 @@ void closid_free(int closid);
 int setup_rmid_lru_list(void);
 
 void free_rmid_lru_list(void);
+void resctrl_limbo_resume(void);
 
 int alloc_rmid(u32 closid);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ae9ddd380515..717c3888c2b5 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -70,6 +70,11 @@ static u32 *closid_num_dirty_rmid;
  */
 static unsigned int rmid_limbo_count;
 
+/*
+ * @limbo_cdp - The CDP state under which the RMIDs in limbo were freed.
+ */
+static bool limbo_cdp;
+
 /*
  * @rmid_entry - The entry in the limbo and free lists.
  */
@@ -852,6 +857,10 @@ void cqm_handle_limbo(struct work_struct *work)
 	 */
 	mutex_lock(&rdtgroup_mutex);
 
+	/* Don't read the RMIDs in limbo until a mount sets up the CDP state. */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) && !resctrl_mounted)
+		goto out_unlock;
+
 	/*
 	 * Ensure the worker is dedicated to a CPU as intended and not
 	 * relocated by workqueue subsystem as part of CPU going offline.
@@ -868,10 +877,12 @@ void cqm_handle_limbo(struct work_struct *work)
 	__check_limbo(d);
 
 	if (has_busy_rmid(d)) {
-		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
-							   RESCTRL_PICK_ANY_CPU);
-		schedule_delayed_work_on(d->cqm_work_cpu, &d->cqm_limbo,
-					 delay);
+		int cpu;
+
+		cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
+					       RESCTRL_PICK_ANY_CPU);
+		if (schedule_delayed_work_on(cpu, &d->cqm_limbo, delay))
+			d->cqm_work_cpu = cpu;
 	}
 
 out_unlock:
@@ -893,10 +904,13 @@ void cqm_setup_limbo_handler(struct rdt_l3_mon_domain *dom, unsigned long delay_
 	int cpu;
 
 	cpu = cpumask_any_housekeeping(&dom->hdr.cpu_mask, exclude_cpu);
-	dom->cqm_work_cpu = cpu;
+	if (cpu >= nr_cpu_ids) {
+		dom->cqm_work_cpu = cpu;
+		return;
+	}
 
-	if (cpu < nr_cpu_ids)
-		schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay);
+	if (schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay))
+		dom->cqm_work_cpu = cpu;
 }
 
 void mbm_handle_overflow(struct work_struct *work)
@@ -1033,6 +1047,49 @@ int setup_rmid_lru_list(void)
 	return 0;
 }
 
+/**
+ * resctrl_limbo_resume() - Resume RMID limbo handling after a mount.
+ *
+ * Release the RMIDs that were freed under another CDP state without
+ * reading them, and restart the limbo handler.
+ */
+void resctrl_limbo_resume(void)
+{
+	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
+	bool cdp;
+
+	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) ||
+	    !resctrl_arch_mon_capable())
+		return;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+
+	cdp = resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L2) ||
+	      resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3);
+
+	if (cdp != limbo_cdp) {
+		list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+					lockdep_is_cpus_held()) {
+			if (d->rmid_busy_llc && has_busy_rmid(d))
+				release_limbo_rmids(d);
+		}
+	}
+	limbo_cdp = cdp;
+
+	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+				lockdep_is_cpus_held()) {
+		/* A queued worker will run, don't move its cqm_work_cpu. */
+		if (has_busy_rmid(d) && !delayed_work_pending(&d->cqm_limbo))
+			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+	}
+}
+
 void free_rmid_lru_list(void)
 {
 	if (!resctrl_arch_mon_capable())
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5d0351453c2f..e6b64a5c9302 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3150,13 +3150,14 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/* Remove the groups under the CDP state they were set up with. */
+	rdt_disable_ctx();
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
@@ -3261,6 +3262,8 @@ static int rdt_get_tree(struct fs_context *fc)
 						   RESCTRL_PICK_ANY_CPU);
 	}
 
+	resctrl_limbo_resume();
+
 	/*
 	 * Ensure root remains accessible after mutex is unlocked so that
 	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s
-- 
2.34.1

