Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C41A38F9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983675; cv=none; b=Mlg54rht39E7j7ajK0IShVREPCHFQn6B6LucxXOU9z4H6yWhtNJ2/5oo3XJwefy9MWn+AirnZ39VQSqsuqXPrM+ZYHbKne6Y1IDOoCHBEz6BkWm0B4OFv0Ep6Rv7BeHR0zmcVIs1o7wbKFoLrCSF6xhO9nAhRa5S6qdEm5xcCpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983675; c=relaxed/simple;
	bh=wm9vnj/mdfa3n8OAOVXbiMEGZIh5d7gLv8Fp7tBnZzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YDx6hjqEFHDkUFcaX43N2XsIXvV1xT5p78OvCpiETP3viRHRqS+g+lr2ZuoP2c5Up8LSjprybn/0IcoOoFIs5ls18rqUTLoi1klgkCBwcY8uCItUn2g0ogs2n1nVadG5QS/zOz3mdMo2tElH9PVMEApvp50+um4v9OHg8XpDLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3pDfTVV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3pDfTVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787983675; x=1819519675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wm9vnj/mdfa3n8OAOVXbiMEGZIh5d7gLv8Fp7tBnZzk=;
  b=L3pDfTVVeqoQIxzwn5Qn2NC1Yo4bYGOsqhZskvuo1CvJ7D9vPaqGMp2j
   co8MfL8n73CR2s3nxxzD0juCl3S+fD/hA54o6EWFbv1DN8j1/wCuK24QH
   ZoQ/jPO1GjQGnsoQp22DNPpy8ynDxZ0VkPkWm33h1u22tYJw78x7evqyC
   fb5jdcgfWHkh+Bmdw4pb11bFCL4CISrVQnKYEw5zhE3b0qrFVriXt/SUt
   06GSEHA3HNl8DRObbLoezlMIIXXzET+Ae6qPTno9AMTITcCRBNUWkJ1qK
   zIPtUDckg9XVdeyiHWDgIIvsiX9hZxkjP0AM0cWX7VGu9BrxkFadSlWlk
   g==;
X-CSE-ConnectionGUID: p/XwrhczQIWAXpZzMqmPtA==
X-CSE-MsgGUID: KK5p8TpiStOhUAxqJ//pSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88685880"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88685880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:07:54 -0700
X-CSE-ConnectionGUID: idhmvLrQSCW/XGYcEkPuAw==
X-CSE-MsgGUID: tLS2rBlXRD65EnZ9NOMlqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="266543524"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2026 23:07:50 -0700
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
Subject: [PATCH v7 1/9] x86/topology: Export topo_lookup_cpuid() for resctrl use
Date: Sat, 29 Aug 2026 13:57:24 +0800
Message-Id: <d087acb8931dba22c80fdaa913c772f8f700dcd6.1787976868.git.yu.c.chen@intel.com>
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
v6->v7:
    Add motivation for choosing asm/apic.h, which already exposes the
    inverse mapping via cpuid_to_apicid[]. (Reinette Chatre)
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

