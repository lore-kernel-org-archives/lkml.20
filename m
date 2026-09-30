Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B631330307
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745227; cv=none; b=CyXwCRj1sMrQpiFyd8zWStqBawVd5UuagGHHpykpny+eWOKv9S4PLjO/JQ0GJXJednx0+aIsR7yXYHCIYhfLHayC/qRlvmMuEeT1m4Ike+G/ufcSMlxmUBEqMIPUuTpsyE9llrh+3JjChEjcRhMSruFu/By0b5UFdSGv2kZwkDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745227; c=relaxed/simple;
	bh=spsRrOS6HujQ4RNUmVsdvHi9Us8q7pB4c3KmtoECrTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t8Hf+qNe5yb2qP2XC+0ZQg14aSCQl55M8SL+WowADFlZN9no+XT5MfZjDvJVZQVvr8InXg3jLsELprVYxt1XQ3jLVtLN2Tra16P3MadyHoJxE7mQpi3YITPaqsKspez2fRlV74lNeB/10fMKBqhw4v9AswjYkT0cYOjed8Ne3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0CLHQFU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0CLHQFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790745227; x=1822281227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spsRrOS6HujQ4RNUmVsdvHi9Us8q7pB4c3KmtoECrTM=;
  b=f0CLHQFUqODq3+mo0t1gb29/n13UNyvVg5MvBVE49Lmlr8LSpxeNRROh
   KysYSO/eMiwh8xIDlnNPixQ/J7QrjpomO+QPrsNCzEFBjuCsc/PyK+HF5
   YuOi2GenCkU0y3pajuPdG0ADy3t5jEAJXdBwF3NjRppdxN4L5z7Ks8LEp
   eFtaekfjEBpTelszB6DZ1zt4SL//sp0JdkfDB5TfJQo4FliA+XuRh38dy
   ugt97putMtscSQbzBISdLv+rMG6nFI6HXYr7iUjqH+3RpNPCdp2GcjqSt
   Pe0sThFNSorcoCZO8KRkqcSmu+yK/4TzO8IrgIXHOLZqaBNrPrMkRLI7f
   w==;
X-CSE-ConnectionGUID: FgcikHQgR5a64HYvdd63iA==
X-CSE-MsgGUID: nI5rRgwtQDaXIkqgYBL2Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="100802891"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="100802891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:13:46 -0700
X-CSE-ConnectionGUID: pjQITmcGSb+3lgeQg8mHqw==
X-CSE-MsgGUID: TudCFCKYSUKypj8syRGSoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278789183"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2026 22:13:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBmdR-00000000QA4-0xHe;
	Wed, 30 Sep 2026 05:13:41 +0000
Date: Wed, 30 Sep 2026 13:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [tip:timers/vdso 1/4] include/vdso/math64.h:14:17: error:
 implicit declaration of function 'OPTIMIZER_HIDE_VAR'
Message-ID: <202609301300.uAawkHuh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   ca46a07c4b68246c4e400ce3649ab7228a878d8f
commit: 37db375ad90467d7e3ce4e450b3d1c4f297d4ed3 [1/4] vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
config: m68k-atari_defconfig (https://download.01.org/0day-ci/archive/20260930/202609301300.uAawkHuh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301300.uAawkHuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301300.uAawkHuh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/math64.h:8,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/md/md-linear.c:7:
   include/vdso/math64.h: In function '__iter_div_u64_rem':
>> include/vdso/math64.h:14:17: error: implicit declaration of function 'OPTIMIZER_HIDE_VAR' [-Wimplicit-function-declaration]
      14 |                 OPTIMIZER_HIDE_VAR(dividend);
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/math64.h:8,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/md/raid5.c:38:
   include/vdso/math64.h: In function '__iter_div_u64_rem':
>> include/vdso/math64.h:14:17: error: implicit declaration of function 'OPTIMIZER_HIDE_VAR' [-Wimplicit-function-declaration]
      14 |                 OPTIMIZER_HIDE_VAR(dividend);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c: In function 'handle_stripe_dirtying':
   drivers/md/raid5.c:4306:21: warning: variable 'qread' set but not used [-Wunused-but-set-variable=]
    4306 |                 int qread =0;
         |                     ^~~~~
--
   In file included from include/linux/math64.h:8,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from raid5.c:38:
   include/vdso/math64.h: In function '__iter_div_u64_rem':
>> include/vdso/math64.h:14:17: error: implicit declaration of function 'OPTIMIZER_HIDE_VAR' [-Wimplicit-function-declaration]
      14 |                 OPTIMIZER_HIDE_VAR(dividend);
         |                 ^~~~~~~~~~~~~~~~~~
   raid5.c: In function 'handle_stripe_dirtying':
   raid5.c:4306:21: warning: variable 'qread' set but not used [-Wunused-but-set-variable=]
    4306 |                 int qread =0;
         |                     ^~~~~


vim +/OPTIMIZER_HIDE_VAR +14 include/vdso/math64.h

     4	
     5	static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
     6	{
     7		u32 ret = 0;
     8	
     9		while (dividend >= divisor) {
    10			/*
    11			 * Prevent the compiler from optimising this loop into a
    12			 * modulo operation.
    13			 */
  > 14			OPTIMIZER_HIDE_VAR(dividend);
    15	
    16			dividend -= divisor;
    17			ret++;
    18		}
    19	
    20		*remainder = dividend;
    21	
    22		return ret;
    23	}
    24	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
