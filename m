Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0805F502D62
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633737; cv=none; b=M6gzbS3gHCHwnoB98PEgA3ljL6UvIYIsI/U+07Lz8M03ryFNxxX+OeA3miXNmiBHDHBGYAYQfaCEwlDpMZB/yoYqViyWkjpQck+F+gNT70H3qEk9H3I+YGFc/CqK3gWS1ftrOAsigTv/IZdcwD2papxyaZ0DBFjWQM3A9RdHiuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633737; c=relaxed/simple;
	bh=R/bZL9/i7VtvxOOoAHBt/F+3fVEIN+/aOaIsm8jgjUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oct5hJ1yw5t7NubrkaDrLiqFjciRdElIrj5hUKp8hdT5cCG0VxEr8QKKaoZCdBfxwjMnj/xRxZakky3HogPddhGKMkrF9U1ctYifkPoTKpunMaV6eP5zbFTeghfFJUTvQP2GfMWJBIGxKDgpSyh6e5L3yeNw7RhJ84AtV2dpzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haVmkvX0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haVmkvX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633734; x=1822169734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R/bZL9/i7VtvxOOoAHBt/F+3fVEIN+/aOaIsm8jgjUo=;
  b=haVmkvX0NLXLX1dPv9EVcBB6sod8y5mxsgVBrqXPgtRDAtXB532Lz+Eu
   qtqkEBwcIi0fGS3G8SF/SczEPFL3P1aj/a4igI3SECxAGMlmKWr9/vrSh
   OsgovjUtdU071UpjHTBiVjBej819umJ4fnW/AZfoJqMPja9jtd0XrdWIE
   5FKiTKHrjoBidLBlynpzNQhFzWuWbP7ejB1hF+DgO6aSu682+0D23LlDA
   6NehnFDV1PiKPfSB5SLjm+jKRFK6YY2vzTtVKKWI+kTbWosHqubS2FkNs
   FRDeizO67S+PuAwGXkTWBCLBq2EEs3iCq4jWFEGqKc5Dfr+bz5no7Sg8m
   A==;
X-CSE-ConnectionGUID: o16Q9gb9RrCC627acnQgDg==
X-CSE-MsgGUID: ulfsAKTxR3OxfU8f0nc2WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387246"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:19 -0700
X-CSE-ConnectionGUID: zHfXL/DjQMihVdd4rsKjAg==
X-CSE-MsgGUID: Anp5SF25SuW5edB8U2CWqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685496"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:18 -0700
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
Subject: [PATCH v13 11/25] x86/resctrl: Honor rdt={perf|energy} options to force enable AET events
Date: Mon, 28 Sep 2026 15:14:55 -0700
Message-ID: <20260928221509.68002-12-tony.luck@intel.com>
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

resctrl can disable ("force_off") a feature supported by the platform if,
for example, there is an erratum related to the feature or, in the case of AET
(Application Energy Telemetry), when the event group has insufficient RMIDs. The
"rdt=" kernel command line option lets the user override ("force_on") when
a feature is disabled in such case. Users may also disable ("force_off")
individual supported resctrl features they do not need.

Linux enumerates AET once on first mount and skips this enumeration if
the associated event group is supported but disabled. Since AET is only
enumerated once, this check is guaranteed to only consider disabling via
the rdt= kernel parameter.

However, when transitioning to enumerate AET on every mount, it is no longer
correct to skip enumeration simply because an event group is marked as
disabled. It is then possible for resctrl to have force-disabled the event
group during an earlier enumeration due to insufficient RMIDs, which would
improperly cause the kernel to ignore a user's explicit rdt= override on
subsequent mounts.

Ensure the user's command line choices take precedence over system-level limits.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Update subject and commit comment to reflect that this change
	applies equally to rdt=energy.
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index c22c3cf5167d..4ad6ad78e93e 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -228,7 +228,7 @@ static bool enable_events(struct event_group *e, struct pmt_feature_group *p)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
 	int skipped_events = 0;
 
-	if (e->force_off)
+	if (e->force_off && !e->force_on)
 		return false;
 
 	if (!group_has_usable_regions(e, p))
-- 
2.55.0

