Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793235613;
	b=RW7qHEnk6605y1qvWjaM8RjTCfUE/C2Sbu2+BU0cAM5qey4Y0qx3JRD0pxBeAr/6mvX6
	 lp+F/2HEdLMoYSzzm/bynkjgUbnlclrBHIXJWI7Ox1X0ZKfxR0PhcquUmcn+6w3pLN5mS
	 qsF0TBYnsFzl93e63G7W4IR1JDddq2iC8s8oIEdfUishYllmqkKaALy4vKvCF4X6iySOX
	 qZigsMAEq0ygdTka57X+DfBSpdC2pwDQExwHBx61e2O2tq6FA+IgZNelpm1gkR1VZ49eT
	 paGQdrCQyw492D4am/zDCn8cW+kQwPvOx9WWxlNOuyMxoPwVxZTBtiniprDnwrZcuFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793235613;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AvcUC/1MiOceAMBu9K9D2zoZ9m1WdRohTEGTv0h4Flw=;
	b=qdZY+S44daJ1Xcb/55blYsx483pskKDciURbF8LNns9rwsA2W4aUeFsM4P4emM9MdZz5
	 6gRNvmm50tcCIQyoSmcnVGR8xvamj0OxhU4qak+GxHmU5fbYAW4+yC2lQX6l6U9X6GAKR
	 n9SXyUiG5BfcNH3pHXDqMXtSgWunFfjTSOLKlt533rhttmM+SkDeBbO+4e+MY4Liy93gI
	 Kf63vVO2hiJhoMddwDTitAl83KkCPbpI5wgArPpFEC/uFQczC1Cgf7uJvMYs7+vn/gqK1
	 sx+pmy5XISLmANdm3O0pXdocoQRf/4DF/ssiFqBbtAGwH6tlBXZPQmxSuKIlNRTIR0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A1Cvm70P;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE43606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A1Cvm70P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793235612; x=1824771612;
  h=date:from:to:cc:subject:message-id;
  bh=EUKRzknw2e8I9NSRveKmihVUd0h/TngiF/kNRita2mM=;
  b=A1Cvm70Pk+oO55bmGwQcgufiVlXLrCofeuAnJ3YJ6EHttzKMG22KDNyf
   YJlCQl+emkj3iDcS5kbgdLRJBY7ge4dJlKP8gL/OE1iLQN1NYE+maFfBA
   1Er9VJWt3DASgPOCf3tIjiXiVhb26hOMksmOfvd56+40/SnAg9/N6ec+1
   etJn/C3ft4Hc5DRHsvoVycgojL81vMaTStakEivJxnAjw4xB/sY8q02lD
   hCwTT5XrHB3/kcV0gwoPKi9lpMDg7umYRYp+Uq+GFMfhahmlh256aPpQo
   XFDNI/8pgV4nzAsMDBrsrJfwGqV7NkZLntIAL5NnsrdU4PlFp2fCleR2t
   g==;
X-CSE-ConnectionGUID: PAqFTvgvSF2LAbPHYGwB4A==
X-CSE-MsgGUID: j3mAFdJlQhedncdCz/xCdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1996872"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1996872"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 18:00:12 -0700
X-CSE-ConnectionGUID: xuLpf1JaTRiH9SL1hq5ocw==
X-CSE-MsgGUID: uJVdH5ozRpi0erEHLgdGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6822378"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 28 Oct 2026 18:00:11 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMEUx-0000000055D-3ljg;
	Thu, 29 Oct 2026 01:00:07 +0000
Date: Thu, 29 Oct 2026 01:59:13 +0100
From: kernel test robot <lkp@intel.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Bradley Morgan <brads@mainlining.org>
Subject: ERROR: modpost: lib/kunit/kunit-example-test.ko: symbol
 '__mulsi3' undefined!
Message-ID: <202610290106.o8Fs3NvO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Karl,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c339f4010dea8b0d754f84ace70cd1b089878ef8
commit: 7c3f4d699f34535285d0ceb184927d71543d0064 resource, kunit: stop selecting GET_FREE_REGION
date:   2 weeks ago
config: openrisc-randconfig-r2306-20261028 (https://download.01.org/0day-ci/archive/20261029/202610290106.o8Fs3NvO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290106.o8Fs3NvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7c3f4d699f34 ("resource, kunit: stop selecting GET_FREE_REGION")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290106.o8Fs3NvO-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: kernel/rcu/rcutorture.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/fuse/virtiofs.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/pstore/ramoops.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/ecryptfs/ecryptfs.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/overlayfs/overlay.ko: symbol '__mulsi3' undefined!
ERROR: modpost: crypto/asymmetric_keys/pkcs8_key_parser.ko: symbol '__mulsi3' undefined!
ERROR: modpost: crypto/ccm.ko: symbol '__mulsi3' undefined!
ERROR: modpost: lib/kunit/kunit.ko: symbol '__mulsi3' undefined!
ERROR: modpost: lib/kunit/kunit-test.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: lib/kunit/kunit-example-test.ko: symbol '__mulsi3' undefined!
WARNING: modpost: suppressed 1014 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
