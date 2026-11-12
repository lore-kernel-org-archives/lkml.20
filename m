Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489198;
	b=YcJHsAWneaRNa6pgdTMtoU53Gp6u/GFzhB6OkbvUgyPgvKsZhTos1RWJWTlFmCQcCF5U
	 9GyL2feidfSyKziLgl8PzIqn6XCv2ia/dyyRhLZjz24HSECPj+F67beBSH3ux6QMkF4Kk
	 ZCiDTaJsvsGqu9yP/s6tY9ylxtcyEwivn+jldvUhg9Em2OsEES5ZAy0sHRlsWxN9dbH/B
	 EwOwRY0RT5V1PKswF7lEBCvSj1Y2nMPkcY6YG8ygCTdjHW3MULMrOBwJvkP2gpERrzBwm
	 tYrTkGrhfXmvl0p3S0KLLk0bqn07c/9O2x91qwnabS16J1lqvf5wswFgrYxszH4a0gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489198;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZN6HaK+VUD2mMiXclgq103a0RWO3KL8Kpf2tLnyheMw=;
	b=vK9iW5CSuk387FqDU+rnuiEnUl7dwX+ye/mo1RVy3EYfGd1lTwNZas1DhuMqB+ifHPQq
	 w9/Mq/OD1Ek8CeKbKnJmEFAg+3fqc2fIMjOvcCzFNagIBGouPGNPX9hkQ8PceJcSweFst
	 EvCYKXbze+h/YZJvAzGgP47KPymXrkrhQ87Qq+CyGQ2Cyh2a6NEsZgs7PLrYpaekfGBrI
	 6wdddg1tGQ2sflTrUy1Jc1SsM13Fd0bFnFVWVeK33iGM3AF0xL05DlHD1qGVfdTm6ihak
	 wTbmGkZFq8RTANiD3VKVxEXCjhR67bdYCBbKDqpZcp28TN+ddlfKOyvGSHE1tW/jxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=wfI1WHhv;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED09606A32A;
	Thu, 12 Nov 2026 13:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED09606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=wfI1WHhv
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZN6HaK+VUD2mMiXclgq103a0RWO3KL8Kpf2tLnyheMw=;
	b=wfI1WHhvEIcrO/2y1iP2oNjXfgl/VIsLtYUwQo6x3V81Nz4dXrnrXN7IKpyZVxBQlwjPaX/FE
	xYEVqY3SCszrFY9nZDdBsTDLg+rF+cvbbNrrioLuxsxVsya1CcfRaakj5ARmaevlXNJTcphKnZ5
	W4Lvwlk2Glcz8oZMYpeyqyk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRG3h2gzmVX9;
	Thu, 12 Nov 2026 21:12:58 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 51BB64057C;
	Thu, 12 Nov 2026 21:13:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 4/9] fs/resctrl: Take the CPU hotplug lock for software controller updates
Date: Thu, 12 Nov 2026 21:12:49 +0800
Message-ID: <20261112131255.4043381-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
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

update_mba_bw() runs from the MBM overflow worker and calls the
architecture to read and write the control of its CPU's domain, under
the RCU read lock.

Writing the control can sleep: MPAM uses smp_call_on_cpu() and waits
for a CPU that can reach the MSC, so that CPU must stay online. The
hotplug lock cannot be taken after rdtgroup_mutex, because the offline
path takes the hotplug lock first, and sleeping in an RCU read-side
section is invalid.

Take the hotplug lock with cpus_read_trylock() before rdtgroup_mutex.
Skip a round when it is unavailable; a blocking lock would deadlock
against the offline path, which holds the write lock while it drains
this worker. The lock keeps the control domain in place, so drop the
RCU read lock.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c  | 28 +++++++++++++++++++---------
 fs/resctrl/rdtgroup.c |  8 +++++---
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 49a4b4ce95d4..8f3b8c3e3010 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -640,19 +640,18 @@ void mon_event_count(void *info)
 /*
  * Find the software controller's ctrl domain that contains @cpu on resource @r.
  *
- * Only called from the mbm_over worker via update_mba_bw() where the returned
- * domain is kept alive by cancel_delayed_work_sync() in
- * resctrl_offline_ctrl_domain(). This drains this worker and then waits on
- * rdtgroup_mutex held here before the architecture can free the ctrl domain.
+ * Only called from the mbm_over worker via update_mba_bw(), which holds the
+ * CPU hotplug lock so the domain cannot be removed while it is being used.
  *
- * Context: Call from RCU read-side critical section.
+ * Context: Call with the CPU hotplug lock held.
  */
 static struct rdt_ctrl_domain *get_sc_ctrl_domain_from_cpu(int cpu,
 							   struct rdt_resource *r)
 {
 	struct rdt_ctrl_domain *d;
 
-	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
+	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list,
+				lockdep_is_cpus_held()) {
 		/* Find the domain that contains this CPU */
 		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
 			return d;
@@ -748,7 +747,8 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 	if (WARN_ON_ONCE(!pmbm_data))
 		return;
 
-	guard(rcu)();
+	lockdep_assert_cpus_held();
+
 	dom_mba = get_sc_ctrl_domain_from_cpu(smp_processor_id(), r_mba);
 	if (!dom_mba) {
 		pr_warn_once("Failure to get domain for MBA update\n");
@@ -895,11 +895,19 @@ void mbm_handle_overflow(struct work_struct *work)
 	struct rdt_l3_mon_domain *d;
 	struct list_head *head;
 	struct rdt_resource *r;
+	bool cpus_read_locked = false;
 
 	/*
-	 * Safe to run without CPU hotplug lock. Work is guaranteed to be
+	 * Reading counters is safe without the CPU hotplug lock: the work is
 	 * canceled before the domain structure is removed.
+	 *
+	 * Programming the control can sleep and may need the hotplug lock,
+	 * which cannot be taken after rdtgroup_mutex. Try it first; if
+	 * hotplug is in progress skip the update and retry next round.
 	 */
+	if (is_mba_sc(NULL))
+		cpus_read_locked = cpus_read_trylock();
+
 	mutex_lock(&rdtgroup_mutex);
 
 	/*
@@ -934,7 +942,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL))
+		if (is_mba_sc(NULL) && cpus_read_locked)
 			update_mba_bw(prgrp, d);
 	}
 
@@ -948,6 +956,8 @@ void mbm_handle_overflow(struct work_struct *work)
 
 out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
+	if (cpus_read_locked)
+		cpus_read_unlock();
 }
 
 /**
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..b32831871f70 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4519,9 +4519,11 @@ void resctrl_offline_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain
 	 * no new worker iteration can find it; drain any worker that already
 	 * holds a pointer to it before the architecture frees the domain.
 	 *
-	 * Software controller is enabled/disabled on mount/unmount with
-	 * cpus_read_lock() held. Running here with cpus_write_lock() so
-	 * there are no concurrent changes to software controller status.
+	 * The overflow worker holds the CPU hotplug read lock around its
+	 * software controller updates, and mount/unmount enable/disable the
+	 * software controller with the read lock held. Running here with
+	 * cpus_write_lock() means there are no in-flight software controller
+	 * updates and no concurrent change of the software controller status.
 	 */
 	if (r->rid == RDT_RESOURCE_MBA && is_mba_sc(r)) {
 		struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-- 
2.34.1

