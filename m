Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF16473C65
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306214; cv=none; b=biD8TG3jzLeF3FPZauMHUP7odhCnwMEAw9jNJnS5UUAZzBgQwwGTemfmamCh7+JkbOYZO4tJsOoZYYL7bza3j98hLopHDCLHuLxuBFuSeTpq5Cl1fGoCNxn8oh1Qp8N1McaChaS5KbxQaXK19WyCj7n/VRg1YA5I3BFpoOldUCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306214; c=relaxed/simple;
	bh=BsrKqoZGFVI0bb4obu2EyK4rErkmjBzF0gjzDVTq+7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMnwoFGfA45OrxmaW6mlRswLOnerXvd8uuHP/Pjsb48Ru7bMaGHx+7xe2SwNwGxWuC2rabRrXDrjWiKLpZZ+vEiPpBVg2EpzI5iadek2d4r4Vr8Ouy4ODzY+DfLEQHxa4mzRNwYc2ugrafJ/vIbeGV5JSjW7CEIGTr37Y5hqzYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ss7uhxOR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ss7uhxOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788306206; x=1819842206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BsrKqoZGFVI0bb4obu2EyK4rErkmjBzF0gjzDVTq+7I=;
  b=Ss7uhxORPL1m/48QE6RVuWmO4WpuW+T68/BVU7rBu83xO5pFxif7QLPM
   FLZnYdHoD4CKkgqX35nE5L17VR9NmxFcJ474PIAdS9X6owjTlE7gwt/SG
   NRkIwWqb4SoWYOTcA55FOkPCozGUrUCDBnBlrEx1gZZ/9cUpLnCvh/UAA
   /tsWZ6BeOuWo+CTrPMRWYGGUro0g8z/XAw6ce6S2RDWl4uh1rPxPCFcHP
   RmGXM5yhPlscD3U+uExNE7rnoC5YPE7oS8ggMbeIsGEfOHtyT/J1RoI9Q
   BRVomHBA+wUYYw9RXy6BiGm8K0npD7mSJR8XTb4bgHIbAsJJZCIJ9hVo/
   Q==;
X-CSE-ConnectionGUID: JYRBZbxhSJmtrhPotLu+yg==
X-CSE-MsgGUID: E1XELeD/QjCSjML4sD5FGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87891903"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="87891903"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 16:43:25 -0700
X-CSE-ConnectionGUID: yPvqiwIKTtWZ3GGAKmE4FA==
X-CSE-MsgGUID: hE1TdyXkQD6OASmdYOzhnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267469911"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2026 16:43:25 -0700
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
Subject: [PATCH RFC 6/8] x86/microcode/intel: Apply minimum revision check to early loading
Date: Tue,  1 Sep 2026 23:16:31 +0000
Message-ID: <20260901231634.714144-7-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901231634.714144-1-chang.seok.bae@intel.com>
References: <20260901231634.714144-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minimum revision check is now generally applicable. Establish the
minimum revision check on early loading. Follow the late loading behavior
when the check fails:

 * Load but taint the kernel if not enforced, or
 * Reject the loading if enforced.

Adjust the check function so that the early path can pass the current
revision.

With this establishment, do not reject early loading anymore when
enforced.

Suggested-by: Arjan van de Ven <arjan.van.de.ven@intel.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/intel.c | 64 ++++++++++++---------------
 1 file changed, 29 insertions(+), 35 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 3247c619eaa1..ddd5b72b27a1 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -341,6 +341,29 @@ static bool is_loading_denied(struct cpu_signature *sig, u32 rev)
 	return false;
 }
 
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
 /* Scan blob for microcode matching the boot CPUs family, model, stepping */
 static __init struct microcode_intel *scan_microcode(void *data, size_t size,
 						     struct ucode_cpu_info *uci,
@@ -365,6 +388,9 @@ static __init struct microcode_intel *scan_microcode(void *data, size_t size,
 		if (is_loading_denied(&uci->cpu_sig, mc_header->rev))
 			continue;
 
+		if (force_minrev && !ucode_validate_minrev(uci->cpu_sig.rev, mc_header))
+			continue;
+
 		/*
 		 * For saving the early microcode, find the matching revision which
 		 * was loaded on the BSP.
@@ -786,17 +812,10 @@ void __init load_ucode_intel_bsp(struct early_load_data *ed)
 	uci.mc = get_microcode_blob(&uci, false);
 	ed->old_rev = uci.cpu_sig.rev;
 
-	if (!uci.mc)
-		return;
-
-	if (force_minrev) {
-		pr_warn_once("No early load: minimum revision check is not implemented.\n");
-		return;
-	}
-
-	if (apply_microcode_early(&uci) == UCODE_UPDATED) {
+	if (uci.mc && apply_microcode_early(&uci) == UCODE_UPDATED) {
 		ucode_patch_va = UCODE_BSP_LOADED;
 		ed->new_rev = uci.cpu_sig.rev;
+		ed->is_safe = ucode_validate_minrev(ed->old_rev, uci.mc);
 	}
 }
 
@@ -845,31 +864,6 @@ static enum ucode_state apply_microcode_late(int cpu)
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
 static enum ucode_state parse_microcode_blobs(int cpu, struct iov_iter *iter)
 {
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
@@ -923,7 +917,7 @@ static enum ucode_state parse_microcode_blobs(int cpu, struct iov_iter *iter)
 		if (is_loading_denied(&uci->cpu_sig, mc_header.rev))
 			continue;
 
-		is_safe = ucode_validate_minrev(&mc_header);
+		is_safe = ucode_validate_minrev(uci->cpu_sig.rev, &mc_header);
 		if (force_minrev && !is_safe)
 			continue;
 
-- 
2.53.0

