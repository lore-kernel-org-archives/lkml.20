Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B023603D7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983684; cv=none; b=M0On3wzNJh86PgXrXfvc1mxHWNKa25HNzKLRtnvu5I8S37a8QTnUbDTwCL3KDzmSlJMvKQeDrk0I+EEAU2rfG6kKaHoFvJgMNjdEzyfMCHtRcGAqlONhfpPv6wFSKLx8sKUwh87IU+g632o7fQVMcNGAhQcBtMbxCwzoWBoWFE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983684; c=relaxed/simple;
	bh=BRp3sUhJq7vcMcoUSMNTEQQai41QCEr1vyAeOR4UNsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YEqPEg+L8CSm3JpKdhAoqUsL1BzA5Toqp0S5xZhthc0FMXMmmI80paI5L/tYR631uyXHl0a9ffVaEamuL89C/GNHuXOC6ELejmG1/Td12qI1ubEL6TOeY0M/Qs5QIUFNLS5sZ8AucuB2Jk8I4Ers2xa6gsPhB1wG+FkBYYdCb6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1JlD6zP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1JlD6zP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787983683; x=1819519683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BRp3sUhJq7vcMcoUSMNTEQQai41QCEr1vyAeOR4UNsk=;
  b=a1JlD6zPL01+ONq8+YhQ4Cvpl+ZTGCmt7GfvOSZNDmDaCbKQy2m0oppP
   MKuS0/gtli3bX/1iTFiZNjBp5WbA41t+nPOEAmrws12tg3JhS14HmYgv+
   sefYgXc7XKMdUZsI12ocb6FZTOPIcYkcxNOep6IgFy8p5HxlvnXh5C468
   6KbdTSCG9xHHI5Mk6FzaTw0nWFRMARx0PgNd0VcOyj1gpTXTdk0hmokTu
   IwituiR8LbXuFGerXMBCEz9euwSY6GWo7FraWfHptPrrkLHEIJNoq1in2
   k2V2oUe33UhOExeU03O4Kt8ts6lBMF39KmUVCKKvzORzowSzS+ITgwBi6
   A==;
X-CSE-ConnectionGUID: JJtJGyACQNuYF354VLnaLw==
X-CSE-MsgGUID: MAYRKI+iQeeipdoIs2t9CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88685896"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88685896"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:08:03 -0700
X-CSE-ConnectionGUID: Kb/5FxWFRHu1S+YHf/2DfA==
X-CSE-MsgGUID: e/pEZ35tQKeBgiI3n5F34Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="266543551"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2026 23:07:59 -0700
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
Subject: [PATCH v7 2/9] x86/resctrl: Require 64-bit x86 for resctrl support
Date: Sat, 29 Aug 2026 13:57:33 +0800
Message-Id: <185a82864956b6c029fc7fd9525f68dbae1d1fc1.1787976868.git.yu.c.chen@intel.com>
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

All known hardware that supports Intel RDT or AMD QoS is 64-bit. MMIO-based
Enhanced RDT (ERDT) monitoring requires readq()/writeq(), which are only
available on 64-bit.

32-bit x86 is maintained for legacy reasons. New CPU features are generally not
enabled for 32-bit systems, its test coverage keeps shrinking, and modern 32-bit
distributions have become rare. Discouraging the use of a 32-bit kernel is
discussed at:
https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/

Drop 32-bit support by changing the X86_CPU_RESCTRL dependency from X86 to
X86_64.

Since X86_CPU_RESCTRL now implies X86_64, remove the redundant X86_64 dependency
from X86_CPU_RESCTRL_INTEL_AET.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
v6->v7:
    Replace the inaccurate "no realistic server use case" rationale with
    the legacy, shrinking test coverage and rare distro reasoning.
    (Reinette Chatre, Tony Luck, Dave Hansen, Borislav Petkov, Peter Zijlstra)
---
 arch/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bdad90f210e4..6685e120cff3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -514,7 +514,7 @@ config X86_MPPARSE
 
 config X86_CPU_RESCTRL
 	bool "x86 CPU resource control support"
-	depends on X86 && (CPU_SUP_INTEL || CPU_SUP_AMD)
+	depends on X86_64 && (CPU_SUP_INTEL || CPU_SUP_AMD)
 	depends on MISC_FILESYSTEMS
 	select ARCH_HAS_CPU_RESCTRL
 	select RESCTRL_FS
@@ -537,7 +537,7 @@ config X86_CPU_RESCTRL
 
 config X86_CPU_RESCTRL_INTEL_AET
 	bool "Intel Application Energy Telemetry"
-	depends on X86_64 && X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
+	depends on X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
 	help
 	  Enable per-RMID telemetry events in resctrl.
 
-- 
2.25.1

