Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0987F52B1FB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600431; cv=none; b=dpxlunByBwK1y3A0XCwUub7oGOc59qdIYsUSO4WzTGDlzUO2kiS/HXUjldXzolhtBoPsE4wvryCQFcg7XlVgZKjVQ4nWMNNibVHtcoHNEuQsIV97OBTpBV/y5wOMW/8ITrDua2vKWIPi00qLZ5DDM1Krg3xKdqD8xIZ6E+AoJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600431; c=relaxed/simple;
	bh=9CyekPmxUkpvx5IqdU7Rjc0F6QQlf4amQJEjXjx4+mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPfUjftefQ+LElWTPncaLxzczbv7TfgG/QVm8a56/jQ9sImkdrkITEaZfGMnOC4dKraT9rC5aasuZTdnb70h1qxw82d3TJP0Shfgn31DhKqGR8zKlMDXrVMTElKqQnnVZBgGI5QJNecRbnpPXIFqN5BDjjVt0UAOUPe1XuCpCpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU77YMN8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU77YMN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789600429; x=1821136429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9CyekPmxUkpvx5IqdU7Rjc0F6QQlf4amQJEjXjx4+mI=;
  b=nU77YMN8w/CjCzwmDatuFheaFvV6AsfyTZZ30+fg4aOXQWUWKQA4dyNN
   y+0peyPW1Uib+2gwRxgwDFaaYVF1/o4ARlvBHGc5k7hAXvP7pZe/U1PRa
   80gyWiwPaRQc9IJ75upiyemcM8LX4i/S78McoqMBBvYC1U2mZhvCsVhxV
   w4FuhXoU344gqHM9ktAirCJelQq3ILBS2b+Uzp/yYXLUqXWHpXOOavM2I
   MQDanND+3WXdYH+ZoOPbOVDmUcJmLJ528xME31b6nV5NNrqqb/NlbQeob
   qCLI0PHj6doMdkW2e/yRaXJQDs9eRrHeeWqdhf6vxNwbMcSn9coFWe0L4
   A==;
X-CSE-ConnectionGUID: sKFFpImBSRyo/k65YCdo4g==
X-CSE-MsgGUID: yDDQw8QLQJi5rEUwxKHe6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861470"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861470"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:38 -0700
X-CSE-ConnectionGUID: i+Qn/mRvRGOmj0VRlgeHzg==
X-CSE-MsgGUID: 7bfyiY+tTmqaC5Do7ETucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277231483"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:38 -0700
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
Subject: [PATCH v12 17/25] platform/x86/intel/pmt: Register enumeration functions with resctrl
Date: Wed, 16 Sep 2026 16:13:12 -0700
Message-ID: <20260916231320.14502-18-tony.luck@intel.com>
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

INTEL_PMT_TELEMETRY is a loadable module, but resctrl is built-in and cannot
call PMT functions directly.

Use ".probe_type = PROBE_FORCE_SYNCHRONOUS" to ensure sequential, synchronous
calls to per-device .probe() functions.  Register the telemetry enumeration
function pointers at the end of pmt_telem_init() when all .probe() functions
have run and enumeration is complete.

Unregister at the start of pmt_telem_exit() before teardown of the
auxiliary drivers.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v12:
	No change
---
 drivers/platform/x86/intel/pmt/telemetry.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 953f35b6daec..bf0c9295feb3 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -427,16 +427,30 @@ static struct auxiliary_driver pmt_telem_aux_driver = {
 	.id_table	= pmt_telem_id_table,
 	.remove		= pmt_telem_remove,
 	.probe		= pmt_telem_probe,
+	.driver		= {
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
+	},
 };
 
 static int __init pmt_telem_init(void)
 {
-	return auxiliary_driver_register(&pmt_telem_aux_driver);
+	int ret;
+
+	ret = auxiliary_driver_register(&pmt_telem_aux_driver);
+
+	if (ret)
+		return ret;
+
+	intel_aet_register_enumeration(THIS_MODULE, intel_pmt_get_regions_by_feature,
+				       intel_pmt_put_feature_group);
+
+	return 0;
 }
 module_init(pmt_telem_init);
 
 static void __exit pmt_telem_exit(void)
 {
+	intel_aet_unregister_enumeration();
 	auxiliary_driver_unregister(&pmt_telem_aux_driver);
 	xa_destroy(&telem_array);
 }
-- 
2.55.0

