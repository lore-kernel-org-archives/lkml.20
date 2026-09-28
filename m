Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2113E0230
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634491; cv=none; b=H08MLlpczxtzxEkU3fyT2L4SFiJOAi3D6PxhA4skowTDeZ1wCJjVg0/xdZsJtfqtisYCl/x8ILMyRn+9dhTJb23wUC6ZqwYZh4Brgos5zF1USUXoVJlcowzRkOlLGRb2uJyNwS/OwlA0S3Hf0QsDpUWdmr4ymvodbKgrxL04aLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634491; c=relaxed/simple;
	bh=cVGo9uujYUsv1Wo0c2nR+Th6Z9Awk19dHo7Sb+ohhvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BNnlUGmTDi0wTGR8QujQtHji7ZpHd7cECEFBcgIsvGcEcgMWQrYlsf6mXs4KFuIiju5BIb4KzHlRRD54IioRggkNBVWeQImlcfO634w4AvstOM0NBqNaFY2dSLxni2iMJAv9wRm7tND1ruxBxwdXmAaU+WgYwCs+tcxX2X6LM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sxezv5bO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sxezv5bO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790634490; x=1822170490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cVGo9uujYUsv1Wo0c2nR+Th6Z9Awk19dHo7Sb+ohhvI=;
  b=Sxezv5bOc0Q1kisN7lTKsjlFtWIEjKIMitwYMj4PDB+Spp21qX02I1SH
   sT8ukoRSFUy1+2VblAoq59qoDK2GX5LVT9DPgQBeBwYlRYAtZurAkWBby
   oe8tHzc1d1xERDwHcHaxR4dI6LH2YIEe8JPGytg5ngps3UGQo5g3QH7hg
   bXv9lLJxzK3fRjG5bEVuBPNF2maYAxA9Y7lVpyiEGMU3byfhQQK6D0GUl
   fCnuIwPrBGsde07KfiwkhH4XdWla5VNpopOKg7a5h8eXeeA6CbfbTjbJF
   MY4vXZTcTbHEVOmJlvTTwPE600nOj/dDujBA4agl2hnlyFd+S3znGGF2M
   Q==;
X-CSE-ConnectionGUID: XuNSH9miSt2s4QVIXn8w9A==
X-CSE-MsgGUID: /SwopmwXR4KnPPbR1Cv/VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90298564"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90298564"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:28:09 -0700
X-CSE-ConnectionGUID: eO2482wFQ1Sy0t0LZVUDYA==
X-CSE-MsgGUID: pmebJsRjTaydDyHRvMoDMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275206387"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2026 15:28:09 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Tony Luck <tony.luck@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] x86/microcode/intel: Refresh old_microcode defines with the May 2026 release
Date: Mon, 28 Sep 2026 15:26:07 -0700
Message-ID: <20260928222607.3593973-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the minimum expected revisions of Intel microcode based on the
microcode-20260512 (May 2026) release.

Note, the three new entries are for INTEL_PANTHERLAKE_L steppings.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
v2:
 - Fix a typo in the commit message.
---
 .../kernel/cpu/microcode/intel-ucode-defs.h   | 91 ++++++++++---------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h b/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
index af8b1d8b26f6..7f463c85c5f8 100644
--- a/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
+++ b/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
@@ -136,35 +136,35 @@
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x5f, .steppings = 0x0002, .platform_mask = 0x01, .driver_data = 0x3e },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x66, .steppings = 0x0008, .platform_mask = 0x80, .driver_data = 0x2a },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6a, .steppings = 0x0020, .platform_mask = 0x87, .driver_data = 0xc0002f0 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6a, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0xd000410 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6c, .steppings = 0x0002, .platform_mask = 0x10, .driver_data = 0x10002e0 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6a, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0xd000421 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6c, .steppings = 0x0002, .platform_mask = 0x10, .driver_data = 0x10002f1 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7a, .steppings = 0x0002, .platform_mask = 0x01, .driver_data = 0x42 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7a, .steppings = 0x0100, .platform_mask = 0x01, .driver_data = 0x26 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7e, .steppings = 0x0020, .platform_mask = 0x80, .driver_data = 0xca },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7e, .steppings = 0x0020, .platform_mask = 0x80, .driver_data = 0xcc },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8a, .steppings = 0x0002, .platform_mask = 0x10, .driver_data = 0x33 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0xbc },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0004, .platform_mask = 0xc2, .driver_data = 0x3c },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8d, .steppings = 0x0002, .platform_mask = 0xc2, .driver_data = 0x56 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0xbe },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0004, .platform_mask = 0xc2, .driver_data = 0x3e },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8d, .steppings = 0x0002, .platform_mask = 0xc2, .driver_data = 0x58 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0200, .platform_mask = 0x10, .driver_data = 0xf6 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0200, .platform_mask = 0xc0, .driver_data = 0xf6 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0400, .platform_mask = 0xc0, .driver_data = 0xf6 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0800, .platform_mask = 0xd0, .driver_data = 0xf6 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x1000, .platform_mask = 0x94, .driver_data = 0x100 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x10, .driver_data = 0x2c000410 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x87, .driver_data = 0x2b000650 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x10, .driver_data = 0x2c000410 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x87, .driver_data = 0x2b000650 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x10, .driver_data = 0x2c000410 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0x2b000650 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0080, .platform_mask = 0x87, .driver_data = 0x2b000650 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x10, .driver_data = 0x2c000410 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x87, .driver_data = 0x2b000650 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x10, .driver_data = 0x2c000421 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x87, .driver_data = 0x2b000670 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x10, .driver_data = 0x2c000421 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x87, .driver_data = 0x2b000670 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x10, .driver_data = 0x2c000421 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0x2b000670 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0080, .platform_mask = 0x87, .driver_data = 0x2b000670 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x10, .driver_data = 0x2c000421 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x87, .driver_data = 0x2b000670 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x96, .steppings = 0x0002, .platform_mask = 0x01, .driver_data = 0x1a },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0004, .platform_mask = 0x07, .driver_data = 0x3d },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0020, .platform_mask = 0x07, .driver_data = 0x3d },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0008, .platform_mask = 0x80, .driver_data = 0x43a },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x40, .driver_data = 0xb },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x80, .driver_data = 0x43a },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0004, .platform_mask = 0x07, .driver_data = 0x3e },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0020, .platform_mask = 0x07, .driver_data = 0x3e },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0008, .platform_mask = 0x80, .driver_data = 0x43b },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x40, .driver_data = 0xc },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x80, .driver_data = 0x43b },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9c, .steppings = 0x0001, .platform_mask = 0x01, .driver_data = 0x24000026 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9e, .steppings = 0x0200, .platform_mask = 0x2a, .driver_data = 0xf8 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9e, .steppings = 0x0400, .platform_mask = 0x22, .driver_data = 0xfa },
@@ -176,30 +176,33 @@
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa5, .steppings = 0x0020, .platform_mask = 0x22, .driver_data = 0x100 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa6, .steppings = 0x0001, .platform_mask = 0x80, .driver_data = 0x102 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa6, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0x100 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa7, .steppings = 0x0002, .platform_mask = 0x02, .driver_data = 0x64 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaa, .steppings = 0x0010, .platform_mask = 0xe6, .driver_data = 0x25 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x20, .driver_data = 0xa000124 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x95, .driver_data = 0x10003f0 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xae, .steppings = 0x0002, .platform_mask = 0x97, .driver_data = 0x1000273 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaf, .steppings = 0x0008, .platform_mask = 0x01, .driver_data = 0x3000382 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb5, .steppings = 0x0001, .platform_mask = 0x80, .driver_data = 0xa },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb7, .steppings = 0x0002, .platform_mask = 0x32, .driver_data = 0x132 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb7, .steppings = 0x0010, .platform_mask = 0x32, .driver_data = 0x132 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0004, .platform_mask = 0xe0, .driver_data = 0x6133 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0008, .platform_mask = 0xe0, .driver_data = 0x6133 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0100, .platform_mask = 0xe0, .driver_data = 0x6133 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbd, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0x125 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbe, .steppings = 0x0001, .platform_mask = 0x19, .driver_data = 0x1e },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0004, .platform_mask = 0x07, .driver_data = 0x3d },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0020, .platform_mask = 0x07, .driver_data = 0x3d },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0040, .platform_mask = 0x07, .driver_data = 0x3d },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0080, .platform_mask = 0x07, .driver_data = 0x3d },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc5, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x11a },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc6, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x11a },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc6, .steppings = 0x0010, .platform_mask = 0x82, .driver_data = 0x11a },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xca, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x11a },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcf, .steppings = 0x0002, .platform_mask = 0x87, .driver_data = 0x210002c0 },
-{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcf, .steppings = 0x0004, .platform_mask = 0x87, .driver_data = 0x210002c0 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa7, .steppings = 0x0002, .platform_mask = 0x02, .driver_data = 0x65 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaa, .steppings = 0x0010, .platform_mask = 0xe6, .driver_data = 0x28 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x20, .driver_data = 0xa000142 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x95, .driver_data = 0x1000423 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xae, .steppings = 0x0002, .platform_mask = 0x97, .driver_data = 0x1000307 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaf, .steppings = 0x0008, .platform_mask = 0x01, .driver_data = 0x30003a3 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb5, .steppings = 0x0001, .platform_mask = 0x80, .driver_data = 0xd },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb7, .steppings = 0x0002, .platform_mask = 0x32, .driver_data = 0x133 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb7, .steppings = 0x0010, .platform_mask = 0x32, .driver_data = 0x133 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0004, .platform_mask = 0xe0, .driver_data = 0x6134 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0008, .platform_mask = 0xe0, .driver_data = 0x6134 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0100, .platform_mask = 0xe0, .driver_data = 0x6134 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbd, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0x126 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbe, .steppings = 0x0001, .platform_mask = 0x19, .driver_data = 0x21 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0004, .platform_mask = 0x07, .driver_data = 0x3e },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0020, .platform_mask = 0x07, .driver_data = 0x3e },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0040, .platform_mask = 0x07, .driver_data = 0x3e },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0080, .platform_mask = 0x07, .driver_data = 0x3e },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc5, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x121 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc6, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x121 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc6, .steppings = 0x0010, .platform_mask = 0x82, .driver_data = 0x121 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xca, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x121 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcc, .steppings = 0x0002, .platform_mask = 0x90, .driver_data = 0x11b },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcc, .steppings = 0x0004, .platform_mask = 0x90, .driver_data = 0x11b },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcc, .steppings = 0x0008, .platform_mask = 0x90, .driver_data = 0x11b },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcf, .steppings = 0x0002, .platform_mask = 0x87, .driver_data = 0x210002e0 },
+{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcf, .steppings = 0x0004, .platform_mask = 0x87, .driver_data = 0x210002e0 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0xf, .model = 0x00, .steppings = 0x0080, .platform_mask = 0x01, .driver_data = 0x12 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0xf, .model = 0x00, .steppings = 0x0080, .platform_mask = 0x02, .driver_data = 0x8 },
 { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0xf, .model = 0x00, .steppings = 0x0400, .platform_mask = 0x01, .driver_data = 0x13 },
-- 
2.43.0

