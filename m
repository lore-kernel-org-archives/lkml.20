Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443055;
	b=EPIzhot3YFBtTh8klfDPfyY/9evWiOoB+MpMSi04UXuhvOqz9ovLbQjGmYUcAYhT8Tvh
	 /L9iFCKTuLP/FnxoXBATJkBAptBvuIkzX0Rr5kG6liA7e4JEG4KGc3SqemSRC/KVpStiU
	 9ay7vtVMjp80KeNKcB77QxNOomhArmjuxL1s1ycm44LRViO1nHwmWduVSV0+GLKtXMLGn
	 1DxlzVLL5XKdJQvZ2JyLQayqU4BEcPL7TfprQsHqVFemjBaM2IB0JeetSE2HZLObZA6Sb
	 0QrvXEQWXdmMRz50TiAXb4NUrU+E3268YyTcp0OIuZKua0z3tYOlehRNGOe56IWThNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443055;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=29zAh+VdACQHdawjT317TnItWPjxE5zEZbko119mJPc=;
	b=j+XUS5LoTxBSXtOOWXiPKDSLzSzBsoIJB4t1Yuccxyt5LB5DbcVk1gDctRxfzm4wQQIH
	 SYHsdUcWI58mx1u3iA3i1+GpBfk0LNnT/z+MfWF1szFB9gJVTCH6EvBl5BcIbF0bJzaMn
	 45MgdAD3TlFlzCSCal0tQXHTpZkUIKERf8fs9qzZBuTQBJRbAECzeNrRdgOCu2NENTt22
	 Spg1K2JmCKQV+IIy4hknApADvV/rkvmTMUjga6Iyz9ZBOeUkRx132jr8JbSiMYDZV03z2
	 wuv2fxolHhxRRjEVLqsLOTeN+GLZafWxHCNLh9kbWCTU1B9Cp1Zta8AdSIbOr21VEiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VRhHEDK9;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D424606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D424606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VRhHEDK9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443055; x=1823979055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMjaQO6VHA1pMakSC91lUM3sxsyJb7A12iNJ5ufdSdk=;
  b=VRhHEDK9T/6zL42BWxr318lfKFNLV+wpYFKKOZaE4ygrcwv3+YoHkVuf
   0fccV1//3OII2Cb0rYCdbg4ESabbPPiK0e/DS3PRXOPrMK4p9q8vXSvES
   RrsYqrq/3eAdis1+A8TmmtLAt9HsffsUjXKU/+1j8LiE4hzewAZepa0KX
   gwfPBOf2dzqJwwoF8yPbL8UsQtyCssD8Ltw4pgo7WTOaz3BdWivD3jyNe
   iq6Dwk9eNhLdlzIvXge1wFe0F1dkf5qe3cVoJIlm09d+q27Q9h6IQ7bPg
   8gd+CqQklopBEDFtOxq5wyP9wOyw52OYrCYm+5eA6goKKt9demtCTbDzg
   w==;
X-CSE-ConnectionGUID: NFbBcmChRPG11cJsADGCxg==
X-CSE-MsgGUID: Xvu+J44AS563a/TzkRt7RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131178"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:49 -0700
X-CSE-ConnectionGUID: kwNtrb48QKGsHzA6Cnj51w==
X-CSE-MsgGUID: lS11in+jRxudndMYFKoBcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008642"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:49 -0700
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
Subject: [PATCH v14 08/24] x86/resctrl: Delete rdt_alloc_capable and rdt_mon_capable
Date: Mon, 19 Oct 2026 13:50:15 -0700
Message-ID: <20261019205031.16977-9-tony.luck@intel.com>
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

Whether the system supports allocation or monitoring is now determined from
the per-resource capability flags via resctrl_alloc_capable() and
resctrl_mon_capable(). The x86 globals rdt_alloc_capable and
rdt_mon_capable are still written during enumeration and when telemetry
monitoring is discovered at mount time, but nothing reads them.

Every place that writes a global also sets the matching resource flag, so
the globals carry no information that the resource flags do not.

Delete rdt_alloc_capable and rdt_mon_capable.

No functional change intended.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	New commit message in context, problem, solution format.
---
 arch/x86/include/asm/resctrl.h        |  2 --
 arch/x86/kernel/cpu/resctrl/core.c    | 13 +++----------
 arch/x86/kernel/cpu/resctrl/monitor.c |  6 ------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 9c44a7766631..8c3b51398ddc 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -42,8 +42,6 @@ struct resctrl_pqr_state {
 
 DECLARE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
-extern bool rdt_alloc_capable;
-extern bool rdt_mon_capable;
 extern unsigned int rdt_l3_mon_scale;
 
 DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f2bf160d01c1..2e3b9c16cbda 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -45,12 +45,6 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 DEFINE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
-/*
- * Global boolean for rdt_alloc which is true if any
- * resource allocation is enabled.
- */
-bool rdt_alloc_capable;
-
 static void mba_wrmsr_intel(struct msr_param *m);
 static void cat_wrmsr(struct msr_param *m);
 static void mba_wrmsr_amd(struct msr_param *m);
@@ -781,7 +775,6 @@ void resctrl_arch_pre_mount(void)
 	cpus_read_lock();
 	mutex_lock(&domain_list_lock);
 	r->mon_capable = true;
-	rdt_mon_capable = true;
 	for_each_online_cpu(cpu)
 		domain_add_cpu_mon(cpu, r);
 	mutex_unlock(&domain_list_lock);
@@ -1026,10 +1019,10 @@ static __init void check_quirks(void)
 
 static __init bool get_rdt_resources(void)
 {
-	rdt_alloc_capable = get_rdt_alloc_resources();
-	rdt_mon_capable = get_rdt_mon_resources();
+	bool alloc = get_rdt_alloc_resources();
+	bool mon = get_rdt_mon_resources();
 
-	return (rdt_mon_capable || rdt_alloc_capable);
+	return alloc || mon;
 }
 
 static __init void rdt_init_res_defs_intel(void)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 468e9821f35a..82a555855c1b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -26,12 +26,6 @@
 
 #include "internal.h"
 
-/*
- * Global boolean for rdt_monitor which is true if any
- * resource monitoring is enabled.
- */
-bool rdt_mon_capable;
-
 /*
  * Scale factor to convert L3 monitor events to bytes.
  */
-- 
2.56.0

