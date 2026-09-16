Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D44EA361
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600422; cv=none; b=FjX88GEhvZy8xjl1DDQdYr7j0WadM396icZMWJba/5O4GCE3bfNBS7UHy5LQL6sO6J2i//Fs2+kqG2Z51T4taJNaPSqS5ROsesrH5TcPRrvxmRLyyDGVaC5iiKd4rK0feVdFHJjUGcmZqlSdFqZDVRU1odNnc7TJKus/8HHm28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600422; c=relaxed/simple;
	bh=3COoBJ2+XbV4ydXsJZZTt7bAu++18o363OAblyVTZkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYCrGJuCf7/zhRqDDK6ZrBWtPXZDdqHdMw7gSM4pyvjKe3+FdZxMbli9+l77+3TuV8BetnrruUe9E0YPM57OtbhjF/gpiFDs9y1o+BL8F6IGKyoQAZZJSsZpHcLnjt2k5G+J4E+6LqMlI2BHI/ndnNZaDdowji7pv1Q+v+rObVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m11jGAyZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m11jGAyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789600419; x=1821136419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3COoBJ2+XbV4ydXsJZZTt7bAu++18o363OAblyVTZkE=;
  b=m11jGAyZbx7zpWNaSHGxipO8eeiWeJq39gnksPEo0vX1y1egVczuxU7D
   onGe16CYPJA6gXaFixMWgc+ZOpstAEwDLrnrZl9Af41X7QyTHWeYKdwIR
   Yf45+7f2CYsBAG7BEBt/rYbwNyA9TUzd9yPH+UiuxElHnNxsPb2mtsY5B
   zAlw0o+bgs5PYuz+F9RivxiCc+4RHm9Kd2lahZSM42UcIUa1jZp8Z28aR
   qJOXRt8YBnPDxsGUj6I0xarCQZGJ2ppgZUeTUMEZcVJOcXwSkIUqJTxOa
   IIcOKDMbomG+n1RhQF2XoZKTy8SKNQHIMBrj01HW7M4uz+NF7PAtQbB2w
   w==;
X-CSE-ConnectionGUID: +YRcnhUlRIidpGfbtL8npg==
X-CSE-MsgGUID: YxGsQkTcQDi/f6334G0Aqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861393"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:34 -0700
X-CSE-ConnectionGUID: rsgGC0vKTka6Vtn/z02tKA==
X-CSE-MsgGUID: EyNweaciT+yQWTG5F7LE9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277231454"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:34 -0700
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
Subject: [PATCH v12 09/25] fs/resctrl: Remove redundant calls to resctrl_{alloc,mon}_capable()
Date: Wed, 16 Sep 2026 16:13:04 -0700
Message-ID: <20260916231320.14502-10-tony.luck@intel.com>
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

3) is_closid_match()
The call to resctrl_alloc_capable() is not just redundant, it is wrong.
On systems that only support monitoring it results in no tasks reported
in the "tasks" file of the resctrl root directory.

Remove the call to resctrl_{alloc,mon}_capable() from each of these functions.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v12:
	updated is_closid_match() per report by Sashiko
	s/resctrl_arch_mon_capable/resctrl_mon_capable/
	Removed unnecessary line break.
---
 fs/resctrl/monitor.c  | 2 +-
 fs/resctrl/rdtgroup.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 79977200b1a0..c0b86ce05e50 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -685,13 +685,13 @@ static int __rdtgroup_move_task(struct task_struct *tsk,
 
 static bool is_closid_match(struct task_struct *t, struct rdtgroup *r)
 {
-	return (resctrl_alloc_capable() && (r->type == RDTCTRL_GROUP) &&
+	return (r->type == RDTCTRL_GROUP &&
 		resctrl_arch_match_closid(t, r->closid));
 }
 
 static bool is_rmid_match(struct task_struct *t, struct rdtgroup *r)
 {
-	return (resctrl_mon_capable() && (r->type == RDTMON_GROUP) &&
+	return (r->type == RDTMON_GROUP &&
 		resctrl_arch_match_rmid(t, r->mon.parent->closid,
 					r->mon.rmid));
 }
-- 
2.55.0

