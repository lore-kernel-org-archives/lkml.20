Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849218;
	b=ycefAC8qmldOgPyJMSl6GboxKqmG1QqEJSXBUeH4y8pzXTRvsQjoPF6MHLWeDJs9IsVj
	 gddybElmFBtOftE2SVxqOnSTnilE078v2ymvMPS2f0yvv17Ji4JCiqA7lXX+bBwFegvgm
	 HH1xHUyfxj4vnv9rwWTrk9rXkadALf4z604BuCjG7AtElXEDdQwIw9VNpMrcTYxSFW5TY
	 GapJCa7TicfVUErVqMOKyOaUfH+RvxBySFTPPm+bd3JLbRKF5++Ni4x9Et12Le1eczUv8
	 einesDtv5/Wa6K43raboZ8vyQScAmT4lu/RI4qss0rYxToc2TtdxUs5xsl7XgP4oKgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8V7xGG+Bn7PqdQRemGnzAoiBfi4wW+bmmTR0g/VwBBs=;
	b=haCtqpC8dBlYzVVTI5V4yB/wolzY480I1BIqiHDVlk/B6AhNT6a+F1YuPFR7s633jmD4
	 ybCLBUGJUMB0d+3w1XzUl26jwdA7GdEjr+Z+JIQILkdhqJAvrN65/ZuFYmDjhQCBGY45w
	 fmfW0walHvc9rqg/t3AULuNr1Vs0NaSocAGScuH8lZJxEM7b1yXBCoFbk/+sy7QkG6FoG
	 ag0icSC3cvMQph+VSCFdp32b48pAriCMW+rxCYj+yKClMHS7gjX8Y1FwfPNvIB9ak4b3n
	 4bj09chUyRDwIKDgeVFVMYl5pD6Lgi72dzlDQJBS6GOuCQruLDtiLGJZHa7DnXAuU9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zkvghjjw;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D24606A886
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D24606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zkvghjjw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794849215; x=1826385215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jBaDQGwZ/o1SJ8CHIuHIDvtYG2R1tEa/VSAn/Y+GrFA=;
  b=ZkvghjjwVd/ITjgJJDXo8ilCTEzL8KyQ/i695Q58cdWCInC9wmkAARYZ
   E2R2GFIjQk3RpUINRs7eNGe7MgcQ0IrfGUyLmYItTlfUQyw5K+8N0QKkL
   SlJSTNWvMsGurhoGu+CGmuTTkTGRBlgK3Tt6LL+sz3D+UbPsVKqts2q6Z
   DorOjiqpqbN/6jUhR9/7RZcwa2NfbAfi8PALdIdwl/u3wYmL7NUDquJxm
   6bg72RNm1t94ba9S7O3hNNrrW2raDXGCFlqaKZRKJQTc+dV3utxC72Mnp
   RMQ4L6ylfwta/DOkWDVHcF4qk0B1ZhFsD4CiEj/XtPUv1oF0hjb+LaOKl
   Q==;
X-CSE-ConnectionGUID: 0E+Ol6qMTi6EX8E8JXjIcg==
X-CSE-MsgGUID: ZTCLNQd4S/6kGzFQjpwQEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627257"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627257"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:13:29 -0800
X-CSE-ConnectionGUID: YnaNbKdMScq6Iw7Mg3/hWw==
X-CSE-MsgGUID: KWUIISkkRzeMmrTd/OPbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9491537"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 09:13:29 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	andrew.cooper3@citrix.com,
	arjan.van.de.ven@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v2 5/7] x86/microcode/intel: Select the lowest revision for incremental loading
Date: Mon, 16 Nov 2026 16:45:46 +0000
Message-ID: <20261116164548.900486-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116164548.900486-1-chang.seok.bae@intel.com>
References: <20261116164548.900486-1-chang.seok.bae@intel.com>
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

The incremental loading logic in the core can repeatedly request a
microcode patch. The vendor parser currently selects the highest loadable
revision, which means no further patch can be selected after the first
update.

To load a concatenated multi-blob image incrementally, adjust the blob
parser to select the lowest loadable revision. This allows patches to be
applied in ascending revision order.

The legacy selection logic stays the same if incremental-loading isn't
configured.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V1 -> V2: Simplify the code a bit and massage code comment
---
 arch/x86/kernel/cpu/microcode/core.c     |  2 +-
 arch/x86/kernel/cpu/microcode/intel.c    | 25 +++++++++++++++++++++---
 arch/x86/kernel/cpu/microcode/internal.h |  1 +
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index a5f6949e0d53..5c4922031d91 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -47,7 +47,7 @@ static struct microcode_ops *microcode_ops;
 static bool dis_ucode_ldr;
 
 bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
-static bool incremental_loading = IS_ENABLED(CONFIG_MICROCODE_LATE_INCREMENTAL_LOADING);
+bool incremental_loading = IS_ENABLED(CONFIG_MICROCODE_LATE_INCREMENTAL_LOADING);
 
 /*
  * Those below should be behind CONFIG_MICROCODE_DBG ifdeffery but in
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 9f09d388ed20..74c2d014efa0 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -851,14 +851,32 @@ static bool ucode_validate_minrev(struct microcode_header_intel *mc_header)
 	return true;
 }
 
+static bool is_revision_candidate(unsigned int cur_rev, unsigned int rev)
+{
+	/*
+	 * A revision must be newer than the active microcode revision to be
+	 * loadable.
+	 */
+	if (rev <= boot_cpu_data.microcode)
+		return false;
+
+	return incremental_loading ? rev < cur_rev : rev > cur_rev;
+}
+
 static enum ucode_state parse_microcode_blobs(int cpu, struct iov_iter *iter)
 {
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
+	unsigned int cur_rev, curr_mc_size = 0;
 	bool is_safe, new_is_safe = false;
-	int cur_rev = uci->cpu_sig.rev;
-	unsigned int curr_mc_size = 0;
 	u8 *new_mc = NULL, *mc = NULL;
 
+	/*
+	 * Start from the boundary value for the revision search. With
+	 * incremental loading, the search walks downward, while the legacy
+	 * search walks upward.
+	 */
+	cur_rev = incremental_loading ? UINT_MAX : 0;
+
 	while (iov_iter_count(iter)) {
 		struct microcode_header_intel mc_header;
 		unsigned int mc_size, data_size;
@@ -895,7 +913,7 @@ static enum ucode_state parse_microcode_blobs(int cpu, struct iov_iter *iter)
 		    intel_microcode_sanity_check(mc, true, MC_HEADER_TYPE_MICROCODE) < 0)
 			goto fail;
 
-		if (cur_rev >= mc_header.rev)
+		if (!is_revision_candidate(cur_rev, mc_header.rev))
 			continue;
 
 		if (!intel_find_matching_signature(mc, &uci->cpu_sig))
@@ -999,6 +1017,7 @@ static struct microcode_ops microcode_intel_ops = {
 	.finalize_late_load	= finalize_late_load,
 	.stage_microcode	= stage_microcode,
 	.use_nmi		= IS_ENABLED(CONFIG_X86_64),
+	.support_incremental	= true,
 };
 
 static __init void calc_llc_size_per_core(struct cpuinfo_x86 *c)
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index ebf079e60c33..246aac4a11bc 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -101,6 +101,7 @@ static inline unsigned int x86_cpuid_family(void)
 }
 
 extern bool force_minrev;
+extern bool incremental_loading;
 
 #ifdef CONFIG_CPU_SUP_AMD
 void load_ucode_amd_bsp(struct early_load_data *ed, unsigned int family);
-- 
2.53.0

