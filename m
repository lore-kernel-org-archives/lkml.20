Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277414;
	b=SyYQto/rXULKQQ1NdsWUJDKy22R85VN5ze86jh//Tqu53px30rOMTAYG6BvfgwJcgJBf
	 VGgeJrezJTHfuC4g4/626vLBnXAkVlntDYyM5kGE+4pXq1vbXivFtAbzItGeNH09ImZto
	 CfKEZjHd5mpmWaKvmQkbDg7vJtFpbmLPHwVOKyshF5ig3WfE+1ry0HtF18qXUpfdXU2ns
	 33IWRh1C0C8mYdGYW5yspDtDiZFJI+kfKpC2WmeHyLJ3ST2Xrv2JXL/FNJP1TeuZ6c5jm
	 BzyPg4PkQcDfre2IVBN70cZYWgRuZwtSvLudVH03zJzHbwsLsFZ0sSdARdmoETECQpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277414;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=J5xbFkKuWpPg8pjGSlKllgYDVAyMuuebQcAVp8pRInE=;
	b=PP3rddiA4ZQnXgrehyFxaQJZ8LqJDFqKd+0T/vdIMKzSrOahmtzDMx1kA9o5GrYtOmp5
	 pnNGW2Pc7+spnF32G1MZmgUlI64x+3PxXweHhPkcdhi2wnSVTJCcwq/YHCojNMPwg/xxz
	 a655XNXD181AXsfXR8hbMdXYcWKNZaJs+Tp5APMUSrPQ8dv2vB3ziN16/CzNmucuQRzy6
	 PfC2jYLnsREtL4d5IUBfXWz79WLoEb8ixgNazlLLXWO3k6iuKI0ahn1Fkz2zDejv6LtRO
	 g/QLuD8muUvGGX5ZC6Ob6gLVW10qEQkB3Q4a7V9TdwuPuNLZqhWkbP6QX+z81ih2ESQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0M1TPfQH;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F419D60A2617;
	Thu, 29 Oct 2026 12:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F419D60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0M1TPfQH
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J5xbFkKuWpPg8pjGSlKllgYDVAyMuuebQcAVp8pRInE=;
	b=0M1TPfQH9iUCiF7m/pduB22xLxwtneQss3Wu0aHzcGACW2yRE6T3FV76pqaihvATL7XfptKkL
	3gKrTdm5ylobXytH2zdnRoiIdnO4o+hZVbBWIfHlgPgPjghiQMJ4tCD6EwdH8vkUMpq+LlOxiUw
	nWHFxFCtJ/9fFLAmwMzndz8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHr0J80zKm61;
	Thu, 29 Oct 2026 20:36:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C2C484048B;
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
Subject: [RFC PATCH v2 15/19] arm_mpam: resctrl: Look up the monitor domain id from the components
Date: Thu, 29 Oct 2026 20:36:07 +0800
Message-ID: <20261029123611.1108424-16-ruanjinjie@huawei.com>
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

The monitor domain id comes from whichever monitoring component the loop
happened to find last, and the monitor domain lookup uses the L3
cache-id. Neither works if the monitors of a resource are in a different
component from its controls, or if there are no controls at all, which
is the case on monitor only platforms.

Add mpam_resctrl_domain_id() to find the component that covers a CPU for
each of the resource's events. It returns the id of the first component
found and warns if another component reports a different id. Also pass
the id, not the component, to mpam_resctrl_domain_hdr_init().

No functional change: every resource has a single component covering a
CPU today, so the same id is returned.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 66 +++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9779cef5dc04..4de3ad5a8ca2 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1563,14 +1563,14 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 	mpam_reset_class_locked(res->class);
 }
 
-static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
+static void mpam_resctrl_domain_hdr_init(int cpu, int id,
 					 enum resctrl_res_level rid,
 					 struct rdt_domain_hdr *hdr)
 {
 	lockdep_assert_cpus_held();
 
 	INIT_LIST_HEAD(&hdr->list);
-	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
+	hdr->id = id;
 	hdr->rid = rid;
 	cpumask_set_cpu(cpu, &hdr->cpu_mask);
 }
@@ -1637,6 +1637,43 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 	return NULL;
 }
 
+/*
+ * Find the domain ID for @cpu from the monitoring components of @r. Also
+ * fill @mon_comp, if not NULL, with the component that covers @cpu for each
+ * event. A negative ID means no component covers this CPU.
+ */
+static int mpam_resctrl_domain_id(int cpu, struct rdt_resource *r,
+				  struct mpam_component **mon_comp)
+{
+	struct mpam_resctrl_mon *mon;
+	enum resctrl_event_id eventid;
+	int id = -1;
+
+	lockdep_assert_cpus_held();
+
+	for_each_mpam_resctrl_mon(mon, r, eventid) {
+		struct mpam_component *comp;
+		int comp_id;
+
+		if (!mon->class)
+			continue;	// dummy resource
+
+		comp = find_component(mon->class, cpu);
+		if (mon_comp)
+			mon_comp[eventid] = comp;
+		if (!comp)
+			continue;
+
+		comp_id = mpam_resctrl_pick_domain_id(cpu, comp);
+		if (id < 0)
+			id = comp_id;
+		else
+			WARN_ON_ONCE(id != comp_id);
+	}
+
+	return id;
+}
+
 static struct mpam_resctrl_dom *
 mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 {
@@ -1672,7 +1709,8 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		dom->ctrl_comp = ctrl_comp;
 
 		ctrl_d = &dom->resctrl_ctrl_dom;
-		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, mpam_resctrl_pick_domain_id(cpu, ctrl_comp),
+					     r->rid, &ctrl_d->hdr);
 		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
 		err = resctrl_online_ctrl_domain(r, ctrl_d);
 		if (err)
@@ -1684,9 +1722,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	}
 
 	if (r->mon_capable) {
-		struct mpam_component *any_mon_comp = NULL;
-		struct mpam_resctrl_mon *mon;
-		enum resctrl_event_id eventid;
+		int id;
 
 		/*
 		 * Even if the monitor domain is backed by a different
@@ -1695,26 +1731,14 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		 * Search each event's class list for a component with
 		 * overlapping CPUs and set up the dom->mon_comp array.
 		 */
-
-		for_each_mpam_resctrl_mon(mon, r, eventid) {
-			struct mpam_component *mon_comp;
-
-			if (!mon->class)
-				continue;       // dummy resource
-
-			mon_comp = find_component(mon->class, cpu);
-			dom->mon_comp[eventid] = mon_comp;
-			if (mon_comp)
-				any_mon_comp = mon_comp;
-		}
-		if (!any_mon_comp) {
-			WARN_ON_ONCE(0);
+		id = mpam_resctrl_domain_id(cpu, r, dom->mon_comp);
+		if (WARN_ON_ONCE(id < 0)) {
 			err = -EFAULT;
 			goto offline_ctrl_domain;
 		}
 
 		mon_d = &dom->resctrl_mon_dom;
-		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, id, r->rid, &mon_d->hdr);
 		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
 		err = resctrl_online_mon_domain(r, &mon_d->hdr);
 		if (err)
-- 
2.34.1

