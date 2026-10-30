Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390089;
	b=v8SrXxMw4Z//BXNE9FOIz9thUvAtobXlkpw+lKx0bSEXLSvOrrAGS1WB/cCFDZ3Kl/Ka
	 Go+DLvhoA9lLK5t/NU/mhPnwScPZuaHSTiXC79qcPxVYrR8HUtA3K8ZNF+PTvehpp04oy
	 PTwxVV9xhCSFxYQMVrHZmUHXNuk8aJELOzJKewSa5aOp0j4bUgI5nqpBCxvCcKap+e6yN
	 g9XYPMaDP8dtyjRYui7R1RsfOq2RmHAk6lXgTAgsOM+cxCkmN6BrAMRylWr6bbIDZ+BpH
	 oRM74LwsFExtDx4VCOTiSva54nxPPaKsqK17fLWGd5tWBvUui0Tp2TjNUoxDejsup3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390089;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WJUDZVbD9SA6/jQ+BrhjA59O5X08tqlfMKnPqF3KKcc=;
	b=GdBxrKDQ8uFylTXMoe3C+sc6takt9mKGEvhqyERJsQ9xgcZ+soL7T3ETFgK7jjP9GF31
	 B2NShIyAa0TRMKX2nT1xIvmVWQJyNCIQBNojKQpptHrNCgvY8/r4E/rHoWvuxIaSqzkYS
	 ENrPYNIw9qdh5uE3zivsjoXIXP4fm4mNroo+bAA9UZcaM4VTXasYuOvj1PUv8Dvtlg/Yi
	 vH9RHCeYQdLbQgQnDSK39FRxx502y90oNrOqoS9bK+l++MglIkYuKG6q7xuDV4O1ouPf5
	 LNodCnwaQwFlrqV9Ttu8vpE1TS63XNZaxYi2oydEs8WKpvUVsk2xmDZvKW67Kjwpm6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OIAPhLQw;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A1606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OIAPhLQw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793390088; x=1824926088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VViLGYgk0+uL9dS9g8mxyQ1QXzeW9xuRljpBmZBoxV8=;
  b=OIAPhLQwfiCzvRw+6HJru2bBACCptvAKDWL8sj1cQyrodLQp8ipvoGjN
   so53zxN0CAIdsT4XHR171lLYxVZK9J3FcqoqKKcwcA4sqw8Nkl4jga+ve
   0sopOeVOn4uquiNQDlFYYr6SSRb6Tl74qygHD3/3F/3XSWWRsw/ot6Zky
   0q5BP5IxloKLC7XE7TS+FOzz1f2dKOQ0OVmUcKB2ePCexq8+GX/IlpxSb
   GotL5EF+czoR3TZGJiI13TLect3NRmQLQAJvDp02DbWTJEHbqnPJHnuF6
   h87OaR2w+uajKD/QEcyDOPKqexzKmThihirqZ40WZoZBO/6HW6T0K+ygT
   Q==;
X-CSE-ConnectionGUID: nhIzAWohSDuFTOfTR63kUQ==
X-CSE-MsgGUID: M5POgj2SR1a62mOIPQzppQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2176651"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2176651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 12:54:47 -0700
X-CSE-ConnectionGUID: zQAJfl6PTOiL2g8kkWqPOA==
X-CSE-MsgGUID: 56NGjL1cTSC0uWzPZW0S+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5860198"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2026 12:54:48 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/bugs: Replace RFDS model checks with VFM ones
Date: Fri, 30 Oct 2026 12:52:14 -0700
Message-ID: <20261030195214.1284995-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
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

The RFDS vulnerability check uses raw model numbers to identify Alder
Lake and Raptor Lake. Most Intel-specific code has already moved away
from x86_model checks, but this one got added recently.

Replace the x86_model checks with VFM ones to make them more readable.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/kernel/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index c7352827f491..8d7bd8bb7b18 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1392,8 +1392,8 @@ static bool __init vulnerable_to_rfds(u64 x86_arch_cap_msr)
 	 * both Core and Atom CPUs. Mark unaffected when Atom CPUs are not
 	 * present.
 	 */
-	if ((boot_cpu_data.x86_model == 0x97 ||
-	     boot_cpu_data.x86_model == 0xB7) &&
+	if ((boot_cpu_data.x86_vfm == INTEL_ALDERLAKE ||
+	     boot_cpu_data.x86_vfm == INTEL_RAPTORLAKE) &&
 	     boot_cpu_data.topo.intel_type != INTEL_CPU_TYPE_ATOM &&
 	     !boot_cpu_has(X86_FEATURE_HYBRID_CPU))
 		return false;
-- 
2.43.0

