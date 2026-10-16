Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87AC421225
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134975; cv=none; b=TwUb1pkGZeAYTVlF2lKd64KjdBZmYROARwLTjA1n4twkTWlpuAmIZYPo1vmyt0P++H5JZ70GjnGaRQf7OXfk+t8A3NEgD4RhTuGl2pXa+SeVrxRxeTLHGxHJw17yIDhhO9Myw2soXChuM2PbMSCsAZIKHNqK3Pu0GU/Y71s+nyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134975; c=relaxed/simple;
	bh=bU78VtmXfQh6spthBjgS3Kwk7sGprvT1XD/O+tZe9Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avNQZGqDJHg0I127B2zm9gga6ZOUR9i/6Gb2AohNXBP9lf7iX0ap80ydh84nA8pNP5HNtAGLQ7NgAPB/Zp65syUr+/a2MTpfJIIxVcLqeNbuNibWRBlWqTME/bnp7g0P/aKastP3zzldF4yVc37gYhy/nBVTKOlcE5Zh7QDrBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1ZGAO7q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1ZGAO7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792134973; x=1823670973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bU78VtmXfQh6spthBjgS3Kwk7sGprvT1XD/O+tZe9Pk=;
  b=Q1ZGAO7q8VZBI0sZy1zNdHpx9q/X9ytgmRYgEBXAO0pFp1srAXRInSwV
   icKBP91c5DiqZhsgr+Z///1FT4FiyojM7OTurLzcTwdA0U7FKv8HwoLBY
   lRwAqpgfMHQbdYH40tHZ/uXvq4mJIa37pPNf3jElTwZowBGlT7IrWyZnu
   nVGoH6o7+yZtQra/6rA1khvEFyF/eopY0tcoNAhEzzeCqiYI4qYYhaOEs
   BqwA2rRoPHwlJfF3gvjgvJXy5fQTQvGCrvD/Q4FfFUg+tvp+RTJjg02Zd
   jjrKKobMV0Z8HMhu34ELFJccYc28X7LTYOPvgKkPNaYTPl7kLfjVVFzwa
   A==;
X-CSE-ConnectionGUID: i36mhYXITcOuUTIfpewKQQ==
X-CSE-MsgGUID: ZaEcW41YSdehjW/dTWAaaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="796099"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="796099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 00:16:13 -0700
X-CSE-ConnectionGUID: DMuzrHjpTxCY23vm6G69+Q==
X-CSE-MsgGUID: +ENxbeauS2m2WQCA6a/K8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1885575"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2026 00:16:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHcAh-00000000Ho6-1MOP;
	Fri, 16 Oct 2026 07:16:07 +0000
Date: Fri, 16 Oct 2026 15:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	peterz@infradead.org, david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: Re: [PATCH v3 3/9] stop_machine: Introduce
 stop_machine_nmi_cpuslocked()
Message-ID: <202610161559.cSgd4JA0-lkp@intel.com>
References: <20261015211426.49114-4-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015211426.49114-4-chang.seok.bae@intel.com>

Hi Chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-S-Bae/stop_machine-Refactor-multi-CPU-stop-glue-code/20261015-211418
base:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
patch link:    https://lore.kernel.org/r/20261015211426.49114-4-chang.seok.bae%40intel.com
patch subject: [PATCH v3 3/9] stop_machine: Introduce stop_machine_nmi_cpuslocked()
config: i386-randconfig-1013-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161559.cSgd4JA0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161559.cSgd4JA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161559.cSgd4JA0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:63,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/stop_machine.h:226:74: error: unknown type name 'conststruct'; did you mean 'const_true'?
     226 | stop_machine_nmi_cpulocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data, conststruct cpumask *cpus)
         |                                                                          ^~~~~~~~~~~
         |                                                                          const_true
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1 shuffle=3873254352
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=3873254352
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3873254352
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3873254352
   make: Target 'prepare' not remade because of errors.


vim +226 include/linux/stop_machine.h

   200	
   201	/**
   202	 * stop_machine_nmi_cpuslocked() - Freeze CPUs and run a function in NMI context
   203	 *
   204	 * @nmisafe_fn:	The function to run
   205	 * @data:	The data pointer for @nmisafe_fn()
   206	 * @cpus:	The CPUs to run @nmisafe_fn() on (NULL = one unspecified online CPU)
   207	 *
   208	 * Description: This stop_machine() variant runs @nmisafe_fn() from NMI context
   209	 * to prevent preemption by other NMIs. The callback must be built with noinstr.
   210	 * Other than that, the semantics match stop_machine_cpuslocked().
   211	 *
   212	 * Context: Must be called from within a cpus_read_lock() protected region.
   213	 * Avoid nested calls to cpus_read_lock().
   214	 *
   215	 * Return: 0 if all invocations of @nmisafe_fn return zero, -ENOMEM if cpumask
   216	 * allocation fails, -EINVAL if not initialized yet or any target CPU failed to
   217	 * receive NMI. Otherwise, the value returned by an arbitrarily chosen member of
   218	 * the set of calls to @nmisafe_fn that returned non-zero.
   219	 */
   220	int stop_machine_nmi_cpuslocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data,
   221					const struct cpumask *cpus);
   222	
   223	#else
   224	static inline bool stop_machine_nmi_handler(void) { return false; }
   225	static inline int
 > 226	stop_machine_nmi_cpulocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data, conststruct cpumask *cpus)
   227	{
   228		return 0;
   229	}
   230	#endif /* CONFIG_STOP_MACHINE_NMI */
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
