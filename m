Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01A34B1A7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983987; cv=none; b=Rh+wDGtZ/IgefWoRXG4IFZ7UnnAkNJQ0HjYxLnFQ5dTg1rHnL+FqoloOEZQODQqtq27tSkyAYBi5nSjjNVWhorLJmiVQsgg8UJjIGwjpzdZwEPAkxw1AiK5p3n5D5N08jQVRkWayNyT2RZjCBIIbZ1tqbYG1IpksAk36i/UlkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983987; c=relaxed/simple;
	bh=RIo0uzucS11KUZPmSl9rxbWOKXcoZGeTAYRUY64LpxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AJf5dKPv/+yzAltzggIuR8T19gq/7e+Ij1QVknpF7zWGLgOl9ZsYLvZKreUrg8pLC1d2G0DZcwVOALK3QlJv9mFNlQkd9T1fnQCY37/hquVr6OOtwHLlipvFw+Y0mH0doK7XqzE0prNLzz98367ybrXmUv7199rMnAmT5S/8CaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaA8XzLa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaA8XzLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787983985; x=1819519985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RIo0uzucS11KUZPmSl9rxbWOKXcoZGeTAYRUY64LpxY=;
  b=KaA8XzLanEdu0chz7APJUEkppsVTjCW8ZGbcLRklU5vH+rQX+H2YFhkz
   3DftfvDJLXKAAY08Umq6B4It3+kpOZuDmnBgFtgQbjuDyM1wXDeSmPxj1
   e5feXr9rdOKQTFQ1DiZc7QRBvxq8lwHY7HteWebUk8e18xYnSu2z4rgQ7
   23RaqJUYvarCendzyMbRFD6qhiia4P3Cx73FZX4NTGKO9pNkTTvX7pRm4
   Z94FYj6DXUtA3znNSyZY4RPFKLcTrlVM92xwqyRb6a7Glxz7u95H0EInv
   UL7kLCnNxL/vOpKqjDtaG+WfZslr/SZCw0b7e9N/5ho8QuVfq9LWdRsjm
   g==;
X-CSE-ConnectionGUID: qbCiWnW9QCuyh8FA6MS7Ng==
X-CSE-MsgGUID: Hy50/eKbT/qDQjRr+l3RbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88507863"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88507863"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:13:05 -0700
X-CSE-ConnectionGUID: qJ4g/MzFROys1Rr8kmLolw==
X-CSE-MsgGUID: WQ/7F6ChQ/GrVYkVfNXr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="271860783"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 23:13:02 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com
Cc: tglx@kernel.org,
	bp@alien8.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	fenghuay@nvidia.com,
	babu.moger@amd.com,
	chen.yu@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/9] fs/resctrl: Do not invoke smp_processor_id() in preemptible context
Date: Sat, 29 Aug 2026 14:02:36 +0800
Message-Id: <990f1312c2a5bfcbb502792e992ba1f9e3ac230f.1787976868.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1787976868.git.yu.c.chen@intel.com>
References: <cover.1787976868.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Luck <tony.luck@intel.com>

An event flagged with mon_evt::any_cpu is read directly in preemptible task
context instead of being dispatched to a CPU of the monitoring domain. Only
Intel AET events set this flag, so __mon_event_count() rejects an any_cpu L3
event with WARN_ON_ONCE(). The L3 read paths can therefore call
smp_processor_id() unconditionally to check that the current CPU belongs to the
domain being read.

MMIO-based LLC occupancy counters can be read from any CPU, so the L3 read
paths have to tolerate an any_cpu event. Move that check into a helper which
returns early for any_cpu events, avoiding smp_processor_id() in preemptible
context, and report a wrong CPU via rmid_read::err.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
v6->v7:
    Describe the current code instead of framing the changelog as a bug
    fix. (Reinette Chatre)
    Drop the now-merged lore.kernel.org link. (Reinette Chatre)
---
 fs/resctrl/monitor.c | 44 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index a932a1fea818..c08d2f90d721 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -422,9 +422,37 @@ static void mbm_cntr_free(struct rdt_l3_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(*d->cntr_cfg));
 }
 
+/**
+ * cpu_on_correct_domain() - Check if current CPU is in the correct
+ *			      domain for the event.
+ * @rr: The rmid_read structure containing event and domain information.
+ *
+ * Context: Preemptible process context when @rr->evt->any_cpu is set.
+ *          Non-migratable process context (via smp_call_on_cpu()) or
+ *          non-preemptible context (via smp_call_function_any()) when
+ *          the event must be read on a specific CPU.
+ * Return: true if the current CPU can read this event, false otherwise.
+ */
+static bool cpu_on_correct_domain(struct rmid_read *rr)
+{
+	int cpu;
+
+	/* Any CPU is OK for this event */
+	if (rr->evt->any_cpu)
+		return true;
+
+	cpu = smp_processor_id();
+
+	/* Single domain. Must be on a CPU in that domain. */
+	if (rr->hdr)
+		return cpumask_test_cpu(cpu, &rr->hdr->cpu_mask);
+
+	/* Summing domains that share a cache, must be on a CPU for that cache. */
+	return cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map);
+}
+
 static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
-	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
 	u32 rmid = rdtgrp->mon.rmid;
 	struct rdt_l3_mon_domain *d;
@@ -457,9 +485,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 		return 0;
 	}
 
-	/* Reading a single domain, must be on a CPU in that domain. */
-	if (!cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
-		return -EINVAL;
 	if (rr->is_mbm_cntr)
 		rr->err = resctrl_arch_cntr_read(rr->r, d, closid, rmid, cntr_id,
 						 rr->evt->evtid, &tval);
@@ -477,7 +502,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 
 static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
-	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
 	u32 rmid = rdtgrp->mon.rmid;
 	struct rdt_l3_mon_domain *d;
@@ -495,10 +519,6 @@ static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *r
 		return -EINVAL;
 	}
 
-	/* Summing domains that share a cache, must be on a CPU for that cache. */
-	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map))
-		return -EINVAL;
-
 	/*
 	 * Legacy files must report the sum of an event across all
 	 * domains that share the same L3 cache instance.
@@ -529,7 +549,11 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
 	case RDT_RESOURCE_L3:
-		WARN_ON_ONCE(rr->evt->any_cpu);
+		if (!cpu_on_correct_domain(rr)) {
+			rr->err = -EIO;
+			return -EINVAL;
+		}
+
 		if (rr->hdr)
 			return __l3_mon_event_count(rdtgrp, rr);
 		else
-- 
2.25.1

