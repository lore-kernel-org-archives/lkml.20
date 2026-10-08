Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865731ED7C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791428775; cv=none; b=og9gvV83M3lI31GRDVuxdph7HPHLAi6jDIo6zKkn4YCbwWSoCgM6JbcUPA0hS6SvZcZg9FUb0HANNF5YMiIlYSJcV4VoOM00XbYcyeNah3yx1QiendeUxX+s6RVkY5uGuhaZ+oPMYF25x88kJLDKREj/aOmZ21lrpetFWSAiIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791428775; c=relaxed/simple;
	bh=F/fzRgU5zNFXoOuiWTzPT7fkxYBqJJ6fbitL0WmIwN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eCEzRAy+nM1qZ9fy0kLfsjIepj9fo1jwCp7cu24hXYyLIJKT3CVQWuTPXo1e/p19g81R5Pf7M4egdG6bpouguZ57vSJzWw9LcHS/t0x5s+An1cNz/BD3kkePn17T4PE0q67MgzpIHyZe9VZ1svnGq2B5GHOsnnmav0MqpxOtuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPWZ0T++; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPWZ0T++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791428772; x=1822964772;
  h=date:from:to:cc:subject:message-id;
  bh=F/fzRgU5zNFXoOuiWTzPT7fkxYBqJJ6fbitL0WmIwN8=;
  b=gPWZ0T++DpafkX/fyDR+jj9nmWLktVg9nYqoPZZfpZb/GROWPl2o88Be
   hVAaXj9RXwaayCoz2FKiedSeYDk8Ox/5z3FIF8Z8+AKFLYoRNskKiy9NP
   8czyhqNPUPHPB9yKZ7ZmynzBiTU8zu2bcFTk/IaqMv1M1drYB5UVlmyHj
   UK4cJ7aEVU9Bn8mjrL+aHBdPicorn3r0S0sjXayQKZEhMwjyBf6iSaDnI
   J1tuC6FLCSCg0KCWvM3fgAujr48sCZwSR4agO5UpyTUiZmtmLmouWL0gt
   RW4DG38su0geVLnXGycqaARmP8R5ZfMqAQOzz7E0sOc5peuHxToFaaNj2
   Q==;
X-CSE-ConnectionGUID: cD8ztn/ZTC6nkiyFkxohpQ==
X-CSE-MsgGUID: TjCTiCUvT+ufIrOXvkP/UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="85472"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="85472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:06:12 -0700
X-CSE-ConnectionGUID: JqwmU4FvQ3CqE1qkJoRAGg==
X-CSE-MsgGUID: oOst+0CTQSGXIdKrt0wtcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="247365"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Oct 2026 20:06:10 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEeSO-000000004eh-0e2d;
	Thu, 08 Oct 2026 03:06:08 +0000
Date: Thu, 08 Oct 2026 05:05:30 +0200
From: kernel test robot <lkp@intel.com>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>
Subject: arch/x86/hyperv/hv_crash.c:512:45-51: ERROR: application of
 sizeof to pointer
Message-ID: <202610080503.ivDF5iYX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
commit: 77c860d2dbb72d1f3c6a2e882a07d19eca399db5 x86/hyperv: Enable build of hypervisor crashdump collection files
date:   11 months ago
config: x86_64-randconfig-2101-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080503.ivDF5iYX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 77c860d2dbb7 ("x86/hyperv: Enable build of hypervisor crashdump collection files")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080503.ivDF5iYX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/hyperv/hv_crash.c:512:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:517:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:521:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:525:45-51: ERROR: application of sizeof to pointer

vim +512 arch/x86/hyperv/hv_crash.c

94212d34618c260 Mukesh Rathor 2025-10-06  499  
94212d34618c260 Mukesh Rathor 2025-10-06  500  /*
94212d34618c260 Mukesh Rathor 2025-10-06  501   * Build 32bit trampoline page table for transition from protected mode
94212d34618c260 Mukesh Rathor 2025-10-06  502   * non-paging to long-mode paging. This transition needs pagetables below 4G.
94212d34618c260 Mukesh Rathor 2025-10-06  503   */
94212d34618c260 Mukesh Rathor 2025-10-06  504  static void hv_crash_build_tramp_pt(void)
94212d34618c260 Mukesh Rathor 2025-10-06  505  {
94212d34618c260 Mukesh Rathor 2025-10-06  506  	p4d_t *p4d;
94212d34618c260 Mukesh Rathor 2025-10-06  507  	pud_t *pud;
94212d34618c260 Mukesh Rathor 2025-10-06  508  	pmd_t *pmd;
94212d34618c260 Mukesh Rathor 2025-10-06  509  	pte_t *pte;
94212d34618c260 Mukesh Rathor 2025-10-06  510  	u64 pa, addr = trampoline_pa;
94212d34618c260 Mukesh Rathor 2025-10-06  511  
94212d34618c260 Mukesh Rathor 2025-10-06 @512  	p4d = hv_crash_ptpgs[0] + pgd_index(addr) * sizeof(p4d);
94212d34618c260 Mukesh Rathor 2025-10-06  513  	pa = virt_to_phys(hv_crash_ptpgs[1]);
94212d34618c260 Mukesh Rathor 2025-10-06  514  	set_p4d(p4d, __p4d(_PAGE_TABLE | pa));
94212d34618c260 Mukesh Rathor 2025-10-06  515  	p4d->p4d &= ~(_PAGE_NX);	/* enable execute */
94212d34618c260 Mukesh Rathor 2025-10-06  516  
94212d34618c260 Mukesh Rathor 2025-10-06  517  	pud = hv_crash_ptpgs[1] + pud_index(addr) * sizeof(pud);
94212d34618c260 Mukesh Rathor 2025-10-06  518  	pa = virt_to_phys(hv_crash_ptpgs[2]);
94212d34618c260 Mukesh Rathor 2025-10-06  519  	set_pud(pud, __pud(_PAGE_TABLE | pa));
94212d34618c260 Mukesh Rathor 2025-10-06  520  
94212d34618c260 Mukesh Rathor 2025-10-06  521  	pmd = hv_crash_ptpgs[2] + pmd_index(addr) * sizeof(pmd);
94212d34618c260 Mukesh Rathor 2025-10-06  522  	pa = virt_to_phys(hv_crash_ptpgs[3]);
94212d34618c260 Mukesh Rathor 2025-10-06  523  	set_pmd(pmd, __pmd(_PAGE_TABLE | pa));
94212d34618c260 Mukesh Rathor 2025-10-06  524  
94212d34618c260 Mukesh Rathor 2025-10-06  525  	pte = hv_crash_ptpgs[3] + pte_index(addr) * sizeof(pte);
94212d34618c260 Mukesh Rathor 2025-10-06  526  	set_pte(pte, pfn_pte(addr >> PAGE_SHIFT, PAGE_KERNEL_EXEC));
94212d34618c260 Mukesh Rathor 2025-10-06  527  }
94212d34618c260 Mukesh Rathor 2025-10-06  528  

:::::: The code at line 512 was first introduced by commit
:::::: 94212d34618c2608758128da32ddac2ad834cb9f x86/hyperv: Implement hypervisor RAM collection into vmcore

:::::: TO: Mukesh Rathor <mrathor@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
