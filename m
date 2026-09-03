Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B73016FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460397; cv=none; b=Ff21L3DcGaORiMym+uigGbx4goZIK/bf3Eypf9FeaqowAx4qm1FVTbSuJeuMHsGqkS9OE3+bLPeQi2cg4wnCN1qFZAdi/neUV5/4VU0tCEqaJM0ibejLRK2RUnFXNjV/zHZUO88j3+2i1sWdDDYbQjjnbu7XuYJ7mVwMRo9wfX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460397; c=relaxed/simple;
	bh=nF0du8HKHFbrQkfNnBnB08CKWqcS0G9pDvdpb/ZJmCc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mi7lkfbN3Cug7X5uPPswa00Jdi4godlmMv2sZmQ+xRvVKdVeBF5CC/3uc7Nn20bQ0D/JmsnsIUQSunfL8Vq3Tz1EzSi2fqb5RKIEPsvQDpq4khQ8loIbaFKuWN2JpyilEe6JJ+6JmcB95gxj5f+j1HGQARgSN5HFiEqdH6nnQac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bepmcJcZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bepmcJcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788460390; x=1819996390;
  h=date:from:to:cc:subject:message-id;
  bh=nF0du8HKHFbrQkfNnBnB08CKWqcS0G9pDvdpb/ZJmCc=;
  b=bepmcJcZaCrScK4UzmB+J+i0a/kofzG4QH13Kj19LsWXtsnmhzXHK3K4
   Or0WNcQGCMl2yjglWPODAhkffr5ChVp+cnbKpkVgIdrR5yaaACG3+GzaS
   xTWBblo37r7ET8JfLjr1IAiHtsOKaHhhVLaAE/qH1LoASKq1yWSJWXU67
   Rd0RKOoCczsLE2CrooPuw2ZrEWNJmFjVU8APqdhK9sDZL1/E0cTYZyVfS
   Q1iH5nFiKt0GjPB9yLiH/UxR29gNpegqiIrvbKxoVCGU+MuVUa/8xmhsm
   JWnBXrgvofumjLC5EmED6LDAwu4CIxtl6/tQcjZ0w4DZt9T3pt2nlU4+W
   w==;
X-CSE-ConnectionGUID: +oqPKMgoSC2sGJX3QR9VHA==
X-CSE-MsgGUID: kp8gqQwxTZuKjCKAahUFVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88877867"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88877867"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 11:33:04 -0700
X-CSE-ConnectionGUID: vQ/HhJQ7TQGUdMRT/Ck57w==
X-CSE-MsgGUID: 5T/qrwAPSWyY6naslHwDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="269797892"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2026 11:33:02 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2CF9-000000005Eg-2Uhj;
	Thu, 03 Sep 2026 18:32:59 +0000
Date: Fri, 04 Sep 2026 02:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: <inline asm>:1:275: error: invalid instruction mnemonic
 'brk'
Message-ID: <202609040258.xw9R4qaZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   940de590b839f71d6dc846160534bf202401b8b7
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   3 months ago
config: arm64-randconfig-003-20260830 (https://download.01.org/0day-ci/archive/20260904/202609040258.xw9R4qaZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260904/202609040258.xw9R4qaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609040258.xw9R4qaZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-crypto' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   '-sha2' is not a recognized feature for this target (ignoring feature)
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-crypto' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   '-sha2' is not a recognized feature for this target (ignoring feature)
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB18_17
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($42)
    ^
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB18_24
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($42)
    ^
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 157; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 286; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                      ^~~
   <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                      ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 117; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 118; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 178; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 286; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 178; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 286; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 178; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
--
   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-crypto' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   '-sha2' is not a recognized feature for this target (ignoring feature)
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-crypto' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   '-sha2' is not a recognized feature for this target (ignoring feature)
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   error: cannot compile inline asm
>> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB19_22
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($42)
    ^
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB19_30
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($42)
    ^
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 157; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                            ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 282; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                      ^~~
   <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                      ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 124; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 282; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                                    ^~~
   <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
           .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
                                                                                                                                                                                                                                                                                       ^~~
   <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
