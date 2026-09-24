Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C2A368277
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217143; cv=none; b=fhjMHXO+1HelzRbCXV05XIN1M9bc03YEd6TzcVWSZAlyXU6M0nGOrXdbrRDXZ4tekXLz0Ptf5D50d0Ycz46tAUDpU4EECpKMp5nxPDN4zGC4EEGLf4sjWSdAaCB72iUBVWUFoPrB/p3R2/jqY0AMBS/WtUWTgBqumd2QtIJkKss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217143; c=relaxed/simple;
	bh=aw7qZwIXpGXOmSs1ULjd8Cr81ugs2SyoXsZIXwSlKtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kZrWo7F2K8mux3UNrWSt6ahQsQgm8Nc7uPULmUy7ePE3jpdso4Vv3qYeHABftZ4MX18lJ9tfUtUYPSmbe10iv+8Kqqzp6Z6lFUa1uWKtd2KRdleAwoWwcZ4abyiYo3nw4qVXSzb3LBaw9hiz6XtWxkFzA3l48VzjOC+vvsQFXV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dt8pihoj; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dt8pihoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790217141; x=1821753141;
  h=date:from:to:cc:subject:message-id;
  bh=aw7qZwIXpGXOmSs1ULjd8Cr81ugs2SyoXsZIXwSlKtQ=;
  b=Dt8pihojgoP+vWqzYDIpPwfWv7CqS4FQrlWIJ6XoNpGkHMUl+jzSmSTF
   VaJ2Vn9PkerDB9Jl9Biwby6nAMg0vzxeE+hVa3gv6M5h98fwOkWh3LFxz
   MfhOPQGSEkW14XH1mRWqDxMqKIDbqIUVaC0lLZlgimTe36LDbqgirVvZL
   fnE2qN5OU86bx6wtQOJw1LjWti0p3GY/FUfyNJmfwkQ641KL9TgyYyNGi
   zRL+vYpxFvIEpDwQoua7Dhj/NkTteq1TFlI4d8VppI3dcLmp+hfa3GpK8
   eJzESWQyxf17OR4sJ6W01uPbmvPdrcpOm/PFtC7RwhebGr3QNy8MR1XeT
   Q==;
X-CSE-ConnectionGUID: y1cZqutpT92yCoMXIA1bbQ==
X-CSE-MsgGUID: W6IsMekASzCmvDm/pb1w5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1472196"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1472196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 19:32:21 -0700
X-CSE-ConnectionGUID: kVvdyMzFSEyb9J6Ig6lArQ==
X-CSE-MsgGUID: JRaLN8S1QuKMnD8eeSsDFQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 19:32:19 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ZFw-00000000I78-27Ur;
	Thu, 24 Sep 2026 02:32:16 +0000
Date: Thu, 24 Sep 2026 10:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, JP Kobryn <inwardvessel@gmail.com>
Subject: mm/bpf_memcontrol.c:125:27: sparse: sparse: symbol
 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
Message-ID: <202609241059.dkB8hWSY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 99430ab8b804c26b8a0dec93fcbfe75469f3edc7 mm: introduce BPF kfuncs to access memcg statistics and events
date:   9 months ago
config: sparc-randconfig-r1307-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241059.dkB8hWSY-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241059.dkB8hWSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 99430ab8b804 ("mm: introduce BPF kfuncs to access memcg statistics and events")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241059.dkB8hWSY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:125:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:68:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block

vim +/bpf_mem_cgroup_memory_events +125 mm/bpf_memcontrol.c

   117	
   118	/**
   119	 * bpf_mem_cgroup_memory_events - Read memory cgroup's memory event value
   120	 * @memcg: memory cgroup
   121	 * @event: memory event id
   122	 *
   123	 * Return: The current value of the memory event counter.
   124	 */
 > 125	__bpf_kfunc unsigned long bpf_mem_cgroup_memory_events(struct mem_cgroup *memcg,
   126							       enum memcg_memory_event event)
   127	{
   128		if (unlikely(event >= MEMCG_NR_MEMORY_EVENTS))
   129			return (unsigned long)-1;
   130	
   131		return atomic_long_read(&memcg->memory_events[event]);
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
