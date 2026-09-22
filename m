Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAAC4908CA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101733; cv=none; b=rZTyD6wiquzKZvbtbese/yBn4wyEYt1egyTL2Wod0ZQ963ozkTqny6Sqx18nAwtswvjpugWMsfjmZv5LJc/q7HhA+v4SsPDG2rl9NNy/TxwfXrHE3Koro7sq5RaZ5GOlxlBRo0gxAJvOSbmJeI50++QK2Hy7loZ83sdlYuWDifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101733; c=relaxed/simple;
	bh=BNdvhp80ZcJoxFgJFaKETqH+ahUzvTlwsgSGbDEPm0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AtIRSbiJV92mf08mr+Hti8aQX06eqQoPxB866RlQMnpqQMX0V20TWqiE4ZK7dSVt2RXmosDZ4V1h60Ab/excjxoFmPh0SHcAU+Wkou4QFsd+DTgTL8Yh/WkimhwkByARctM27tVLQ2nUBr0ttMtqy47uf55Pmchd9fbulQzS9JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg4pqnwv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg4pqnwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790101730; x=1821637730;
  h=date:from:to:cc:subject:message-id;
  bh=BNdvhp80ZcJoxFgJFaKETqH+ahUzvTlwsgSGbDEPm0U=;
  b=Jg4pqnwvt6IXDuqadztZaREPfHUeNkEbMD++ZuIabdMHrfUQ4+Y89MnX
   kQLwoS78IWpwFoq0EzKIzNJJqbm3CY5TbYZ7OTjUOr/H55LNg6Z56UHgN
   XkCHUr9yoplxii4MH9PNdPQeqI9u8cepTd/+tbsQjaYSt3PxzxzAxPa28
   RJovvSpbPMkikxyjzbT8800kqofMp0NupAO77NcFCkEVPEwTmhb0mzaNv
   p8hNgnuMSA7SQTkwArl4Le+IY5B4ajkjKdv+QuK+gIrhG9uZfgcYeQsq+
   HMSK/bpwhrlxmKrfOHMPxp2/1Cd71zN968T987WTCuaw1b4OwXXL9eKU7
   g==;
X-CSE-ConnectionGUID: uXUc9TPJSYOmVNADvnDWeQ==
X-CSE-MsgGUID: VmApWJocRC2Akf9CNeYMVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116260581"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="116260581"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:28:48 -0700
X-CSE-ConnectionGUID: jSs9LCfORmSYjU/oYkXLBQ==
X-CSE-MsgGUID: abZZTjUBSieadro3f3w8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4535282"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 22 Sep 2026 11:28:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x95ES-00000000FsY-1eui;
	Tue, 22 Sep 2026 18:28:44 +0000
Date: Wed, 23 Sep 2026 02:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: include/linux/jiffies.h:470:36: sparse: sparse: cast
 truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
Message-ID: <202609230241.mqecl3OP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: b777b5e09eabeefc6ba80f4296366a4742701103 time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
date:   7 months ago
config: alpha-randconfig-r1307-20260922 (https://download.01.org/0day-ci/archive/20260923/202609230241.mqecl3OP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230241.mqecl3OP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b777b5e09eab ("time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230241.mqecl3OP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-mlxcpld.c: note: in included file (through include/linux/delay.h):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   drivers/i2c/busses/i2c-nomadik.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/workqueue.h, include/linux/srcu.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   drivers/i2c/busses/i2c-k1.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/workqueue.h, include/linux/srcu.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   drivers/i2c/busses/i2c-npcm7xx.c:1387:61: sparse: sparse: Using plain integer as NULL pointer
   drivers/i2c/busses/i2c-npcm7xx.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/workqueue.h, include/linux/srcu.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   drivers/i2c/busses/i2c-qup.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)

vim +470 include/linux/jiffies.h

   454	
   455	#if !(USEC_PER_SEC % HZ)
   456	/**
   457	 * jiffies_to_usecs - Convert jiffies to microseconds
   458	 * @j: jiffies value
   459	 *
   460	 * Return: microseconds value
   461	 */
   462	static inline unsigned int jiffies_to_usecs(const unsigned long j)
   463	{
   464		/*
   465		 * Hz usually doesn't go much further MSEC_PER_SEC.
   466		 * jiffies_to_usecs() and usecs_to_jiffies() depend on that.
   467		 */
   468		BUILD_BUG_ON(HZ > USEC_PER_SEC);
   469	
 > 470		return (USEC_PER_SEC / HZ) * j;
   471	}
   472	#else
   473	unsigned int jiffies_to_usecs(const unsigned long j);
   474	#endif
   475	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
