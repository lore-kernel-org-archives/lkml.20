Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5404568FA0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600438; cv=none; b=ZbXPwSoZ5rp+IzoSTKe/XIS0Ra/K+TqV635wlRAbIJkTVoSju+0xr6/ZGUGiYbvUGGe10Cf2rg9OeYSHPYzpDCNtq1myopsCW+385G10X9rR50OidB8HPLjbyOicVhtW28613hzG3myRnFTFqUSEHlzpXnDVTEvU4Zylf+cM1hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600438; c=relaxed/simple;
	bh=cAKIPPnEb03hnvVJ+fHsQBXdQnWtKOGKq+ZwQ8s/riA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sucNJfRj7SUQWXlqnjxR2i/oLD2qu6Ap7jALHXiXKh02OGmYro8756veEGa7wVDVLXbOZREzK9rZgqiDZLEyKT6MGXOHafXyiS8Jma9tzjseLxD/teS/rEGvMUuwU9Z5nCJVMWU1QKU2iZglaBfVr7MuzfzGXjUZ/ID8p/seZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7TcXRKe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7TcXRKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789600436; x=1821136436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cAKIPPnEb03hnvVJ+fHsQBXdQnWtKOGKq+ZwQ8s/riA=;
  b=W7TcXRKeQMYDBN+FTQhUKGE2jRciJidC6DCXE0/CmBsxgMmXAryBhIdo
   l0AqFJkGjs/DmQWZ8iXBbXQh2+csib6aZSvDwPtAL8vkmm910Qi46ZfxD
   eYzupIMEVCShaFA9j4BhPIew598kUM59lqGqZlvDZecANYdpTrCedF8i/
   cFzhB+cgpL46iikGkuYnEW43whXtU1e4aB1EZL0CFKm2mWCxtoh4xA75b
   UrVE0js+N6rESXIjTA8sinRZ9EV+jU1olv9loRwm0Z2lxJ/u9hVKyuUog
   L0s+0qlM9vm0JRbFQgeiOxc+PXR4UX5NANnQk6mF0WWOr0XjUcu/gM8HJ
   A==;
X-CSE-ConnectionGUID: MwcbE1NlQFG3pGijR2Eokg==
X-CSE-MsgGUID: IB36ll7VSj+X3B66vkE3bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861528"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:41 -0700
X-CSE-ConnectionGUID: oHHs0ZqPRtKSfGY1etJdZA==
X-CSE-MsgGUID: MrRe/7NgTxafyqZwqa9+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277231504"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:40 -0700
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
Subject: [PATCH v12 23/25] x86/resctrl: Require 64-bit x86 for resctrl support
Date: Wed, 16 Sep 2026 16:13:18 -0700
Message-ID: <20260916231320.14502-24-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916231320.14502-1-tony.luck@intel.com>
References: <20260916231320.14502-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Application Energy Telemetry (AET) provides event counts in 64-bit
registers in MMIO space. For accurate results these should be read with a
single 64-bit load operation from the CPU.

In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.

This in line with Dave Hansen's proposal[1] for an addition to Linux
documentation that details the state of 32-bit x86 support.

Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v12:
	Added "#" to Link tag
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
2.55.0

