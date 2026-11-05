Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874029;
	b=mBSF2x5qOByZ3yNvAUbTGJAkSHUMH6Flc9wUCCtszhb/fcyuPB6HDeFbhFZgg7dTm9SH
	 3rYrsYxKwhrWoi7KqZ9J6b/MOJbEZs7MD9RD2N6Y+JUSl8nBZu53Hh6ybQZ5xtA/2U+mW
	 DHXpNYgvmG2tyTWHfOo5IjLs2qkKH8bkuGJrmo0tCUTtfLxxf4CuyUCl7CSWJnIzWmwUC
	 x/d7ddeLx68BzW9MkNFH9siOJyLZpG3A4Kh3pCzJNETZLtgYzDkDIqoz/PpIH+V6Wy3R0
	 5r+H+SJSICqwKXlo9tAgCYhInzeJK9MUtSlRFAGS47ymXb9QBX0iyznfpMnzzOHVHxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874029;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1wLTVAldyF6SYlZk8+oDOH0VZiVgJCi35AwmffGohj0=;
	b=SV9iiYPsraYo49aAgV+6g174DBjM023X9CdUJ0zW91/JPiYs9jBRruaIScwAaef08woe
	 BX3xATw0jEUr9f0JFYWAAllDOxL1PTEkSrecfvNd0vGqgRgZbzfKZexbppAk6HvIOPE+b
	 +X6QNntnGx9pSGWoC1AXJCdhZ1/h/Yz52d+IEsdutmxYDSlD3D4iEf33TXO65/8zMTGaI
	 5aHE+WBJKd5Vo08bugQN1cV9Ba2J2XtVOlkfJYngcJZcljTxvQd/GpPyBt799jTJ2z/jz
	 iib91hZ4V6M4sCQ64u5LBJ58Hz+8AKfsWBIdvHss6Y9p9yI2AYamKoB7byUBmjA4VAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFN4aTqG;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0595606EEBC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0595606EEBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFN4aTqG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874028; x=1825410028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ZiUoJmOvikEOpEPWi1jamYWTTXJ8TyE7Eiao144884=;
  b=YFN4aTqGTTLJe1biICo7CwKyCECIsak2OO5N/LmHB+fhQe9UMzJOYGOW
   fgYd6cHgy5dnkmLgAnS34vbYiFpHCl3mXEl8OHXw7+6xeyQIvYJORAAzq
   PEM82815Q6nOFvU8AiFGM7+qpUI0HZ3LiVZ04SlE54L2MKgCUGWs+QvkS
   F/GoQe6RSnew3mwq+mLo3t4wS5ORiFic8rKVlIozjxxfUY/wbAaBfXIMk
   dyj50T4TTSphtDwChQeu5Xi7MhhBmkTKleQy76biFE6Z0zgUe+Cl4QC0r
   RBts60EeYTaxE3LdumTBk8nXsUUI0zJ0gQhcKDy+fWFVllqXj5PbUmLi9
   A==;
X-CSE-ConnectionGUID: u2J51r2pSX+P3XNj7Nf/1g==
X-CSE-MsgGUID: rpFSx4RqTLKdkC3uWgXEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2530294"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2530294"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:20:27 -0800
X-CSE-ConnectionGUID: UeG1oQGJRMGQbanBEr8mCg==
X-CSE-MsgGUID: w6EQAP+CQfi7VCWItbOhDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7143678"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 02:20:24 -0800
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
Subject: [PATCH v10 08/12] x86/resctrl: Refactor the monitor read function
Date: Thu,  5 Nov 2026 18:09:24 +0800
Message-Id: <0f9331a421081ebe65996a19e73a8d6811d5c9c6.1793864720.git.yu.c.chen@intel.com>
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

Split the monitor read helper into an L3 read path and an AET (Intel Application
Energy Telemetry) read path. This makes the two distinct monitoring sources
easier to extend independently and prepares the L3 path for ERDT-based MMIO
reads.

No functional change.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- No change.

 arch/x86/kernel/cpu/resctrl/monitor.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a30444dd638a..510e947d98e6 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -237,9 +237,8 @@ static u64 get_corrected_val(struct rdt_resource *r, struct rdt_l3_mon_domain *d
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
@@ -249,11 +248,6 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	int cpu;
 	int ret;
 
-	resctrl_arch_rmid_read_context_check();
-
-	if (r->rid == RDT_RESOURCE_PERF_PKG)
-		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
-
 	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
 		return -EINVAL;
 
@@ -279,6 +273,22 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
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
2.25.1

