Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7A488234
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416527; cv=none; b=DtBenglbaFnMORjRxQ+bqWdKt0OO+GKqN1VqDNjHd0//F9mZtNxGyQUdRhCnhdqejL2NxfxPrvxAQrfIzIY7+HdMhQfJPidHcLHxoNmzGMmqIXm9Sm2a553dfn1eFA+yPP+EhL3p79XoL5ZupnCCW1qOansLM6O701MZIYZevKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416527; c=relaxed/simple;
	bh=lmyxpMgNY3gyVyI0VoUqaOi2IiniSdL5VE9DkwnJY5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CKJRwRmo1erevUHse1/fzvDR++dc03ndWq4ZovCmnsqXyTa+l6VP9b3mQzh0vzVpelM0cqaG+V7cO/iRx7ugac9dEzKcYqVfLIwxUzSaDIf3Hm8KlHhAW9SHLez58G015KJ2FtI69Fikfr2J6W2L6MZ2Lk+Yb97eF9fLI4R8d08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdwKl3+p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdwKl3+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792416525; x=1823952525;
  h=date:from:to:cc:subject:message-id;
  bh=lmyxpMgNY3gyVyI0VoUqaOi2IiniSdL5VE9DkwnJY5M=;
  b=bdwKl3+pPVaINjlcerx3yoJU97So7i5FKcMU3yxciR9Av+n+4FkUlSoR
   dqGKaxsbfQRj/CG+ux8RoThm8KPykDhMjArWD7TmXZpsLB7suIDXbn4Js
   /v3HhcNdB2oDvGvcZgNGe5PZlyuH9/ijAPBuhrgj5InZIaTneICao+9If
   ROMvokY/Bc/gcqyJVytD7kS2ucgOV0MoHxnqqlKpmVkY92kaImzcE+B06
   0nAZMgNMU7gyFhfuGXXXGUPYgPZDAczuUppm214xb/DZ0JQtWWM1kaMez
   oeThl77YBTZ2Uq2WY+NOX5K+oNF/w+RwK5nw96YanGRrP11WH5rFMejDd
   A==;
X-CSE-ConnectionGUID: FJnS0sXmS5mDmk8qNCUiZg==
X-CSE-MsgGUID: F9xJT9ZNQOSIOyYoGuqKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1000437"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1000437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 06:28:32 -0700
X-CSE-ConnectionGUID: coDAQwNUTL6IW6Z91AAxbw==
X-CSE-MsgGUID: sBkBx4cxSOqgQWP53mahRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2536901"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2026 06:28:30 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xInPg-000000005dD-2x4g;
	Mon, 19 Oct 2026 13:28:28 +0000
Date: Mon, 19 Oct 2026 15:27:47 +0200
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: __efistub_cmdline.c:undefined reference to
 `__efistub___ashldi3'
Message-ID: <202610191553.uvFTO4t9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c03c1a14507dfaf8b856c2608f9ac216021fc222
commit: 9a4580db6e9f83428813f671a79486469684069f lib: fix memparse() to handle overflow
date:   5 months ago
config: loongarch-randconfig-r2309-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191553.uvFTO4t9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191553.uvFTO4t9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a4580db6e9f ("lib: fix memparse() to handle overflow")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191553.uvFTO4t9-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L47':
>> __efistub_cmdline.c:(.init.text+0x288): undefined reference to `__efistub___ashldi3'
>> loongarch64-linux-ld: __efistub_cmdline.c:(.init.text+0x298): undefined reference to `__efistub___lshrdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
