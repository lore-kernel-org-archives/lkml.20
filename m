Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443072;
	b=fW4NLmdb4bFoxP4o9i6hVjamLbUwefn+7bnCaYgg1MNRtmbE1ffPojVrpGAVN0HkNZer
	 iE8MBc28d8CoNIj+wncZl5YEXsJAYi4bdls+VlWETF2CLSNRhSaiH5CTHVw11zhvJqOa3
	 ku/iWbJsWc8cwpKjNfdbfpu3K/sxNd3jNvZt7hHoDSwNrinPQld6BxgJx8u15QwBprMJB
	 GxpLoa/tzU+EJOaVjr16lo2LPFtvw/gOt4u7Pb6lBBAp6b60M8xp8VPOo2fvZdUeg5IMx
	 ypmnhH8hCgUdn4Z4rR1Tm+2siUHJHkVsJIcLk8Bdb/5B73TlTGF3LVesjINbpKJRVKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443072;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3AAjvZIRWiQW+gK3vnNy9D2avRnjF9IaCmrvGUbt8AE=;
	b=qjWKWsfrkcD10RYvxVK2g/8OqyuxrgywjGpGC/iRxBBiEmcV9OpyGJQjG1W3oFXleLm/
	 SRs03VyNeA8U4zZdqJErK7K0Hib2JIG+EC6p/BNOGzAh3ZihoUrck3BH9U+mbApyQVbw1
	 4pvoKpEdHSShIOP4tUy1uFEAl99uDkXi5K2LLCGfbC7kuk6SFJxLwfFrVIia9tzD2g5TJ
	 8scJoIRQ4kBSSYCzhwOWcQ+3jQnKNOA2EYhHSitkU3S9GKnERHWAowKcH0YVFx+mLO8mV
	 sajVLmCYRxTwmodqnrz8xmUGAWcOjWBY6d3fCXCaldp4uFTWuWh5J8r7uKJ1L3SL2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nt08xo+b;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123E60A4ADD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2123E60A4ADD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nt08xo+b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443072; x=1823979072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ioWPp4jOIpND+/d8HJaRuiW2367Lq4ZEumGCYHGbrqA=;
  b=Nt08xo+bXfzElYnUqOJ80ptxJoYTeHFTVFWyTVjFLWs3ajqKuUWvZt1O
   x7dUh7CMFDtMfVNs53kVgfI5VM5yS9UpDIfS/xqbLdbq7u3t7Ouo1JMvV
   aTXjsEJc0F42kIEunvmE2GgL50P8sJtOhhybV2PRjwAy39q+fUZrHmChF
   5xdb/IRUvwpZSee5EoDGQdgOIBzCW3fKeqythYzUGBkUMglNBrziPfG3J
   JJYwTRuIadJZu0rI9K6jZm1/hLu8F2aPyW74cjhcScRraljX36OSMuo3d
   wi/XOv4LzJW160tcKyph7nSHvnI6jQ7fJFKB+ZtqaVmIxpscz+FuQ5Rrd
   w==;
X-CSE-ConnectionGUID: ejoLgFUTTw2WvDHqBAEUxA==
X-CSE-MsgGUID: /OGewg7TRjyozf42ANKcmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131321"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:52 -0700
X-CSE-ConnectionGUID: GyssZcrpS2aWKlQBZaowWg==
X-CSE-MsgGUID: wqJ0RreiQiCIsSffauJ1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008713"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:52 -0700
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
Subject: [PATCH v14 24/24] x86,fs/resctrl: Document telemetry mount timing caveat
Date: Mon, 19 Oct 2026 13:50:31 -0700
Message-ID: <20261019205031.16977-25-tony.luck@intel.com>
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

resctrl enumerates telemetry events each time it is mounted, using
functions that the pmt_telemetry driver registers when it loads. The
driver can be built as a module, which is typically loaded by udev during
boot.

An automatic mount of resctrl from /etc/fstab early in boot can run
before pmt_telemetry has loaded. Telemetry events are then not enabled
in that mount, with no indication why.

Document the race, how to avoid it by mounting resctrl after
pmt_telemetry has loaded, and that unmounting and mounting resctrl again
enables the telemetry events.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	Updated commit message. Include unmount/remount as solution
	if early mount did not include AET.
---
 Documentation/filesystems/resctrl.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..66ffb625aac0 100644
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
@@ -668,6 +668,12 @@ When monitoring is enabled all MON groups will also contain:
 	returned if the MBM event does not have an assigned counter in the
 	CTRL_MON group nor in any of its associated MON groups.
 
+.. [#] Telemetry features are enumerated asynchronously by the PMT driver, so
+   an automatic mount of resctrl from ``/etc/fstab`` at boot may not enable
+   them. To avoid this race, defer the mount until after the ``pmt_telemetry``
+   module has loaded. Unmounting and remounting the resctrl file system will
+   fix the issue.
+
 "mon_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the monitor group. On x86 this is the RMID.
-- 
2.56.0

