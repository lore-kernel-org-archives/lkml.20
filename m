Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769D558FD22
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600439; cv=none; b=rVe3Ut+haFqU6ciCW0xD3uJVmNfJ26ws9zU1TpxQudC9QkyBY0yuD6lfCwbhICTbPFb5JeVs7uj3usy1W05BqS8fcdmkHALkUTxE7H2lY9c+XaUtIuSLAQAoXEaNkdNrpIm6XBuzJDmYwextLoFyKLqBDpk58eRARPA7v7TreYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600439; c=relaxed/simple;
	bh=ydpynI7FWRcDuv3jJBE/xxqcbkyClGw2KGJIvYL2PfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6Qsb09yvGnp3G9K4YkS2BfKPMrWgIyMmxjkWtic8U7UduHJ+X7aGSD9N2rXcq39hR13tgaaYBMjQkd0CiOhSzFpUMMdnsje4kzdh537VtwfZuBVUWjMDnw6hh1m0w44eGj0oHsRAco5+LKBxdpXxfDMUTDh6ylZthShx/H8uY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfrSFRfF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfrSFRfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789600438; x=1821136438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ydpynI7FWRcDuv3jJBE/xxqcbkyClGw2KGJIvYL2PfA=;
  b=PfrSFRfFal9U9CTQ8dtC9C++Vbyz3hnG+BXUpx6+yWj77zwradePgf1N
   TPR4IJWw6S/blc0KX+ZS9m7eVWY0oUO5A8a+PsPhEFHLGf5lUQg1c6Su3
   3trcpuZTYN1SF2oBh6PuGyw5l9RG9LibajUy/WAUyMmG7D3dsEvKEaQc0
   OkCDWGqHc6XS33a0t/HppAzEplJ9K6XTqXByXWyv2nQFmYGt9fuxlYrAd
   xS8nh1VDkdhSgmziqZkG6s5az1NE0z8CLPC+70E0KWeSloIrZhsQX9Y3j
   s4XxiihUNAfY7w7YMMGb6TW6ZkTOgI0Xiyk9sHX+gL6SceYfbqFaTtFZn
   w==;
X-CSE-ConnectionGUID: dxJyyyBCRY2yQm9HetLoRw==
X-CSE-MsgGUID: iPU3cyivQzOCPnCaGW1aEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861549"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:41 -0700
X-CSE-ConnectionGUID: 6uAJXPrqTSOky6uUNq5jBA==
X-CSE-MsgGUID: sJ7fYBpYSqqIeQApm81J5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277231511"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:41 -0700
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
Subject: [PATCH v12 25/25] x86,fs/resctrl: Document telemetry mount timing caveat
Date: Wed, 16 Sep 2026 16:13:20 -0700
Message-ID: <20260916231320.14502-26-tony.luck@intel.com>
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

The PMT driver enumerates telemetry features asynchronously, so an
automatic mount of resctrl from /etc/fstab early in boot may occur before
those features are available, resulting in them not being enabled in the
mounted instance.

Add a footnote to the 'If telemetry monitoring is enabled' sentence
pointing readers to a new "Mounting resctrl with telemetry" section. That
section explains the race.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v12:
	Drop problematic examples of systemd/udev rules.
---
 Documentation/filesystems/resctrl.rst | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..91a2ab0fa027 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -630,7 +630,7 @@ When monitoring is enabled all MON groups will also contain:
 	each instance of an L3 cache. Each directory contains files for the enabled
 	L3 events (e.g. "llc_occupancy", "mbm_total_bytes", and "mbm_local_bytes").
 
-	If telemetry monitoring is enabled, there will be a "mon_PERF_PKG_YY"
+	If telemetry monitoring is enabled [#]_, there will be a "mon_PERF_PKG_YY"
 	directory for each physical processor package. Each directory contains
 	files for the enabled telemetry events (e.g. "core_energy". "activity",
 	"uops_retired", etc.)
@@ -669,6 +669,10 @@ When monitoring is enabled all MON groups will also contain:
 	returned if the MBM event does not have an assigned counter in the
 	CTRL_MON group nor in any of its associated MON groups.
 
+.. [#] Telemetry features are enumerated asynchronously by the PMT driver, so
+   an automatic mount of resctrl from ``/etc/fstab`` at boot may not enable
+   them. See `Mounting resctrl with telemetry`_ below.
+
 "mon_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the monitor group. On x86 this is the RMID.
@@ -1898,6 +1902,18 @@ m. Unmount the resctrl filesystem.
 
   # umount /sys/fs/resctrl/
 
+Mounting resctrl with telemetry
+===============================
+
+Telemetry features (e.g. the ``mon_PERF_PKG_YY`` events) are enumerated
+asynchronously by the PMT driver. If resctrl is mounted before that
+enumeration completes (for example, when mounted automatically from
+``/etc/fstab`` early in boot) the telemetry features will not be available
+at mount time and will therefore not be enabled in the mounted instance.
+
+To avoid this race, defer the mount until after the ``pmt_telemetry`` module
+has loaded.
+
 Intel RDT Errata
 ================
 
-- 
2.55.0

