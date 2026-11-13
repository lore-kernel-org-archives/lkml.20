Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558927;
	b=H0Ot+yZRCI8r/ZALjZE4QMUelgxVDYxiXeyyrBKw1N0Zgd2tgftswrsk2Gpy+2yoUt+0
	 S01hGOkQ9igVb0XOZzxmsIKyRx/aEjSQ8tBsYCt5tDaP4hIAbh+tQjlTgP7DSMda7DaL7
	 vIXGlRWyQ2j91CVAwcEiprFq/X4D39kE5xHgpU13pJh+befdisA3dMUJb28u+KZvqYwBD
	 fuOj/MiuilYI3F+mkELKavBC6SZwGNcT3MbxduYMWQzHFzxm9kZ/+sM3p9Jiqw/ITlfcy
	 x5X/Vb+a7IZvoE2V3lHyZWk75e/+D+S7vzqJMolKhPdBGuAb4mu1V0FA/RXZIXaHaFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558927;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=X132ufY391nPowA86jFdiKtqLmI5hdL3TIQJBsPEY5Y=;
	b=tPnCLAnV40ZBIBo8PZ8ZyPKeqUMh2BP+tez6QuM74y5k6CTiqoHX5sPu+jDNprnDJITN
	 K2nuv1jIo/cCGs+/EM/HdceAYY/1VXNvuhTcCmeEk4KklNSkrJpY+Zh8ba/dnjQApyaXT
	 VGoIl/qg0AL8RLJdXLB6ix/hVtspMHndwgoWd7UE5OfpTsh6eJX+/U0JczYoi0y8i4Et1
	 pgER2kvvps2jbYUiXRlzTJ6w2ghQREvp9w0+QEXyFkRR9iWIUae+HBolvnqq8hSVqNykr
	 iHXy0Y8pVRVvpDpQmuVxehDdcCuqja3vhij9SFQrNZfaLPCYCvbKheR6uL/sSw2eg8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WrW71oZA;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5549A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WrW71oZA
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=X132ufY391nPowA86jFdiKtqLmI5hdL3TIQJBsPEY5Y=;
	b=WrW71oZAFiPYxMVFVMl3ViygYlPi7dt+ejCVwZDuinjevodweib4+lQWIc+UYWXJxz1MsiaFm
	XlZPIYbLPat0g64E+AiDV5J4duF03Ta6lT2KU/jarGbElgQZYVhN8ZBq83Uh4cQfJSVOaAKzeJM
	+ys8BVD403yC23fziZ1WGuw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jQrDb338mz12LJy;
	Fri, 13 Nov 2026 16:35:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 605DF40575;
	Fri, 13 Nov 2026 16:35:21 +0800 (CST)
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
Subject: [PATCH v2 2/2] fs/resctrl: Give a monitor domain the counters the groups already use
Date: Fri, 13 Nov 2026 16:35:06 +0800
Message-ID: <20261113083506.4129060-3-ruanjinjie@huawei.com>
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

With assignable MBM counters, resctrl can be mounted while all CPUs of
a monitor domain go offline and one of them comes back, either through
CPU hotplug or because hibernation takes the non-boot CPUs offline. The
domain is destroyed and re-created, and the new domain starts with no
counters assigned. Counters are otherwise only assigned when a group is
created, when rdtgroup_assign_cntrs() takes a free counter in each
monitor domain for each MBM event, so no code revisits the groups that
already exist.

Those groups read "Unassigned" on the new domain, on any system with
assignable MBM counters. A counter assigned to them later through
mbm_L3_assignments is the lowest free one in that domain, so the same
group can end up with a different counter ID on different domains. For
example, with the counter ID each group uses for mbm_total_bytes and
"_" for none:

                               domain 0         domain 1
  mount, mkdir g1              default=0 g1=1   default=0 g1=1
  all CPUs of domain 1 offline default=0 g1=1   (destroyed)
  one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
  assign g1 on domain 1        default=0 g1=1   default=_ g1=0

Each domain has its own counters, so g1 can use counter 0 on domain 1
and counter 1 on domain 0 without affecting the other domain, but until
it is assigned on domain 1 it reads Unassigned there.

Assign the counters when the domain comes online, after its state is
set up. Give each enabled MBM event of every group, including the
monitor groups under mon_groups/, the counter ID the group uses in
another domain, and leave the event unassigned when that ID is already
taken on the new domain. Skip groups in pseudo-lock mode, as their RMID
has been freed and they are not monitored.

A group that has no counter for an event in any domain stays unassigned
on the new domain, as it was before. mbm_assign_on_mkdir only applies
when a group is created, and counters that the user removed through
mbm_L3_assignments stay removed.

Fixes: ef712fe97ec5 ("fs/resctrl: Auto assign counters on mkdir and clean up on group removal")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Dave Martin <Dave.Martin@arm.com>
---
Changes in v2:
- Drop the MPAM part of the changelog, the MPAM driver is fixed by
  "arm_mpam: resctrl: Use the domain's counter ID".
- Link to v1: https://lore.kernel.org/all/20261106094537.2337188-1-ruanjinjie@huawei.com/
---
 fs/resctrl/internal.h |   2 +
 fs/resctrl/monitor.c  | 121 +++++++++++++++++++++++++++++++++++++++++-
 fs/resctrl/rdtgroup.c |   4 ++
 3 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 5a3a11a5bd5c..2e092fbd3051 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -438,6 +438,8 @@ int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of, struct seq_fil
 
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp);
 
+void resctrl_mbm_cntr_assign_domain(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
+
 void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp);
 
 int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index bb6e6e509f4d..604b42d1133f 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -427,6 +427,52 @@ static int mbm_cntr_get(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	return -ENOENT;
 }
 
+/*
+ * mbm_cntr_get_other_domain() - Return the counter ID @rdtgrp uses for @evtid
+ * on a domain other than @d.
+ *
+ * Counters are allocated on every domain together, so a group usually has the
+ * same ID everywhere. The first domain that has a counter ID for the event is
+ * used. @d is skipped in case it is already on the list.
+ *
+ * Context: Called with cpus_read_lock() held.
+ *
+ * Return:
+ * Valid counter ID on success, or -ENOENT on failure.
+ */
+static int mbm_cntr_get_other_domain(struct rdt_resource *r,
+				     struct rdt_l3_mon_domain *d,
+				     struct rdtgroup *rdtgrp,
+				     enum resctrl_event_id evtid)
+{
+	struct rdt_l3_mon_domain *dom;
+
+	lockdep_assert_cpus_held();
+
+	list_for_each_entry_rcu(dom, &r->mon_domains, hdr.list, lockdep_is_cpus_held()) {
+		int cntr_id;
+
+		if (dom == d)
+			continue;
+
+		cntr_id = mbm_cntr_get(r, dom, rdtgrp, evtid);
+		if (cntr_id >= 0)
+			return cntr_id;
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * mbm_cntr_claim() - Mark the counter @cntr_id in domain @d as used by @rdtgrp.
+ */
+static void mbm_cntr_claim(struct rdt_l3_mon_domain *d, int cntr_id,
+			   struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
+	d->cntr_cfg[cntr_id].evtid = evtid;
+}
+
 /*
  * mbm_cntr_alloc() - Initialize and return a new counter ID in the domain @d.
  * Caller must ensure that the specified event is not assigned already.
@@ -441,8 +487,7 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 
 	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
 		if (!d->cntr_cfg[cntr_id].rdtgrp) {
-			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
-			d->cntr_cfg[cntr_id].evtid = evtid;
+			mbm_cntr_claim(d, cntr_id, rdtgrp, evtid);
 			return cntr_id;
 		}
 	}
@@ -1423,6 +1468,78 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
 }
 
+/*
+ * resctrl_mbm_cntr_assign_group() - Give @rdtgrp, on @d, the counter IDs it
+ * uses on the other domains.
+ */
+static void resctrl_mbm_cntr_assign_group(struct rdt_resource *r,
+					  struct rdt_l3_mon_domain *d,
+					  struct rdtgroup *rdtgrp)
+{
+	struct mon_evt *mevt;
+
+	/* Pseudo-locked groups have no RMID and are not monitored. */
+	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
+	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)
+		return;
+
+	for_each_mon_event(mevt) {
+		int cntr_id;
+
+		if (mevt->rid != r->rid || !mevt->enabled ||
+		    !resctrl_is_mbm_event(mevt->evtid))
+			continue;
+
+		/* A group without a counter on any domain stays unassigned. */
+		cntr_id = mbm_cntr_get_other_domain(r, d, rdtgrp, mevt->evtid);
+		if (cntr_id < 0)
+			continue;
+
+		/* Keep the group's ID; do not allocate a different one. */
+		if (d->cntr_cfg[cntr_id].rdtgrp) {
+			pr_warn_ratelimited("Counter %d for %s is in use in domain %d\n",
+					    cntr_id, mevt->name, d->hdr.id);
+			continue;
+		}
+
+		mbm_cntr_claim(d, cntr_id, rdtgrp, mevt->evtid);
+		rdtgroup_assign_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
+				     rdtgrp->closid, cntr_id, true);
+	}
+}
+
+/**
+ * resctrl_mbm_cntr_assign_domain() - Assign counters to the existing groups on
+ *				      a monitor domain that has just come online.
+ * @r:	The resource the domain belongs to.
+ * @d:	The domain that has just come online.
+ *
+ * A new domain has no counters assigned. Give each group, including the
+ * monitor groups below a control group, the counter IDs it uses in the other
+ * domains. A group that has no counter for an event in any domain stays
+ * unassigned: mbm_assign_on_mkdir only applies when a group is created, and
+ * counters that the user removed through mbm_L3_assignments stay removed.
+ *
+ * Context: Called with rdtgroup_mutex and cpus_read_lock() held while resctrl
+ * is mounted.
+ */
+void resctrl_mbm_cntr_assign_domain(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
+{
+	struct rdtgroup *prgrp, *crgrp;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
+		return;
+
+	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
+		resctrl_mbm_cntr_assign_group(r, d, prgrp);
+
+		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
+			resctrl_mbm_cntr_assign_group(r, d, crgrp);
+	}
+}
+
 /*
  * rdtgroup_free_unassign_cntr() - Unassign and reset the counter ID configuration
  * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 40b8f34c3d56..abe5244da379 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4744,6 +4744,10 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 	if (err)
 		goto out_unlock;
 
+	/* The new domain has no counters for the existing groups yet. */
+	if (resctrl_mounted)
+		resctrl_mbm_cntr_assign_domain(r, d);
+
 	if (resctrl_is_mbm_enabled()) {
 		INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
 		mbm_setup_overflow_handler(d, MBM_OVERFLOW_INTERVAL,
-- 
2.34.1

