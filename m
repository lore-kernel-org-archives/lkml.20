Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92693C0601
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100511; cv=none; b=HLlQUC7RIEjCp8LGiAFIUHDzcdxuBARe+NYVL2IFWWtqZnfQ25Xk3IVX35slscrkQJadKWdjsiEzarBntJULMyrAHomg4z5mmc2YwqeEXVfUyCBMbpVhUUDSEaBuydQCwgktEvwHAym1AEmQ43CTunq9iEkgdmTSoBixSBxWrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100511; c=relaxed/simple;
	bh=mCECG8PpkvewG9d2stdcrYqQpZuhDGTPdn/v2x5elHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0VAki8YQEtAMC88IbzaErDFOOBFABeUWTniZtiW6UjnMeLfFNHB0PHG0zbHCddVnZuDiDTj6zJCPDB4hGN/LVJCw/CdUfzvw9e+1EkRGYHGtI2TQAuWsBxGLUNdx7CUkiSTD9lcQddidnTvdkpxD1BkkuU7aLXTC6s0WYhC3sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbxDHrLA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbxDHrLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100510; x=1823636510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mCECG8PpkvewG9d2stdcrYqQpZuhDGTPdn/v2x5elHI=;
  b=KbxDHrLARtA/ydV5Vo9Q6MvoGrBScbioCuT4aFAq9+OJXH/vxkaek3L+
   VBVFj4fQQ6WyFxG+NKIDSVuDoeFm546G+SvzD80qviX7HcQ06UH/4jZWu
   iB37uGGWTpIjLhfI1I47Cfp7Dm1zOCiFjEFPn94coxi5Ekf6fdm462scS
   K6O/vpCT+xyaFqkFIfGqnFFb7AfS0qfjXgVKm1d3J0OEhfxHcUfMA8sRr
   vAV2vXq2qtHiAMNmH5/7750pZNvtql7z0Zo0USX2V5PyDmnqKk/QT6OeF
   O/OimTxHrBSRi/bWeuEXv0hSbt366GfZbFajs0wFu08Li77dW7iW3oHzn
   w==;
X-CSE-ConnectionGUID: /6E8k0z4QcWkV0gdKQGCEQ==
X-CSE-MsgGUID: qGsDU9lFRUGhs9F+au6j6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902177"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902177"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:44 -0700
X-CSE-ConnectionGUID: L2per+6zQMWWUQf1evNAEA==
X-CSE-MsgGUID: 9dxvtxzUR3SLWlNbi0h0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104420"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:44 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 8/9] x86/nmi: Simplify offline microcode handler invocation
Date: Thu, 15 Oct 2026 21:14:25 +0000
Message-ID: <20261015211426.49114-9-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015211426.49114-1-chang.seok.bae@intel.com>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode loader now uses the stop-machine facility for NMI-based
loading. The offline handler is the only remaining user of the microcode
NMI static key.

But the handler already has internal guarding. Offline CPU doesn't matter
how fast it handles anyway, so remove the static key. Instead, check the
build option.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/nmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 066ac297873e..0227387fff54 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -548,7 +548,7 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 		raw_atomic_long_inc(&nsp->idt_calls);
 
 	if (arch_cpu_is_offline(smp_processor_id())) {
-		if (microcode_nmi_handler_enabled())
+		if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
 			microcode_offline_nmi_handler();
 		return;
 	}
@@ -710,7 +710,7 @@ DEFINE_FREDENTRY_NMI(exc_nmi)
 	irqentry_state_t irq_state;
 
 	if (arch_cpu_is_offline(smp_processor_id())) {
-		if (microcode_nmi_handler_enabled())
+		if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
 			microcode_offline_nmi_handler();
 		return;
 	}
-- 
2.53.0

