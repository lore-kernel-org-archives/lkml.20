Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19085038F5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633737; cv=none; b=e7SaZ9d+FrYmeJWdmJJNTby2AQ1qL1rK6a2bDMtpamdDg0jH7vLmQwTpVd+PM48sAjQ8Y7Ls0Pk0FaaZ0xF4dTtC4dzktbV4/R+t6/4Yfr3JQuBiXeth24+N6t5Bk/s8+i2G0cf2eCfpaptwVEni/PWzGmWgaOK6mdhUnhxRB9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633737; c=relaxed/simple;
	bh=pTDhq79ddpggY0n+KqOqU6TsTZ4sAikNtUXGt1GAhlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyvDyLSfouZYGrVeZeZNdQmSz4xUEmGb6hcnUw9v70De0epZXZnIwOhL1ImjSMZ328DcfNHMEAV16TqgoE7KBQ6HO4fsI0lHMeXKyYxpGfdZ5C/36RM3zShYhn0ohFq2kdrUCv3Hprkcrtoe3tyRsk8XVq8+oFPaRvmnfTFl/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkkXAiKz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkkXAiKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633730; x=1822169730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pTDhq79ddpggY0n+KqOqU6TsTZ4sAikNtUXGt1GAhlk=;
  b=DkkXAiKz78F6JGy77ir2WBV4nvo25satgoqsYniDfM+ZfsLlN6T+5ZPW
   d9o1jubdO60YaP/n1zB3EQ6kSRV4D5wHtr4hLX/O/IHWeBF96UCbrfjiL
   25NJIXZgoNgWaL/dITdU5IstG2TPMR7x7UHq3Q4/4DOL7wfRJWx/rkkgv
   3tSOjNrpNZtTqM4A6XmwkHplHU8cGU8E68Zur1aIPsWCAvZ+V6/5nLhPL
   TozQryL8T271aqUCF7MWbhqD+06nl9S+O07nPKlo+9YWJW1/MJkIDSuU3
   keE4L8GVohvyWacCthzbcKgSjV2wmdif6Q7Jb/ll1s9ahLUT3mRqF7NH2
   w==;
X-CSE-ConnectionGUID: Lpe+vOqkR6Wh2uMW5p6c3A==
X-CSE-MsgGUID: 7CDIHChKTr6ZiAxzKXD/bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387244"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387244"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:19 -0700
X-CSE-ConnectionGUID: 7byRebtfQFy3NSzZYLVlBw==
X-CSE-MsgGUID: WTQQtDslSBOQLvW0EkeU+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685493"
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
Subject: [PATCH v13 10/25] fs/resctrl: Remove redundant calls to resctrl_mon_capable()
Date: Mon, 28 Sep 2026 15:14:54 -0700
Message-ID: <20260928221509.68002-11-tony.luck@intel.com>
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

resctrl_mon_capable() indicates whether any monitoring resources
are enabled on the system. It does this by scanning all resources.

Redundant calls to resctrl_mon_capable() in hot code paths should
be eliminated. There are two prime examples:

1) mbm_handle_overflow()
This function is called once per second from worker threads running on
each L3 domain. resctrl_mon_capable() is clearly redundant because worker
threads are only created if the MBM monitoring feature is enabled.

2) is_rmid_match()
This is called for every task on the system so making it less expensive is
appealing.  resctrl_mon_capable() is redundant because the function also
checks "r->type == RDTMON_GROUP" and this type of group can only be created
on systems that support monitoring.

Remove the call to resctrl_mon_capable() from each of these functions.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Moved change to is_closid_match() to its own patch.
---
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
index 96a4978ce6b6..7cf809380c53 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -691,7 +691,7 @@ static bool is_closid_match(struct task_struct *t, struct rdtgroup *r)
 
 static bool is_rmid_match(struct task_struct *t, struct rdtgroup *r)
 {
-	return (resctrl_mon_capable() && (r->type == RDTMON_GROUP) &&
+	return (r->type == RDTMON_GROUP &&
 		resctrl_arch_match_rmid(t, r->mon.parent->closid,
 					r->mon.rmid));
 }
-- 
2.55.0

