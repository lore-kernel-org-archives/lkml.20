Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7254A7CD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704367; cv=none; b=ATgNanKqvQ4GVbjkl8CzosrIO1xiu86T6WTIW4TaWqOOA1dkEqEIlBzpoKdgqnhh15KdsPM7q8hxHz5AFPE7gub4IR0CEqHtk+cScDQs+ti7brxGcdQ2+7VAynRZ7pTdac/qEc0WBSongBGEWQVpPo+h+elvUl9gDNcHVmoR1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704367; c=relaxed/simple;
	bh=1FoIteT8HywCaBBpEfbL4X1gmCxIX7jPN3s7R3UVTpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOHSY1EQuwkaNZA+zS4fUr7ee4Ukc60LEujx93RIjnGtxB0WIhuq9TEHgI5lkj26ixUYzLW7wEY1qZuSTu4u3Hc1ugXuRl8cz2W+1gT4ZfDJnSEqkAM08vhtYggEjBjKt/aEtbm7WM3/5AOhLl3fIP9ZJ3RFgU7mN0tH9m1mINU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDSEb+z7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDSEb+z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790704365; x=1822240365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1FoIteT8HywCaBBpEfbL4X1gmCxIX7jPN3s7R3UVTpc=;
  b=jDSEb+z7+QTdSzNUig9DjoloYDSPPZJxO71WoIYqUz+wwdhvOZxZFLA0
   AX6sEPcEqidBXvVQONvD6dAxptFgwr/Fc6v2wKjly0eyT1DQ9Rf/BjKvr
   ZaVpMMnamawrQ94ArQrNR+9PvpgQrW/89P4wvnMCUw7lbi+zpHbcqW2b5
   OPcD0bJAllzQ7yx3mAeDrwg1QDsuL+/kaVVD3xRV8669qm4uBu/f3d6VM
   EK+m2Hw5l1gia3FKtoh4IMMKdqcJ+BublfEXYEFDaQfQz54pKwo8gwB7+
   hSBAvJwpqB2Mm1zZAABNDiEbQRrMNhlc+Mbuc+I8yJFWxRcHfwxgfPkCx
   g==;
X-CSE-ConnectionGUID: dqw1xQB4RwmVlJUlvQlnBw==
X-CSE-MsgGUID: ttFJ3aNsRs2HdGq9GWrPtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90294398"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90294398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:52:44 -0700
X-CSE-ConnectionGUID: h4zXNiSdTjSNaIeUcvbPxQ==
X-CSE-MsgGUID: vNvcgD5rQ9yCyCZcr2vUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274649258"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.222.232])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:52:44 -0700
From: Tony Luck <tony.luck@intel.com>
To: tony.luck@intel.com
Cc: Dave.Martin@arm.com,
	babu.moger@amd.com,
	david.e.box@intel.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	hch@infradead.org,
	james.morse@arm.com,
	linux-kernel@vger.kernel.org,
	maciej.wieczor-retman@intel.com,
	patches@lists.linux.dev,
	peternewman@google.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: [PATCH v14.1 20/25] x86/resctrl: Enforce system RMID limit on AET
Date: Tue, 29 Sep 2026 10:52:38 -0700
Message-ID: <20260929175238.16588-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928221509.68002-21-tony.luck@intel.com>
References: <20260928221509.68002-21-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AET (Application Energy Telemetry) event groups each support a specific
number of RMIDs. But that number may be higher than the number supported
by the system.

Ensure that info/PERF_PKG_MON/num_rmids does not display an unachievable
value to users by capping the maximum supported RMIDs in the resource to
the system maximum.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	No change
---
 arch/x86/kernel/cpu/resctrl/internal.h  | 2 ++
 arch/x86/kernel/cpu/resctrl/core.c      | 2 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index c66954bc01e7..1f080aad1b67 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -153,6 +153,8 @@ extern struct rdt_hw_resource rdt_resources_all[];
 
 extern bool intel_rdt_mbm_need_quirk;
 
+extern u32 pqr_assoc_num_rmid;
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 40466f29e48e..689b9e31fe7a 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -46,7 +46,7 @@ static DEFINE_MUTEX(domain_list_lock);
 DEFINE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
 /* Number of unique RMID values that can be written to MSR_IA32_PQR_ASSOC.RMID */
-static u32 pqr_assoc_num_rmid;
+u32 pqr_assoc_num_rmid;
 
 static void mba_wrmsr_intel(struct msr_param *m);
 static void cat_wrmsr(struct msr_param *m);
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index e7cd7d8a80cd..756832f6d51d 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -274,6 +274,12 @@ static bool enable_events(struct event_group *e, struct pmt_feature_group *p)
 	else
 		r->mon.num_rmid = e->num_rmid;
 
+	/*
+	 * AET may claim to support more RMIDs than are permitted to be
+	 * assigned to MSR_IA32_PQR_ASSOC.RMID. Enforce this limit.
+	 */
+	r->mon.num_rmid = min(r->mon.num_rmid, pqr_assoc_num_rmid);
+
 	if (skipped_events)
 		pr_info("%s %s:0x%x monitoring detected (skipped %d events)\n", r->name,
 			e->pfname, e->guid, skipped_events);
-- 
2.55.0

