Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F291A683E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790392841; cv=none; b=cSS8hIh+jXcViJ2/bXsZ2t4BKC154ZSrAbdeBPRYehSWGm7CEZz3x/la8TXWw46i9rugjpUr0fui8sNzZcgwVmDRJIjUi+gmdQIGkZJNrHbh7uqbeGz6SX57uKVvgkoGh7phXJP6lO8PxKX5Gp0/ahCQN1o5pQsm84bN4dDm0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790392841; c=relaxed/simple;
	bh=P/bCX5AdMr5MaOBp32K22GmqqfZLbc+/8PqG6/hbOrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PsXDqFi1j6nLKLKw3O1deHeKcZp4aQRSZDWh/r27wGReu9g8T9Qlo3F1c36b+1vCGSgKtCok2G1mycPvTKa1KmySxoo5+dAXfadZ2izw/NidgPTkxfZZ/nJajK3Go7EH1W3NfHAy4m9T5QRLinjoInmRHELEg6Chfi9HvqNADvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjJPJxMA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjJPJxMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790392840; x=1821928840;
  h=date:from:to:cc:subject:message-id;
  bh=P/bCX5AdMr5MaOBp32K22GmqqfZLbc+/8PqG6/hbOrc=;
  b=HjJPJxMAUF1Ju6PLpL7lxpx+VB8+l6vGQ2+DPJJHWljlWyC5W9UMIPHC
   SEOkWdbv5Z5chU8Rr6VV8OALScjTHukBUjptfUdp0/MxP7CzShlRyioAD
   kfzuEoPh7kKNsXTzTG1R1GV1YRnOpRT/qc5NQOtwGzH54Z3x5i7NRQ9+i
   RoUzuW4GU171CBVow+tLR5WAnc5pV5Ytt4mHMQDHwFHG6hZlVFoxqwgu2
   43neNt1Eva6vLCSv0HvXAnZHSYrabUnvA0oaSAz8go2ixTjHBTJ4uf/g3
   ygXrerCF+5r/61bEL3PA+PQ+bopkLRpiEZDu0Ul9DCtSUXb2Q5R/c6Z6Y
   w==;
X-CSE-ConnectionGUID: 304TE2TQTd2U0iWomwIvGA==
X-CSE-MsgGUID: 4RI3/FpUS3+/GkukL/SQqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90238799"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90238799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:20:39 -0700
X-CSE-ConnectionGUID: mR8iIfQWTIuVmSW/GiLjMQ==
X-CSE-MsgGUID: tM6NJsxpTxmVt/F+VwWwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273094132"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2026 20:20:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAIxn-00000000LTF-1o3R;
	Sat, 26 Sep 2026 03:20:35 +0000
Date: Sat, 26 Sep 2026 11:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202609261131.0lGWzTQR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
commit: 4708fba19adee9ba14ef28af6face4ab043d9cd6 powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
date:   1 year ago
config: powerpc64-randconfig-r1305-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261131.0lGWzTQR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261131.0lGWzTQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4708fba19ade ("powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261131.0lGWzTQR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/perf/vpa-dtl.c:254:30: sparse:     expected unsigned int [usertype]
   arch/powerpc/perf/vpa-dtl.c:254:30: sparse:     got restricted __be32 [usertype]

vim +254 arch/powerpc/perf/vpa-dtl.c

   241	
   242	static int vpa_dtl_event_add(struct perf_event *event, int flags)
   243	{
   244		int ret, hwcpu;
   245		unsigned long addr;
   246		struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
   247	
   248		/*
   249		 * Register our dtl buffer with the hypervisor. The
   250		 * HV expects the buffer size to be passed in the second
   251		 * word of the buffer. Refer section '14.11.3.2. H_REGISTER_VPA'
   252		 * from PAPR for more information.
   253		 */
 > 254		((u32 *)dtl->buf)[1] = cpu_to_be32(DISPATCH_LOG_BYTES);
   255		dtl->last_idx = 0;
   256	
   257		hwcpu = get_hard_smp_processor_id(event->cpu);
   258		addr = __pa(dtl->buf);
   259	
   260		ret = register_dtl(hwcpu, addr);
   261		if (ret) {
   262			pr_warn("DTL registration for cpu %d (hw %d) failed with %d\n",
   263				event->cpu, hwcpu, ret);
   264			return ret;
   265		}
   266	
   267		/* set our initial buffer indices */
   268		lppaca_of(event->cpu).dtl_idx = 0;
   269	
   270		/*
   271		 * Ensure that our updates to the lppaca fields have
   272		 * occurred before we actually enable the logging
   273		 */
   274		smp_wmb();
   275	
   276		/* enable event logging */
   277		lppaca_of(event->cpu).dtl_enable_mask = event->attr.config;
   278	
   279		vpa_dtl_start_hrtimer(event);
   280	
   281		return 0;
   282	}
   283	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
