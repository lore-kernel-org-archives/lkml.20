Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673673F105D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707588; cv=none; b=UDe8gdEzC4UtfNnVNTIsL4w9SDnbFdSUSjPAvrKOtauTPmQHy/Iwtgl88tZGqJVC0YwFdjBdowMS4spEVBfqTfBCMiTz6R9Vu/F6uhb7hj7JW1NIMYcGzcpnCnZQOH6mhspQ9zluIIpoOcjNTyuHibP18/SVlzO5rP2w28IrPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707588; c=relaxed/simple;
	bh=BcTR5EDFiVeGoYMwZ5vWzexnMIV8T2dcLFpKkfv+Nic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xjeho1wF1IzvWu2imrRxuwPe83NiAJweWFC4cuMqdo7isKYaJymdvE/4QI/hDgPRZ9sJhJXjEuFZYKrql0MNwFco8q1HmHSd5PGplVxBE4i7nn9oGCLz7jSpnfirgsksRecxkqdWXNgYLJqYAit2fSCC1EoOVGLtKjKB7EJxoOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbIUrMuB; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbIUrMuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707588; x=1821243588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BcTR5EDFiVeGoYMwZ5vWzexnMIV8T2dcLFpKkfv+Nic=;
  b=JbIUrMuBfQqiVtUTkTq1o82ZzDr387wYWZDhcslqLXFbLE4TPnMIYrb7
   hkVUshlNnpM/eRRcEYVsao9lVhK856B8lwtkPzYIygQIRbcaOECZXEMYD
   aHMHmGcgqpVeFhWgHifeR2/JLMQg48KuUiErQ+m8Hfs7mECGR3Bxk8iFk
   B6M24CD5y/ke0UL+Ss5PREioWdqDJHx8zj9A8sojqWIDZLmzM0NIkms0c
   6Iu1HQmmnEks9FpERhee/jl+jr/a5sFAZDxqag7cEy9j/ff0TOEdQsXFY
   /laEtA3r9wRofmbxjLy1Td1SEX0NJbq9Ugjf6j6BYZiVtpC0ZL+4BLUqL
   w==;
X-CSE-ConnectionGUID: I8qdJh3NSAuk+a7v5PTWog==
X-CSE-MsgGUID: pes0bjntTjWPyH9ZR2c8Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="704598"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="704598"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 21:59:47 -0700
X-CSE-ConnectionGUID: yI6mFI4lQJSk2X3UOwrigw==
X-CSE-MsgGUID: ZodesKnUTJmNQ032tHVVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271541891"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2026 21:59:44 -0700
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
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v8 2/9] x86/resctrl: Require 64-bit x86 for resctrl support
Date: Fri, 18 Sep 2026 12:48:38 +0800
Message-Id: <711a7976e0a33cd6fa2872ff10898b66d34fcd70.1789705667.git.yu.c.chen@intel.com>
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

Intel Application Energy Telemetry (AET) provides event counts in 64-bit
registers in MMIO space. For accurate results these should be read with a
single 64-bit load operation from the CPU.

In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.

This in line with Dave Hansen's proposal[1] for an addition to Linux
documentation that details the state of 32-bit x86 support.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
---
 arch/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..06b5d0c4633e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -518,7 +518,7 @@ config X86_MPPARSE
 
 config X86_CPU_RESCTRL
 	bool "x86 CPU resource control support"
-	depends on X86 && (CPU_SUP_INTEL || CPU_SUP_AMD)
+	depends on X86_64 && (CPU_SUP_INTEL || CPU_SUP_AMD)
 	depends on MISC_FILESYSTEMS
 	select ARCH_HAS_CPU_RESCTRL
 	select RESCTRL_FS
@@ -541,7 +541,7 @@ config X86_CPU_RESCTRL
 
 config X86_CPU_RESCTRL_INTEL_AET
 	bool "Intel Application Energy Telemetry"
-	depends on X86_64 && X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
+	depends on X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
 	help
 	  Enable per-RMID telemetry events in resctrl.
 
-- 
2.25.1

