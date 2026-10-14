Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D093301709
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947471; cv=none; b=SF5ZkM3yP4x1ChTnlObtNDBfS6TxSLbbR8/NlIAIkKsG1j/dglDaSzDmgDpTjn/gfigc6BHSMeKMcjQjeYZUejkEXeBA6PpyE+kXsIq9MSIcV+cQ6jhmXVc/cS6xr6UsYKWstpqnGNvuPcVQuDMTXHaCtz8P8HZndGJM7CWOmGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947471; c=relaxed/simple;
	bh=aEW8WLMjZZebrc3qv8tNXwmPXveyj1qJiZaduEMJndo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YNz6MTfy2edyztwEfqZXstQgQbCnMtEFB2lX7UydiH1IlY18bCewLCI0DWMnsN9HfY2YYrHtsvgvrT1owstISx+Ba00TgUeIcxPyurPqnw7vrt69CNyc8c8upBZcVE3MMtt86gKoBHemJPcZa0093gKFjWpLkbacUJMhQCi3oAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=feD8gp0D; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="feD8gp0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947470; x=1823483470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aEW8WLMjZZebrc3qv8tNXwmPXveyj1qJiZaduEMJndo=;
  b=feD8gp0Dfmel4IIY9b/s7hLM33IdCIaIPyi4JkVtvqdawWYEGcFZN23B
   Fz3NmJlKSK7g7mHYGqQiJAiGNYiTKIwG57iA+1jQEfs9j13uWVgnDbhDx
   qoI9RrVhA61Crl43KMPPmaUHfGcxgW7Xd6cie3Va475MQvr1tIzRsId8A
   Z9gmFXdQRu7nvEDcZZtJNsh937oktWhzxkiYEQglZ619Zc4JhQHHujQWy
   7EOqdRQ9so98O1/IGa1aX9nxIak52pj4TtyKx56PA+tfQEdr/RdLTwQXf
   eByFC0Xq45B8s1vlSOICZDvvdvpqedQPhobfCng8NArRJ5CzkdI2XPFu+
   Q==;
X-CSE-ConnectionGUID: +fXw9uqmQ6iYPsWVxRPrXA==
X-CSE-MsgGUID: cCmHNI5XRb+Jtf4IA00qzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="589336"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="589336"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:11:09 -0700
X-CSE-ConnectionGUID: GYl+4nFkRsC/tjFgIGj7cw==
X-CSE-MsgGUID: b1JoXehnQ46Hb/QgDTK82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1414650"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 20:11:05 -0700
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
	hongyu.ning@intel.com,
	chen.yu@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: [PATCH v9 10/12] fs/resctrl: Do not invoke smp_processor_id() in preemptible context
Date: Wed, 14 Oct 2026 11:00:40 +0800
Message-Id: <08d32fc9c556d3932d9dcaf16e8df2b57be661cd.1791933001.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791933001.git.yu.c.chen@intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
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
context.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v8:
- Rename cpu_on_correct_domain() to cpu_can_read_event() because the
  domain is not always relevant to the answer. (Reinette Chatre)
- Drop "report a wrong CPU via rmid_read::err" from the changelog, it is
  obvious from the diff. (Reinette Chatre)

 fs/resctrl/monitor.c | 47 +++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..5060640b4f50 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -422,9 +422,36 @@ static void mbm_cntr_free(struct rdt_l3_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(*d->cntr_cfg));
 }
 
+/**
+ * cpu_can_read_event() - Check if the current CPU can read the event.
+ * @rr: The rmid_read structure containing event and domain information.
+ *
+ * Context: Preemptible process context when @rr->evt->any_cpu is set.
+ *          Non-migratable process context (via smp_call_on_cpu()) or
+ *          non-preemptible context (via smp_call_function_any()) when
+ *          the event must be read on a specific CPU.
+ * Return: true if the current CPU can read this event, false otherwise.
+ */
+static bool cpu_can_read_event(struct rmid_read *rr)
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
@@ -457,11 +484,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 		return 0;
 	}
 
-	/* Reading a single domain, must be on a CPU in that domain. */
-	if (!cpumask_test_cpu(cpu, &d->hdr.cpu_mask)) {
-		rr->err = -EIO;
-		return -EINVAL;
-	}
 	if (rr->is_mbm_cntr)
 		rr->err = resctrl_arch_cntr_read(rr->r, d, closid, rmid, cntr_id,
 						 rr->evt->evtid, &tval);
@@ -479,7 +501,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 
 static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
-	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
 	u32 rmid = rdtgrp->mon.rmid;
 	struct rdt_l3_mon_domain *d;
@@ -497,12 +518,6 @@ static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *r
 		return -EINVAL;
 	}
 
-	/* Summing domains that share a cache, must be on a CPU for that cache. */
-	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map)) {
-		rr->err = -EIO;
-		return -EINVAL;
-	}
-
 	/*
 	 * Legacy files must report the sum of an event across all
 	 * domains that share the same L3 cache instance.
@@ -538,7 +553,11 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
 	case RDT_RESOURCE_L3:
-		WARN_ON_ONCE(rr->evt->any_cpu);
+		if (!cpu_can_read_event(rr)) {
+			rr->err = -EIO;
+			return -EINVAL;
+		}
+
 		if (rr->hdr)
 			return __l3_mon_event_count(rdtgrp, rr);
 		else
-- 
2.43.0

