Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD08B36BCD7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947276; cv=none; b=R0ImdwZmgQGFfovavhnRFCjdHI+PsK5tu2Km8WfN3gr3uIW4X3Lpo8M59Lx93hfJxKiYduMMT1KyVVXwXyinkeW+DD7HOFQyqsRk9xZrPRuVNim32s2BHPaCJ53H1HdpvvnCfss0ZheDsAGjoqYc2bbr3zPplfRYIDIxul090kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947276; c=relaxed/simple;
	bh=8x5HcehG5q9QCiwWnf4Lga1HCLbtnqJTAPa+8FgB660=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WblhyqKwjCgOSFTw/DMVR9hEF2CyD/uP8iFXWRwYuUlN06MxhUqnJwv5sFEHfRP0/k09TvSsnXFq2jH5YrQaOqxKAYjeLGDRXCUAPuJwcdKz0A8jYnjEa8u5JNlQc7mzkw/H9FKt5iOSdJ9+uoCe58Kjc7iZ4ea+ouDpHR/3zvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caz8tYMq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caz8tYMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947275; x=1823483275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8x5HcehG5q9QCiwWnf4Lga1HCLbtnqJTAPa+8FgB660=;
  b=caz8tYMq5DBqe5h+7vkf1M76mAU3jBQOPCmILyv+NCp/BInfI7Wm237W
   T9X1lTI9dKMBRA3CWju4bOMnvFIJoN6pmJmmiJ41x8z61B20HU+XUX/Oa
   CijSx3BztUTX0yCzQJ4A/FYlJBkSyLGpKQGIfcUEfHlsJtCSQije5p+5o
   aNDV8rVUrH1IeFgL3mDLoMUjjGLwuItfTQvWRo8V+6rmK6F2e9mbbpMzG
   j8anf0Gu+zvqcklij5Abm11+oNFjSLbPvDmm61T7SevBe4zYvWOGaPbMt
   rBl9LlS4MoxHYu1SbIWxkS/zcQSjvmEwTd0hCVueXPCk9dgTRQ6F81Llp
   Q==;
X-CSE-ConnectionGUID: S52fdEOwQQyPuGdzXVbIKw==
X-CSE-MsgGUID: J8+f/kTWT9a8BrGKvrnZ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="703044"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="703044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:07:55 -0700
X-CSE-ConnectionGUID: QZsi342nTL6vmURecnNyDQ==
X-CSE-MsgGUID: uy0vs4HpSU6EFlk/CHkYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1256323"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa009.jf.intel.com with ESMTP; 13 Oct 2026 20:07:52 -0700
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
Subject: [PATCH v9 01/12] x86/topology: Export topo_lookup_cpuid() for resctrl use
Date: Wed, 14 Oct 2026 10:57:14 +0800
Message-Id: <37030a968c44c3f306f97da161a12a99808eae49.1791933001.git.yu.c.chen@intel.com>
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
Changes since v8:
- No change.

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
2.43.0

