Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7949B1F4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306210; cv=none; b=BJJ/dh7x34ajpq4Qr3NO6c6RJrLMVIEPLYVWuNgcYVOrOFlpkm8zaRdr+E6eQsRF5LjkdCKOlPN5SdfNhUzKWFTFkZRewE2QLidGGcZVLfAB6p5RQX9CmZJcUqCh53GPRf/Yo1vTIJsjGYMBJtIWdf0SXmAmAJhZy1kW6gL2Uhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306210; c=relaxed/simple;
	bh=ntouSyFznmv8TJgRxbpHSz6u7LixB3//ApXqB29BbNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjgmKlJ9taKLxSixR8C1/bNDju+q0emzGbSjzPL3IO648m61lm+ZsQK0ALLSdn/hP7U0Jc67aHUkUlSkt4y6stPuKAbDVqykaFZLviLQb6UDkXFS9PI7sRacb4rab/gLJNq95R7PTUooipeFnfRgtKW+l7W+KH4dtQARAdeQ9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu2xmzUh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu2xmzUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788306209; x=1819842209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ntouSyFznmv8TJgRxbpHSz6u7LixB3//ApXqB29BbNQ=;
  b=Mu2xmzUh7w6U1ZAUNMWk3dMhj4/5VvT6S1EJEtNj7Kqm8re2U8GBxudw
   CI+9rytZtUy5K1NdOgsT38KxyStoj6r7m9mEPkc0UAvctbdPGdMS5Zrwo
   /1FgneQhYY4wXdB6FBp8Am6Zd6v/72yjiNneHVMqHGXNJ5MN45XAj1Fgz
   PueWz7M7jH8Y4xuLY3+d0vrkXRBVp0LTsmmIYRzod6y8X2EJ3ML+336yi
   lLV2tAFV8Q7BO8P7QGs8UAzoodbWd695sKzpr6ICy9nKCqCYFbWAGTEzJ
   4VB+olVHDbjiBn8eTQ6heiW705CRIubhACvjx5vk3j7vQvQwaMbDO3F/l
   w==;
X-CSE-ConnectionGUID: mYoW2+CDQ5yNhXTSLlXvEA==
X-CSE-MsgGUID: MF3kekZ1S5GZ3tHpQC75mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87891920"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="87891920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 16:43:28 -0700
X-CSE-ConnectionGUID: V7TS83dJTEChtjtpWZCgvQ==
X-CSE-MsgGUID: VE3GLKq/SA6jE3q1jjTWIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267469929"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2026 16:43:28 -0700
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
Subject: [PATCH RFC 8/8] x86/microcode/intel: Select the lowest loadable revision for iterative loading
Date: Tue,  1 Sep 2026 23:16:33 +0000
Message-ID: <20260901231634.714144-9-chang.seok.bae@intel.com>
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

The iterative loading logic in the core can repeatedly request a
microcode patch. The vendor parser currently selects the highest loadable
revision, which means no further patch can be selected after the first
update.

To load a concatenated multi-blob image incrementally, adjust the blob
parser to select the lowest loadable revision. This allows patches to be
applied in ascending revision order.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/intel.c | 34 ++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 48e7d023ea41..3a699e361fe0 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -864,14 +864,39 @@ static enum ucode_state apply_microcode_late(int cpu)
 	return ret;
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
+	/*
+	 * Iterative loading selects the lowest loadable revision so that
+	 * revisions can be applied incrementally.
+	 */
+	if (iterative_loading)
+		return rev < cur_rev;
+
+	/* Legacy late loading selects the highest loadable revision. */
+	return rev > cur_rev;
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
+	 * Start from the boundary value for the revision search. With iterative
+	 * loading search walks downward but the legacy search walks upward.
+	 */
+	cur_rev = iterative_loading ? UINT_MAX : 0;
+
 	while (iov_iter_count(iter)) {
 		struct microcode_header_intel mc_header;
 		unsigned int mc_size, data_size;
@@ -908,7 +933,7 @@ static enum ucode_state parse_microcode_blobs(int cpu, struct iov_iter *iter)
 		    intel_microcode_sanity_check(mc, true, MC_HEADER_TYPE_MICROCODE) < 0)
 			goto fail;
 
-		if (cur_rev >= mc_header.rev)
+		if (!is_revision_candidate(cur_rev, mc_header.rev))
 			continue;
 
 		if (!intel_find_matching_signature(mc, &uci->cpu_sig))
@@ -978,9 +1003,6 @@ static enum ucode_state request_microcode_fw(int cpu, struct device *device)
 	if (is_late_loading_denied(cpu))
 		return UCODE_NFOUND;
 
-	if (iterative_loading)
-		return UCODE_NFOUND;
-
 	sprintf(name, "intel-ucode/%02x-%02x-%02x",
 		c->x86, c->x86_model, c->x86_stepping);
 
-- 
2.53.0

