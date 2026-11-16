Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833986;
	b=BNOVKvYBluyhpny+BH8ZAD+Qgy1U8Pl7rQLWBgebSOMR9pT/raWb8kWfz0wg+r1kINaP
	 qLlGjMJ5QGLuVN1fZyw3D/vKLPQmPH8Z6h2ryLyoSTsiH8voxw1+LAewDwDJltOdwdqlL
	 9eqyvdjk+7kHG+TQl3q+inyH10edgD0nJzuuh71hrTAzI8Wn1QCrX2HiamAvOZV4++oDp
	 4xwuiFsVhcr6Y0a2/8rzGwL+FdYLgQbQo1nHXkufBmTCXkox2Sa346x5NeW7Nr6XFDpUs
	 +i4PQ4A/T+1Y47TM7fqQONi3jYID3I/nflmSMIpWX/jISeS5w6+lAcHvyv7egBWRxLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833986;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FXYvYFGwkT4xuB/zHam/APbk+L8Dwz8yaSTuS9gvviM=;
	b=YWfIzZPQaz1EbLHSJ2nc0B5lY6HB0FhlHesoRLsx/vbRJ24sU65Q0F6kkuceCVOKZOwy
	 oyxjOvqHagbI8f442duRvCm7nzMFl5lgy8yKaTTtJsY+KT3UlSu1/POQoM9hhiQDXU48a
	 Iy7x+1dJH1wLroKUD3ab/1Ui6q32iFf/pCvJdgvWzLUUcznnrd+TMdetLrO/fiMurPNKm
	 fXwoMAdkK/xVEvq8ERGBZdMoEOGs0j5pVBO+ixS/+fAyTVv3KcHo+hE+rBmtIqtTuf+A2
	 0+7DuCrJ7DMMIDrJKi+XYeZNBxbrxUtRc5Z1/7Sq3Xv8yYlFdy/1vHsxfXgtv2lU7nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PtJcs3XU;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E7E60A263D;
	Mon, 16 Nov 2026 12:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E7E60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PtJcs3XU
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FXYvYFGwkT4xuB/zHam/APbk+L8Dwz8yaSTuS9gvviM=;
	b=PtJcs3XUF3XPgi+q08V44Kdq4mTO4vqHNpOws8Jobztd6GhWqwnj1HWteHldGP2l1el1jsdef
	AcML95xVXnpi9nR5q+4XOTDPMW2kmuL/NHoEpR3CpJqFSew4EZzzZbu74/Q9uPtXjPY4K79ET4D
	n8DDN1sarlABs1lJpeWCdJM=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxt0JwGz1prlC;
	Mon, 16 Nov 2026 20:59:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CE32740561;
	Mon, 16 Nov 2026 20:59:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:41 +0800
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
Subject: [RFC PATCH v3 17/19] arm_mpam: resctrl: Allow monitoring on resources other than the L3
Date: Mon, 16 Nov 2026 20:59:12 +0800
Message-ID: <20261116125914.498841-18-ruanjinjie@huawei.com>
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

The MPAM driver assumes only the L3 monitors. resctrl_arch_mon_capable()
looks at the L3 only, a CPU's monitor-only domain is found with the L3
cache-id, and mpam_resctrl_monitor_init() always names the resource L3.

Check every resource for monitoring, find a monitor domain by the id its
component reports, and set the name and scope from the resource.

No functional change as only the L3 has monitors so far.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 77 +++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 470b37587890..704383304f6b 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -99,11 +99,12 @@ bool resctrl_arch_alloc_capable(void)
 
 bool resctrl_arch_mon_capable(void)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct rdt_resource *r;
+
+	for_each_mon_capable_rdt_resource(r)
+		return true;
 
-	/* All monitors are presented as being on the L3 cache */
-	return l3->mon_capable;
+	return false;
 }
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
@@ -1337,35 +1338,39 @@ static int mpam_resctrl_monitor_init(struct rdt_resource *r,
 	struct mpam_resctrl_res *res = container_of(r, struct mpam_resctrl_res,
 						    resctrl_res);
 	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, type);
+	unsigned int level;
 
 	lockdep_assert_cpus_held();
 
+	/* Called once per event. The name is needed on monitor only platforms. */
+	if (r->rid == RDT_RESOURCE_L2) {
+		level = 2;
+		r->name = "L2";
+		r->mon_scope = RESCTRL_L2_CACHE;
+	} else {
+		level = 3;
+		r->name = "L3";
+		r->mon_scope = RESCTRL_L3_CACHE;
+	}
+
 	/*
-	 * There also needs to be an L3 cache present.
+	 * There also needs to be a cache at this level present.
 	 * The check just requires any online CPU and it can't go offline as we
 	 * hold the cpu lock.
 	 */
-	if (get_cpu_cacheinfo_id(raw_smp_processor_id(), 3) == -1)
+	if (get_cpu_cacheinfo_id(raw_smp_processor_id(), level) == -1)
 		return 0;
 
 	/*
-	 * If there are no MPAM resources on L3, force it into existence.
-	 * topology_matches_l3() already ensures this looks like the L3.
-	 * The domain-ids will be fixed up by mpam_resctrl_domain_hdr_init().
+	 * If there are no MPAM resources on this cache level, force it into
+	 * existence. The domain-ids will be fixed up by
+	 * mpam_resctrl_domain_hdr_init().
 	 */
 	if (!res->class) {
-		pr_warn_once("Faking L3 MSC to enable counters.\n");
+		pr_warn_once("Faking L%u MSC to enable counters.\n", level);
 		res->class = mon->class;
 	}
 
-	/*
-	 * Called multiple times!, once per event type that has a
-	 * monitoring class.
-	 * Setting name is necessary on monitor only platforms.
-	 */
-	r->name = "L3";
-	r->mon_scope = RESCTRL_L3_CACHE;
-
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
 	 * can exist simultaneously, including the default monitoring group for
@@ -1730,9 +1735,8 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		int id;
 
 		/*
-		 * Even if the monitor domain is backed by a different
-		 * component, the L3 component IDs need to be used... only
-		 * there may be no ctrl_comp for the L3.
+		 * The monitor domain ID comes from the monitor components, as
+		 * there may be no ctrl_comp for this resource.
 		 * Search each event's class list for a component with
 		 * overlapping CPUs and set up the dom->mon_comp array.
 		 */
@@ -1769,28 +1773,26 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 }
 
 /*
- * We know all the monitors are associated with the L3, even if there are no
- * controls and therefore no control component. Find the cache-id for the CPU
- * and use that to search for existing resctrl domains.
- * This relies on mpam_resctrl_pick_domain_id() using the L3 cache-id
- * for anything that is not a cache.
+ * There may be no control component to search, for example on monitor only
+ * platforms. Find the domain-id the monitors' component would report for
+ * this CPU and use that to search the resource's monitor domains.
+ * This relies on mpam_resctrl_pick_domain_id() giving the same id for every
+ * CPU that shares the component.
  */
-static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
+static struct mpam_resctrl_dom *
+mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct rdt_resource *r)
 {
-	int cache_id;
 	struct mpam_resctrl_dom *dom;
-	struct mpam_resctrl_res *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	int id;
 
 	lockdep_assert_cpus_held();
 
-	if (!l3->class)
-		return NULL;
-	cache_id = get_cpu_cacheinfo_id(cpu, 3);
-	if (cache_id < 0)
+	id = mpam_resctrl_domain_id(cpu, r, NULL);
+	if (id < 0)
 		return NULL;
 
-	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
-		if (dom->resctrl_mon_dom.hdr.id == cache_id)
+	list_for_each_entry_rcu(dom, &r->mon_domains, resctrl_mon_dom.hdr.list) {
+		if (dom->resctrl_mon_dom.hdr.id == id)
 			return dom;
 	}
 
@@ -1810,11 +1812,8 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 			return dom;
 	}
 
-	if (r->rid != RDT_RESOURCE_L3)
-		return NULL;
-
 	/* Search the mon domain list too - needed on monitor only platforms. */
-	return mpam_resctrl_get_mon_domain_from_cpu(cpu);
+	return mpam_resctrl_get_mon_domain_from_cpu(cpu, r);
 }
 
 int mpam_resctrl_online_cpu(unsigned int cpu)
-- 
2.34.1

