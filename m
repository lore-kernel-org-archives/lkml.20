Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148E3290C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947389; cv=none; b=U1a/PpPpL7GYjEh2e0NWSlGurdw6xsjtVyKWIEPuZHfdlLdMRNOs8ZWNipNHCwS+NuwiaBNETSMmzGqE9IXxM03D6qkUZw09QnLwVlM0HpPt376cSRTV2L5JgJVB3GFo6dQNYJdc2OWrREIc3KZmvvFCVvtMy0YubHVRVGxLvf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947389; c=relaxed/simple;
	bh=s5yWXhMm/iaGaP67zWfcSatdoC+/zx8he12I7G/Ayfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GSjDNROrn8qZO65o7bU15gEEojrZsI4D8xSPQz8dGMbT/MpUBi9e1nwQ0MOxBF0WxKUnUlcWlbd6OhhU10R312L+xI1xvUmtxmDTwu59ewu5iQa5999Keum5/RInkX24pwUbJgrahyIPELEjH4jKDB/U1vd+Gv0TKM8mK3mHHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHTk+ANA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHTk+ANA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947389; x=1823483389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s5yWXhMm/iaGaP67zWfcSatdoC+/zx8he12I7G/Ayfg=;
  b=oHTk+ANA28gIqGPWM/EqAqUdfF5emoR2cKvDm7UawCM9sDyJrcYycrfL
   8HeJgd8pRvpbxxHJqm4pEWBVcZyXv2Nr2vQfIMRB9mVdmwE+TeKWC70lw
   9Nyh+aHUMKBQZ9ALQz1KBv3/hhx8o4DDVBTOjyOY7SFPLoe1KcpGNcsVw
   //gwI7w4kNnyocBlzKXrXxnK57lpeOVbic/KvNwRPwGL9lj+HeMNyocIw
   o4ltgcx7FMAMahM0x795Nqair7cdpLRlKrEHdBdsuY1DdI+b7vy67Di6h
   5d+0q0AgE7jQB1YOh67UK/hXTDytvGieMAvjnipZTUSYCnR/6+8ou0/uo
   g==;
X-CSE-ConnectionGUID: BmgRv/v5SQeN5q8EPdKnKw==
X-CSE-MsgGUID: P2/Me6zfTJOLNEnVS4l66g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="562683"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="562683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:09:48 -0700
X-CSE-ConnectionGUID: NfXTaskdS06+6ppw2R/RLQ==
X-CSE-MsgGUID: dbv99Ug3TWCZzhKTHZPvnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1283607"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2026 20:09:45 -0700
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
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v9 07/12] x86/resctrl: Add a global ERDT monitor scale
Date: Wed, 14 Oct 2026 10:59:18 +0800
Message-Id: <ec2671aec51023ffacc8bd265a57f7aa09195d23.1791933001.git.yu.c.chen@intel.com>
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

The limbo handler polls the LLC occupancy of stale RMIDs and frees an RMID
once its occupancy drops below max_threshold_occupancy. User space writes
that threshold in bytes, but the hardware counts occupancy in units of the
occupancy scale, so the threshold is rounded down to a multiple of that
scale. The scale is the number of bytes one counter unit represents, i.e.
the granularity of the occupancy counter.

ERDT may provide per-domain monitoring scale factors, but resctrl rounds
max_threshold_occupancy through a single global
resctrl_rmid_realloc_threshold value that is visible to user space.

Prepare for that by adding erdt_scale/erdt_get_scale() and teaching
resctrl_arch_round_mon_val() to consult the ERDT scale when firmware has
populated one.

When CMRC parsing provides per-domain up_scale values, erdt_scale will be
updated with max(). The reason to use max is because rounding is a floor:
a larger scale yields a slightly lower threshold, i.e. an RMID has to
drop to a slightly lower occupancy before it is reused.

For now erdt_scale is intentionally left at its default value of 0.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
Changes since v8:
- New patch. erdt_scale and erdt_get_scale() were introduced inside
  "x86/resctrl: Parse ACPI CMRC table" without any mention in its
  changelog. Split them out and describe why a single global scale is
  used. (Reinette Chatre)
- Reword the erdt_scale comment: it is not used by the limbo handler.
  (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/erdt.c     | 16 ++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  1 +
 arch/x86/kernel/cpu/resctrl/monitor.c  |  5 ++++-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index d4b630358d6d..09072e478bde 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -38,6 +38,22 @@ static u16 first_rmdd_domain_id;
  */
 static unsigned int erdt_max_rmid;
 
+/*
+ * Used only to round the global resctrl_rmid_realloc_threshold for the limbo
+ * handler. resctrl_rmid_realloc_threshold is exposed to user space as a single
+ * global value, so ERDT uses one scale derived from the per-domain
+ * cmrc->up_scale values. max() keeps this single threshold conservative across
+ * domains because the rounding is a floor: a larger scale yields a slightly
+ * lower threshold, i.e. an RMID has to drop to a slightly lower occupancy
+ * before it is reused.
+ */
+static unsigned int erdt_scale;
+
+unsigned int erdt_get_scale(void)
+{
+	return erdt_scale;
+}
+
 static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
 {
 	void __iomem *addr;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 48aa64c1ff96..75dd4736937d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -284,6 +284,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+unsigned int erdt_get_scale(void);
 void erdt_init(void);
 void erdt_exit(void);
 bool erdt_try_bind_cpu(int cpu);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index e42ee2769a39..f1a28a3c81bc 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -423,7 +423,10 @@ __init void resctrl_arch_update_snc(void)
 
 unsigned int resctrl_arch_round_mon_val(unsigned int val)
 {
-	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
+	unsigned int scale = erdt_get_scale();
+
+	if (!scale)
+		scale = boot_cpu_data.x86_cache_occ_scale;
 
 	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
 	val /= scale;
-- 
2.43.0

