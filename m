Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAC509EF1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633756; cv=none; b=jyjrdGP+VypGsySs4O4rrmbdUauNWjhdq+J+ZmGl7LrTfv6YRTU44x+ichyPcQrgo7BHLuPinp2F19nmoZqdDzo+CieO37o7iz2KCVIkACfjfsITqs2iucTXILeAdIndYFiX1qBpwnIYhavAwJnSPgpuCBfL17O/Bt15KDaQ83U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633756; c=relaxed/simple;
	bh=HRaGWkms3o2AV/USNZBUgC1MVEPrSsotLJzEAs7VjQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=StT4khOh2o1+1IdPyPSBzSZTO7bghGSJ0MrULsgfgLJrDAKdy0vfbZIZByS2RpwGHUWkOn3xGx6swf1+FoaB7rTHezgZ+AP8OUoeWAAbq6PUwrffAV1AiuN7S12lGwJlKfDBwYDdhLjiX3Ckxth6YHoa1G0sSTknLjFYXRD1CCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0tKhHzb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0tKhHzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633755; x=1822169755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HRaGWkms3o2AV/USNZBUgC1MVEPrSsotLJzEAs7VjQ0=;
  b=C0tKhHzbfopannXP/LbbQ+MFFty81r95sjXyUSGtvPPNfx43Ux03R0jm
   p7aTtLciTXD2SZpmJRbO6Ht2eEQ84CPvf83q590vcEAhb8/jok8HcbO6/
   HH8j/yWaP5NCapEQqy+bIkvzYyEUmbAytRrjHe8ky+aZCn47nG55MSWtb
   gfhM7RG1OHi+FPtzltVBdOwbgBGzqf2QgTQ+Qu3zJrNgLHq+l28eEL3Nv
   q0/USKiS5LWk5iur+zzhPdT1y6assPhF5yYLxiCuN+uwXNaCJe/GByRY7
   7a/dbmkeonfEngGJP20DCF/V8gsuMn1dgM5GWwbk3VFX5u2zAcAgKeIj/
   A==;
X-CSE-ConnectionGUID: TuriT30ISOOLHEPZi69R3g==
X-CSE-MsgGUID: g5T9dlpqQMCQbCUIuymGEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387384"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:22 -0700
X-CSE-ConnectionGUID: ey560ApjQ8SfoX68oi0eEw==
X-CSE-MsgGUID: 8jxHqtqjTdOjzifYcBudgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685555"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:20 -0700
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
Subject: [PATCH v13 25/25] x86,fs/resctrl: Document telemetry mount timing caveat
Date: Mon, 28 Sep 2026 15:15:09 -0700
Message-ID: <20260928221509.68002-26-tony.luck@intel.com>
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

The PMT driver enumerates telemetry features asynchronously, so an
automatic mount of resctrl from /etc/fstab early in boot may occur before
those features are available, resulting in them not being enabled in the
mounted instance.

Add a footnote to the 'If telemetry monitoring is enabled' sentence
explaining the race and providing a solution.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Drop the "Mounting resctrl with telemetry" section. Include the
	solution in the footnote.
---
 Documentation/filesystems/resctrl.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..dcae1076f863 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -629,7 +629,7 @@ When monitoring is enabled all MON groups will also contain:
 	each instance of an L3 cache. Each directory contains files for the enabled
 	L3 events (e.g. "llc_occupancy", "mbm_total_bytes", and "mbm_local_bytes").
 
-	If telemetry monitoring is enabled, there will be a "mon_PERF_PKG_YY"
+	If telemetry monitoring is enabled [#]_, there will be a "mon_PERF_PKG_YY"
 	directory for each physical processor package. Each directory contains
 	files for the enabled telemetry events (e.g. "core_energy". "activity",
 	"uops_retired", etc.)
@@ -668,6 +668,11 @@ When monitoring is enabled all MON groups will also contain:
 	returned if the MBM event does not have an assigned counter in the
 	CTRL_MON group nor in any of its associated MON groups.
 
+.. [#] Telemetry features are enumerated asynchronously by the PMT driver, so
+   an automatic mount of resctrl from ``/etc/fstab`` at boot may not enable
+   them. To avoid this race, defer the mount until after the ``pmt_telemetry``
+   module has loaded.
+
 "mon_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the monitor group. On x86 this is the RMID.
-- 
2.55.0

