Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958369;
	b=hV/D65Y5PvVEIfnTwNvchUJbwnv0KXg1WUMXqRyrqj8p7P1lJhMYZymPY2Y2es2b4ZY5
	 08KIpFuquUwZA+6sS65eBLcPXlJNUxejqMAfVgXF7/o+PBbrh77jhuKZtXw+Hbr2Z+kDq
	 XKOdvdnNRGLRf5ORlMM0O6WwZbKm3JZ4J+CF6WQez+JGnenMREbiwU0euJVtG63zqZxGf
	 lJyGJfBDS5den47ChXkQ5LelUqKLHNGJ1R0h4O8EhdNvIZvNq/JtvGudKFK+8EhIHBbfR
	 OQHNmw33KLVDFf4NE4DNaBKwOUmIvNevT5ofrMx2K6ah1QtObY54Epyq8n72T8H8+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958369;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=lf1KcsPksgadxN6Aa5Rpl4uAsuLUiAZC7zj0gr6Y0TQ=;
	b=fOhCja56vGfkCyN4NgTrensQY4mKc4MoNihKvoFPhq13hgF1vw2toR/JRPr6w/hBTHQM
	 Ugk1bVlLKKmja8EWtSe+GzMiKHJ3c8cJnHMkUyfB2FbtnIA6YaQ/JXTZvzINqqzj6QZ8K
	 yus9OAMrF+0MOQ9Xd/7LjhLQ+KSpK50zHis0mtRTD/AfJYeR0FwnBdlhr3m51HA0vuIDr
	 0ZY/DpvTfaE4FJi6zngWEhOXkOKx4X3VObnvN7MivQdIzQqtLivLWdsZaAtRV6bWV5uxw
	 dUAG4e22oNF5GXIyQq8ISNxVNM1pgeaej86wIi1Q6yWNHYwBUsi+90gjiG7PtVv2y8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Uu4jg3qF;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A42A606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A42A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Uu4jg3qF
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lf1KcsPksgadxN6Aa5Rpl4uAsuLUiAZC7zj0gr6Y0TQ=;
	b=Uu4jg3qF2gQ2F5DwtYMyo56uYNfeOwAMYKgmZC40hbrJLmZZEEhrZetEyIMYNguUIDfPlzMSK
	q2ZfDo7WbXb701VDAR7+tiD0dRYF52LMkCzafz4hPn/FphhfXYtPbqXLFVL53agqhqQ2S7xl9KO
	xn17QEkfe/c7XqheuivQG7E=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jLZ7K2Zb4z12LdP;
	Fri,  6 Nov 2026 17:46:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B6D340561;
	Fri,  6 Nov 2026 17:46:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 6 Nov
 2026 17:46:02 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <ben.horgan@arm.com>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] fs/resctrl: Give a monitor domain the counters the groups already use
Date: Fri, 6 Nov 2026 17:45:37 +0800
Message-ID: <20261106094537.2337188-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

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

g1 now uses counter 0 on domain 1, the counter the default group uses
on domain 0. On x86 each domain has its own counters, so a different ID
on another domain changes nothing else. MPAM maps a counter ID to one
hardware monitor for the whole resource, so the assignment moves g1 to
the default group's monitor on every domain, and on domain 0 g1 reads
the default group's monitor instead of its own.

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
Cc: <stable@vger.kernel.org> # 6.18+
Cc: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Dave Martin <Dave.Martin@arm.com>
---
 fs/resctrl/internal.h |   2 +
 fs/resctrl/monitor.c  | 117 +++++++++++++++++++++++++++++++++++++++++-
 fs/resctrl/rdtgroup.c |   4 ++
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index c95fa6ce62e6..31c1c04a3c51 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -437,6 +437,8 @@ int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of, struct seq_fil
 
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp);
 
+void resctrl_mbm_cntr_assign_domain(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
+
 void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp);
 
 int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 717c3888c2b5..744961a78435 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -425,6 +425,44 @@ static int mbm_cntr_get(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	return -ENOENT;
 }
 
+/*
+ * Return the counter ID @rdtgrp uses for @evtid in a domain other than @d,
+ * taken from the first domain that has one. Counters are allocated on every
+ * domain together, so a group usually has the same ID everywhere. MPAM relies
+ * on this as it maps a counter ID to one monitor for the whole resource; x86
+ * does not. @d is skipped in case it is already on the list.
+ *
+ * Return:
+ * Valid counter ID on success, or -ENOENT on failure.
+ */
+static int mbm_cntr_get_other(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	struct rdt_l3_mon_domain *dom;
+	int cntr_id;
+
+	list_for_each_entry_rcu(dom, &r->mon_domains, hdr.list, lockdep_is_cpus_held()) {
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
@@ -439,8 +477,7 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 
 	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
 		if (!d->cntr_cfg[cntr_id].rdtgrp) {
-			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
-			d->cntr_cfg[cntr_id].evtid = evtid;
+			mbm_cntr_claim(d, cntr_id, rdtgrp, evtid);
 			return cntr_id;
 		}
 	}
@@ -1414,6 +1451,82 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
 }
 
+/*
+ * Give @rdtgrp the counter IDs it uses on the other domains, on @d.
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
+		if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
+			continue;
+
+		/* A group without a counter on any domain stays unassigned. */
+		cntr_id = mbm_cntr_get_other(r, d, rdtgrp, mevt->evtid);
+		if (cntr_id < 0)
+			continue;
+
+		/*
+		 * Allocating a different ID would change the group's mapping for
+		 * the whole resource on MPAM, so leave the event unassigned.
+		 */
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
+ * Called with rdtgroup_mutex held while resctrl is mounted.
+ */
+void resctrl_mbm_cntr_assign_domain(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
+{
+	struct rdtgroup *prgrp, *crgrp;
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
+		return;
+
+	lockdep_assert_held(&rdtgroup_mutex);
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
index 3c002b711024..106e78fb1f1d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4707,6 +4707,10 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
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

