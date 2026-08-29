Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE9E41C72
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983979; cv=none; b=kUvCW/ywwZdjo3TGx5vejChupqz5yZJ/vjXOIHcRk1n0HWrTz43si9SiZKaqC2isZx9MRl3M9kWZS1d4GXtD+tA7x/3Z955s40SsfjLxbGiXORlVbI8KgQHNf62qStniZbtREObnqR8qQc9nrwNETeMby6JgPt3srvt5FA452k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983979; c=relaxed/simple;
	bh=GWh4zXYWZWve7WCa1ybRUlJ4g1kljTHwU33poRapBeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NCSumsgSMmikbjxWYYbJJRD9Q/deZTHRIb0aWpU9/mDomRasWHRWLdtHASb0yberYKDcw3akCS4GMG8kR+vz9q2agFb/0je12+Hjp0/DlA3S0gDZqzvb12oainUK+Yz2btBmy0RLpOOdEcCSZDRyeq+/IMnV8fcFKyyf3FhVzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqMlN03Z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqMlN03Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787983977; x=1819519977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GWh4zXYWZWve7WCa1ybRUlJ4g1kljTHwU33poRapBeM=;
  b=eqMlN03ZCjAZMce9S1i8Rzq4MIjc5mhgRet2yGPmvO8ztkZCcLbjVmzJ
   FDZCEQL7CiGz4VKxCXcSJ7rOS0U3Vgmpbo0pkJxui2rhV5lCYPuDU8gsC
   9S0+/4IEZnyPkmt7duGKOfnzSKs2yChojl7GXdOAXi7UrEkuCyz9xS66+
   t5MiowROyxSSNZOs55RBHZIVwVb+L2bAvdF3gSx/VVWBvx65EjTke2yyK
   pWRGFZVQSPxmdmNN1B6HAD2oFmnnB0kCQuOYgrvRyk0gYnuHLwHN2mu7M
   iX3ZTAl7ZekuySYwz8iuZlBsJBpAl24iA/MR4gFWhi0kTy9eO2T5tTVnB
   Q==;
X-CSE-ConnectionGUID: DTHz9/T0SnG+sechlYyfEw==
X-CSE-MsgGUID: 233IZ8CeTG6FGsD8okDY8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88507849"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88507849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:12:56 -0700
X-CSE-ConnectionGUID: N4DgrJ6PQRqTboDKsHkdmA==
X-CSE-MsgGUID: d28Zia4PSSWTdKmAO+dx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="271860764"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 23:12:54 -0700
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
Subject: [PATCH v7 6/9] x86/resctrl: Refactor the monitor read function
Date: Sat, 29 Aug 2026 14:02:28 +0800
Message-Id: <1e5d8b9da4bc7cc125bf0c34afd4bb837b6ca79d.1787976868.git.yu.c.chen@intel.com>
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

Split the monitor read helper into an L3 read path and an AET (Intel Application
Energy Telemetry) read path. This makes the two distinct monitoring sources
easier to extend independently and prepares the L3 path for ERDT-based MMIO
reads.

No functional change.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
v6->v7:
    Keep the original resctrl_arch_rmid_read() parameter order with the
    resource first, and drop the unused closid/arch_priv arguments.
    (Reinette Chatre)
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 569894d6e5c8..8057f8403e56 100644
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
 	u64 msr_val;
-- 
2.25.1

