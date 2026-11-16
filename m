Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849220;
	b=S2jmg/eV8VOAHjlr4Mzzd3ShqqiipNo6dtnrLS1KVxw9gYpZFnXdwwKTQKbvizv675Xh
	 1h/ifTmYxp4EmqNrwrD6zuKzlZQd7HhXEWFWepN3SxrN+iMyXAVqWyUISavwmCQxQbN/X
	 SZ/tfeOokW3wQoXQQKAcLb6W/ZeXQfNdjSfi9LDk0jFyYz04iOTC7OOOXGG3uRRMi6iwa
	 Tdt0n+qRkyZP7Wm5yMHFWSPnRoggGTlhclcnRw9XyZIvLfDrzNrgldyHlaUT2QEX3Khy2
	 tP4DU2UF9j9nSDC9afduCh5CjWURYkdOVzzGqreV6zaUa/Qr69BT6fZSXoa2DWYAtvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849220;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7QvFe1k+A6nsfZsq1Q6PPcYpuyzLtM1WSWpelZzbAo8=;
	b=GubJLWbUBZyYEYCshPt6cRHuMmsiwadjFUslUWyzJibM1c0ID6kLSFfQpiuOF1C1LWu6
	 mgoZSogxeqslof45LT2LzT6V+lUeOa40v4t0kyvYulPcTEC21jbbcBdLExNdMXGtik5Vy
	 dETU75z5er8aHshByRuznJRbKWlEJRZAk2FHVls5xwqJGF6dFrqXkb0Xmtyp+fckJ2WwE
	 fu40lvcec6M0VPgdQhvEpwY7rQ0zY55lOx4RF24vEnlxx9B8y9pQA9B/BRsFOkuFkdaot
	 WFKrERoG7iW0MWcUOxBSD03xfZyNMTxilELFqm5xvafWFBC67etIgrr5uhOx4dOfAhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mwci30RP;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BA3606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BA3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mwci30RP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794849221; x=1826385221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=McEpagBE3W61efKh8RrujlubMsTfQQD1gEVZu4ISZf0=;
  b=mwci30RPCufJSgVdEJnQob55SW2AaKsnu2pOP/ID2ykVqwKlim1KHwjB
   i88iTI6f4hBA6WEdiw48ZSBml7wjiGqqPIT12vqgxyZXBFLcnBjoxCOKV
   4zeTfvTTGJx2yp3bkCuibX7KuvMrCmmaUhQ25BR8MzxejKkMC68TumU5L
   rCPlhWNjcPNd9n2++y6Ps3huKcRv85DiqE/w+Nmq1AiHQwSm40bcTXMkw
   4anTGh+E7GJ7oO1+XC+RZ6vG2Fw846pWaEmRUfNGp4kiX2lMfI2fUbOTR
   Xg6m0tHKyeRDsbqR+sZSjsznHOJaiiJNgzq+i15K3jG71PZJcs5qsaZ4e
   Q==;
X-CSE-ConnectionGUID: kPf1KdR8Sjmt2uxVBnD2qA==
X-CSE-MsgGUID: OPo/JnsxR+6/siNZcw+nnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627294"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:13:34 -0800
X-CSE-ConnectionGUID: xfq6BEQTTQ6IL3kKLIaSpQ==
X-CSE-MsgGUID: LuFl7FlXQ8q888Mhb+eFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9491555"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 09:13:33 -0800
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
Subject: [PATCH RFC v2 7/7] x86/microcode/intel: Apply minimum revision check to early loading
Date: Mon, 16 Nov 2026 16:45:48 +0000
Message-ID: <20261116164548.900486-8-chang.seok.bae@intel.com>
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

The minimum revision check is now generally applicable. Establish the
minimum revision check on early loading. Load the patch but taint the
kernel when the check fails.

Adjust the check function so that the early path can pass the current
revision.

Suggested-by: Arjan van de Ven <arjan.van.de.ven@intel.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V1 -> V2: Drop force_minrev support
---
 arch/x86/kernel/cpu/microcode/intel.c | 51 +++++++++++++--------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index eec8a45b283c..8d598c7ac2c4 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -766,6 +766,29 @@ static int __init save_builtin_microcode(void)
 }
 early_initcall(save_builtin_microcode);
 
+static bool ucode_validate_minrev(u32 cur_rev, struct microcode_header_intel *mc_header)
+{
+	/*
+	 * Ensure the header declares a minimum revision required to perform a
+	 * load. The previously reserved field is 0 in older microcode blobs.
+	 */
+	if (!mc_header->min_req_ver) {
+		pr_info("Unsafe microcode update: Microcode header does not specify a required min version\n");
+		return false;
+	}
+
+	/*
+	 * Check whether the current revision is either greater or equal to
+	 * the minimum revision specified in the header.
+	 */
+	if (cur_rev < mc_header->min_req_ver) {
+		pr_info("Unsafe microcode update: Current revision 0x%x too old.\n", cur_rev);
+		pr_info("Current should be at 0x%x or higher. Update incrementally.\n", mc_header->min_req_ver);
+		return false;
+	}
+	return true;
+}
+
 /* Load microcode on BSP from initrd or builtin blobs */
 void __init load_ucode_intel_bsp(struct early_load_data *ed)
 {
@@ -777,6 +800,7 @@ void __init load_ucode_intel_bsp(struct early_load_data *ed)
 	if (uci.mc && apply_microcode_early(&uci) == UCODE_UPDATED) {
 		ucode_patch_va = UCODE_BSP_LOADED;
 		ed->new_rev = uci.cpu_sig.rev;
+		ed->is_safe = ucode_validate_minrev(ed->old_rev, uci.mc);
 	}
 }
 
@@ -825,31 +849,6 @@ static enum ucode_state apply_microcode_late(int cpu)
 	return ret;
 }
 
-static bool ucode_validate_minrev(struct microcode_header_intel *mc_header)
-{
-	int cur_rev = boot_cpu_data.microcode;
-
-	/*
-	 * Ensure the header declares a minimum revision required to perform a
-	 * load. The previously reserved field is 0 in older microcode blobs.
-	 */
-	if (!mc_header->min_req_ver) {
-		pr_info("Unsafe microcode update: Microcode header does not specify a required min version\n");
-		return false;
-	}
-
-	/*
-	 * Check whether the current revision is either greater or equal to
-	 * to the minimum revision specified in the header.
-	 */
-	if (cur_rev < mc_header->min_req_ver) {
-		pr_info("Unsafe microcode update: Current revision 0x%x too old\n", cur_rev);
-		pr_info("Current should be at 0x%x or higher. Update incrementally.\n", mc_header->min_req_ver);
-		return false;
-	}
-	return true;
-}
-
 static bool is_revision_candidate(unsigned int cur_rev, unsigned int rev)
 {
 	/*
@@ -921,7 +920,7 @@ static enum ucode_state parse_microcode_blobs(int cpu, struct iov_iter *iter)
 		if (!revision_is_safe(&uci->cpu_sig, mc_header.rev))
 			continue;
 
-		is_safe = ucode_validate_minrev(&mc_header);
+		is_safe = ucode_validate_minrev(uci->cpu_sig.rev, &mc_header);
 		if (force_minrev && !is_safe)
 			continue;
 
-- 
2.53.0

