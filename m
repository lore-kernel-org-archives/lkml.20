Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874037;
	b=D1SwuobvV6h3yJeci31zGD6mKK5kkA8OfZ9c03c7nHGGpOdbJOn5c9uSBZ87I7nxeadn
	 vyBm195d4Pk4akoFFKh1Bpto0KzXZ9Wr7hzE4soykp1B1aRKuBv2d2frlKEorPFVWQDrc
	 UKvuY6v0GJpBCkhq1HR/P5nUHB/uteOrFWGJ+FoLjSM4VmF6jEDpL5+hmYT1xFYNQqQmb
	 H0Aygm0Q7Uxn/lAZLc95pfL/hCZ61Yan4FEisVPEwUE+Kn3i3M4YPM2NjFD7xu5ycyR3V
	 QjWzNTefK6BBhjddyCbXLPxb7JutE/7VPQyLXt2DyBIFYBpuqziMjFmnpAff8orUzIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874037;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+U6EH1rlvi0t4HoQvvfP6wZczlURMSZ7tCXOR+hp3Lw=;
	b=zQCum9hxI/NQqJXfIKIbwrwozugitbRVhv6t13m82wb2qKroIR/65pSDmXDTEdcDQaxi
	 ECSHuiScRRWrv5MwH9+/1ZPPuoZjTnygCjYVvZHgCuS12uNocdmqqV01JVLQ+9GiUjTOR
	 LGGXjNdlZuDEYdjsPnSm8SVYby76DCRnfBmlZTDismkfaDpKa9QB2RVaLgcNoeT4SamHD
	 wusrJFZuIumzWUpHC5q3J1arsrLur9obHzk7uIIuvZG0Dt1MMftPwm3xDTlx3hAfz5PeL
	 /SGGN7hF7maQiSIsYyHCxuVd32iB2idqCFoAM/VANRarMzC94WzrZNK1LhB3vuDAWyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=THYrjr5g;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2B606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E2B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=THYrjr5g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874037; x=1825410037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WsTbnVsREBZtJQQftPT0RbfA0FMnJmdjFfVg3z/OG2Q=;
  b=THYrjr5g2GweFCC4ipSu7VZRUrrFZKMjHbjr/PrX6tIhG1g+9YI9DmNQ
   Kt5bwkRamABc9lPxW1XyOXd6RAFBt174m6DTRRN3Vakj/ZRnRSdmwV5GP
   slVX2lxof6u+HcUIsZ0FfBEPSD5WJqjEl0BoOL2aOpodEM6yZ5xMx91tS
   dfpC5octoaPRBlr5W/J+0/V5oq952D3J9MROcO+l530At7KQcyBjhotrQ
   wfD7qFg0onORrWy71Wn6WZmW+7bpL/H7YRlSi9kmtbTjTqqueqKoZLV6w
   vO5YbDUGe0ihQhKnBliFzXG40EpFlCa72/MSEWYHkMTmO4IS4KtIhgNPz
   A==;
X-CSE-ConnectionGUID: T4Km0eMETNie/6/Zgat+7Q==
X-CSE-MsgGUID: 88OlI8wiT3OJvota0bOlVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2530307"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2530307"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:20:37 -0800
X-CSE-ConnectionGUID: i8zxYnm1RQqzoBaFUvBRyw==
X-CSE-MsgGUID: ug0LvQHcR3Gi1wwq6uqJ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7143727"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 02:20:32 -0800
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/12] fs/resctrl: Do not invoke smp_processor_id() in preemptible context
Date: Thu,  5 Nov 2026 18:09:33 +0800
Message-Id: <cd73a928b588171354c96b873fa192ee80c60173.1793864720.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793864720.git.yu.c.chen@intel.com>
References: <cover.1793864720.git.yu.c.chen@intel.com>
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

From: Tony Luck <tony.luck@intel.com>

An event flagged with mon_evt::any_cpu is read directly in preemptible task
context instead of being dispatched to a CPU of the monitoring domain. Only
Intel AET events set this flag, so __mon_event_count() rejects an any_cpu L3
event with WARN_ON_ONCE(). The L3 read paths can therefore call
smp_processor_id() unconditionally to check that the current CPU belongs to the
domain being read.

MMIO-based LLC occupancy counters can be read from any CPU, so the L3 read paths
have to tolerate an any_cpu event. Move that check into a helper which returns
early for any_cpu events, avoiding smp_processor_id() in preemptible context.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- No code change.

 fs/resctrl/monitor.c | 47 +++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..be43eb36611f 100644
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
2.25.1

