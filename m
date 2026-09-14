Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F0282F17
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354019; cv=none; b=dMakWCrB/TchbTX7l53AXFVUHJH19ara6x7gWauzJSIZARuCfQtYfouaxvXGyC6L2IWRNKjkcDsWvp3uEDS/C8G2SoUs+yP2Ht9QqEzyxSK7VtOaoEVFB8sFDOP0nntxMdsxD7G6YC8Z4D0xosnQZ8y9ZC65svY9UcPw1oZ23l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354019; c=relaxed/simple;
	bh=NgocNdtx6jfiM0d293Fivhltj4bS8b9C5T0tk3kBrGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jnnm1tF8lV8mpoATEMfko8WZgWmFUn75TUjSCkp3MhlKLNf9L+6IndCOqxQrT0gATHN5CViY1gXoERfZQjmK62ZswTlDUGU8P7ZKoZ7wAlC3xGJsiHfInQaz7dksXlFey3qCIMc4QpJx63Al9VbqPziMrw3zZ7Ag+Bmt6Z/WYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=im5/rs4p; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="im5/rs4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789354018; x=1820890018;
  h=date:from:to:cc:subject:message-id;
  bh=NgocNdtx6jfiM0d293Fivhltj4bS8b9C5T0tk3kBrGI=;
  b=im5/rs4pPO1NFJTNKhRLJR8S7OkuwP8MhlHyl15/XdKI4uRIs3FNjoYv
   X76qXf/W9pczssnMyteDKTOnfKqZMJLS7ZRMk6Rc844YkCwrXT6hsbAEg
   jo+WUNGFkPhTW0P/SzoLWOCXIaUmddR2v2z5/LvdmI5qy4eKw9Yqi6mgh
   +bQxUmX2UcMkku/7mkFpm9NH82yC1IMHonpTTI5t0i9qsymB7pDevW5en
   HO6kbJcF95R628IOleLRzIRD54fZNghB/oTWjEKQqZwOn/aLYNC5xxFmU
   GYMsVGDmBrCh4wrgI6Cr6Wvg4BI769DCk/vXc0v5Mbu9w9t3LHUY7beVR
   w==;
X-CSE-ConnectionGUID: wHsCUmzXRcmtm6TaxHxvIQ==
X-CSE-MsgGUID: RmThsYsDQ2uXJf5eryxoRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89471299"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89471299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 19:46:57 -0700
X-CSE-ConnectionGUID: k+1mHxErSNegJ1URGpbpLw==
X-CSE-MsgGUID: eI4n5crzRziI1eutUZ17Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="271096975"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2026 19:46:55 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5wia-000000001qJ-2pyu;
	Mon, 14 Sep 2026 02:46:52 +0000
Date: Mon, 14 Sep 2026 04:46:29 +0200
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to
 absolute symbol: $d
Message-ID: <202609140412.mMAbdsg8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd73f4a6659897191fa0d40695fe370925dd3780
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   4 months ago
config: riscv-randconfig-r063-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140412.mMAbdsg8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 707c032dae3bee24eae29c6f4c459a6d6dc6556d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140412.mMAbdsg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140412.mMAbdsg8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
>> ld.lld: warning: parsing line table prologue at offset 0x000014d8: unsupported version 26814
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x000000c2: unsupported version 0
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x000000ce: unsupported version 48959
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
>> ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00000102: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000010a: unsupported version 55501
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000318e: unsupported version 26118
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00003198: unsupported version 774
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00005636: unsupported version 42234
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x000083c2: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00000648: unsupported version 60295
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000e29e: unsupported version 62283
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000e2b2: unsupported version 20741
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000e2c8: unsupported version 25034
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000e2ca: unsupported version 52915
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000e2d0: unsupported version 26722
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00017054: unsupported reserved unit length of value 0x5aabc0001fd65
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0001705c: unsupported version 38382
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00017060: unsupported version 7967
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00017064: unsupported version 19
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0001919c: unexpected end of data at offset 0x191a6 while reading [0x191a6, 0x191a7)
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x000191ac: unexpected end of data at offset 0x191b6 while reading [0x191b6, 0x191b7)
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_prefetch_for_write)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_unbuffered_write)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_write_collection)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_create_write_req)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_advance_write)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_writepages)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_begin_writethrough)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_writeback_single)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(device_write)
--
>> ld.lld: error: relocation R_RISCV_CALL_PLT cannot refer to absolute symbol: $d
   >>> defined in vmlinux.o
   >>> referenced by strrchr.o
   >>>               vmlinux.o:(netfs_readahead)
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
