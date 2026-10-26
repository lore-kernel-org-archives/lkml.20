Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051852;
	b=2OZP8hac+mIQAA/v54rUfrRVy9J7lSU5py3pdyziE2ix9ATNpUX1uHRTcfk8on7DF4vn
	 dyO2YhJYu3u+DDJzDoly0KHmgxNQ7LYoOfVIItjO2BtTaXMOFGqeqoHUGbwAD00BiYLt+
	 qirm8uWZqWSaX6+n6065mcBiqeqxnhNH1PQVoU1K1shI1zhnodbkXw0cCaz75spuLTQsS
	 rEuOvGtZF2wdpGVMGOwcVz+39EthhbfjXO2UN/gHzyyReMQpQ8jcb4JyPXW7+0V98Iis/
	 UsT7S7bJfVbACGdI4p61KeaxCHKeEslXLzOaRPDXrrHjQZU6+s1DmERDY1HZ1VNigIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051852;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5mry8NX7IU25Mv4VbIVDhN3Ltk2Ra2LbLU8Ssj2ZWI=;
	b=MtXqbxdVbAsIOYty1TK50Wv66akuRFchAkoXIAoJ9tLxJ+ba5dq35JUurgFIxEe+Frh6
	 z1IyzJYfsbmr/XNOLekOmi1qI/UMgiD3nl3ZSn9Yfr+ccEOcltZ2V9Aq+YVwPOPbmtLox
	 bBQrNl4kIiaQ+s/y/HNFnJVz0BmYCCxS/CLXi4axBeYYnbZvlOYQVPzCEYQa0OCZ0vg95
	 fdJ4mOHQkaIruZhzfGsNOYjg9wJLZGLaBluPUKs43Ut/MvZUP3ZBIhj8yRBWPjpg0DTz1
	 jlOnoHt5U4ZCSjgVqKXhGrIYm0T+iUI1tl7YSX3QKCRqeCEJempt3wJljW2k/3m577Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hDZZQli3;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC8D606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BC8D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hDZZQli3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793051852; x=1824587852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vIU/9TBpx3zGWSy8HO2xYesQ/tYEPGpo/eHn0hKcOcA=;
  b=hDZZQli3HYMnzDIoISIxko9IGpzJQGKVZXbrDtvHhn+3d3XQnakLjq9K
   4LSpIFya4w+xx/2VFlcNyb4+YEnHfl/+pKJ9KhBGGsR6OycNNrECvO3XK
   VS0MRtWHqQt3rdwIQ0Wa+I6QxZGPXMUHkFucNiCsB8WQUCchgjwKNs5aE
   BARjXNSZ5MdYUIBrTtiL+kRhRPJmU1KdknzhNoPVEGv6vGsURiNyDxTyO
   mx917/RLY0+G01gZdchFFmwtuRTZhU8BKDMOv+CY3JscoQU/EU3kuLQ2m
   JsvmfZJDtBNugV2JsI+YHnvqR66z1NVNDoKqFEUux0f0ekw1SHcBvC16B
   w==;
X-CSE-ConnectionGUID: vOcdQYxMQ5yVGPt5BWYkww==
X-CSE-MsgGUID: LZYrLXBhRdmqoaaCxbXNpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1766399"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1766399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:28 -0700
X-CSE-ConnectionGUID: xBAUE/VKQwO/fVgAfek7AA==
X-CSE-MsgGUID: yVDShx/BSH+V7b6GUWPKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4240269"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.221.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:27 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [RFC PATCH 4/8] x86/resctrl: Add X86_FEATURE bits for asymmetric L2
Date: Mon, 26 Oct 2026 14:57:14 -0700
Message-ID: <20261026215718.16810-5-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026215718.16810-1-tony.luck@intel.com>
References: <20261026215718.16810-1-tony.luck@intel.com>
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

CPUID(0x7,0x1).ECX[1] enumerates that a CPU may have some asymmetric
allocation features. These are enumerated in CPUID leaf 0x28 in a
parallel manner to CPUID leaf 0x10.

Create new #defines, add dependencies, and initialize from CPUID.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/include/asm/cpufeatures.h | 3 +++
 arch/x86/kernel/cpu/cpuid-deps.c   | 2 ++
 arch/x86/kernel/cpu/scattered.c    | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index f70ee74b5f92..8a800964c100 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -430,6 +430,9 @@
 #define X86_FEATURE_SUCCOR		(17*32+ 1) /* "succor" Uncorrectable error containment and recovery */
 #define X86_FEATURE_CPPC_PERF_PRIO	(17*32+ 2) /* CPPC Floor Perf support */
 #define X86_FEATURE_SMCA		(17*32+ 3) /* "smca" Scalable MCA */
+#define X86_FEATURE_RDT_A_ASYM		(17*32+ 4) /* Asymmetric allocation features */
+#define X86_FEATURE_ASYM_CAT_L2		(17*32+ 5) /* Asymmetric Cache Allocation Technology L2 */
+#define X86_FEATURE_ASYM_CDP_L2		(17*32+ 6) /* Asymmetric Code and Data Prioritization L2 */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EDX), word 18 */
 #define X86_FEATURE_AVX512_4VNNIW	(18*32+ 2) /* "avx512_4vnniw" AVX-512 Neural Network Instructions */
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 99801e844b30..b5d44cf12df6 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -73,6 +73,8 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
 	{ X86_FEATURE_SDCIAE,			X86_FEATURE_CAT_L3    },
+	{ X86_FEATURE_ASYM_CAT_L2,		X86_FEATURE_RDT_A_ASYM },
+	{ X86_FEATURE_ASYM_CDP_L2,		X86_FEATURE_RDT_A_ASYM },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 8665a6474806..02e405a95dbd 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -28,6 +28,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_APERFMPERF,		CPUID_ECX,  0, 0x00000006, 0 },
 	{ X86_FEATURE_EPB,			CPUID_ECX,  3, 0x00000006, 0 },
 	{ X86_FEATURE_INTEL_PPIN,		CPUID_EBX,  0, 0x00000007, 1 },
+	{ X86_FEATURE_RDT_A_ASYM,		CPUID_ECX,  1, 0x00000007, 1 },
 	{ X86_FEATURE_MSR_IMM,			CPUID_ECX,  5, 0x00000007, 1 },
 	{ X86_FEATURE_APX,			CPUID_EDX, 21, 0x00000007, 1 },
 	{ X86_FEATURE_RRSBA_CTRL,		CPUID_EDX,  2, 0x00000007, 2 },
@@ -46,6 +47,8 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_SGX2,			CPUID_EAX,  1, 0x00000012, 0 },
 	{ X86_FEATURE_SGX_EUPDATESVN,		CPUID_EAX, 10, 0x00000012, 0 },
 	{ X86_FEATURE_SGX_EDECCSSA,		CPUID_EAX, 11, 0x00000012, 0 },
+	{ X86_FEATURE_ASYM_CAT_L2,		CPUID_EBX,  2, 0x00000028, 0 },
+	{ X86_FEATURE_ASYM_CDP_L2,		CPUID_ECX,  2, 0x00000028, 2 },
 	{ X86_FEATURE_OVERFLOW_RECOV,		CPUID_EBX,  0, 0x80000007, 0 },
 	{ X86_FEATURE_SUCCOR,			CPUID_EBX,  1, 0x80000007, 0 },
 	{ X86_FEATURE_SMCA,			CPUID_EBX,  3, 0x80000007, 0 },
-- 
2.56.0

