Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443067;
	b=y6v2s5iDLlA7GyELeTmhEIOiw8M0L5fWYZoMbzKY/SUnTi2JbpUnGM+yBopL0toANhMe
	 O0q9kurhnT4JodJfXVbwmUJweoUsMvHyIqDUsc0yrobb21PyzTs0HkFj0E1eYvffn+krG
	 w0x8/Vn4EySBmXdvi88ktkefflnoccKcpxOZhZMi+iPB3ZkwKNHvQkqOarqq74JIy7y3N
	 gXOHUl6ywHg7CHaRjXH8XTehSH+zh+x8KEU2tR96UOjikc4OFJqUcrrHaD8fLx4RsS9bH
	 qPY3W773dzeama0KNcpucGlLJNUkhiWekH6H2MGZYn4PCClLa7W0OG5wJ/mLNFg6s5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443067;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k0i/N1b5yWNh2DrHfWtbHgv/fVPwrlaI2gnbJ6ty73w=;
	b=pD2PpqnMCVo5utaNGXfdxY+aVlBzBGDuDQBdugTNWjxv/+NPdQszzS+f+dRoxiYi4tUA
	 5VT9+p/rFASVeyYuW0N9FbKcis6Dl3sRBpOVNhpS68MTu/Y0b+8D1ymoZDPyp70c3Ul1F
	 U4nH8OaKa3mrLLZh9tT/TPZJT1GZUMMenJEAILTDAC1j1n4XW/trADtdLIrtswxQXxtAA
	 uZVMm16SVVjGZtBFyUUd399XBAlpRGzLokVWLG6tMiTbFV1ZJwjZej8r29qKJl/o7M1ZP
	 PhsDI4O0wwzA4zR9KAPqr4qJxRlT0G+Qeec9HNoK1WRC1Zi08ivX9tnscsWqnl1pjrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KhmjTbJi;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E39C606A332
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E39C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KhmjTbJi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443067; x=1823979067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xsbwNdGGLJOC/4bW7nqSY811th/00q9A8AGx07zDNwk=;
  b=KhmjTbJi10+P7m7viwUHj0SFCcENABVoA8GOfpeHUciKoKbtVjGrg5dQ
   FF+bpyd1mQ8qh3Off8BqBT1CSXDnPX6p9LEbIZxTrqbcjUEEaW+r2hsG0
   SRQknEn+TbXmEKoiGJo0PDVRnvAVtSGUu7Z2fM3fAOpMSwY9U4o9XmPJa
   0Rp+SWf4JmujHeGKReMR+S7dqQJGVn9c0qx9iC+eDBoYQzldyMDZ9S/IO
   RMKi8rwf8j1ZzYFMoKvAFPQjphEctmnzlrKzUzIX1Zq28TQWkXtxwYF8E
   YP4KmoE+ICPbgZa6KSsFORPM2sifKo7P/hn0Qb21UNi8+FOhjm+r//qp6
   w==;
X-CSE-ConnectionGUID: i57SsmZxTUCl5f16WWHtWw==
X-CSE-MsgGUID: cfSreivsR1WDT6glPpSzqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131256"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
X-CSE-ConnectionGUID: Js7ajy48RSW4+vvWNL3+WQ==
X-CSE-MsgGUID: CkT+Jh2ARPG0Nemy2BI1kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008671"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
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
Subject: [PATCH v14 16/24] platform/x86/intel/pmt: Register enumeration functions with resctrl
Date: Mon, 19 Oct 2026 13:50:23 -0700
Message-ID: <20261019205031.16977-17-tony.luck@intel.com>
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

resctrl enumerates Application Energy Telemetry (AET) features by calling
pmt_telemetry functions directly, which requires pmt_telemetry to be built
in. resctrl now provides functions with which pmt_telemetry can register
those enumeration functions instead.

Register the enumeration functions with resctrl when pmt_telemetry is
loaded, in preparation for resctrl calling them through the registration
and for pmt_telemetry being built as a module.

Register only after the driver has probed all telemetry devices so that resctrl
does not enumerate a partial set. Force synchronous probing to avoid issues
if kernel command line or module parameter requests asynchronous operation.

Unregister the enumeration functions before tearing down the telemetry
devices on unload, so that resctrl cannot start enumeration while they are
being removed.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	New commit message.
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
2.56.0

