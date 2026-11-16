Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833985;
	b=Fb8Rjwf7pjFj9KuUWZCrQQhrgH6Evfk6GwFy4B61KYClNS+buk+s0Coe0H79xchJGaPt
	 9p8BPxfXC+m4VaiTB2bY2WBB4lPrEz3W7blFVHUK2MHrOjwSj3tRfWlaTYJ84cUYb94FL
	 Qi61Iru4zg7vZNXac3kEtGATGieFsOos+DW0iMYOh6npjENFwYsQx3chuUA+o9//jBWaF
	 mPyyURnoCCoOfq9/W6EDBlRwy2Nine+L4vnkaMi9HzVn1HUukEfeaioFiE4pNV7QBpaZm
	 93j7PQhxZfs5lFRnzrN+yl9Gw7wU7do3sNLMzEL4/Ndin/ssPutXayCHt9ObGalZARw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833985;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8kUCmMf9xR3z7OpNfAwmY9oHzUwpJMn8UndR+N9kxmE=;
	b=d60vzLDMNDH2/Ez2wAIa5hHBAw7200X3k+2uKO/Y7qYV2vQsE3MiECKi3Tfjawkcsjqt
	 rbD991h1yGpeN5yfyQlNDA9fjFu1ZAnUelQfp0MxSUEcTeLJ7O3PSQS3E7xtahApRMmlE
	 O69dRegIfCrcsaG/HSl8JNSrapzUOhQ73XP3hjseSaMx2ta7kIvakbTl30R6cGOOJtosy
	 NHt3Lc+7X+encLHMia47BL3VUmN/591tO1pNxu7JZeejsOaaSM945q9QNC6Zsv5PC0zkI
	 bcdx6lAQhTqRFb0d4yevKKpPaPO6OAAhgq3Q2mu4+yeTwK/0L49LOors+7W0cyACK8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2vyi8LYX;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2DB60A261F;
	Mon, 16 Nov 2026 12:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2DB60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2vyi8LYX
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8kUCmMf9xR3z7OpNfAwmY9oHzUwpJMn8UndR+N9kxmE=;
	b=2vyi8LYXAsbmTDjLqxg0yrXMfpOuqhIfeDtRDBUN+P6bAaYIVk1Y8umHitRbJI4pKGI9t/IAY
	DjT2Zs7khX9mPEpfzvtS/9BRHBYu9HCJ9eRbbMkTRbiW5ZuUvaWLXgu3+c8zFergOTLbaQOvMR2
	d8RdeIhRBVbTdJ3F2knI6po=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxq72LYz1K96X;
	Mon, 16 Nov 2026 20:59:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 74FDC40561;
	Mon, 16 Nov 2026 20:59:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:39 +0800
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
Subject: [RFC PATCH v3 15/19] arm_mpam: resctrl: Look up the monitor domain id from the components
Date: Mon, 16 Nov 2026 20:59:10 +0800
Message-ID: <20261116125914.498841-16-ruanjinjie@huawei.com>
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
index df2f0674535e..8a68b51d5811 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1568,14 +1568,14 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
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
@@ -1642,6 +1642,43 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
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
@@ -1677,7 +1714,8 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		dom->ctrl_comp = ctrl_comp;
 
 		ctrl_d = &dom->resctrl_ctrl_dom;
-		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, mpam_resctrl_pick_domain_id(cpu, ctrl_comp),
+					     r->rid, &ctrl_d->hdr);
 		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
 		err = resctrl_online_ctrl_domain(r, ctrl_d);
 		if (err)
@@ -1689,9 +1727,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	}
 
 	if (r->mon_capable) {
-		struct mpam_component *any_mon_comp = NULL;
-		struct mpam_resctrl_mon *mon;
-		enum resctrl_event_id eventid;
+		int id;
 
 		/*
 		 * Even if the monitor domain is backed by a different
@@ -1700,26 +1736,14 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
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

