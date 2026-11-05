Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873956;
	b=zn/NbzQORdL8bSyE3DugV7Coc5uLHPcg8gyU9paS1gXENSchvBpvBDlG090jhQyVZckd
	 GZXZXWKh6a948eNwQKzwabaKnKnMRje5TQhhWzrD6R7+xRPBFxcaJaMxca/XTU8Jkvj/O
	 1O+eK+jYkVyLxKB/BnXLHec7nX6E8AX6dr0wjYaPDug9d69EJQg/2eOOplLjpXgw5S6gL
	 WMCOlGgnFg1ObJYJ5FSQaKlsTJEv5AW1k2pQe3yi6LommjhzrACjkLUb1dFXrq4YNtgQ6
	 1lIArHoMlCjxPtsltn5V4QHQyHbvaBzApHeE5DHEaCRVkHzdJOEYFJ0AST1Oivetppw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873956;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PNHYaX2uyoKJULljJPSq/lZ0s8sQCRzCR4cV+BEsP5s=;
	b=cHtAgFtkA0UR5l+41jUhRJ+YCxD7mMKa3yyKrwFesZex34xgvENy8GLIQeG/Gz2aarDd
	 +aVUMuLES0e2hp/fVXuFFmJJp8XSqyP1A643d7FDeX+TjzVfFX9LMXs59cdeQfqiEnKmm
	 flFbmALBIAlVQZh/MJysvi7Xw41teC++lKT83417F/3oLApHFohU/O/y60fssSvtxZbTZ
	 ozCl5an+EYjy9xiBgHW3QRtPUjsESraCZriexyhiOPvXiamUHsKBbfUj68V27vL2FXYzq
	 0CIgg/oi543OIWM8YPzX/g15zNuAwOh2QAZqioDoXFnzk91saEJzV+vUqrq1ZsDpGPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=knIKPBC7;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F095606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F095606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=knIKPBC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873955; x=1825409955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ibHSVn1iFI3W9DDYqxw66EnywcE2HOQpJkWsm4BTRl4=;
  b=knIKPBC7EiaFkkZwTGleeV7J1fAGQZs8oMyFcRil55DMlbb4CfY6nExC
   pmPdnMaFqCthIMefKKCyEWxu5Pqv2JEQXSmjc6m4tUyUeX3F/S8kbuqRS
   EWUDUzfpikzoQbjTtOuimtOjerG0VIl7nYHy+/+qqbxZuhn6wmQFirBJ6
   CGdhQmeMvZsq2wxdJ+lThoan7OMZJY/BnyvFtZGtzq6wrfCZRTgrDhLpr
   npzYu3Dy5xfdC6sZEf4bvZqLvwaLkUw75ftAUpfikOY4nwuAsbgcajhBW
   s72lI75acZYU0pfBMUmoPAFSle/pHzFd59AFN3YKbPJioV05yP1fJ4kMs
   A==;
X-CSE-ConnectionGUID: itiKADZ6ThiX8lia01oqSA==
X-CSE-MsgGUID: 5JRk4CqUTRyaBWH2qXN1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2558343"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2558343"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:19:14 -0800
X-CSE-ConnectionGUID: 3vFYKdgzQx+DCFhGerZEwQ==
X-CSE-MsgGUID: BLJ7gsDmR8Cx+Z4Ya2G0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8741658"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 02:19:11 -0800
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
Subject: [PATCH v10 01/12] x86/topology: Export topo_lookup_cpuid() for resctrl use
Date: Thu,  5 Nov 2026 18:08:11 +0800
Message-Id: <c81456d74c0a573ff91882285f351510f7ab953e.1793864720.git.yu.c.chen@intel.com>
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

Enhanced RDT (ERDT) enumerates its monitoring and control resources through ACPI
tables that identify each CPU by its x2APIC ID. To associate this
firmware-provided data with the kernel's per-CPU structures, ERDT must translate
those x2APIC IDs into logical CPU numbers.

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
Changes since v9:
- No code change.

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

