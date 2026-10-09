Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712A54F4D17
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574781; cv=none; b=YlZ963Zd9YH14/kfRnGDbmnH6fkog9xpZWEU+siLognzJLxpI6xha7FywdzOe85PQEP1vGgC+oTFRKj9oVXuslhLNm3wNAs6VG/I4HfDrqxVKkwCmYxCoJVWi9ZxxDlH8l/Vnwy08cbkeWBpcaMdabcblLAgS+TnVT+QrJgiftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574781; c=relaxed/simple;
	bh=JRsxD9lKLX8xRzhQtNVgSrQcg1f5Qit7EiZoZr6fZOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQj1u6h69g5s9fIL15HPMCFoLX54x/XwfTiZNSilm9MGvAZYTi+DBf90RXqn2XH1pzUTBZHvxNyZlliygak/ge5xCyTioFh16U+9QDUfMUaNeW0qrc34EvY+V+mlRx9D9mSIl+GYomd2Yvj+zbJNhaCQxRC6kpHsxwJbPHNHeX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiJQbj4o; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiJQbj4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791574771; x=1823110771;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JRsxD9lKLX8xRzhQtNVgSrQcg1f5Qit7EiZoZr6fZOk=;
  b=aiJQbj4oo1nM0hcCmT7zNfCXl2Y7AoRJCRuLfC0HEC407PAtZw0S6W6R
   cMpdo36AAqprhvHJbjSkJitHki2WpI2hylYfTHMnuIAxq33r/rcPTl2Ou
   VBmpNuagqcujt9QsycfCT1F/1DE3vEsKrgiIpBADyCjAOqtTlqoovRBrs
   4PQfb0Gt2sphmyJv3ypLmWgeHBQChPeuyPmjLBqzKbHH4g48YW7OMzu3r
   u88sY3tcx0Dp96+LM/FnV4sit6R57Dl1X5La6rulDmiST5Fb6IbnOfPaT
   dsWXFWTLqn6Jp3HeFU4FkQFhA2sZX62orMnPMCF04/B5hxJyTUo1uZ02Y
   w==;
X-CSE-ConnectionGUID: 5LRemnA9Sc64Kmdd2Tpa0A==
X-CSE-MsgGUID: sUHY6E0fRsaV0t6B8R7lGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="279133"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="279133"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 12:39:29 -0700
X-CSE-ConnectionGUID: BO2mVxf3STSMvWLzFyJFYQ==
X-CSE-MsgGUID: IZHR1V0/Sk2jOvEvXRJFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2183742"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.221.192])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 12:39:29 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] fs/resctrl: Ensure default group reports tasks on monitor-only systems
Date: Fri,  9 Oct 2026 12:39:23 -0700
Message-ID: <20261009193923.15498-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl can be mounted on a system that supports monitoring but not allocation.

On such a system reading the "tasks" file in the default group reports no
tasks, even when there are tasks assigned to the default group. This problem
occurs because the check for whether a task belongs to a CTRL_MON group is
gated by a check for whether the system supports allocation.

The resctrl_arch_alloc_capable() check in is_closid_match() breaks task
reporting for the default group on monitor-only systems so remove this
check. On systems that support allocation the check is redundant.

Fixes: e6b2fac36fcc ("x86/resctrl: Use is_closid_match() in more places")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831174421.13921-1-tony.luck%40intel.com?part=9
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
Changes since https://lore.kernel.org/all/20261008234311.17702-1-tony.luck@intel.com/

        Dropped Assisted-by: tag. The LLM was only used for commit wordsmithing
        and I've now discarded everything it wrote.

        Rewrote commit in 3-paragraph (context, problem, solution)
        format per Documentation/process/maintainer-tip.rst guidelines.
---
 fs/resctrl/rdtgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 68be9b903ac6..57ab090072c2 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -685,7 +685,7 @@ static int __rdtgroup_move_task(struct task_struct *tsk,
 
 static bool is_closid_match(struct task_struct *t, struct rdtgroup *r)
 {
-	return (resctrl_arch_alloc_capable() && (r->type == RDTCTRL_GROUP) &&
+	return (r->type == RDTCTRL_GROUP &&
 		resctrl_arch_match_closid(t, r->closid));
 }
 
-- 
2.56.0

