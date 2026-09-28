Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D304C9DE0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633727; cv=none; b=eZLF7vkgZXHBTpEuaka3iZI2VPuA8pWW77EMNU5uER/CrXHD1VdP2HJ2reIR+boLYhco5UoEvh3eWC8OcTQBATCTkJOqz7MwiVRIMEwNtSGMDF19CYpUrkzNpwME8oJ6qVR0y4JJk8nJelGa2b5Up3GVhrZPqAgutmExRHXbo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633727; c=relaxed/simple;
	bh=IRqoKFEUUPH3JfUBrnXoDVdYH2g0YY0OxwRoPolp5Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVanFtVyXnCPDsjOYS8YGHylY0bAnSLqExrMpX50v7W1GMMoTGaxGLO2ACn3LXJl91SjACpTcZ5zoxGI+9mGSHGwQ9VyVl0d5BWY8ZLCXK6E1H9dCA55aPbX9GMgIpzysIw5gvPuxfHgQFXeRwrXLnvuUa6MlW88/gAHupEF0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0axI/mp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0axI/mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633723; x=1822169723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IRqoKFEUUPH3JfUBrnXoDVdYH2g0YY0OxwRoPolp5Jw=;
  b=T0axI/mp1VMNgVTLnsxZWJQmeNRKe8EYar7OGB2abiaudiZZ9h6qc5WH
   XKt9+ZZry9I/pCwAPqLfw2eVvp974YMAqXrdezSK2hOy78YiwpbSInijI
   LmTY9lfHDXv9cd/ZjXN1AP+2QlU9jNotp7NSU3tz/XYg0GfX4WhUEMKwO
   HUui5YbI9ZoBP1KHqI9amkcZ1f/Fgx4HAHcXEJrdQOnPh4cigyKr9tYz2
   k++rjJkXUHUgTkUy0nvO1PT1XM3Ztws4K+KsDlL33fFrbEv5NvNULkJHK
   bU1m/EV+mEexQ0oD1+p4RyWpKERs6i5yyaXKY+y1Wx/pLVnSo0UvxsYW2
   w==;
X-CSE-ConnectionGUID: /U40qrXPSDan5a6pGY/BSg==
X-CSE-MsgGUID: k2gg2BjuT8GsS/nyx/RFaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387179"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387179"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:18 -0700
X-CSE-ConnectionGUID: lI6QkQZ+T5+EwFtwgKuBog==
X-CSE-MsgGUID: /hSIZ/obQHe0dFlJf6uoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685466"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:16 -0700
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
Subject: [PATCH v13 03/25] x86/resctrl: Check if monitoring features are supported
Date: Mon, 28 Sep 2026 15:14:47 -0700
Message-ID: <20260928221509.68002-4-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928221509.68002-1-tony.luck@intel.com>
References: <20260928221509.68002-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both Intel and AMD manuals say that software must first check
CPUID(0x7,0x0).EBX[12] to see if any monitoring features are supported before
checking for resource specific features supported in subleaves.

Each of the L3 monitoring features is further gated by CPUID(0xF,0x0).EDX[1].

Add checks for these feature bits.

Maintainer note: No need to backport this fix. No issues have been seen
from this failure to follow the exact enumeration process in the manual.

Fixes: cbc82b172638 ("x86: Add support for Intel Cache QoS Monitoring (CQM) detection")
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Dropped (Linux: X86_FEATURE_*) from commit comment
	s/specific features/resource specific features/
	s/L3-based monitoring features/L3 monitoring features/
	Added maintainer note about not back porting.
---
 arch/x86/kernel/cpu/resctrl/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..34ca3c7cc046 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -968,6 +968,14 @@ static __init bool get_rdt_mon_resources(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 	bool ret = false;
 
+	/* Any monitoring at all? */
+	if (!cpu_feature_enabled(X86_FEATURE_CQM))
+		return false;
+
+	/* Any of the L3 monitoring features? */
+	if (!cpu_feature_enabled(X86_FEATURE_CQM_LLC))
+		return false;
+
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
 		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
 		ret = true;
-- 
2.55.0

