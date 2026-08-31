Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8047AF75
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198279; cv=none; b=HkMg0oUbMNzaI1LRnQ5kRobjEsSuEljXMJvkls1Yz38o2j3SbOwyFIDNZX7AwIf448rm6gekPo0Nvhwj/D3y+95zJv5EHCPcwFaAdi6m0gcfiSMvsO2nifG46N2fZ29WMxEVQXS0s8WyLJxDKTKP3tqf+/l80FT1gbQqLkcZ3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198279; c=relaxed/simple;
	bh=hojs2ET8W3LbBA9nShG0eUqGsi0qv2zkp79nApua7HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUZ6RuOONU66YnKO1fgd9/jTtWA8k/lsXOZRYBXJKzQsoeYVe6yJ0Yt9iPemW5UDAhp1U7R4lTGsmWqib0KPoGjKEIpJuTqRufZxcJSYv1zSJMBRGQ9DsFKJeBzkxvVIaNBmf3Bh5HLFV5mzTMpX5njZJK1SfZMVudQF3cjUREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyrjyIEw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyrjyIEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788198278; x=1819734278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hojs2ET8W3LbBA9nShG0eUqGsi0qv2zkp79nApua7HE=;
  b=XyrjyIEwisK7rF+wpe1F0LXPHW/xbo2TRKMQTXsRWwPAMOOx0xEDSUms
   HTCyfy2XI2HklCMQifOYKtj864v/dsofC3A3loZzSRvQtDi5EmurGVhZ5
   iC608jwjDI8+4Rby3i1B/oSj1u7luU4MIf/YSKE2FfuW7uNF+H2aZvqEG
   YHI+oAdd3HfgWf/hgo7IviKI7HKRT8/BZME5po7lk4KjP7GCb6Joex+Dt
   mR2GUNYV01Od/Ga+wKlzZhaMoJ10XI7mKZ7pgSugJJ6oYzbKqwMOBIxXJ
   OpaS2P9B65C5bdM3zPnUr309yfCuGobpbY/wOfj94vgDK6Ln59ahgrn5F
   g==;
X-CSE-ConnectionGUID: of0TLG6QToS5rPqw2htRgg==
X-CSE-MsgGUID: Dqs6SEDeRx+M/TTJRzjOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92479959"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92479959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:35 -0700
X-CSE-ConnectionGUID: a18VEciqQVubKcXFvJ3R8g==
X-CSE-MsgGUID: RoSzIApsS+yQ6SQrNMrFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="268906965"
Received: from aherrold-mobl1.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.17])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:34 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v11 07/23] x86/resctrl: Add special case for Intel Haswell enumeration
Date: Mon, 31 Aug 2026 10:44:05 -0700
Message-ID: <20260831174421.13921-8-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831174421.13921-1-tony.luck@intel.com>
References: <20260831174421.13921-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain Intel Haswell CPUs have support for resctrl L3 cache allocation
but do not enumerate the feature. There is a quirk to check for support
and provide hard-coded parameters. This quirk sets rdt_alloc_capable
to indicate to get_rdt_alloc_resources() that normal enumeration is
not needed.

Replace the set and test of rdt_alloc_capable with a new variable
in preparation for the removal of rdt_alloc_capable.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v11:
	New patch

 arch/x86/kernel/cpu/resctrl/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index b657eab4eb0c..62b97e357ce5 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -138,6 +138,9 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 	return &rdt_resources_all[l].r_resctrl;
 }
 
+/* Skip regular allocation if cache_alloc_hsw_probe() succeeds. */
+static bool hsw_alloc_capable;
+
 /*
  * cache_alloc_hsw_probe() - Have to probe for Intel haswell server CPUs
  * as they do not have CPUID enumeration support for Cache allocation.
@@ -178,7 +181,7 @@ static inline void cache_alloc_hsw_probe(void)
 	r->cache.arch_has_sparse_bitmasks = false;
 	r->alloc_capable = true;
 
-	rdt_alloc_capable = true;
+	hsw_alloc_capable = true;
 }
 
 /*
@@ -930,7 +933,7 @@ static __init bool get_rdt_alloc_resources(void)
 	struct rdt_resource *r;
 	bool ret = false;
 
-	if (rdt_alloc_capable)
+	if (hsw_alloc_capable)
 		return true;
 
 	if (!boot_cpu_has(X86_FEATURE_RDT_A))
-- 
2.55.0

