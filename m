Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB851509EE1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633751; cv=none; b=ANYmqwF966gwjyprkSJPpnf1lZiCY0+KCGIJ0+JJAzssKG4wQSgcudw5VTzLH6qEIRlxm4CdM8X3jbwmwkLjVmIO64ADqNE4zbUsmNF7uuVWhlZ6uNVthYUgjSxLGSKV6LvrcaRx26mLq67z23p4ES7jvWVah5zneCi0H29X9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633751; c=relaxed/simple;
	bh=DhWDUzqit36MmMWF71XQ8xF0iejy5cX8wk9OD0emNkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUhHU5Ub7DGVJjwCyw8qYB2dN2hp7QP9+Pysa8YxsLu/KPc/Po/XiagPlxw+WJ319cLHjDh2KMWeWeEmxAsVPOWhOUZExCQnpOwWXiC3jEDDiHMdFdnaMWXEAH5d/EJRPDZwsniyxgLNEiS2yL23HzgC2YC6hXyCqodImUo/Yhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fllVfZ4d; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fllVfZ4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633743; x=1822169743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DhWDUzqit36MmMWF71XQ8xF0iejy5cX8wk9OD0emNkY=;
  b=fllVfZ4dVMrfDYRHvEADMAhgyUDn2vofLxjR8TsTg9qLlbRpmKfCPJRo
   Vz/sELdId6Zy/3kw0XGAEgvwdxvrrgGT6xQRODnz9/GQ3g3mwN57Nt/IB
   8u86j+HWNMtH2OHIWwXKHXQctlJCfU3VN1so1TRqpoLMVENk66epYCo3k
   n66zB9ebp7DF5hQf5M7SNJ/+cvyhk1N9/9hFW/E2kWEzaWL56JTE+FWEQ
   C6xsth/V4iD/voFQAKu+WKBkWCqSI2WvvoG+yXs88ZNKjiBup3ruTDd5r
   lBZsS9qmfEd//t1R6GPCAJhZ8+BJYbYbne6YdJUXkYuYe46ytwa82pH+i
   g==;
X-CSE-ConnectionGUID: JzXpJtbZRCK3kHEulVcxPA==
X-CSE-MsgGUID: vZLUc892Tw6Yk8vORoPuxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387301"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:20 -0700
X-CSE-ConnectionGUID: xpfvfn9FSUK2jvkFJHJBow==
X-CSE-MsgGUID: 2h3JWHg/Sl+87zedjjGFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685521"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:19 -0700
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
Subject: [PATCH v13 17/25] platform/x86/intel/pmt: Register enumeration functions with resctrl
Date: Mon, 28 Sep 2026 15:15:01 -0700
Message-ID: <20260928221509.68002-18-tony.luck@intel.com>
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

resctrl exports register/unregister functions that the pmt_telemetry
driver should use to allow resctrl to call the Application Energy
Telemetry (AET) enumeration functions when this driver is configured
as a module.

By default module probe functions are called asynchronously. Change the
probe type to request synchronous execution to ensure that all probes
are complete before supplying the enumeration function to resctrl.

Unregister enumeration before beginning tear down of auxiliary devices
so that resctrl cannot attempt enumeration in parallel with unload of
the pmt_telemetry module.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Dropped empty line in pmt_telem_init()
	Rewrote commit message with accurate context.
---
 drivers/platform/x86/intel/pmt/telemetry.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 953f35b6daec..57eb2967a4d0 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -427,16 +427,29 @@ static struct auxiliary_driver pmt_telem_aux_driver = {
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

