Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793741000;
	b=ZrSLIb/cXXqjgzgkMKsv4XORp4wwRP2iUlkakFKOHGqD6HF7UnlaCZZkuDnGlHzeoims
	 J07dTuibUhBivtup7EJGqPxTxauSJMvB4HVTaWnlnFjypORi1Z/gtY0A2qY/7PYlWO2ti
	 jwa4UKk4Anqk2EofTDdIzS8Ig2U785BBRyFA5bsZNwpDnE0Ixd4JQV+PO55AdNpXQEcc8
	 SOr2Mc0mntx6HeWD6zvVv2JqZ5QgaNb34EbrmLs0p3uNUT9snah69u3SrElIO968pwngP
	 AtGvSJQoKT9tX9ApecwQqzTgKQwFMBuZAtUvbbXy+1r9lTqNUr00AzJ45XGyse4rM3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741000;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B50Jt/cYyCUsUbYxbYjKwAXm6ulIX4rJxYjs5Njyqgg=;
	b=2AVqC4Ir8OAQGfv0DGVZI1yRFF22wwQHjou0TEDDDzTfYklvpfBK29+EiYtbNJ0y2srT
	 PbTibppsyFSLvnwgp5TS350Eb9YL+0NZO9CN0Df6uHJnTdR1dOidplsmTMsEXeCaoXkSO
	 tQ0/2OIXOAbpD1tZ0tXb2f1Enfxas539ivqOrSY5V0rISpRpoM2+A6M0r9qGKWD5l4gxT
	 G13Rr9AMmfaMaD4qOdvekBcq/EZ35wt4/lMgpCX3p6QGc557xUKglGB8rOvEeVIfFMjxS
	 HkVd8mmhog7K8wB4EiCj2MdQOLeUSe1WCLhP+1LXM/EPg3dxOSnGvaRjJleTs0TlnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="B8/Gf1hW";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18295606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18295606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B8/Gf1hW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793741001; x=1825277001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cqXd4OJlpWZioZ2BGrFu3nNs3QMLDFpa1lSgaTSP2YA=;
  b=B8/Gf1hWvVHNvb0gdz03l5OWck4kTtJLS1deApWcV1whnsw5dsj3oAWg
   jCDT/UJcrXSaXH6dDtpF23BPvmg3pwyvgMKDHM7uGe6mlrlOx5Q1nvYR7
   2nHriLL0LX1RlK0k9iujzRvQPh+lcARuK3Tan9EjGRIOswN2oQG/+0TLi
   YnjlF+9rBdN/aw6SOuvjQzhqonP6sT6R/b5u6SGt+tVHLENR1Ux4gezhA
   fI8Kczo6qgBlztyt8BwW6nF79CYaFReIv030x405F9lv/gzq14FxJVrOS
   EvU1rNKcAjjofdvixR85flK8KFkQ0aJqPvwwWms8MFuIktH1cbLw2tKeF
   g==;
X-CSE-ConnectionGUID: 2rl1MmX8RsGnNcOJzIyuuw==
X-CSE-MsgGUID: vr4RJHI9TK6WZ2R2uKN4bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2393504"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2393504"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:11 -0800
X-CSE-ConnectionGUID: qJjEI5YhR66nUCseUqgaRA==
X-CSE-MsgGUID: 2OS6y/brR+mVshcnd6MpHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6624579"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.124])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:09 -0800
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
	Tony Luck <tony.luck@intel.com>
Subject: [RFC PATCH v2 06/11] x86/resctrl: Pass the CPUID leaf to rdt_get_cache_alloc_cfg()
Date: Tue,  3 Nov 2026 13:22:49 -0800
Message-ID: <20261103212254.18314-7-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103212254.18314-1-tony.luck@intel.com>
References: <20261103212254.18314-1-tony.luck@intel.com>
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

Symmetric and asymmetric cache allocation parameters use the same CPUID
subleaf format but different leaves.

Pass the leaf number to rdt_get_cache_alloc_cfg() so callers can select the
enumeration leaf. This prepares the helper for asymmetric allocation without
changing current behavior.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 6df8e3c03289..7981ddbde8c9 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -348,7 +348,7 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_resource *r)
 	return true;
 }
 
-static struct resctrl_ctrl *rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
+static struct resctrl_ctrl *rdt_get_cache_alloc_cfg(int leaf, int idx, struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	struct resctrl_hw_ctrl *hw_ctrl;
@@ -357,7 +357,7 @@ static struct resctrl_ctrl *rdt_get_cache_alloc_cfg(int idx, struct rdt_resource
 	union cpuid_0x10_x_edx edx;
 	u32 ebx, default_ctrl;
 
-	cpuid_count(CPUID_LEAF_RDT_A, idx, &eax.full, &ebx, &ecx.full, &edx.full);
+	cpuid_count(leaf, idx, &eax.full, &ebx, &ecx.full, &edx.full);
 	hw_res->num_closid = edx.split.cos_max + 1;
 	hw_ctrl = kzalloc_obj(*hw_ctrl);
 	if (!hw_ctrl)
@@ -1065,7 +1065,7 @@ static __init bool get_rdt_alloc_resources(void)
 
 	if (rdt_cpu_has(X86_FEATURE_CAT_L3)) {
 		r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
-		ctrl = rdt_get_cache_alloc_cfg(1, r);
+		ctrl = rdt_get_cache_alloc_cfg(CPUID_LEAF_RDT_A, 1, r);
 		if (ctrl) {
 			if (rdt_cpu_has(X86_FEATURE_CDP_L3))
 				rdt_get_cdp_l3_config();
@@ -1079,7 +1079,7 @@ static __init bool get_rdt_alloc_resources(void)
 	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
 		/* CPUID 0x10.2 fields are same format as 0x10.1 */
 		r = &rdt_resources_all[RDT_RESOURCE_L2].r_resctrl;
-		ctrl = rdt_get_cache_alloc_cfg(2, r);
+		ctrl = rdt_get_cache_alloc_cfg(CPUID_LEAF_RDT_A, 2, r);
 		if (ctrl) {
 			if (rdt_cpu_has(X86_FEATURE_CDP_L2))
 				rdt_get_cdp_l2_config();
-- 
2.56.0

