Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DEF481FC7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197176; cv=none; b=qsxwIrCDtZP7+RTpFuZT7L2mB7Px3S7N8b1pUO53cWfiQeywHnRNU7JpDl5uHzohZbTU9tmF57nz6MSl5Z3sswBAHLJLvuFUnqbvgVFumsFf2pLaCeMNZNGJLxF9cSDfZ79sEmBt5HXzd7vbRaNSw5VtNmvUkE2JlXh4euzVQa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197176; c=relaxed/simple;
	bh=KgY8MHecWP1QTzvk8/yhoISCx0XO/mUI+M+KPqGjYxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gOaFHd1f2kBHUjG3jz4/GhWhpwQFdqjeL9JltuvFoBjatpOVLHGbaJAHnElr8qx44Hp1eGTly3eI5KDf7lMOFC7lqKshEElH6KWq1aMuKMfqn0I8kbfub5IYnLGXkdG8S3UXjteAmb0gqi5KDmzsGSxQBM2vsdsWo9ndKZ3HSxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5SkMJm/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5SkMJm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790197174; x=1821733174;
  h=date:from:to:cc:subject:message-id;
  bh=KgY8MHecWP1QTzvk8/yhoISCx0XO/mUI+M+KPqGjYxA=;
  b=A5SkMJm/oQZeYwmmQpxW6oOoCE+KHHqre+ZCqqG2cK6jfM+bY0e8kntC
   BOJKsP365QgG5GpIG+Kks7gWGcJMHwUKmU0oxTQVdBCVxm2M7Zmt0w8ix
   ZxGHFfwsa0e4++81M0UPlkrFN32yHNKF5jov2q8aCQVzlVmZ+sVHLGE03
   /HAJX7/X/Y6x+iIxqJYC+cN7otxNkuLoBviH63sAEkuLNiBC6qYItohCe
   xu3+UD9U2dWHFCZJuVDi/dQut6/e1tc3uB1qAM2sseLvoPWmug+OzAY2h
   Mx9ii5854i4crpxNlFUUIk8GZUc8voobTbqU+o3mZxZQBuWLIBWDuftlF
   g==;
X-CSE-ConnectionGUID: 3zB2LZVaRr2fq/u7gLpylw==
X-CSE-MsgGUID: FDU9K+dASySLJAKiC6xtEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101517863"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="101517863"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 13:59:34 -0700
X-CSE-ConnectionGUID: ffsSfDmkQWeTXwSdeSJnDA==
X-CSE-MsgGUID: VgTrJ3g1SqqX2fobck6gfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4867264"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 13:59:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9U3t-00000000HjS-3lhD;
	Wed, 23 Sep 2026 20:59:29 +0000
Date: Thu, 24 Sep 2026 04:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: include/linux/jiffies.h:449:36: sparse: sparse: cast
 truncates bits from constant value (7fffffffffffffff becomes ffffffff)
Message-ID: <202609240410.96llJ8tB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: b777b5e09eabeefc6ba80f4296366a4742701103 time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
date:   8 months ago
config: x86_64-randconfig-r1308-20260923 (https://download.01.org/0day-ci/archive/20260924/202609240410.96llJ8tB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240410.96llJ8tB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b777b5e09eab ("time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240410.96llJ8tB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/gt/intel_engine_cs.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)

vim +449 include/linux/jiffies.h

   433	
   434	/*
   435	 * Convert various time units to each other:
   436	 */
   437	
   438	#if HZ <= MSEC_PER_SEC && !(MSEC_PER_SEC % HZ)
   439	/**
   440	 * jiffies_to_msecs - Convert jiffies to milliseconds
   441	 * @j: jiffies value
   442	 *
   443	 * This inline version takes care of HZ in {100,250,1000}.
   444	 *
   445	 * Return: milliseconds value
   446	 */
   447	static inline unsigned int jiffies_to_msecs(const unsigned long j)
   448	{
 > 449		return (MSEC_PER_SEC / HZ) * j;
   450	}
   451	#else
   452	unsigned int jiffies_to_msecs(const unsigned long j);
   453	#endif
   454	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
