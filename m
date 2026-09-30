Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71A4BA1ED
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766353; cv=none; b=lq+bTxlOgKgyPrUlyrHXVbsPm8sS5qU/Ym2d247KsUUalR8LbnrMn3+AL2o+/BQJgFjrXTt8s6E5T6gJCv9cEOiBz3PXpWIQvr2WChi/885pQfxk8vheccldcOCYdpYuVWNUUTBM5SFV3U5hA+LmVrcsHnfgGH3RRO3yE62WabU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766353; c=relaxed/simple;
	bh=xb2F7yY761Px570aTEq8Hu9qlrKvIEJumXMxe/XEzVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kbCDQ56pWN8Cq1kCYH4V2Yxxao2UG/MKMzNIlh4MFNFgqGuVop3iWtfyTgfvyNLe69OBvJqjr5pG275zIoE5k3+pyLXgxNZGOJpg2/Y1Isgq5dSjLziYIdrB0V6SoB0Oc32BH1vXMRNePiZbItTY+jLE7Zyb++VnRK8nD4u765g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSrswqUC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSrswqUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790766349; x=1822302349;
  h=date:from:to:cc:subject:message-id;
  bh=xb2F7yY761Px570aTEq8Hu9qlrKvIEJumXMxe/XEzVU=;
  b=XSrswqUCFqMTr6saqFBAqeIvFVyxFjyggk+hikE9F2UyP9VRllpuTOnP
   Qn7TkL2CNl6IUt41JKeSh9WAD7hExBof93M6xPDQf8vsAGdJ/lunKVU8r
   BH1opow2BAugf/dW1PcFvicWCvbkFCu5glcCD7cyTSouzE1qB2rI4iHAE
   jI/3SvIfAhoDEr274eGEke/r+fIt8dZDqSBO48in6Q6N4CccON/LNcNNU
   vkBojCrvFkbrRA/Pb5JKrfh9+jy0T20z4OouGvgqX2HjLpqO3gbnjh+r+
   0gnRxPhUJMFfMq+lWJxHgDGGmTCawPnry3BJT2jc7TuzGfgup+PhTEfQy
   A==;
X-CSE-ConnectionGUID: BwMFs8k8RjOpQR/I56YR1w==
X-CSE-MsgGUID: AVTl3bfpQ3ClDJjzbqpWzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90542143"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90542143"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:05:45 -0700
X-CSE-ConnectionGUID: pN/9bqPISt2dNIqNy9TQtA==
X-CSE-MsgGUID: Y/l/7UGaTP258CGwh9vqxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274271720"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2026 04:05:43 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBs85-000000001q3-0Qlh;
	Wed, 30 Sep 2026 11:05:41 +0000
Date: Wed, 30 Sep 2026 13:05:34 +0200
From: kernel test robot <lkp@intel.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_424' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
Message-ID: <202609301230.CauIUXCF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Finn,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   551c722f40809618230001baccf219193e22fc5a
commit: e428b013d9dff30f7a65509e33047ba975cce8ba atomic: specify alignment for atomic_t and atomic64_t
date:   8 months ago
config: m68k-randconfig-r2102-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301230.CauIUXCF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301230.CauIUXCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e428b013d9df ("atomic: specify alignment for atomic_t and atomic64_t")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301230.CauIUXCF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'qlt_queue_unknown_atio',
       inlined from 'qlt_24xx_atio_pkt_all_vps' at drivers/scsi/qla2xxx/qla_target.c:331:4,
       inlined from 'qlt_24xx_process_atio_queue' at drivers/scsi/qla2xxx/qla_target.c:7903:4:
>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_424' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:612:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_target.c:216:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u));
     ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'qlt_queue_unknown_atio',
       inlined from 'qlt_24xx_atio_pkt_all_vps' at qla_target.c:331:4,
       inlined from 'qlt_24xx_process_atio_queue' at qla_target.c:7903:4:
>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_424' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:612:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   qla_target.c:216:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u));
     ^~~~~~~~~~~~


vim +/__compiletime_assert_424 +631 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  630  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @631  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  632  

:::::: The code at line 631 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
