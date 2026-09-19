Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F30929408
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789784584; cv=none; b=sKw7CjvsClf7E7KNAf+M+ZcEhKmI0uzIb7mx7sxppa65+fUDjMGyu2NjgET35ISfERs9jlo8z5XzIxQC91e1K6yUXKZCi9h88jxYkL15JbVQ+SfP0FafkZ9xgaVsfwsrAW2MoEdAVjNiQ7OT9gn4W7ePplgPaPUZTMKDhG9qMk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789784584; c=relaxed/simple;
	bh=F5plFVXlHqejTzkFIhtUpn09XXP5HVZlaKCxC75oCf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bt7zZaLmq1dTpKfMEwYlZ5krAdWqWO3cHMAzPoxBKr0WLiLi0n+yoSZfuF9CzZG9JC1DafUwUk06kGtItleAEQXukWMSG+CGekgGeK7dsUjKJCgHGVM+jMo4P0m6RPdRRIhzuaIeCACQBk/x/LRrgwZx3oXWHc5ZdT+QuGtg5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uys930np; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uys930np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789784582; x=1821320582;
  h=date:from:to:cc:subject:message-id;
  bh=F5plFVXlHqejTzkFIhtUpn09XXP5HVZlaKCxC75oCf4=;
  b=Uys930npeKMJX9R/vWFuAEmqvluzd+czouMfKjxo15UrvYWAuR8xs4zy
   gucQ55KFG4SQ1vGPOix8lRThLFWrzlgdm5dXnYqCoEvVJiNORpfg2bskx
   zPV8vyhvpC3PONSQqNyVxsb0Ti38l2U1RRm7Ns3oqpTz2357i5m/e0jX0
   kjYcOmZPStphaTHNRAvtw2dVFFSt/yJN2ZSgaOpuXB213764Jyg5cFZ5j
   4vhIQlAjTuZOWEIuf9lWyiLxglhEtQGjdhZyT6W4NPUzxY+ycklIR0IKk
   3q3w4S64lJM6cf88mkT2/ZJFpZJBRtsD95qhWPtEbsoz6jCXJM8PZskdE
   Q==;
X-CSE-ConnectionGUID: qArcEL7ZRpujUZ89FcFK8A==
X-CSE-MsgGUID: xUYPynrTQjGJsgfjmA244Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100922163"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100922163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 19:23:01 -0700
X-CSE-ConnectionGUID: XSMB3to/Q1KSJEOK5FcZmQ==
X-CSE-MsgGUID: IadGu1wIT8SX6lJnVhaNtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="279886291"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Sep 2026 19:22:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7kjB-00000000Aaj-0WDK;
	Sat, 19 Sep 2026 02:22:57 +0000
Date: Sat, 19 Sep 2026 10:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: kernel/futex/core.c:1870:21: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <202609191020.VPOLEfEq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: bde0238083647381d4747355c5a19115a3422b96 futex: Fix race on the initial mm->futex.phash.ref allocation
date:   5 weeks ago
config: riscv-randconfig-r1307-20260919 (https://download.01.org/0day-ci/archive/20260919/202609191020.VPOLEfEq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 05d706e9a816dbf9eff31f47869f53d6fe796089)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191020.VPOLEfEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bde023808364 ("futex: Fix race on the initial mm->futex.phash.ref allocation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191020.VPOLEfEq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   kernel/futex/core.c:536:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:536:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:536:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:536:51: sparse:     got void *
   kernel/futex/core.c:552:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:552:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:552:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:552:51: sparse:     got void *
>> kernel/futex/core.c:1870:21: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +1870 kernel/futex/core.c

  1836	
  1837	static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
  1838	{
  1839		struct mm_struct *mm = current->mm;
  1840		struct futex_private_hash *fph;
  1841		bool custom = flags & FH_CUSTOM;
  1842		int i;
  1843	
  1844		if (hash_slots && (hash_slots == 1 || !is_power_of_2(hash_slots)))
  1845			return -EINVAL;
  1846	
  1847		/*
  1848		 * Once we've disabled the global hash there is no way back.
  1849		 */
  1850		scoped_guard(rcu) {
  1851			fph = rcu_dereference(mm->futex.phash.hash);
  1852			if (fph && !fph->hash_mask) {
  1853				if (custom)
  1854					return -EBUSY;
  1855				return 0;
  1856			}
  1857		}
  1858	
  1859		if (!mm->futex.phash.ref) {
  1860			unsigned int __percpu *ref = alloc_percpu(unsigned int);
  1861	
  1862			if (!ref)
  1863				return -ENOMEM;
  1864	
  1865			/*
  1866			 * Tasks sharing the mm can run this concurrently, so take the
  1867			 * initial reference before publishing the counter.
  1868			 */
  1869			this_cpu_inc(*ref); /* 0 -> 1 */
> 1870			if (cmpxchg(&mm->futex.phash.ref, NULL, ref))
  1871				free_percpu(ref);
  1872		}
  1873	
  1874		fph = kvzalloc(struct_size(fph, queues, hash_slots),
  1875			       GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
  1876		if (!fph)
  1877			return -ENOMEM;
  1878	
  1879		fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
  1880		fph->custom = custom;
  1881		fph->mm = mm;
  1882	
  1883		for (i = 0; i < hash_slots; i++)
  1884			futex_hash_bucket_init(&fph->queues[i]);
  1885	
  1886		if (custom) {
  1887			/*
  1888			 * Only let prctl() wait / retry; don't unduly delay clone().
  1889			 */
  1890	again:
  1891			wait_var_event(mm, futex_pivot_pending(mm));
  1892		}
  1893	
  1894		scoped_guard(mutex, &mm->futex.phash.lock) {
  1895			struct futex_private_hash *free __free(kvfree) = NULL;
  1896			struct futex_private_hash *cur, *new;
  1897	
  1898			cur = rcu_dereference_protected(mm->futex.phash.hash,
  1899							lockdep_is_held(&mm->futex.phash.lock));
  1900			new = mm->futex.phash.hash_new;
  1901			mm->futex.phash.hash_new = NULL;
  1902	
  1903			if (fph) {
  1904				if (cur && !cur->hash_mask) {
  1905					/*
  1906					 * If two threads simultaneously request the global
  1907					 * hash then the first one performs the switch,
  1908					 * the second one returns here.
  1909					 */
  1910					free = fph;
  1911					mm->futex.phash.hash_new = new;
  1912					return -EBUSY;
  1913				}
  1914				if (cur && !new) {
  1915					/*
  1916					 * If we have an existing hash, but do not yet have
  1917					 * allocated a replacement hash, drop the initial
  1918					 * reference on the existing hash.
  1919					 */
  1920					futex_ref_drop(cur);
  1921				}
  1922	
  1923				if (new) {
  1924					/*
  1925					 * Two updates raced; throw out the lesser one.
  1926					 */
  1927					if (futex_hash_less(new, fph)) {
  1928						free = new;
  1929						new = fph;
  1930					} else {
  1931						free = fph;
  1932					}
  1933				} else {
  1934					new = fph;
  1935				}
  1936				fph = NULL;
  1937			}
  1938	
  1939			if (new) {
  1940				/*
  1941				 * Will set mm->futex.phash.new_hash on failure;
  1942				 * futex_private_hash_get() will try again.
  1943				 */
  1944				if (!__futex_pivot_hash(mm, new) && custom)
  1945					goto again;
  1946			}
  1947		}
  1948		return 0;
  1949	}
  1950	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
