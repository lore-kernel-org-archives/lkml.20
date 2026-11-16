Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833987;
	b=r0UzmMs8uJWCmu76NoSxT+pva4C3xnO+c5KypTgzHO9IuEWLmFu/aKli0KcXtL/CQN/D
	 ZxkJ+8/08FNPl3oIgpQxctBISFfPZi/KYTFA9GOeEmgnrH4nEqPCPMpvkKw0Yklt/I6Gc
	 CrZQ70JaIZY28w/cjvgctzWCzviiUIDhUUtJfSNTKqBTOg54MSvC9oJG+GmztGrdgHUBe
	 YyKEgeXBiZo+QkcWlbc8JIO/2sVyVtOK91TNwTXYj0z7T3rDnDEO2Gfn7pvx2O7apsjix
	 NeXqnclgl40PZ8nUlm1UX3MuVEOOOpXmcWWr0a8QkPO8DFjlIHghsYv83G1YXAOLG0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833987;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LWCb4AWo4UNWW8tYFiY9wFGDrUTAdjfM7WUP0es79AE=;
	b=BNOeRz74Y2i4UmYRZqBoTEevLGnnMwCtCMmZZ4Ib1L8W1aJyyktoSNURKC9NNCtKnOZ2
	 bxOHe4Ufz1bERjRJOVjC5z6dCuCGnjetMtCkW0UxU5Fc+Yw0xwmMKiJZ6EUyDOcwEamC6
	 alxCmkAt/GVZd23UhfFmjxLfP5P/yw7rT14UUhhrGQmuzKAt5krrOE5kJFUXcqG6zGE+w
	 ppnvI8ht6+Q7Tqkyc9YDc4Bj1QT+UEk9H8iVHChpFiD+BClPj6YsPxdhiMSPB6v2V1lMl
	 8mVrJ0mYSjVlU2lczSUUis69+9w3KC93wrJtVVzuk23q6ciMLfJIqA0QQDJSITGlyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=vIAYTJhB;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8794160A3809;
	Mon, 16 Nov 2026 12:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8794160A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=vIAYTJhB
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LWCb4AWo4UNWW8tYFiY9wFGDrUTAdjfM7WUP0es79AE=;
	b=vIAYTJhB6eHaA2uYPFuFBrOsteftDjYBSaCovSbgWW0hiA3KLd81qonwMjQ/r+dw9xIcvKFqN
	HV8PeqgltPakksgnSSrXv9Kkj8Au6+LDgNJwCzbS+V4N3+5RifDqaT9TvFgmxrNkTUddYOsNXq4
	gRKGwVb8ZerLHb7R7F0kfAU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jSny94Fykz12LDl;
	Mon, 16 Nov 2026 20:59:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B13554056E;
	Mon, 16 Nov 2026 20:59:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:36 +0800
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
Subject: [RFC PATCH v3 10/19] fs/resctrl: Set up MBM state and workers for every monitor resource
Date: Mon, 16 Nov 2026 20:59:05 +0800
Message-ID: <20261116125914.498841-11-ruanjinjie@huawei.com>
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

Monitor domain state and the MBM overflow worker are only set up for L3
domains. Set them up for any resource that has the matching events
enabled, and let the overflow worker find the resource from its domain.

The MBA software controller still uses the L3, so only the L3 worker
updates its bandwidth numbers.

No functional change as only the L3 has monitoring enabled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c  |  8 +++---
 fs/resctrl/rdtgroup.c | 57 +++++++++++++++++++++++--------------------
 2 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index d72d53ba25c7..5924cc7d64f8 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -589,7 +589,7 @@ static void mbm_bw_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct rdt_l3_mon_domain *d;
 	struct mbm_state *m;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid))
 		return;
 	d = container_of(rr->hdr, struct rdt_l3_mon_domain, hdr);
 	m = get_mbm_state(d, closid, rmid, rr->evt->evtid);
@@ -793,7 +793,7 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 	 * If the software controller is enabled, compute the
 	 * bandwidth for this event id.
 	 */
-	if (is_mba_sc(NULL))
+	if (is_mba_sc(NULL) && r->rid == RDT_RESOURCE_L3)
 		mbm_bw_count(rdtgrp, &rr);
 
 	if (rr.arch_mon_ctx)
@@ -909,8 +909,8 @@ void mbm_handle_overflow(struct work_struct *work)
 	if (!is_percpu_thread())
 		goto out_unlock;
 
-	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	d = container_of(work, struct rdt_l3_mon_domain, mbm_over.work);
+	r = resctrl_arch_get_resource(d->hdr.rid);
 
 	/* Domain is going offline */
 	if (cpumask_empty(&d->hdr.cpu_mask))
@@ -923,7 +923,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL))
+		if (is_mba_sc(NULL) && r->rid == RDT_RESOURCE_L3)
 			update_mba_bw(prgrp, d);
 	}
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 8154e02b3d1c..afd6ffa9e324 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3254,9 +3254,11 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (resctrl_arch_alloc_capable() || resctrl_arch_mon_capable())
 		resctrl_mounted = true;
 
-	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-	if (resctrl_is_mbm_enabled(r)) {
-		list_for_each_entry_rcu(dom, &r->mon_domains, hdr.list, lockdep_is_cpus_held())
+	for_each_mon_capable_rdt_resource(r) {
+		if (!resctrl_is_mbm_enabled(r))
+			continue;
+		list_for_each_entry_rcu(dom, &r->mon_domains, hdr.list,
+					lockdep_is_cpus_held())
 			mbm_setup_overflow_handler(dom, MBM_OVERFLOW_INTERVAL,
 						   RESCTRL_PICK_ANY_CPU);
 	}
@@ -4498,7 +4500,13 @@ static void rdtgroup_setup_default(void)
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-static void domain_destroy_l3_mon_state(struct rdt_l3_mon_domain *d)
+/* Only cache resources use the struct rdt_l3_mon_domain layout. */
+static bool rdt_mon_domain_is_cache(const struct rdt_domain_hdr *hdr)
+{
+	return hdr->rid == RDT_RESOURCE_L2 || hdr->rid == RDT_RESOURCE_L3;
+}
+
+static void domain_destroy_mon_state(struct rdt_l3_mon_domain *d)
 {
 	int idx;
 
@@ -4556,8 +4564,8 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 	 * the domain that has the workers' struct delayed_work embedded.
 	 * Do so before taking rdtgroup_mutex since the workers also acquire it.
 	 */
-	if (r->rid == RDT_RESOURCE_L3 &&
-	    domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
+	if (rdt_mon_domain_is_cache(hdr) &&
+	    domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid)) {
 		d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
 		if (resctrl_is_mbm_enabled(r))
 			cancel_delayed_work_sync(&d->mbm_over);
@@ -4574,10 +4582,8 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 	if (resctrl_mounted && resctrl_arch_mon_capable())
 		rmdir_mondata_subdir_allrdtgrp(r, hdr);
 
-	if (r->rid != RDT_RESOURCE_L3)
-		goto out_unlock;
-
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!rdt_mon_domain_is_cache(hdr) ||
+	    !domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
@@ -4593,13 +4599,13 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		__check_limbo(d, true);
 	}
 
-	domain_destroy_l3_mon_state(d);
+	domain_destroy_mon_state(d);
 out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
 /**
- * domain_setup_l3_mon_state() -  Initialise domain monitoring structures.
+ * domain_setup_mon_state() -  Initialise domain monitoring structures.
  * @r:	The resource for the newly online domain.
  * @d:	The newly online domain.
  *
@@ -4617,7 +4623,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
  *
  * Return: 0 for success, or -ENOMEM.
  */
-static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
+static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
 {
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	size_t tsize = sizeof(*d->mbm_states[0]);
@@ -4680,21 +4686,21 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (r->rid != RDT_RESOURCE_L3)
+	if (!rdt_mon_domain_is_cache(hdr))
 		goto mkdir;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
-	err = domain_setup_l3_mon_state(r, d);
+	err = domain_setup_mon_state(r, d);
 	if (err)
 		goto out_unlock;
 
 	if (resctrl_is_mbm_enabled(r)) {
 		INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
 		mbm_setup_overflow_handler(d, MBM_OVERFLOW_INTERVAL,
-					   RESCTRL_PICK_ANY_CPU);
+					  RESCTRL_PICK_ANY_CPU);
 	}
 
 	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
@@ -4753,7 +4759,7 @@ static struct rdt_l3_mon_domain *get_mon_domain_from_cpu(int cpu,
 
 void resctrl_offline_cpu(unsigned int cpu)
 {
-	struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
 	struct rdt_l3_mon_domain *d;
 	struct rdtgroup *rdtgrp;
 
@@ -4765,18 +4771,18 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
-	if (!l3->mon_capable)
-		goto out_unlock;
-
-	d = get_mon_domain_from_cpu(cpu, l3);
-	if (d) {
-		if (resctrl_is_mbm_enabled(l3) && cpu == d->mbm_work_cpu) {
+	for_each_mon_capable_rdt_resource(r) {
+		d = get_mon_domain_from_cpu(cpu, r);
+		/* Only cache domains carry the MBM and limbo work fields. */
+		if (!d || !rdt_mon_domain_is_cache(&d->hdr))
+			continue;
+		if (resctrl_is_mbm_enabled(r) && cpu == d->mbm_work_cpu) {
 			mutex_unlock(&rdtgroup_mutex);
 			cancel_delayed_work_sync(&d->mbm_over);
 			mutex_lock(&rdtgroup_mutex);
 			mbm_setup_overflow_handler(d, 0, cpu);
 		}
-		if (resctrl_is_mon_event_enabled(l3, QOS_OCCUP_EVENT_ID) &&
+		if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID) &&
 		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
 			mutex_unlock(&rdtgroup_mutex);
 			cancel_delayed_work_sync(&d->cqm_limbo);
@@ -4785,7 +4791,6 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
-out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.34.1

