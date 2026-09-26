Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7C54707B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388115; cv=none; b=BM9wDVK8Z8Uqz1Wx5KpIb/faKxzQRxWcETk2MbzkYBpQCWOY9UH1MMP4iO2UFFz6GIKucuuIp+I5R7T6r4vrDh2MUu+PHJMUgG1nk6bbAqOY1mlbUDHuFuEym/aDlke+2URNVyC7e4qsWiL8VVbmT/z40UcBwCngKTD/8xHaQ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388115; c=relaxed/simple;
	bh=TyHMa884rEn3IuH6JzFdcB5NA7GYjcaY9Thmo8jQjK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ORN+4iyEhpB0/9NtNUKsE1eaCIPwAu3eEk5o3b08dzlwYAKJINSub+SDdJIDOOwPI3IIJOSJy9esaNOtkvmEvj1jE8b8cGLyBdmvl7GKN7SsfVACBAtRYQD8E1WDEITwONNDBmBlHrLOAhoPT2W7IgbrOkz1/0vyut/06TzWiY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVbyw/fo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVbyw/fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790388112; x=1821924112;
  h=date:from:to:cc:subject:message-id;
  bh=TyHMa884rEn3IuH6JzFdcB5NA7GYjcaY9Thmo8jQjK8=;
  b=lVbyw/fozJrhshGmpYVzTs4CCmB0QJ57Zce6kUiYWFKfogytXsVWjwCt
   w/QQf6fEZ9T+iaNRrszRXoNI/m3NLSNVS4u76PjTuaRVp8fVYbZWMSUF9
   lp2OvpBI4Fv3dlJlBBwGlyLqozWAlABvsjY8eUKK03cF1eQbmofnoafH1
   mEG0qHh7FlCRlgXgQilWs8GEEDlOMg6KAtmL9M98o+3XRrt/RybB8BFAx
   fEoI2QUx50oIRxqlpqKB41Iyi03cN+SYhjCOPdHdDYf6WUKAPn3nMS9D1
   vhAvuV13fm1vG2N3hB8lnGBnvtFTNu76Tf/L9XK/ph//+uE7IiVk4i+sC
   Q==;
X-CSE-ConnectionGUID: VjwVvnGUROSvzpZ8gP/VdA==
X-CSE-MsgGUID: sAi4Y7HiTQWcEN8kZ4b/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="107555456"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="107555456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:01:52 -0700
X-CSE-ConnectionGUID: y+WaXH3GTCWYcxKQDdNXnA==
X-CSE-MsgGUID: WDdPEBriRtSLSkADRKwywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303985537"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 19:01:50 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAHjX-000000000AN-32kx;
	Sat, 26 Sep 2026 02:01:47 +0000
Date: Sat, 26 Sep 2026 04:01:15 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler.h:200:82: error: expression in static
 assertion is not an integer
Message-ID: <202609260356.tJWbd1WU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Rosen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6812ce4e4379ffc99c52401ec28f0d7ffbc36206
commit: 4d105880666ab7f7914a75716d3e95b0d8b879dc tty: serial: mpc52xx_uart: add bounds check for psc_num array index
date:   3 months ago
config: powerpc-randconfig-r2101-20260926 (https://download.01.org/0day-ci/archive/20260926/202609260356.tJWbd1WU-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260356.tJWbd1WU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4d105880666a ("tty: serial: mpc52xx_uart: add bounds check for psc_num array index")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260356.tJWbd1WU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:16,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:62,
                    from arch/powerpc/include/asm/processor.h:41,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/tty/serial/mpc52xx_uart.c:31:
   drivers/tty/serial/mpc52xx_uart.c: In function 'mpc512x_psc_handle_irq':
   drivers/tty/serial/mpc52xx_uart.c:648:35: error: 'psc_mclk_clk' undeclared (first use in this function)
     648 |         if (psc_num >= ARRAY_SIZE(psc_mclk_clk))
         |                                   ^~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/tty/serial/mpc52xx_uart.c:648:35: note: each undeclared identifier is reported only once for each function it appears in
     648 |         if (psc_num >= ARRAY_SIZE(psc_mclk_clk))
         |                                   ^~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/dev_printk.h:14:
>> include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/tty/serial/mpc52xx_uart.c:648:24: note: in expansion of macro 'ARRAY_SIZE'
     648 |         if (psc_num >= ARRAY_SIZE(psc_mclk_clk))
         |                        ^~~~~~~~~~


vim +200 include/linux/compiler.h

230fa253df6352 Christian Borntraeger 2014-11-25  196  
cb7380de9e4cbc Kees Cook             2025-02-05  197  #ifdef __CHECKER__
243c90e917f5cf Vincent Mailhol       2025-03-29  198  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) (0)
cb7380de9e4cbc Kees Cook             2025-02-05  199  #else /* __CHECKER__ */
243c90e917f5cf Vincent Mailhol       2025-03-29 @200  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
cb7380de9e4cbc Kees Cook             2025-02-05  201  #endif /* __CHECKER__ */
cb7380de9e4cbc Kees Cook             2025-02-05  202  

:::::: The code at line 200 was first introduced by commit
:::::: 243c90e917f5cfc99821e5104d1c8a81c11cda4c build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()

:::::: TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
:::::: CC: Yury Norov <yury.norov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
