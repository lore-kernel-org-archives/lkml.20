Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540F20D4FC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633725; cv=none; b=STtwj5gp0W2pFaFMzWHc8v08rfWFUBw8HVV/deQmZcfY53M/3f5RzU061xsw4jaO7iDdCfU3uwpwNwJaFoPHB+ZQ0oCdXa3c3CgyXbAvpAEpcv1G7E3jzAEc/NkFmycthdqoeJ0w/1JvL1NQMpsN8FypRbyUb6bflAyGc63O5j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633725; c=relaxed/simple;
	bh=x+lg1jDtlSoRYQBySy4LUMxzzQksxOihvDNRrCpQUFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8/KNqsYWkAC0prcwlAa6/hENGqzi7s9+jnAXSDw5Yan/Nm4SUjC0usXZUAvyYdgLqBc9YsXwju0aM+aH/zQMuHiO4XTbonkZx2JfDfUqKbD8aOOQJoWEsAZ66ihVf55FQSLpVPhKNg+2hc0Z4xM0ct3wIN2VuAdthbqJtuQaSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bqvx8jvm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bqvx8jvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633719; x=1822169719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x+lg1jDtlSoRYQBySy4LUMxzzQksxOihvDNRrCpQUFg=;
  b=Bqvx8jvmm9Ujocpxu2N7ymML9+w9RI+aIa0RPynN3sCfGYhTm2XB5UYu
   g3GZ/3TzZYHF7abNi0ZQ4sn/IeDbLgcXJuTL5u4YWXxbC1osTDDO6WYp7
   nAkz4PywiPlc26zLIIiS0g3x2gZox7VDiC0aUIsyYMvWtGlmvquAMQrbN
   eWdQgTNtbKSNv+UwyybE+tqQbeoJUr6+4iON+N4SifhtTivXSskcvH5GL
   A/PbbUJhOL08Ea5SdMkD8SSv7yVSw5a757Q/X1LpR6oUVYU6zj9yQ8IfJ
   Gf63lHROj8DqQolTKl19cuTMRSKBDCdGU6GJwkceixTogZxkKQPx+wPMu
   A==;
X-CSE-ConnectionGUID: DhuAI93RSVq65jxm4DrJSw==
X-CSE-MsgGUID: 6qDazo2FRK6rT3MIGygSXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387162"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:17 -0700
X-CSE-ConnectionGUID: TgZi13uEQV+DbouHwHwHxg==
X-CSE-MsgGUID: 9bnymJ6BSgCtaPkVuEf9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685457"
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
	Tony Luck <tony.luck@intel.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v13 01/25] fs/resctrl: Ensure default group reports tasks on monitor-only systems
Date: Mon, 28 Sep 2026 15:14:45 -0700
Message-ID: <20260928221509.68002-2-tony.luck@intel.com>
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

This is a pre-existing issue, but the resctrl_arch_alloc_capable() check in
is_closid_match() actively breaks the default group on systems that only
support monitoring capabilities.

When a user reads the root /sys/fs/resctrl/tasks file on a system with
monitoring capabilities but no allocation capabilities, the following call
chain occurs:
	rdtgroup_tasks_show()
	show_rdt_tasks()
	is_closid_match()

Since resctrl_arch_alloc_capable() evaluates to false on such systems,
is_closid_match() unconditionally returns false for all tasks. Furthermore,
because the default group has type RDTCTRL_GROUP, is_rmid_match() will also
return false.

This causes the root tasks file to appear completely empty, hiding all tasks
on the system that have not been explicitly moved to a monitoring group.

Removing the resctrl_arch_alloc_capable() test is safe because a struct
rdtgroup with type == RDTCTRL_GROUP (other than the always-present default
group) can only be created on systems where allocation is supported. So
whenever the remaining resctrl_arch_match_closid() check could meaningfully
succeed, resctrl_arch_alloc_capable() was already implicitly true, making
the test redundant.

Fixes: e6b2fac36fcc ("x86/resctrl: Use is_closid_match() in more places")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831174421.13921-1-tony.luck%40intel.com?part=9
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	New patch (split from patch 9)
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
2.55.0

