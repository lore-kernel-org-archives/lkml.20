Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443058;
	b=oNyIBkEk8U2z2G22mkA8n1eYLf9bnFTTcDXYiXDdVPK97IZFzPfo4SUk0ZEN6FJEFeAr
	 TW19jB4qxxC+94LifHueRQhWtWo1gUk250vvk/O9ZeBB/fJnuPyb4jN/DG7OKWvsoHhi+
	 8SAlDGkudkcIlNd5hMnbDyvaSyihA95YAGqwH9ZADKz9FAwqdbjNwJpQsQHfrfQrLzxj0
	 pyotfT9nT/U9LX5h+6uHqtTKU9leMIfajnrmjlzonpoQuuJk0aEvpI/UzR7W9PYrenc/U
	 /5yJZ2nS135tZPDQTr0s/S+BCjqJ3jTSlnWIvFxtXEb1fNyeNvBtGtPXqX3cHuxTp5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PX0Ux4l98L8xvo7tBfYBHCx/KaUx8ITkoXvqIWv6vQY=;
	b=O3xoR3oy9rvJkXs4nqypHsaqNctdsyLiegR8mDtyri6DRfAVmwGOS2TS5GgBFDpZzA+v
	 cFq2OUBOsP2np5w3R0ezgw+ixW+KGgFVTZ1F3rb4CumWL9yCNIc4x7C3gXNnFKZpF8tsL
	 tPaQi7RPS6M9csrJ0zeU+RS53Is26nz/Egp7eKBOOM+dtBYNntyWBj/Qe2s/Hi6zvK0il
	 VV7qb4m5fcwaM1jx7xGmvOOz3ooVKxzWLJPzg528NxEzFgZ18RfXoX8Iju8xqtzGUKMKe
	 YHWV/w0hZB6rF2kDMom/BDUc96/nF1xVNriFvQR3etXA42gHkLNWjP86qn4PcHAv5Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGgaITUv;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD760A2608
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFD760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGgaITUv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443058; x=1823979058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1IB3esYd7ATSNi2S34LjPKibbEY3B/eSQhbp/8PZJ/A=;
  b=QGgaITUv1iYRRSLBDPlIoez7262UlinAxoTfsq7RWJ2oUBwxs7sbGS/6
   ZqWsliij+fHPrV4FzeNQ64llZh1GkgSMJfsxMjlDJgdS/QhzqonD54Yno
   pQ7eByZoh7bqgMpNPjrBiMl1xDshkSmhQ+0HZKr8a+ZXUe45cY/ThcnsF
   FjvP15LRW7/mo+sVHPzya2fXZ4LXOnH6wAaIko2bmkIFgHX4m14i2O/Ar
   r2vn/Xokf7YhzRIvWGOQukPcg2tpsCpbvM/55TXVyvPEhjJ8dFzLAF1WG
   /I0bsL0SpMnCt7Nc7E48B1Fo6v4DIR4LL3VHVzCqhxsk3jH72MdLltrmb
   A==;
X-CSE-ConnectionGUID: Y2PeRXv0QOWh/dUZuci+sw==
X-CSE-MsgGUID: omyWVygKTYuYz8649xtQJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131193"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131193"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:49 -0700
X-CSE-ConnectionGUID: LAGf6ADNQW6mlYgc7jP0WA==
X-CSE-MsgGUID: A3OZ5WnHQ1ORpucMBUtynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008650"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:50 -0700
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
Subject: [PATCH v14 10/24] x86/resctrl: Honor rdt={perf|energy} options to force enable AET events
Date: Mon, 19 Oct 2026 13:50:17 -0700
Message-ID: <20261019205031.16977-11-tony.luck@intel.com>
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

resctrl can disable a feature the platform supports, for example because
of an erratum or, for Application Energy Telemetry (AET), because an event
group has insufficient RMIDs. The "rdt=" kernel command line option lets
the user force such a feature on anyway, and also lets the user disable
supported features they do not need.

resctrl enumerates AET once, on first mount. Enumeration skips an event
group that is marked disabled. An event group with insufficient RMIDs is
marked disabled even when the user forced it on, but this happens after
the test for forced off when enumeration begins for an event group.

This will be broken when AET is enumerated on every mount. The disable mark
recorded for insufficient RMIDs on one mount causes the event group to be
skipped on the next, ignoring the user's explicit rdt= request to enable it.

In preparation for enumerating AET on every mount, skip a disabled event
group only if the user has not forced it on. As a result, when the command
line both disables and enables the same event group, for example
"rdt=!perf,perf:<guid>", enabling now takes precedence. This matches how
rdt= handles the other resctrl features.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	New commit message. Dropped previous supplied Reinette RB tag.
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 66cd8c2c7a51..9f0829a82cb0 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -262,7 +262,7 @@ static bool enable_events(struct event_group *e, struct pmt_feature_group *p)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
 	int skipped_events = 0;
 
-	if (e->force_off)
+	if (e->force_off && !e->force_on)
 		return false;
 
 	if (!group_has_usable_regions(e, p))
-- 
2.56.0

