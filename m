Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443051;
	b=Qt8+0Fkiv5cBZbesh15khL9JhsyrVF+D7fpCx7F6SP93lajDHMmvlC9+4kyp7oOt5UBF
	 VR7IBFHeQhNaUzZNCWiuVR+R5vSrHW3YrnabNZgl+c0zaJUach5trLBsIzi6boLILNJUj
	 /om9SIYWXOECFu5SMRrLNZh8C6P61wO2OH8aRhn4yTKkbsekMYR60L+qWbCowrUS9v0IW
	 WHSnG3lvVlWde7xJQvIgAgxaJc1YB3NiVu5DtGtH34GO5OfyK+ptLSBYpkSaY9y07w339
	 XwTgFHUoAIrKVazZBBpKr5EuB+eaG5pvJQSrVzlHI469bUBOuE7Thy0HNOKtBfSkk9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443051;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1J9iWEiWrczQjQEcwygdXwhh7vEmUIm0JvPmuADK3YA=;
	b=QsZ0YNFrQSeeKwvv1NiH9id39q/UvzBtJbXx8qXqZmb5hugDHFSH23gKeBZnc46Z7VQo
	 pZ3gyPmu0BqTASVefNZeOAlaauQ434yJr8HC2oj+ykeRzLGZoqwegMKyViUJvA9WCYFEG
	 7KVYejaDSfKNButDRfmpjFAnw34YgTpDPNv8ZoQcYwfeajQP8VmXKqCSeIvuqSpYLiG13
	 Ra3UmIesSuJ1Py2NiCfshn9Ixm0qq/UFcObGW1Uzna3Efh6tbYGMPaR5yA2sB/1sT7a9k
	 EJd7pwFkDZ/lXqguReX1daisnd6Jw96894UM0w1HxBjMEVdbofMiNqTMZ03ZoEoWjvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BuNJL/u7";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BD606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D67BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BuNJL/u7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443050; x=1823979050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvQw1TBwx+lcj7j4plt/DGhgvioHWP/u7kCLDb9TMfw=;
  b=BuNJL/u7Ts7Pmj2X3JtRtlg9GaEakfFIDPqZVFQU8MlJix0vf+HWIg3O
   nP7ArkxpFA2UnkaafMIm4ms+cvd7JR+VPD6dbvndeGQkJ2esuBS2fCeId
   tauzj3rMKJCNwVGyBIRT85cwM8dhUw5DPObOD1P6eooTO8bzf4gs3DpzW
   VFqlJ6frLT/zqWli8QBqUzHwNH5jrNG/fVN3GzFPbY2KdTtHZp86VH+qJ
   GJyJvHEJ0hG7a5ut0MQYqzmTDYYYwCa+MhaWbyCsBYIu52AInF8JzdAN3
   wn0Jp3teJ93NcvNqHhsFBthroBsbhKmyaGSwE6NFDfiP71oOZUjwbCDel
   g==;
X-CSE-ConnectionGUID: 7s8FNGrnQHmna3BbXGjR7g==
X-CSE-MsgGUID: CIxa4lQKTWCej1pjW1RTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131114"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:48 -0700
X-CSE-ConnectionGUID: Dh2YADknSkGSGlRDeJe9pA==
X-CSE-MsgGUID: bhoKMHpWQqeJmpnumOQxIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008617"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:48 -0700
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
Subject: [PATCH v14 01/24] x86/cpufeatures: Add missing CQM feature dependency
Date: Mon, 19 Oct 2026 13:50:08 -0700
Message-ID: <20261019205031.16977-2-tony.luck@intel.com>
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

The L3 monitoring features are enumerated from CPUID leaf 0xF. Both the Intel
Software Developer's Manual, and the AMD64 Architecture Programmer's Manual,
say that software must check that CPUID(0x7,0x0).EBX[12] (X86_FEATURE_CQM)
is set before checking for monitoring features in CPUID leaf 0xF.

The CPU feature dependency table does not record this requirement.

Add the missing dependency of X86_FEATURE_CQM_LLC on X86_FEATURE_CQM.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v14:
	Add AMD64 manual
	s/Linux X86_FEATURE_CQM/X86_FEATURE_CQM/
	Complete the trio of context, problem, solution paragraphs
	by adding the problem statement.
---
 arch/x86/kernel/cpu/cpuid-deps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 99801e844b30..93d45b688f6c 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -67,6 +67,7 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_AVX512_4FMAPS,		X86_FEATURE_AVX512F   },
 	{ X86_FEATURE_AVX512_VPOPCNTDQ,		X86_FEATURE_AVX512F   },
 	{ X86_FEATURE_AVX512_VP2INTERSECT,	X86_FEATURE_AVX512VL  },
+	{ X86_FEATURE_CQM_LLC,			X86_FEATURE_CQM       },
 	{ X86_FEATURE_CQM_OCCUP_LLC,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_CQM_MBM_TOTAL,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
-- 
2.56.0

