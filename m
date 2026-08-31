Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6385E47CA8B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198281; cv=none; b=Htw6jW+4bakQIdY5OOctTsYIWvXOgK2XwnZFbYx1Z5r9vQLdRxglCWxHkRZElJdbD2umY78FIIOHUL4Ui6zCIeEXjqrGtt22Cfatq1xUY0Hhp7SCS0YKVWb0lltheVMSoACAkkKCvdwehTbixty+cFEs1JcXtUs/Uh8HTVf9JBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198281; c=relaxed/simple;
	bh=zN8qW4C9UcQ4UCrfke3t/UK9kemwvFGZbzkj9BfKpZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XR3m8ojAISr9Kbw759eaZsNcv3/S4cMNYl0ubjiEQg3V67zQg8tTr/YvUYx0MGUfXrQwpgvsllfkhTVodx/8bdILFIQt4g1oYwXRheLKmfl3O5bTB2FnTNGQXYQTCNF8xjZZ4oOxDUHhxl1L9GPNu/feSmBi4qxqhRuYnEnD2GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAHJA5k4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAHJA5k4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788198280; x=1819734280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zN8qW4C9UcQ4UCrfke3t/UK9kemwvFGZbzkj9BfKpZE=;
  b=dAHJA5k4wNGoABRwzdECeWA8W+Ig1ur0aDCeNlTWq3kHNSrab1a689Ae
   4pOr/ZLnTatMTZit916SY+A8fC9WKfbrjehwaRJoWZ4yaapFB8V4YPHDT
   1Rzv8L2JKg+XjCtRcs4Wju3mKshUtSq3G3G5K94BUZeakuIhCHxch8phr
   RURbC6raFc8U/BS3Hot8p0th4KGMKHvOQgN/faeJOslybKMxrU3EnfQEp
   q1mbccAEvPgR8bTRmNlpY2gu/I8bSIdTLJOOfuKnfaJ6RQyO0S3OykXAn
   Zh/4plvzEQgYX0tsDoEn8S13UE5+vjL2PXudTBbX4p2xd6jwtO9Lg+3Jt
   A==;
X-CSE-ConnectionGUID: rvhY8SRrQpK/qUOma0L1RA==
X-CSE-MsgGUID: 9yYk+theQzyM75l8yfJBmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92479992"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92479992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:36 -0700
X-CSE-ConnectionGUID: ia41pQSsSo68G/61TYVaIA==
X-CSE-MsgGUID: cRqLaIWLSVyHXW4skFVUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="268906973"
Received: from aherrold-mobl1.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.17])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:35 -0700
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
Subject: [PATCH v11 09/23] fs/resctrl: Remove redundant calls to resctrl_mon_capable()
Date: Mon, 31 Aug 2026 10:44:07 -0700
Message-ID: <20260831174421.13921-10-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831174421.13921-1-tony.luck@intel.com>
References: <20260831174421.13921-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl_mon_capable() indicates whether any monitoring resources
are enabled on the system. It does this by scanning all resources.

Redundant calls to resctrl_arch_mon_capable() in hot code paths should
be eliminated. There are two prime examples:

1) mbm_handle_overflow()
This function is called once per second from worker threads running on
each L3 domain. The call is clearly redundant because worker threads are
only created if the MBM monitoring feature is enabled.

2) is_rmid_match()
This is called for every task on the system so making it less expensive is
appealing.  The call is redundant because the function also checks "r->type
== RDTMON_GROUP" and this type of group can only be created on systems that
support monitoring.

Remove the call to resctrl_mon_capable() from both of these
functions.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v11:
Update commit message with performace impact justifying the is_rmid_match() case.

 fs/resctrl/monitor.c  | 2 +-
 fs/resctrl/rdtgroup.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 362737e13cd3..02e81fc82b14 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -888,7 +888,7 @@ void mbm_handle_overflow(struct work_struct *work)
 	 * If the filesystem has been unmounted this work no longer needs to
 	 * run.
 	 */
-	if (!resctrl_mounted || !resctrl_mon_capable())
+	if (!resctrl_mounted)
 		goto out_unlock;
 
 	/*
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 79977200b1a0..4f8a510be8ec 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -691,7 +691,7 @@ static bool is_closid_match(struct task_struct *t, struct rdtgroup *r)
 
 static bool is_rmid_match(struct task_struct *t, struct rdtgroup *r)
 {
-	return (resctrl_mon_capable() && (r->type == RDTMON_GROUP) &&
+	return ((r->type == RDTMON_GROUP) &&
 		resctrl_arch_match_rmid(t, r->mon.parent->closid,
 					r->mon.rmid));
 }
-- 
2.55.0

