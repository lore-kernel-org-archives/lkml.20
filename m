Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A73290C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947460; cv=none; b=HNBFrqVQ/SGpxSjaPqsmLi0Ofk3NxVo2fNedwNROpPpDko+1KziJDYFvVLziDs/9eQ2v6Shx/32PBP8EhJTf//sEdAJ/4TmB7he49YuRpKewSFHRVD7aTfKasQlgpQFghecJKhJxTJiVCTZQAS+b8vvrDa9CMQoiU0hQc6GsaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947460; c=relaxed/simple;
	bh=50kXYi1PQMf1rtG8OOWujfXrYhZeYoWtuHmopPHMdu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9/euL4REoovwxf7HxU/J3FJMasY9PO8BbDrYjRXVf5MPBTjFqtm62/oiVZBOPdiHYTpy2cpdhX3lBJfkeXge2frtLywMYpjfwiq1LgVA8kxNwwf/Q6VF0AqWdqfWE/HGCfoEFeU+tIf8NJ9Ym6s2vVjE1cuI80ZucqnGQh1hd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3tFyK5i; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3tFyK5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947458; x=1823483458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=50kXYi1PQMf1rtG8OOWujfXrYhZeYoWtuHmopPHMdu4=;
  b=Z3tFyK5iCqVtKTykFUHYaM+GvKPjmVIHfy6nNwj7aqRACy0b1COKyCqd
   zzAmOchckPBCqo7wRxpKZVu5/GrJ3o8UM9v0pEtWaDzTLfJPjhuhGQwzs
   J34zzMAQUnWGFT5+rTJtD35F3TEcxNaY2YtscUzE98IYWxFtQhrjWjQR6
   YL0USpHtaoz+JY2q6juFgvlYTfNVFYaxYXsXx5iG+c/ehqXS46kwBJypx
   QnI8nF6isgtMhYAkwwJPjr+ZdU0kxBTs7rs0gsy2DvQTLAPxcvLEHdP8O
   GCtd9afSd7oSROvbyxy1/9HrDecRNMnWyDa+psP45jzjPIdWP8PmDZtuk
   Q==;
X-CSE-ConnectionGUID: yfA/lDtSS6ysyQgS9h1pbw==
X-CSE-MsgGUID: DaZmyzBlTHWg7yBWnLRtxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="589321"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="589321"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:10:57 -0700
X-CSE-ConnectionGUID: 1ieK6qMsQdGhWFrRzgMAhg==
X-CSE-MsgGUID: TiWF+041QSStPfIT2sCgaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1414624"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 20:10:53 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com
Cc: tglx@kernel.org,
	bp@alien8.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	fenghuay@nvidia.com,
	babu.moger@amd.com,
	hongyu.ning@intel.com,
	chen.yu@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: [PATCH v9 09/12] x86/resctrl: Refactor the monitor read function
Date: Wed, 14 Oct 2026 11:00:26 +0800
Message-Id: <6e02cc7b05f70446c78aadea642cf471b10329ea.1791933001.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791933001.git.yu.c.chen@intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the monitor read helper into an L3 read path and an AET (Intel Application
Energy Telemetry) read path. This makes the two distinct monitoring sources
easier to extend independently and prepares the L3 path for ERDT-based MMIO
reads.

No functional change.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v8:
- No change.

 arch/x86/kernel/cpu/resctrl/monitor.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index f1a28a3c81bc..e66e4c845739 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -239,9 +239,8 @@ static u64 get_corrected_val(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	return chunks * hw_res->mon_scale;
 }
 
-int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
-			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
-			   void *arch_priv, u64 *val, void *ignored)
+static int arch_l3_read_event(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
+			      u32 rmid, enum resctrl_event_id eventid, u64 *val)
 {
 	struct rdt_hw_l3_mon_domain *hw_dom;
 	struct rdt_l3_mon_domain *d;
@@ -251,11 +250,6 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	int cpu;
 	int ret;
 
-	resctrl_arch_rmid_read_context_check();
-
-	if (r->rid == RDT_RESOURCE_PERF_PKG)
-		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
-
 	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
 		return -EINVAL;
 
@@ -281,6 +275,22 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	return ret;
 }
 
+int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
+			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
+			   void *arch_priv, u64 *val, void *ignored)
+{
+	resctrl_arch_rmid_read_context_check();
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L3:
+		return arch_l3_read_event(r, hdr, rmid, eventid, val);
+	case RDT_RESOURCE_PERF_PKG:
+		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
+	default:
+		return -EINVAL;
+	}
+}
+
 static int __cntr_id_read(u32 cntr_id, u64 *val)
 {
 	struct msr msr_val = {
-- 
2.43.0

