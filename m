Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277417;
	b=WenOEZg6nKvGozb0GG1AGoFUo74r2tECQ/uuQTcRAxMiQAc9S+b9ZBUBZZ1Zwjubamrg
	 639zx0A6UQrkVKBvylecNuZ57x6o2La/G5sPlv+k8YyW/V6+Uztc1oCABOXANfWVMxNMr
	 o+6RqJcEA0xrICm6kvLvXz767e8l+12h54LgBld1qmSYQ8ER/oxuic24rzqExj1SgCt2Z
	 z9UJMAmbi6ILs5lltQ+bdaDlQen38/vG86zmgzkC2ZIKkVFpcd2tCrRsCDayj0gKSYUk3
	 /pnkeEtO3gvDpn8jEmgkL9Fy1cV48SgclS4UyHscby+hqgwpRjcFVS/TdpdaNG8St6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277417;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=CMuvd3+9XJkSziY44lXdy/sLtp3FpnTake3tX9vFQbw=;
	b=K8hMjVMHpT8CGrDb6JpIMkGFFYWEISKoH68Ri5L4R5uhbWGza1gUb1YEQPX7CL7XW4uj
	 QkP9MGw3dZRc6v3zAfw8NmH4JJvow999taAosUjfWzUqHD6hJ1NS8kb1Sgg8SAOQ8zqgq
	 IR3yZwfpggnOi3d5hffSXcsvQCKP5b6pUIvzzE0K08GfXkW7pK9hLtakTAFBn5ZAKCHg6
	 usm+8fWV+rfnz16blRFZhqcaEFjLAuh+asiYreQpRZCV7MpnzsBCl9G8SdlvC3b4fPLlY
	 lomUFl6d6K9ucUiVyqCOP8qWnOlBHsrMdpCZH5KC49s5PYbR7bKmLKTYXbJxq7S/bmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lYx1dOVx;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7997260A3806;
	Thu, 29 Oct 2026 12:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7997260A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lYx1dOVx
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CMuvd3+9XJkSziY44lXdy/sLtp3FpnTake3tX9vFQbw=;
	b=lYx1dOVxe9axrEKDiLFkh6J5Yov1v1RnHNDGhuMITxnEJ3VHH/YoTe18ndTOaBJOJpYuNvQoe
	I4ChxVOLtCsCYZ27RYB9W9pGs99fbPozZnuFlghgoh1mmgalUJbkrRxDrK77JwlUrdTxiB2xT0z
	ekddhbPBLhHDpAHqNqXwPZw=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHp4qcvz1prKl;
	Thu, 29 Oct 2026 20:36:38 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 73D8C40537;
	Thu, 29 Oct 2026 20:36:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:46 +0800
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
Subject: [RFC PATCH v2 12/19] fs/resctrl: Set up MBM state and workers for every monitor resource
Date: Thu, 29 Oct 2026 20:36:04 +0800
Message-ID: <20261029123611.1108424-13-ruanjinjie@huawei.com>
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

Monitor domain state and the MBM overflow worker are only set up for L3
domains. Set them up for any resource that has the matching events
enabled, and let the overflow worker find the resource from its domain.

The MBA software controller still uses the L3, so only the L3 worker
updates its bandwidth numbers.

No functional change as only the L3 has monitoring enabled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c  |  8 ++---
 fs/resctrl/rdtgroup.c | 78 ++++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 3544dd2a983a..4d90f784a4cf 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -586,7 +586,7 @@ static void mbm_bw_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct rdt_l3_mon_domain *d;
 	struct mbm_state *m;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid))
 		return;
 	d = container_of(rr->hdr, struct rdt_l3_mon_domain, hdr);
 	m = get_mbm_state(d, closid, rmid, rr->evt->evtid);
@@ -790,7 +790,7 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 	 * If the software controller is enabled, compute the
 	 * bandwidth for this event id.
 	 */
-	if (is_mba_sc(NULL))
+	if (is_mba_sc(NULL) && r->rid == RDT_RESOURCE_L3)
 		mbm_bw_count(rdtgrp, &rr);
 
 	if (rr.arch_mon_ctx)
@@ -906,8 +906,8 @@ void mbm_handle_overflow(struct work_struct *work)
 	if (!is_percpu_thread())
 		goto out_unlock;
 
-	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	d = container_of(work, struct rdt_l3_mon_domain, mbm_over.work);
+	r = resctrl_arch_get_resource(d->hdr.rid);
 
 	/* Domain is going offline */
 	if (cpumask_empty(&d->hdr.cpu_mask))
@@ -920,7 +920,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL))
+		if (is_mba_sc(NULL) && r->rid == RDT_RESOURCE_L3)
 			update_mba_bw(prgrp, d);
 	}
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 8154e02b3d1c..b992f4b5270f 100644
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
@@ -4680,27 +4686,25 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (r->rid != RDT_RESOURCE_L3)
-		goto mkdir;
+	if (rdt_mon_domain_is_cache(hdr)) {
+		if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
+			goto out_unlock;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
-		goto out_unlock;
+		d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
+		err = domain_setup_mon_state(r, d);
+		if (err)
+			goto out_unlock;
 
-	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
-	err = domain_setup_l3_mon_state(r, d);
-	if (err)
-		goto out_unlock;
+		if (resctrl_is_mbm_enabled(r)) {
+			INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
+			mbm_setup_overflow_handler(d, MBM_OVERFLOW_INTERVAL,
+						   RESCTRL_PICK_ANY_CPU);
+		}
 
-	if (resctrl_is_mbm_enabled(r)) {
-		INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
-		mbm_setup_overflow_handler(d, MBM_OVERFLOW_INTERVAL,
-					   RESCTRL_PICK_ANY_CPU);
+		if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
+			INIT_DELAYED_WORK(&d->cqm_limbo, cqm_handle_limbo);
 	}
 
-	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
-		INIT_DELAYED_WORK(&d->cqm_limbo, cqm_handle_limbo);
-
-mkdir:
 	err = 0;
 	/*
 	 * If the filesystem is not mounted then only the default resource group
@@ -4753,7 +4757,7 @@ static struct rdt_l3_mon_domain *get_mon_domain_from_cpu(int cpu,
 
 void resctrl_offline_cpu(unsigned int cpu)
 {
-	struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
 	struct rdt_l3_mon_domain *d;
 	struct rdtgroup *rdtgrp;
 
@@ -4765,18 +4769,17 @@ void resctrl_offline_cpu(unsigned int cpu)
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
+		if (!d)
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
@@ -4785,7 +4788,6 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
-out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.34.1

