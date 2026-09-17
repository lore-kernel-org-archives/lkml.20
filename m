Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A295547077
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665109; cv=none; b=ZZkx3tXWS+JpFm8bmqpqdAG/yYmWpfiLvML3Oo5N70NMaKgYq9qUDOCMa1gXIsg56i1QGYcFxutPNFRKuvqmpPqzmTleH3AnFYojTwWL8NyIedtG2Na2on+MJtVIkJv8FP6OEbGJDHIvkfrBS7xTxny4dp20NMflhxe/DgmI/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665109; c=relaxed/simple;
	bh=jqnRVj8Ykd+ppDe2ZUtJ1ehaU+VGN1mVNSyBNSh80UM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JJ5x64LxSZsYv2TdmgpU8Th8e8za55CESNCEk2Zlj8wGqvMQ1Ch3HNhuBE8Yovdru9oaM8IjJzcY7ZhQzvliWklw48iBk6xQGr2snSxvvtXySp+65LDCky9BIGvX+vhvIoXh0Dus8TKsYWNMpUIeIVa0rF2x9GCTcv6SXb0avGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JENdJKUs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JENdJKUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789665105; x=1821201105;
  h=date:from:to:cc:subject:message-id;
  bh=jqnRVj8Ykd+ppDe2ZUtJ1ehaU+VGN1mVNSyBNSh80UM=;
  b=JENdJKUsDwon2naCO6Dqky4VR5C/Fivq6HPWRpGKJw29Asm1mfKKz/YO
   viGOkPhDpAl+mM8E95T/nOJSDlP2Sv+S12vyxwabTsmCrTuZYjHIqctoF
   4dU9UNjzieCT/WIYPLn9vG1SFwTiQphtBxzQd5T3xK/VjqFTIyoOlnLLd
   DqHYE1EVrR52HSXD9R7Q0jep5x+bKTkCGb1NRf3G76476PMrcyTwEiItp
   hfpOcdNrc1IjSFXfmfcYwAFU6Pa14woRl+Teh62vcCwiSuQzI8HzYt8It
   Y67GZ/ouDOScJHyg4xCOrI0qSv4Mk8nwZHT5X5yNwHqp0xkQJWoNM9fH8
   A==;
X-CSE-ConnectionGUID: tyHkYh4fSTy5pwduFrcYZw==
X-CSE-MsgGUID: Og7/Ib4RTDWrE0O0eRVSuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89046104"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89046104"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:11:44 -0700
X-CSE-ConnectionGUID: Ny7ZE/t/TfmEVydPKDThbw==
X-CSE-MsgGUID: 1WuIYdVTTB27HPSTTyDkow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2136646"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 10:11:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Fe8-000000008HK-0DwQ;
	Thu, 17 Sep 2026 17:11:40 +0000
Date: Fri, 18 Sep 2026 01:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@unseen.parts>
Subject: arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse:
 cast to non-scalar
Message-ID: <202609180147.cW02eIhR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: dd5712f3379cfe760267cdd28ff957d9ab4e51c7 alpha: fix user-space corruption during memory compaction
date:   8 months ago
config: alpha-randconfig-r1304-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180147.cW02eIhR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180147.cW02eIhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180147.cW02eIhR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
--
   mm/mremap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/mremap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/mremap.c:313:18: sparse: sparse: context imbalance in 'move_ptes' - unexpected unlock
--
   mm/madvise.c: note: in included file (through include/linux/mm.h, include/linux/mman.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/madvise.c:212:17: sparse: sparse: context imbalance in 'swapin_walk_pmd_entry' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/madvise.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/mman.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/madvise.c:562:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - different lock contexts for basic block
   mm/madvise.c: note: in included file (through include/linux/mm.h, include/linux/mman.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/madvise.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/mman.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/madvise.c:781:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - different lock contexts for basic block
   mm/madvise.c: note: in included file (through include/linux/mm.h, include/linux/mman.h):
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
--
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c:816:17: sparse: sparse: context imbalance in 'get_mergeable_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file:
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'write_protect_page' - unexpected unlock
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/ksm.c:1461:42: sparse: sparse: context imbalance in 'replace_page' - different lock contexts for basic block
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c:2563:9: sparse: sparse: context imbalance in 'ksm_next_page_pmd_entry' - different lock contexts for basic block
--
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through arch/alpha/include/asm/page.h, include/linux/shm.h, include/linux/sched.h, include/linux/vmalloc.h):
   include/asm-generic/memory_model.h:30:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   mm/vmalloc.c:549:21: sparse: signed value source
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c:1128:25: sparse: sparse: context imbalance in 'find_vmap_area_exceed_addr_lock' - wrong count at exit
   mm/vmalloc.c:4671:28: sparse: sparse: context imbalance in 'vread_iter' - unexpected unlock
--
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:238:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:380:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:462:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - different lock contexts for basic block
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:1506:26: sparse: sparse: context imbalance in 'move_pages_ptes' - unexpected unlock
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
--
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'folio_referenced_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'try_to_unmap_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'try_to_migrate_one' - unexpected unlock
--
   mm/memory.c:876:38: sparse: sparse: cast to non-scalar
   mm/memory.c:876:38: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:361:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:1331:9: sparse: sparse: context imbalance in 'copy_pte_range' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2220:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2326:9: sparse: sparse: context imbalance in 'insert_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2611:9: sparse: sparse: context imbalance in 'insert_pfn' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:3193:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c:3826:42: sparse: sparse: context imbalance in 'wp_page_copy' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:3865:19: sparse: sparse: context imbalance in 'finish_mkwrite_fault' - different lock contexts for basic block
   mm/memory.c:3896:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3922:17: sparse: sparse: context imbalance in 'wp_page_shared' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4088:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4350:9: sparse: sparse: context imbalance in 'remove_device_exclusive_entry' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4376:19: sparse: sparse: context imbalance in 'pte_marker_clear' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4621:12: sparse: sparse: context imbalance in 'do_swap_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5280:9: sparse: sparse: context imbalance in 'do_anonymous_page' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5512:12: sparse: sparse: context imbalance in 'finish_fault' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5896:9: sparse: sparse: context imbalance in 'do_fault' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6025:17: sparse: sparse: context imbalance in 'do_numa_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6301:9: sparse: sparse: context imbalance in 'handle_pte_fault' - unexpected unlock
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6743:5: sparse: sparse: context imbalance in 'follow_pfnmap_start' - different lock contexts for basic block
   mm/memory.c:6829:28: sparse: sparse: context imbalance in 'follow_pfnmap_end' - unexpected unlock

vim +278 arch/alpha/include/asm/pgtable.h

   273	
   274	static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
   275						unsigned long address,
   276						pte_t *ptep)
   277	{
 > 278		pte_t pte = READ_ONCE(*ptep);
   279	
   280		pte_clear(mm, address, ptep);
   281		return pte;
   282	}
   283	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
