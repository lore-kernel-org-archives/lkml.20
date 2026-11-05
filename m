Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873975;
	b=K0DaD6RrAV4pP8woM2QXMARr/6j/3s1yk4BsLqJNtXF+G1S38YyxZX39urmTucT+E3nW
	 44mRKTAnApJGnZd3igDV0xfy2xoz1zrQB7bdv4V4MjTxHV2o5UFkJW1LmCSKUZ3RrPw6r
	 wRsrkyFboUYVeoMj8RIH6c/3leLAsZ06ofhc3zESXZsu5jTsfkYzGpgAKdQeBR9xHVaFX
	 fA1CDiZJfxHHdmLXOPbagrEc4RIXz08vD2bhqKd5ODCqTcpb9O2zlR4piO5qB/nVKvTPF
	 jeXoiniawU9mh32va/ylhq+172MmRuWEcLRJJxR8HPGZMAiXGxIw9V/+b54IpX8Unzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873975;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V1425VickH0U/cq3HA//BsimIL61YS+3s6S4I+LnDFY=;
	b=22rkAsFRjMvYXveog5nfBKFrpPsBYixWcMvVtPPPqoZEk3aH92f1Cs6r7znYfidxi51P
	 NztfuH3fVYKIa3fcgKM5V2BrLg+bS8OcKnRI92UsjnRWBzx0fhAozhQy61hYvp5Xf5U+N
	 42NXsvEEdlJ9RrFjmRqTLEjXOhBghwwaX1b24LumECGZw6AFV6hZ6ArLTEuzTksbQ9Ftb
	 H3qXZZL+9VwY/ELdjkQvg7knECuPvpsx73FwReNjNw8PpP3KPeWm5Td3eJduBSLjEN14p
	 8tiFPNEItxB5ZjcNsJCzO/i5ZBTo9zOoTLJ1ts4E/5beelLzSB0btlWju7VVJNFWL2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYhKMp79;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB378606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB378606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYhKMp79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873972; x=1825409972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zj0zVNOu94ih07InFYHgHqA1Pz8gcacruHHQkFrLLpQ=;
  b=NYhKMp79rnjMBbIfRtXSmpVO1dkw4s0B/DDF7I7fVd1sh20rE1ssFhLM
   OLUWh1dg+byUPG8TmD/cNN7qRAaLHWqnu5kwwAf/r275j2PCDasgkVEfb
   zForqq62iCqE/wos4wFVxFI0I4fQwGJ7OxN/HPBeCA/GIjoVyvhUWKC9D
   XcuwcGnXvpr4UzkOvvszd7j/iuZC8+uFyEVqJ4ItRS5FxXDLXoNUyL8vU
   gMileqaMod6D6ecfsEk7d5TSOJq1saiMyU2Gfj5OgqaJLrSOPeEXjnYZf
   xSmGzqCeP7zJCDx7en+S8CL3uNDZNmQNF/+UJOUS1q8W7tYXqNe4Bpf1j
   g==;
X-CSE-ConnectionGUID: x7A5H3FsT4KY11Vz/GI3Lg==
X-CSE-MsgGUID: aSmbn6VlQMiZUESxI+6rPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2558379"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2558379"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:19:32 -0800
X-CSE-ConnectionGUID: abrshWGPTYu/d9jzsvHs1g==
X-CSE-MsgGUID: hmA+C8GUSKyTM8PuN9yZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8741743"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 02:19:29 -0800
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
Subject: [PATCH v10 03/12] x86/resctrl: Require 64-bit x86 for resctrl support
Date: Thu,  5 Nov 2026 18:08:29 +0800
Message-Id: <39843a4166ca45ac777548eb70e777e2f23c949c.1793864720.git.yu.c.chen@intel.com>
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

Intel Application Energy Telemetry (AET) provides event counts in 64-bit
registers in MMIO space. For accurate results these should be read with a single
64-bit load operation from the CPU.

In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.

This is in line with Dave Hansen's proposal[1] for an addition to Linux
documentation that details reduced 32-bit x86 support.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
---
Changes since v9:
- This patch is picked up from the AET series so that both series carry
  identical versions, which is why its changelog refers to AET rather
  than ERDT. (Reinette Chatre)
- Add Reinette's Reviewed-by.

 arch/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179..4aff3c6cda0c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -515,7 +515,7 @@ config X86_MPPARSE
 
 config X86_CPU_RESCTRL
 	bool "x86 CPU resource control support"
-	depends on X86 && (CPU_SUP_INTEL || CPU_SUP_AMD)
+	depends on X86_64 && (CPU_SUP_INTEL || CPU_SUP_AMD)
 	depends on MISC_FILESYSTEMS
 	select ARCH_HAS_CPU_RESCTRL
 	select RESCTRL_FS
@@ -538,7 +538,7 @@ config X86_CPU_RESCTRL
 
 config X86_CPU_RESCTRL_INTEL_AET
 	bool "Intel Application Energy Telemetry"
-	depends on X86_64 && X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
+	depends on X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
 	help
 	  Enable per-RMID telemetry events in resctrl.
 
-- 
2.25.1

