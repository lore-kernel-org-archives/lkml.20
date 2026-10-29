Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277423;
	b=Uz2S4y3tKUzkAcrUgrvhfl5a5ozP+7tNLbNz8dZGM2l5GcIqTIFtNYqBAoPTx1a/rD8K
	 Wt1L8KCDAxfr87wAYCsvnW6cVk3Ng3SQwpiJDAtBJCWanyw0sIfJpRgmFQGdFU5sa8AZ5
	 cIS6/OUBWD8v5vONtfsJC2JAEoj6VUzoBT0jF/Qz+j6tgLCY/u8n8XV6vHVPDtVrqxbJy
	 AdBA8Pyff1Owdfvc5b4KgdBGezOl1T+Gwerr7HQEpsvSFn/a7NwmZad5+JlGJZSjAS3AG
	 +WQhHS2b1ZkdP9dgy7mCNopYA+obCBjB1jBr4CIouIk6sqgyEpWiJbDdcTHfC/b/89g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277423;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LpPddM5a4XHnA6R0yPkyk4dQ7BNYkzf/kTezWMZaKqk=;
	b=BNsXJBXH7BE0Ukciw7BgUCq4kqhEGegArBnTcTHG3nA1Z/q7eFY6JNnDDZuG0cd6GCDT
	 aq2reALs06N9SGDQzEBeqPqfzg+Blis+IOaBCdAH3PW+g+LYP6NR/rUCgOkrznxOHaodM
	 QEPlIKq8nvkz50Kd8IVYQcMEeOSuLXHqrHlOxCgxYK9ZwfkHgvrrra0jBbAEoyYtU/E9I
	 ttaeVb6fTbik2eG9g9PPOWP93b5/bj9WeG3q0gLYU010qivTCRa4jOkWIPfV5nZ55ghwZ
	 0YH219HnltbluOJ4DIvg9LPXwvSSdP7Wifflb8vFkrzvBBKUJj29cTivHX9MLTbRojg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=NOsubV4o;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0B860A2616;
	Thu, 29 Oct 2026 12:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0B860A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=NOsubV4o
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LpPddM5a4XHnA6R0yPkyk4dQ7BNYkzf/kTezWMZaKqk=;
	b=NOsubV4ogt1cCLkBLy9sEbs80aJ+F6JthSJpOh1pU7h9ulXShFz9QVGdjEcx/tUOl5R9JqAk/
	eIBaj837ulsdGwF1FY+rqMxdnqYfWDXSrfS1IigJ2j/Zog7RlBmtlpyxzJY4ohjs3CA6Y3gFrEX
	IUX3vjTg7VSwHZ0s4j9x4zM=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jFkJ91TB8z12LHT;
	Thu, 29 Oct 2026 20:36:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5696140538;
	Thu, 29 Oct 2026 20:36:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:50 +0800
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
Subject: [RFC PATCH v2 17/19] arm_mpam: resctrl: Allow monitoring on resources other than the L3
Date: Thu, 29 Oct 2026 20:36:09 +0800
Message-ID: <20261029123611.1108424-18-ruanjinjie@huawei.com>
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

The MPAM driver assumes only the L3 monitors. resctrl_arch_mon_capable()
looks at the L3 only, a CPU's monitor-only domain is found with the L3
cache-id, and mpam_resctrl_monitor_init() always names the resource L3.

Check every resource for monitoring, find a monitor domain by the id its
component reports, and set the name and scope from the resource.

No functional change as only the L3 has monitors so far.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 85 +++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 43 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index b5416f589698..b9487f3c648d 100644
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
@@ -1332,35 +1333,39 @@ static int mpam_resctrl_monitor_init(struct rdt_resource *r,
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
@@ -1638,9 +1643,9 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 }
 
 /*
- * Find the domain ID for @cpu from the monitoring components of @r. Also
- * fill @mon_comp, if not NULL, with the component that covers @cpu for each
- * event. A negative ID means no component covers this CPU.
+ * Fill @mon_comp, if not NULL, with the component that covers @cpu for each
+ * of the resource's events, and return the domain ID of the first one found.
+ * A negative ID means no component covers this CPU.
  */
 static int mpam_resctrl_domain_id(int cpu, struct rdt_resource *r,
 				  struct mpam_component **mon_comp)
@@ -1656,7 +1661,7 @@ static int mpam_resctrl_domain_id(int cpu, struct rdt_resource *r,
 		int comp_id;
 
 		if (!mon->class)
-			continue;	// dummy resource
+			continue;
 
 		comp = find_component(mon->class, cpu);
 		if (mon_comp)
@@ -1725,9 +1730,8 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
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
@@ -1764,28 +1768,26 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
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
 
@@ -1805,11 +1807,8 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
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

