Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC92E737B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707683; cv=none; b=iQyZ3phCFBvH5WZ/KMoSN1HJNwPNYLR3fDU0Oj1MbmCdZlXn8l0SQozuTlbYkitvDq6aPLjVLU1EQVSNHvlD3kvulMBYEo3SvcTENOKtbJKfYw2beP+zvxTT/xvjQpOFp/nuJd4Zq/Egs6sxmZh400ZWkJ9wmiiiFmg/kPsQfv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707683; c=relaxed/simple;
	bh=vCOgFkquUfKp2S4mfMttclgB1SUTNvecrCaoIOtAvq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MD7AwK7h+aqUL2lOBmR7Xupzx/L4Wntoj5Ep2iO/ahsbum+kRjddKEKsH2bbaIkaNFpqr6HUPiN25FzhhOJEeEDNNgED3ex/r8KXRRfYiJMSELk8Rv2aOe4/X9sM25jv9ND3eNktkrZO0UOoyRl6ypRVDmTPEDHsP6SeSnJ2LDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYl0yynV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYl0yynV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707681; x=1821243681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vCOgFkquUfKp2S4mfMttclgB1SUTNvecrCaoIOtAvq0=;
  b=AYl0yynVVvLU5dx3kIzICQ/CFyvsQaa4dUGmnaCEd+jjlfEagWiM7uW0
   oSHHmfkxs0XDXQPNtq7j6F97TsbTf9xWc569nsGQ4CJMJla9gs63B+RBK
   Ou9kQiFoSRj4sBa+gJo0Q01ocE0anX0bjhwnSetVqoXonmxy/ZRXdyj46
   mABTMN3uDcgHyYvE/vvwPCwsuiXTO3coKMIlvzXvkPRgBVhq9yjsyQWiE
   3zxXHI0lAKlHZDdLFum6YxDmRxDgXHEa5yLRJ59SjuL0cpyhiF56srAgx
   OBj0IPxAixAgdJby2FLODMg9K0HJ/RiEVVKpkyaCDpAaIeTP6llg/aovi
   g==;
X-CSE-ConnectionGUID: 155B6O96RSiwiTCr5vESqg==
X-CSE-MsgGUID: tMXAoN99SnyxLAvYdgKQ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107693092"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107693092"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:01:21 -0700
X-CSE-ConnectionGUID: qUkR6JN/Ti6QpeyUqMHDBw==
X-CSE-MsgGUID: KJyo+2mQSXSTiDwKm1wUHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2612218"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 22:01:18 -0700
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
Subject: [PATCH v8 7/9] fs/resctrl: Do not invoke smp_processor_id() in preemptible context
Date: Fri, 18 Sep 2026 12:50:51 +0800
Message-Id: <6e0ff955200ead6a2ac689d492a5e5c73ebc3552.1789705667.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1789705667.git.yu.c.chen@intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
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
 fs/resctrl/monitor.c | 48 +++++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..3e05b0271c58 100644
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
@@ -457,11 +485,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
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
@@ -479,7 +502,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 
 static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
-	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
 	u32 rmid = rdtgrp->mon.rmid;
 	struct rdt_l3_mon_domain *d;
@@ -497,12 +519,6 @@ static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *r
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
@@ -538,7 +554,11 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
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

