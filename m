Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2A23ABBF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947333; cv=none; b=gi2pmuNoDv3LqrUolw5L+goG9uCVTw53/6XeyJD1kL2KR0NfCW/3WXxcfHv4nCGi/wgmvBVDQBCTRvrxrNGL93HDlxNTqNuHLAYASQ22A3Wx0L5rSdVKbCOKAWHufw3orcVMSdliVYCnorx/vx40b6cAd4JH6IwIDmQbpoOCAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947333; c=relaxed/simple;
	bh=wNuc0/B10XEqQY8495S4q6n50UFD9neJbZTVxue0XTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H3v9bLtPj8QNheJ3rGbuacmYpwvuENluuSk9Dkhz4eON3b4feO6H7NqJZvmyoocdMsYwk9jOifP3lqOyHMVoihNUt4KXObt8ackLIq2UMEirP6t0ZzUH5+YWPTORH5qzuWMh4Rfj7gFf6VZKGMibTOH3XGiKR4NaozescFuL+I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fs6lnAj8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fs6lnAj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947332; x=1823483332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wNuc0/B10XEqQY8495S4q6n50UFD9neJbZTVxue0XTM=;
  b=fs6lnAj8fCTR67WfU8zKBv2JdpjFdQBgsrbPx2vMHtIyoeXuO/qcPNzp
   DkaLyVnRlggL/bX3hgyX84Vc6Yw7p9RCDH9Zwny00nO/LgfGmm5I6atvb
   APEjCn2oVwIXUGLPdD8v5mqeNGosR7/BFht+sXpX7G9yB1U43vxe8vX9p
   ut8wfFnTnyaUDNNrJ6Uww5rzBRYoE5ij2n1VPIYj5xxSkvZdSWQSLaMJc
   f2Ym6tho3riC/uHmuhMOERm002aawG0oIEthQ06f2s8InIJ1v8tl+iSKb
   4saYVekhOFe3m2MpRt/i2H97gbftulnV/T5EfK84quQkrLZ6fNqk8TkBY
   g==;
X-CSE-ConnectionGUID: mXY5jMU/RzqEEjZkT9EXbQ==
X-CSE-MsgGUID: UKELTjIQSKGj3KBLkPfmZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="589168"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="589168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:08:51 -0700
X-CSE-ConnectionGUID: ibsjrjX7Q0mvoN5DIjEafw==
X-CSE-MsgGUID: OH7W00PyQi+zQ/16rqLuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1414362"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 20:08:48 -0700
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
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v9 02/12] x86/resctrl: Require 64-bit x86 for resctrl support
Date: Wed, 14 Oct 2026 10:58:23 +0800
Message-Id: <2d718521cb64f27bb14a377da41121f890f77d43.1791933001.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791933001.git.yu.c.chen@intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Luck <tony.luck@intel.com>

Intel Application Energy Telemetry (AET) provides event counts in 64-bit
registers in MMIO space. For accurate results these should be read with a
single 64-bit load operation from the CPU.

In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.

This is in line with Dave Hansen's proposal[1] for an addition to Linux
documentation that details reduced 32-bit x86 support.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
---
Changes since v8:
- Pick up the latest version of this patch from the AET series so that
  both series carry identical versions. Changelog wording only, no code
  change. (Reinette Chatre)

 arch/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..06b5d0c4633e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -518,7 +518,7 @@ config X86_MPPARSE
 
 config X86_CPU_RESCTRL
 	bool "x86 CPU resource control support"
-	depends on X86 && (CPU_SUP_INTEL || CPU_SUP_AMD)
+	depends on X86_64 && (CPU_SUP_INTEL || CPU_SUP_AMD)
 	depends on MISC_FILESYSTEMS
 	select ARCH_HAS_CPU_RESCTRL
 	select RESCTRL_FS
@@ -541,7 +541,7 @@ config X86_CPU_RESCTRL
 
 config X86_CPU_RESCTRL_INTEL_AET
 	bool "Intel Application Energy Telemetry"
-	depends on X86_64 && X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
+	depends on X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
 	help
 	  Enable per-RMID telemetry events in resctrl.
 
-- 
2.43.0

