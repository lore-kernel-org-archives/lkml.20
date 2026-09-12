Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C129D260
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173307; cv=none; b=RE3QxItK5mR2P0zJ6iT8vMthltciZFFYvm/XTxA4WuCgFmbd6axMsWz0cthNqo5hKRAdVCT09/imIlB+uYaxDYiQXq2SBRLhrrhcTlEy61c1yGv//DHjcHMugRIVOB0uOBXJ2rmeGKN8Eee2+dDDO+G6+j0TdUXifsCaeAqDkms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173307; c=relaxed/simple;
	bh=n1YFCcL+pq+InjfsAVMb4kl/Tw2a5rz5iSJpBsPCjRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fABfNIOAe776BUoSWbgfEtSuyCRFTDtlQ8QcjOxdY6cxsZES5ItK7L7+h7UJIYy5p6LVKC13catuoxReP0Ge9029ukxJwG8ZHhnjLFWsuJE1MvsY7EBiK3aCSDtEOkwXIuKQwYzbj/kLwpxf8Ulf038jkQbfPTKhznjRM8zAyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTkzcZIZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTkzcZIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173305; x=1820709305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n1YFCcL+pq+InjfsAVMb4kl/Tw2a5rz5iSJpBsPCjRE=;
  b=KTkzcZIZXujhttde3S6sX9KWrIcRsnrsZr+URNuVBW6jSli04o12OB/1
   8kehB0jt9Ffoo1rFPsVcLdyAysJf+H5GdvGSFAckswTod8qNN7Qj6NMV/
   JJeLZXCXhZQAWbJEk3LeIcu//4v7YkrDbPQMyFakkG+ehxzyvcRLNhWjl
   OQwzIFDmF40F693MiT4VBFrRdO9hT1b+W5A/g97sNDvB7JDyAj68BoHX2
   ns1HwGnvHmqYzjJZiORPCe+ZLS6Jf9HjNxjTzcrcrc1Gqm1PrUcnsd35U
   sxPvtOp+QZwXlSID7gGYLbIq8tibKzN31MJl+HyyqIsBrbZ382rsSOAaw
   g==;
X-CSE-ConnectionGUID: HNccN2dtT3uyYxeZuSR6AQ==
X-CSE-MsgGUID: 0PBISRhlSSaebAex3yermA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174969"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:35:05 -0700
X-CSE-ConnectionGUID: rwriP2gUQXSZ2xCBAToWNw==
X-CSE-MsgGUID: B71n73AeTpuArd1zZ1yN3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217623"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:35:05 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 4/8] x86/microcode: Extend struct microcode_ops for uniform loading
Date: Sat, 12 Sep 2026 00:08:10 +0000
Message-ID: <20260912000815.997720-5-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912000815.997720-1-chang.seok.bae@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microcode loading is currently performed on a per-core basis. The loading
process concludes only after every core has been updated. As core counts
continue to grow, reducing the number of update invocations makes the
process increasingly efficient.

The uniform loading feature extends the update scope beyond a single
core, for example to a package or even an entire system. This means a
single update covers multiple cores, which in turn reduces the number of
update triggers.

The common late-loading logic determines the primary CPUs before invoking
vendor-specific callbacks. Extend struct microcode_ops with fields for
describing the feature support and the loading scope.

The actual loading flow changes will follow later.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/internal.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index a10b547eda1e..0a74794e0245 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -21,6 +21,13 @@ enum ucode_state {
 	UCODE_OFFLINE,
 };
 
+enum uniform_scope {
+	UNIFORM_DEFAULT	= 0,
+	UNIFORM_CORE,
+	UNIFORM_PKG,
+	UNIFORM_SYS,
+};
+
 struct microcode_ops {
 	enum ucode_state (*request_microcode_fw)(int cpu, struct device *dev);
 	void (*microcode_fini_cpu)(int cpu);
@@ -36,7 +43,9 @@ struct microcode_ops {
 	void			(*finalize_late_load)(int result);
 	unsigned int		nmi_safe	: 1,
 				use_nmi		: 1,
-				use_staging	: 1;
+				use_staging	: 1,
+				use_uniform	: 1;
+	enum uniform_scope	uniform_scope;
 };
 
 struct early_load_data {
-- 
2.53.0

