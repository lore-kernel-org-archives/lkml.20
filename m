Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443057;
	b=NkPH2+VHzmLgNRbKejThB7V+ipXcqwOcIKUeWpxtMVGTZZ+HnU3F7Ajxt5TGMp+aULtb
	 WG5+4MtOTKjHarf8X0d2T2udgzJo5Y9VdGyDa6NAtDMiUrNipbmXGkAhaFik/OsP3W76S
	 e9lG51cpHY1g+eR6F6QXnL4s1gaOS752+B9MakGQMVRvmtBefvGglLm9V5rz+HhVyLdy6
	 bkg9KhIUVXfbU8GQb1qHYo2Vr8asVR+/jTgVrWqRsRnWatgkvX/RtSqGhwpZ9dsuTn1Ls
	 6cZmoULyn3079puE8di4sTmK5gvj+zsFdtxqp/SBFX0sbnX8dCyKFACfIifS9FgU/GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443057;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QSKjpL7rlI9j8KnP1KHuXBo8dKBfkr2RJeGR51X0O8c=;
	b=fyGHV1As66YvEYmLLX+Z7BynDRwtfyk53F2/iaGXZVI132E1b30QU3ybua/AZ+90BARY
	 9dOTMreDRMaTNwoEDi10RDHcXI1/tcbnbboafdFecCaX5VVhM030Ar6poUIQsXeg2Nrvm
	 euxZi8T32WgeQDjH+M9R/nSXEZA+jVELrdHJv2ujeMlaGBv4npDigdaKJ2uRJNfYGehY6
	 3TryM6sHaJZT74GmcZb5C/g3WBbKBlSxmpJNaeNttP+K8Dht96eukeWWJqJlWJI1qIAzF
	 F7zQMvLFbsoU16UG/7Ld+7BDn65jqev0OFMgOI24iGrU7WqgRaxA8tOqFnZNgowtXWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="c+/bJjve";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF18606A339
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF18606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c+/bJjve
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443055; x=1823979055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MLokIPWC72UuXqIEvS4jfTLb5xv4h/cs5V0w3ZW1IPs=;
  b=c+/bJjveok7NNpIdebXFj+hT6UXDPb6mfR0fnhNACuwQnxL4NzjD4ZSa
   cDxuNkL6vuB3VgM/R91emOUQZM3Eux2UCNyoYrkV2UvrNwNLFkkJ4W2A0
   PfhInsIbL6QZZxm37lHc79q09N+Yj1sLYUf5pKmZMfCYDwFJatGorK9zK
   dOmxlZmKyrbc1sF3OFpMtlD9Tk9HSfuqNu9iLt4NjZ2gJcxFmwTlPwral
   KZ7nTKpTVnAzVkseRvajVbvg65M64LeYM4/MqkSqF/4y7QDo0Gtpbwzko
   VBBdI7DwtJ81pdT3dqQhYzl0dtIargrvDh3wXZj8a5rwfCbAOQ6gMdF0u
   g==;
X-CSE-ConnectionGUID: 10VfCqnmRtOrfOFp4tUalw==
X-CSE-MsgGUID: EeKU1mnyQBudZGojE7CVIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131186"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131186"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:49 -0700
X-CSE-ConnectionGUID: 0QCT2BqVTMyiFxGX0LZ6ng==
X-CSE-MsgGUID: CfhQZaIFTdeyHn2UfsbAsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008646"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:50 -0700
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
Subject: [PATCH v14 09/24] fs/resctrl: Remove redundant calls to resctrl_mon_capable()
Date: Mon, 19 Oct 2026 13:50:16 -0700
Message-ID: <20261019205031.16977-10-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019205031.16977-1-tony.luck@intel.com>
References: <20261019205031.16977-1-tony.luck@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl_mon_capable() reports whether the system supports monitoring by
scanning all resources. On x86 it used to read a single architecture-provided
flag. Calls on paths that run repeatedly now pay for the scan.

Two such callers already know that monitoring is supported:

1) mbm_handle_overflow()
The MBM overflow handler runs once per second on each L3 monitoring
domain. It is only set up when MBM events are enabled, which requires
L3 monitoring support.

2) is_rmid_match()
Called for every task in the system when walking the task list to read
a tasks file, remove a group, or unmount. It only matches MON groups,
which can only be created on a system that supports monitoring.

Remove the call to resctrl_mon_capable() from both functions.

No functional change intended.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	New commit message confessing that this is fixing a performance
	problem created by an earlier patch this series.
---
 fs/resctrl/monitor.c  | 2 +-
 fs/resctrl/rdtgroup.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index cb34d3637ee5..f05be52ab5b3 100644
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
2.56.0

