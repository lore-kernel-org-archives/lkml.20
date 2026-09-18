Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227EB37BE8E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707673; cv=none; b=Qf0VwDHt5EqFXaXKCdTQyZcRD/bxJxkXW8srGUhJWcVeFKCW4XvWJKkjzJhYqM5oTH+6LlRonCFaqHVxzYfVdxhrPmiPPZBwGneOOeQc3P95k/cPcfK8gqWjr2nOcIwKXHd8bn2cI8O581TdkCR5Wfdm81tJ1B6D7FtTdUzaOkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707673; c=relaxed/simple;
	bh=Fnz2mSyZbEjv8xagaQfGCXTO7opPZat3MHmf6dKakhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7FqAaO8QiT6tyVzDOm6hAZ7xTfu/s6/S/q5yaIBegNNrbouYCgKEvtUQxunJTEUloIZe3R3uUoHWVopssYewb2M8+hAK/OYVaa+Qv71KmXjLYIESI7gctYj38MUY7+QF+8QpFwzE2CvjWqkguK4kVFz8tvqf2YyOZaY+NWGN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGRVKmB0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGRVKmB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707671; x=1821243671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fnz2mSyZbEjv8xagaQfGCXTO7opPZat3MHmf6dKakhI=;
  b=LGRVKmB0UHfiIFdjR814s3Ygap4XLXM1Ff+kSew7sozIkEWJW29PJZJf
   iggH4lNrw9M5n8uxljIVRhe7uct4oBcPCs+D6QHZft9ouFGZYm77u9Otv
   RKxFMuclWRbuBzhT+z5oyXOk7HpsHNeJthQvybB7iFhRxPHy6hvYmD7Wb
   jScqOY5v3s+VvwBFGySOjOrVXAyMxeVe/jwxZt4nn6othRW1og5VzWTn3
   dXunDRque5G4P4k+fPV/jPgj4OqPuXmYjzUYoAD9zRygw4nc0Hi4YmMZU
   yDUFzZj2vWndWdfixIEhSNPHIcof2tnVvAMazPczFV3hXFMUXm97MNaJE
   A==;
X-CSE-ConnectionGUID: fAkd3jVTSAaL2xihIgTNsA==
X-CSE-MsgGUID: ERwRgazxSOGUC/5bZzwtCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107693067"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107693067"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:01:10 -0700
X-CSE-ConnectionGUID: DzV++Gc1QSSoNl1Xs6yW7w==
X-CSE-MsgGUID: 1BCUWGVCQKq/xaZZWGwoIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2612153"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 22:01:07 -0700
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
Subject: [PATCH v8 6/9] x86/resctrl: Refactor the monitor read function
Date: Fri, 18 Sep 2026 12:50:41 +0800
Message-Id: <ad791d4e9bb6c466f98c5604d7684ab25459dd1b.1789705667.git.yu.c.chen@intel.com>
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

Split the monitor read helper into an L3 read path and an AET (Intel Application
Energy Telemetry) read path. This makes the two distinct monitoring sources
easier to extend independently and prepares the L3 path for ERDT-based MMIO
reads.

No functional change.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..138fd420131b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -239,9 +239,8 @@ static u64 get_corrected_val(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	return chunks * hw_res->mon_scale;
 }
 
-int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
-			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
-			   void *arch_priv, u64 *val, void *ignored)
+static int arch_l3_read_event(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
+			      u32 rmid, enum resctrl_event_id eventid, u64 *val)
 {
 	struct rdt_hw_l3_mon_domain *hw_dom;
 	struct rdt_l3_mon_domain *d;
@@ -251,11 +250,6 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	int cpu;
 	int ret;
 
-	resctrl_arch_rmid_read_context_check();
-
-	if (r->rid == RDT_RESOURCE_PERF_PKG)
-		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
-
 	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
 		return -EINVAL;
 
@@ -281,6 +275,22 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	return ret;
 }
 
+int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
+			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
+			   void *arch_priv, u64 *val, void *ignored)
+{
+	resctrl_arch_rmid_read_context_check();
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L3:
+		return arch_l3_read_event(r, hdr, rmid, eventid, val);
+	case RDT_RESOURCE_PERF_PKG:
+		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
+	default:
+		return -EINVAL;
+	}
+}
+
 static int __cntr_id_read(u32 cntr_id, u64 *val)
 {
 	struct msr msr_val = {
-- 
2.25.1

