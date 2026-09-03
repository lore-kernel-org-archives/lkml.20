Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9A4F4743
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454643; cv=none; b=ARDBldCW7S9dJAZF3N9Jp1Km+vKppCw3UaoxwzSi1HJ1bnkOeE6uigb/pyYSjEtDt3qv3TEDLfpbTPC/fTXSwgZUTTVTFezcOGxzi8+XcObaoATKUkXpMDci0VYEuaCzaDC6IOVpBZax/M14dd7K6TQOxQLY4ZlgmQ9GH9C/jjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454643; c=relaxed/simple;
	bh=O32YA1GupXL2pJDr2dC3y6lyznnbDasL19E8pW885is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZrvoOLekjkCFUDZkrxB/inZ77K1gmZCXv9j08CGrkF7SRz7L0Rhrwx10q+IrCQKOsXsDnjAyyZXj6e1mWcovNARkFQFWA+IhwP0V4XEJ2mi1DelmUU6jkQY7MAw+bilsqV9okJ3aCN9cvy4iGCOqT8++x2yLE0bT+sYG2SNiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PckXGo9l; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PckXGo9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788454642; x=1819990642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O32YA1GupXL2pJDr2dC3y6lyznnbDasL19E8pW885is=;
  b=PckXGo9lioMIiuLgOPhq3V5ZLujjo08FidqRMbJJj39L7kx7kqygt/Sc
   tft5GbnBl1coTi8DsL0bu+3twsUTWjOAOlz09fdVqubPSCKSxUGLYAn1g
   B9VbOal7x5gJQsauwkBTo1r0in4huW5yl7nwvRTAcyp4P3f/bTTADB19v
   xLT/8ebta7L6x8ybZ7DKZL1nFC1kG7ZWDxq0lC/ugDszHylaKowQqKpv9
   ryYJyfDUpWwA2zKjgWC9BxI/65xgGdI+7kLrkwOsEOA2O4WJoJay/7J4Z
   CqI4NrA7DpkwWhF9ze94x+mFFhoiMOoh4t5DaW7NRokRfXF0m6yVYJM3A
   g==;
X-CSE-ConnectionGUID: PR6LnHpjR5CoQQVvvwXTxw==
X-CSE-MsgGUID: kGWzZuQXS/64Z3XMfiS6kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100103999"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100103999"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:57:14 -0700
X-CSE-ConnectionGUID: K7D73+47RGqMf3X2Smh1YA==
X-CSE-MsgGUID: bEgcnRw7SvWzm2zWCwWm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273554223"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:57:13 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: tony.luck@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	bp@alien8.de,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	fustini@kernel.org,
	fenghuay@nvidia.com,
	peternewman@google.com,
	yu.c.chen@intel.com,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH 4/5] fs/resctrl: Drop unnecessary is_mba_linear() helper
Date: Thu,  3 Sep 2026 09:57:06 -0700
Message-ID: <b615f948cab09677813ae54e316e10ca96acccf3.1788452481.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788452481.git.reinette.chatre@intel.com>
References: <cover.1788452481.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_mba_linear() assumes it operates on the MBA resource and returns whether
the resource is linear. There is only one caller that separately makes the
same assumption.

Avoid duplicating the resource assumptions and let the only caller access
the needed property directly.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes from RFC v1:
- RFC v1 made bandwidth delay a resource property. That change was dropped
  and this cleanup is all that remained.
---
 fs/resctrl/rdtgroup.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 68be9b903ac6..821c6e2b10f4 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2577,11 +2577,6 @@ mongroup_create_dir(struct kernfs_node *parent_kn, struct rdtgroup *prgrp,
 	return ret;
 }
 
-static inline bool is_mba_linear(void)
-{
-	return resctrl_arch_get_resource(RDT_RESOURCE_MBA)->membw.delay_linear;
-}
-
 static int mba_sc_domain_allocate(struct rdt_resource *r, struct rdt_ctrl_domain *d)
 {
 	u32 num_closid = resctrl_arch_get_num_closid(r);
@@ -2621,7 +2616,7 @@ static bool supports_mba_mbps(void)
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
 
 	return (resctrl_is_mbm_enabled() &&
-		r->alloc_capable && is_mba_linear() &&
+		r->alloc_capable && r->membw.delay_linear &&
 		r->ctrl_scope == rmbm->mon_scope &&
 		!rmbm->mon.mbm_cntr_assignable);
 }
-- 
2.55.0

