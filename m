Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849226;
	b=bP6hVf6/v7b3PCx34LHDtyM7AmjbP1Tqm0oxnvdltnfDd0Ki3gFcyJtMbeAK3H1d3Z92
	 3b34QSYlbbPpf9ILbMZY7dOn2GnJuJBDRPAc8LwaNhCPWmsxf4sHpa4CR0vjOFHcbhyBe
	 rEa4srRsCJGQVFppHUJEKezf0qyCJS/NRXcHzP7cRYIFrBDYKgtzd0sqkI0TPHzc6Ihr6
	 V2df8btdGWl+xo61mubE5CK7+gPO9us/Vv1+L29FR5j/z6BY4DM5f+lbX3e77iieg89Y7
	 I7p/HXemaKW3Xsx5k6o9V8hf38oDdBlspA9/b21xyLJ4wABKZ8MNJAjiF/v4N1ysHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849226;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7aaB/jMa3D8DcbZfuR4IAiTRSP5fVd1+0sT7tArNIXM=;
	b=d4Sms1t45Dj2ibipaBLBLmrljNO5rdtJhHW8DKSi4fKwzkZGNbz/URVeywhg6S29Hn7u
	 pkiBptOV+47i38fDJvFY36Ukoc6Gzt6gzm2V+shXUgTUnn+NqOfYaPOvhDaZkBelJJi7X
	 9rAfKyFtHC/FxYSLRd+mmErlCsy4YC4MHtyjI6K0v65NFKaVEIegYZOHvoF8VdAwQqUmX
	 +yEXSJWzzyPhkPCGUOaTMXMfjn1Dmnv4N6otBjLUNRsX7wFaTbk9KtHR5l/mY34/at4Wg
	 Aa7tql3s3Jm8YQv/2Pe+qNL0KB1Ca+Pf8pBy4b3+UYe6P0O8S7d435yNJS41goxEX/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzOQBRPS;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0FE606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0FE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzOQBRPS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794849218; x=1826385218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JotyqeGqx9JQmdAaYOs7wuxUiDk/sHKi6wAJt7G2VRo=;
  b=jzOQBRPSAgl5i+a9eKH8SvKD4nUAjJ9970rPwI4wrcT4X431hE2QYB9j
   cWN97P81ki7w09Whapbdkk6Z85+TGMyKqNqKm9j3bjStXLZoTnMQpDjJb
   LBaZx0aEUOI4wlRmHfsr07SqBcJW1wyM5+7a3iWm/xU+bBspDMWpz74OO
   4K7+zGQ0534b5iwCWa8Cu71lHxms7a9wcAHfZvd9d3MWJzPcfc47R8lqw
   Nx8BVkIjd4860fdqy3qzEf6v1pu8mgO1z9toSikPbZjbnC2eD1pHE25zY
   NNKglG9eWKt9W8wN8LQgRz+dgsq1h5zqmcvBEpfCVVBtLFyRaqfWNwcrp
   A==;
X-CSE-ConnectionGUID: dyddyQDmS7GSehpDeP+nug==
X-CSE-MsgGUID: GIM3/driQ2CIsVGFFI1cIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627280"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:13:32 -0800
X-CSE-ConnectionGUID: bDGVzGPoQvC522r3eYFBnA==
X-CSE-MsgGUID: GwuF0G5vRKepd4jcCqaqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9491550"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 09:13:31 -0800
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
Subject: [PATCH RFC v2 6/7] x86/microcode: Decouple minimum revision check from late loading
Date: Mon, 16 Nov 2026 16:45:47 +0000
Message-ID: <20261116164548.900486-7-chang.seok.bae@intel.com>
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

The microcode minimum revision check was originally introduced to express
dependencies involving OS-visible changes, thus it has been limited to
the late-load path.

In fact this can serve as a general guard against unsafe microcode
loading. Make the check independent of the loading path in preparation
for applying it to the early path as well.

For early-loading, establish a tracker to check whether an update
satisfies the minimum revision requirement and taint the kernel if not.

Right now, no vendor code implements the check, so every early load
taints the kernel.

Then, adjust the failure messages to suggest incremental updates, rather
than early-loading, as a solution to address revision dependencies.

Keep the existing force_minrev semantics unchanged; it continues to apply
only to late-loading.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V1 -> V2:
 * Do not apply force_minrev to early loading; keep the current semantics
 * Move after incremental-loading support
 * Massage changelog
---
 arch/x86/kernel/cpu/microcode/core.c     | 13 ++++++++++---
 arch/x86/kernel/cpu/microcode/intel.c    |  7 +++----
 arch/x86/kernel/cpu/microcode/internal.h |  1 +
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 5c4922031d91..b784d7df9906 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -609,8 +609,8 @@ static int load_late_stop_cpus(bool is_safe)
 	struct cpuinfo_x86 prev_info;
 
 	if (!is_safe) {
-		pr_err("Late microcode loading without minimal revision check.\n");
-		pr_err("You should switch to early loading, if possible.\n");
+		pr_err("Late microcode loading without minimum revision check.\n");
+		pr_err("You should update microcode incrementally.\n");
 	}
 
 	/*
@@ -959,9 +959,16 @@ static int __init microcode_init(void)
 
 	pr_info_once("Current revision: 0x%08x\n", (early_data.new_rev ?: early_data.old_rev));
 
-	if (early_data.new_rev)
+	if (early_data.new_rev) {
 		pr_info_once("Updated early from: 0x%08x\n", early_data.old_rev);
 
+		if (!early_data.is_safe) {
+			pr_err("Early microcode loading without minimum revision check.\n");
+			pr_err("You should update microcode incrementally.\n");
+			add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+		}
+	}
+
 	if (incremental_loading && !microcode_ops->support_incremental) {
 		pr_warn("Incremental late loading not supported, disabling\n");
 		incremental_loading = false;
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 74c2d014efa0..eec8a45b283c 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -830,9 +830,8 @@ static bool ucode_validate_minrev(struct microcode_header_intel *mc_header)
 	int cur_rev = boot_cpu_data.microcode;
 
 	/*
-	 * When late-loading, ensure the header declares a minimum revision
-	 * required to perform a late-load. The previously reserved field
-	 * is 0 in older microcode blobs.
+	 * Ensure the header declares a minimum revision required to perform a
+	 * load. The previously reserved field is 0 in older microcode blobs.
 	 */
 	if (!mc_header->min_req_ver) {
 		pr_info("Unsafe microcode update: Microcode header does not specify a required min version\n");
@@ -845,7 +844,7 @@ static bool ucode_validate_minrev(struct microcode_header_intel *mc_header)
 	 */
 	if (cur_rev < mc_header->min_req_ver) {
 		pr_info("Unsafe microcode update: Current revision 0x%x too old\n", cur_rev);
-		pr_info("Current should be at 0x%x or higher. Use early loading instead\n", mc_header->min_req_ver);
+		pr_info("Current should be at 0x%x or higher. Update incrementally.\n", mc_header->min_req_ver);
 		return false;
 	}
 	return true;
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index 246aac4a11bc..e60febbdf964 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -43,6 +43,7 @@ struct microcode_ops {
 struct early_load_data {
 	u32 old_rev;
 	u32 new_rev;
+	bool is_safe;
 };
 
 extern struct early_load_data early_data;
-- 
2.53.0

