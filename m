Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6423C238C1A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707540; cv=none; b=jszXmXWt7p+NZHy1v0AWAwgNa0Zx6VqwSGi6FLWX8L1jKap7vrPytK+gACLFyuy8k3UmzOZh8v7qmkM+w9JVod9lyLHxiHeGXU1juLvbMDiYm0AzmGYDF/OkVSAv3trFf3LP76jXlPdolS4c6lKp9/OATZLs26Imiss5LWyw5XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707540; c=relaxed/simple;
	bh=6aldtN4ey7HhVuJqveGfwVpcOqrd+UOagCBtbDnPWO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T7XfwqbTmqpc+4icjAo637CVV9TFXZqrkfApCHMtW3BEKJbEi3w9guMV5FnxbD6j0IgudGZCVcH7H41mphS0JKGagRFqOvoc53g0Zh1KhlrQsD7E6EdxcR8t19ZipgvlmRMo0oo5SXGajbzIIz4nqiLQbjB1Rv0XCC3Yg9+/4Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4xnBcgD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4xnBcgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707539; x=1821243539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6aldtN4ey7HhVuJqveGfwVpcOqrd+UOagCBtbDnPWO8=;
  b=i4xnBcgDqz1MLcBrHa7PGeFAUSQSoiqW3eB6Hsm4NARDJp/MM3lp7tRR
   YhjRQMZlbU7CJSlTb266JL9p20kA0AH5Nt/Cav3PTqmBNI624BaYXeJY8
   CKvuyxFdpr76F1RhFHL02zFqcL9048/xRCKPTYrhbAflvkndNvgmHP8k+
   LbHXGBXr8mk4j5aMMcNNiPgI38pTrJKW9bfhdZmtCJOQnZOdn25qvSdQh
   mzklRX7ppr9HMQs6em2424Nqtuj1B+QZ13subZ/sd58OzcEMFF+wzQN8W
   UxixvmY8iHqhcppoKfAfbgNxs6HFi8PKVJuJN0/aUcaIcXr48I3mCSn77
   w==;
X-CSE-ConnectionGUID: X+ON9zSwSp6Ly1eOPxpH2Q==
X-CSE-MsgGUID: wj2TlKq2QYiJQyUZ+NV3Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92699395"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92699395"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 21:58:58 -0700
X-CSE-ConnectionGUID: lMZxbsfpTKuVvG7aDTPPkA==
X-CSE-MsgGUID: gtB1PkZ3QsKyzPVnzx4GXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="279438447"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2026 21:58:52 -0700
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
Subject: [PATCH v8 1/9] x86/topology: Export topo_lookup_cpuid() for resctrl use
Date: Fri, 18 Sep 2026 12:48:21 +0800
Message-Id: <78066ab48e7c917417b0ac6c94eed5015f445180.1789705667.git.yu.c.chen@intel.com>
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

Enhanced RDT (ERDT) enumerates its monitoring and control resources through
ACPI tables that identify each CPU by its x2APIC ID. To associate this
firmware-provided data with the kernel's per-CPU structures, ERDT must
translate those x2APIC IDs into logical CPU numbers.

topo_lookup_cpuid() already performs this translation, but it is static to
topology.c and therefore not reachable from resctrl.

Export topo_lookup_cpuid() and add its declaration to asm/apic.h that already
exposes the inverse mapping via cpuid_to_apicid[], so that ERDT can resolve
x2APIC IDs from ACPI tables to logical CPU numbers.

No functional change intended.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
 arch/x86/include/asm/apic.h    | 1 +
 arch/x86/kernel/cpu/topology.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 9cd493d467d4..bb84651b14bd 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -54,6 +54,7 @@ static inline void x86_32_probe_apic(void) { }
 #endif
 
 extern u32 cpuid_to_apicid[];
+int topo_lookup_cpuid(u32 apic_id);
 
 #define CPU_ACPIID_INVALID	U32_MAX
 
diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
index 4913b64ec592..bcee70fb9277 100644
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -92,7 +92,7 @@ static inline u32 topo_apicid(u32 apicid, enum x86_topology_domains dom)
 	return apicid & (UINT_MAX << x86_topo_system.dom_shifts[dom - 1]);
 }
 
-static int topo_lookup_cpuid(u32 apic_id)
+int topo_lookup_cpuid(u32 apic_id)
 {
 	int i;
 
-- 
2.25.1

