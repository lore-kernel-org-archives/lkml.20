Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874057;
	b=WpKt2rUX/cJAJYNLT969rf+ERfIdZ2KzcLXng/B7EmH19ex7Z+w9n7TsheFI/BX5DpYc
	 zG5xX0iFI5kyAK3AM0JpM2SCREleq7CVT1VfFwMFdBceI7r2AMGTOq6+yPdHXPVGLgX80
	 RwxIXtFUbrqt2A+F+S3teAZ9Q7CbR4IOHgV0ZJr+/zdftzC1KOk+cydv0OLwVmcI8zb7q
	 fviKwMl/Ob66ZltEDf4oc1Yu8zWRSpWTxA4mcEMhOV4Rnvc9oFJ/CVv2Zg5Mh6Svg8HW7
	 gTJCU1ALvu5OYL0jCh32jNu77es/sPGS0lyp6dIdGj+J45WP7as+aPH+HZgeYKABV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874057;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Di+L1YHt/OArYl1l5fXQv+3OfcxuermdYXLB9zUDQFA=;
	b=wS7m5G/G1oV+FhnCFdMevR/XC9+f7W+wFr6O5QlMXoSKgATVGjMpS4irPVU0jwfhJJ9k
	 mTQNQj6kovur6WSg3W4A8Z381NXY66fTsJsyk3Zqmmjoh5rGrvNKoO0MnvE+KA4WYtR6l
	 4rRTfdXQksx5ZrNblI0bpn4yRllpDb+0j6gi2MB5msFRsZrc3EQ80e8N+LlEVzIbzVioe
	 TD4D2h5xsPEA3bKTt1xGEfecgEXWSTm/MmVn1lG7xe4Ff2tcjkRxmsF083BHpqAmv48MO
	 R/+EXEkLwWTzyQ9Fxe5jHwLKV6hY0M2d0+sVIoCyQtivtHGcJZvC5a8GbGZ5Qb713oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKiqOucl;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456C606D806
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7456C606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKiqOucl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874057; x=1825410057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HKpOZqMP5mztqqRfZ6NboqJ+WYWDVIeJLeTuF3VtFCo=;
  b=CKiqOucluVleibd5e8ewU08eDccg4WMD3mbMQNoIZKRVD9S4/Q3RtwXp
   /TIT/QNgkbO+nqpNQeMXaaEUqfEfuvfgNEqDWq6FHeYtauD1QLZtfAw8T
   BUJUwGr3Wh0SASDXCZZykUc7/Py18WQjHfbfAbKEsuVTc493dK2167eSr
   hcX6KQRIEQhhdrGjoaIYzqu/GTJCM4k2mTlXARDaorVPKNGBIhD2GWBSz
   3h3BtX4WUT7cLGVSunsqKXD+EVB3yY1w6SpmNXbUz/ibn8pCukLxJKPWq
   b9cqJsQacbbckd9Qa9bFiegEbKnvfnWXjp+OWsFTK3iHYzT1g4QKQqpwn
   Q==;
X-CSE-ConnectionGUID: o23PMuk4RCGYD0tAHupPdw==
X-CSE-MsgGUID: jWNdecq7TUyIuvgBZqbUUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2530328"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2530328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:20:57 -0800
X-CSE-ConnectionGUID: S8xIhzP5TmCOzRKN7Hw+Nw==
X-CSE-MsgGUID: p2CfSBM6ShGU4GKix9xgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7143859"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 02:20:52 -0800
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 11/12] x86/resctrl: Add the ERDT CMT scale
Date: Thu,  5 Nov 2026 18:09:53 +0800
Message-Id: <051539a40e662d6cf0a9f0fd35204f23571137da.1793864720.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793864720.git.yu.c.chen@intel.com>
References: <cover.1793864720.git.yu.c.chen@intel.com>
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

The limbo handler polls the LLC occupancy of limbo RMIDs and makes an RMID
available for reuse once its occupancy drops below
resctrl_rmid_realloc_threshold. User space sets this threshold in bytes by
writing to the "max_threshold_occupancy" file. The occupancy counter only has
the granularity of its scale, the number of bytes one counter unit represents,
so resctrl_arch_round_mon_val() rounds the written byte value down to a multiple
of that scale before it is stored in resctrl_rmid_realloc_threshold.

resctrl_arch_round_mon_val() uses the CPUID-provided scale. LLC occupancy read
via ERDT is instead scaled by the CMRC up_scale of each ERDT domain.
resctrl_rmid_realloc_threshold is a single global value, so one scale has to be
derived from the per-domain values.

Add erdt_cmt_scale to hold the largest CMRC up_scale among all ERDT domains. Use
the largest because rounding is a floor: a larger scale yields a slightly lower
threshold, i.e. an RMID has to drop to a slightly lower occupancy before it is
reused.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- New patch, replacing v9 "x86/resctrl: Add a global ERDT monitor scale".
  Place it after the CMRC parsing and erdt_cpu_has() patches so that the
  scale is added in one coherent change instead of as a placeholder that
  stays 0 until the last patch. (Reinette Chatre)
- Rename erdt_scale/erdt_get_scale() to erdt_cmt_scale and
  erdt_get_cmt_scale() so that the names say this is the CMT scale and
  not a global monitor scale. Move the erdt_cpu_has() check from the
  last patch into erdt_get_cmt_scale(). (Reinette Chatre)
- Compute erdt_cmt_scale from the CMRC up_scale of each RMDD that is
  accepted (moved here from the last patch), and reset it in
  erdt_exit(). (Reinette Chatre)
- Squash in the fix for the stale "h/w works in units of
  boot_cpu_data.x86_cache_occ_scale" comment from the last patch.
  (Reinette Chatre)
- Changelog: say "limbo RMIDs" instead of "stale RMIDs", distinguish the
  "max_threshold_occupancy" file from the resctrl_rmid_realloc_threshold
  variable, and state that the threshold is in bytes. (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/erdt.c     | 23 +++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  1 +
 arch/x86/kernel/cpu/resctrl/monitor.c  |  7 +++++--
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 107d599bf586..3d34e1050794 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -36,11 +36,30 @@ static u16 first_rmdd_domain_id;
 /* Largest RMID that is valid in every ERDT domain. */
 static unsigned int erdt_max_rmid;
 
+/*
+ * Used only to round the global resctrl_rmid_realloc_threshold for the limbo
+ * handler. resctrl_rmid_realloc_threshold is exposed to user space as a single
+ * global value, so ERDT uses one scale derived from the per-domain
+ * cmrc->up_scale values. Keep this single threshold conservative across
+ * domains because the rounding is a floor: a larger scale yields a slightly
+ * lower threshold, i.e. an RMID has to drop to a slightly lower occupancy
+ * before it is reused.
+ */
+static unsigned int erdt_cmt_scale;
+
 bool erdt_support(int flag)
 {
 	return false;
 }
 
+unsigned int erdt_get_cmt_scale(void)
+{
+	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
+		return 0;
+
+	return erdt_cmt_scale;
+}
+
 static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
 {
 	void __iomem *addr;
@@ -256,6 +275,9 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
 	else
 		erdt_max_rmid = min(erdt_max_rmid, rmdd->max_rmid);
 
+	if (domain_info->cmrc)
+		erdt_cmt_scale = max(erdt_cmt_scale, domain_info->cmrc->up_scale);
+
 	list_add(&domain_info->entry, &domain_info_list);
 
 	return true;
@@ -400,6 +422,7 @@ void erdt_exit(void)
 	valid_subtbl_mask = 0;
 	first_rmdd_domain_id = 0;
 	erdt_max_rmid = 0;
+	erdt_cmt_scale = 0;
 }
 
 static __init int enumerate_erdt_table(struct acpi_table_header *table_hdr)
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index fe8a4c1dd46b..87494316becb 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -293,6 +293,7 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
 
 bool erdt_cpu_has(int flag);
 bool erdt_support(int flag);
+unsigned int erdt_get_cmt_scale(void);
 void erdt_init(void);
 void erdt_exit(void);
 bool erdt_try_bind_domain(int cpu);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 510e947d98e6..05f6d24d0fc6 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -426,9 +426,12 @@ __init int snc_get_config(void)
 
 unsigned int resctrl_arch_round_mon_val(unsigned int val)
 {
-	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
+	unsigned int scale = erdt_get_cmt_scale();
 
-	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
+	if (!scale)
+		scale = boot_cpu_data.x86_cache_occ_scale;
+
+	/* h/w works in units of the occupancy scale */
 	val /= scale;
 	return val * scale;
 }
-- 
2.25.1

