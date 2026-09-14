Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2430D407
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370066; cv=none; b=PX15qnYU5LDbaWpWEhYFdNrefkc0Om78l24T+g21L7N6NmR+ZWmx7gPrBFmlnNV6xpo/vYY2/Sc41ues3VXo5tsj+jXgEO7/67Q+8HJzo2TtN13/zpZI8uq9Vph8diUIJd5PlPdu0LCskpgYaotFQof0zgetqVwj9GZDmZpDxaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370066; c=relaxed/simple;
	bh=6n8h7IIrZwG3KBmY0khfmI8Lpeir0vMqjC10SRwdz5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nSr3OYuo76KF9dFzRm4PUxO+u5qMiv7XoKbTa0agV/xLf8QytUEh1R4HNIWC6LLki0dEKaMUOTt8GzsrzipIplC75sKAWeERctC6UgqKNbP/k5PvWDuTh7GpwWf0J1fbF5QhcfY2TGcClz/A3nHy2dkbip8yrOKjKHPzHc424Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fwmq3EFW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fwmq3EFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789370063; x=1820906063;
  h=date:from:to:cc:subject:message-id;
  bh=6n8h7IIrZwG3KBmY0khfmI8Lpeir0vMqjC10SRwdz5o=;
  b=Fwmq3EFWiHBWogT8h6CgGkGik2uzQ4WtMWTzCsjOjSgEGXWoSTlevnqN
   9zfMmeVoEMbgeVVAKvdPTlMcYYygxxavsfaZjKOSHBtx7K34c0wnuT/t9
   dNKsAAx0kTdhR+2cQKSjo97M9zjeeAbRgJ7FGsopE1/1E403NTr/cszRm
   aVBMQWfDUwG2KKEbsd6c1IEkB8sLBaEklq/DCylsHjJjx8O8O3PNBczBG
   o4W86DBmMV2nArIg+K+JZ4kUDmYLXk0EmYQO8qQiPOAK2is+uagCsGJ/G
   jT5jcUHDcbxNWRDrwU0ZhXmFYI9KtED5onUttxM4HVBof2SMgLXjgqvVo
   g==;
X-CSE-ConnectionGUID: 9yQsfpWZQd6VQGTzXvjWQQ==
X-CSE-MsgGUID: ShdWBTKkTzyP6dmXptv+BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100381424"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100381424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 00:14:22 -0700
X-CSE-ConnectionGUID: V3mYNV+3SfiAJON63g5yuA==
X-CSE-MsgGUID: aLP/+3uCS5KBwXQYnhYVDA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2026 00:14:19 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x60tN-0000000006R-1HNG;
	Mon, 14 Sep 2026 07:14:17 +0000
Date: Mon, 14 Sep 2026 09:14:04 +0200
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: ld.lld: warning: parsing line table prologue at offset
 0x0001919c: unexpected end of data at offset 0x191a6 while reading [0x191a6,
 0x191a7)
Message-ID: <202609140934.KAmq6Ow4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   4 months ago
config: riscv-randconfig-r063-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140934.KAmq6Ow4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 707c032dae3bee24eae29c6f4c459a6d6dc6556d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140934.KAmq6Ow4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140934.KAmq6Ow4-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> ld.lld: warning: parsing line table prologue at offset 0x0001919c: unexpected end of data at offset 0x191a6 while reading [0x191a6, 0x191a7)
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x000191ac: unexpected end of data at offset 0x191b6 while reading [0x191b6, 0x191b7)
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0001cd0a: unsupported version 775
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0001cd12: unsupported version 9
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x000235ea: unsupported version 256
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000c3ee: unsupported version 54189
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0002f3f8: unsupported version 6852
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0002f400: unsupported version 256
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0002f404: unsupported version 59001
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00033a82: unsupported version 21139
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00033a8c: unsupported version 167
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00038de4: unsupported version 24
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00038ea6: unsupported reserved unit length of value 0x5aabc000685d1
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00038df8: unsupported version 12462
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0003c7aa: unsupported version 19274
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0003c7ba: unsupported version 19275
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0003c7d6: unsupported version 2305
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0003c7bc: unsupported version 5893
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00040c3e: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00040c62: unsupported version 56372
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00040c50: unsupported version 16275
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00040c54: unsupported version 0
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
   ld.lld: warning: parsing line table prologue at offset 0x000108a8: unsupported version 13195
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0000ddfe: unsupported version 256
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
--
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007d5fa8: unsupported version 24633
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007d5fac: unsupported version 65147
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007da42c: unsupported version 3937
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007da436: unsupported version 4742
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007da438: unsupported version 43679
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007de5c2: unsupported version 1541
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007de5d0: unsupported version 1543
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007de5da: unsupported version 4101
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
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
   ld.lld: warning: parsing line table prologue at offset 0x007e44b2: unsupported version 13699
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007e44be: unsupported version 22869
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007e62d6: unsupported version 65019
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
   ld.lld: warning: parsing line table prologue at offset 0x007ed002: unsupported version 1545
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007ec51a: unsupported version 61187
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007ec520: unsupported version 1025
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007edbf2: unsupported version 46271
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007edc12: unsupported version 24684
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007edc16: unsupported version 48207
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
   ld.lld: warning: parsing line table prologue at offset 0x007f46ba: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007f4742: unsupported version 42736
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007f5484: address size 3 doesn't match architecture address size 4
   ld.lld: warning: parsing line table prologue at 0x007f5484 found an invalid directory or file table description at 0x007f54a8
   ld.lld: warning: failed to parse entry content descriptions because no path was found
   ld.lld: warning: line table program with offset 0x007f5484 has length 0x2f0b0209 but only 0x03276386 bytes are available
>> ld.lld: warning: line table program at offset 0x007f5484 contains a special opcode at offset 0x017f549c, but the prologue maximum_operations_per_instruction value is 2, which is experimentally supported, so line number information may be incorrect
   ld.lld: warning: unexpected line op length at offset 0x017f5e62 expected 0x03 found 0x01
   ld.lld: warning: unexpected end of data at offset 0x3a6b80a while reading [0x17f6256, 0xe54c172)
   ld.lld: warning: last sequence in debug line table at offset 0x007f5484 is not terminated
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007f5494: unsupported version 9
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007f989e: unsupported version 2430
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007f98a0: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007fa87e: unsupported version 6533
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007fa8d6: unsupported version 34440
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007fa88c: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x007fa88e: unsupported version 256
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
   ld.lld: warning: parsing line table prologue at offset 0x00800294: unsupported version 16133
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0080029e: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00801af8: unsupported version 141
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00801b02: unsupported version 65147
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00801b08: unsupported version 12834
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00801b0e: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00801b16: unsupported version 52571
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x00007a98: unsupported version 18947
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0080857c: unsupported version 2425
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0080857e: unsupported version 0
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
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
   ld.lld: warning: parsing line table prologue at offset 0x008135fc: unsupported version 17585
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0081811a: unsupported version 5016
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0081bd22: unsupported version 14855
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0081bd30: unsupported version 60446
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0081bd36: unsupported version 12577
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0081bd3a: unsupported version 79
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: section offset exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0081fc92: unsupported version 517
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: parsing line table prologue at offset 0x0081fc98: unsupported version 795
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size
   ld.lld: warning: vmlinux.o: invalid reference to or invalid content in .debug_str_offsets[.dwo]: length exceeds section size

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
