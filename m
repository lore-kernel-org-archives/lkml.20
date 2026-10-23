Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788433;
	b=RMa/YfffJ3LYBHpYuCIGNSTyGQANF4wu0LzFLnWfrU5VXr4FkmgpC9CxQS1VeAVjUsOS
	 5IoKOQh1h0Cp/x1iN/7z0SAUuhihPKRWSKg2kWTQcpwF+IB7GYmxHEobdJTbQIuo52Sl2
	 2gEGl9inUYEdc6NQjmxipLBw7hmlFv31ONNDcoW3hx7IMHe7fBFtUDV22P5NcFjNPK0Lx
	 uOT1WpaOz6CJhYWfOw8cmhlIj9dxNO/j5FfV7kaOk4OIINPPbPZz03kuiUWa3csxrqqvT
	 Ein1AGUgm2Q6g1idDoWl7gqw2ska63sbmVj8DEwBQoVRbqqmrwjFQVCjC7Cjk+Sbeaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788433;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0Fytb4JgoO63FwYVtw+c+EDAJNfJ/FtMczRvF5Yc/c0=;
	b=mLrGm8wOYLigzzW6StZYJOfyNBFYctHWIeRA+knlCovrSTUEiri9ASyliAXey6oej6eL
	 KkytrGpNoa3pI3wK+VkRnyAWflbGlPVhiqEqp9+zdw6ryKouTkoh+bh2LXWutbv1ZVBEK
	 8DQEleq117wMBwvrj6a3qZztoZ8k3ZVOKJNxLX8TWL57jNv/Oec3uALN8hJE8tpOV9hsg
	 87nSm3Cn2rC90s7NfCatF/i/Lw+6eHvWuM8qeNyR0MTPIrjtMIBbZsoCvJbHGgw3TNI7K
	 bt8xAJ/HcC6YJr8sZvpB+Ny9cA/PjxrQN7y5+Ynj1OMorhzveQG9JK/SPIqozu8V1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XJwpof14;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D33606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D33606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XJwpof14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792788432; x=1824324432;
  h=date:from:to:cc:subject:message-id;
  bh=hQbhkW0N2Hm2jUca0TrGTlDLQqi1MRXNxeE7O9yIBFA=;
  b=XJwpof14rFr7pWcFpqMwuCZPIa4DjgI/ayb16XQOpfgLqfHCE36b44/2
   5Vm5pkeQjIXqcWLxR3jQ9hJEan6C7CeB+lJlgzKEPmMaNRY2k6mApIxr2
   FRClPrH0MDxvZWnjbzSwnnGWt4oiKPoolz9rmtS21brtWYCPZvFdDyfxR
   IBMK7+EHigfkiu1jwSms3CRPjNrh/ANmAX+/xD0OVkK6ayEx4DaM0E1LB
   xJYxkJpMH/1JOS2vNukFKV9Ni5kVQO5MBB5OGLJqkjttmJ1seQ/5DSr8B
   ZvhNPHihrg/6+S2Et4BbrolddttdAlEZgvsk62PHCovQFgZCwU1eWWHdx
   g==;
X-CSE-ConnectionGUID: 129vsiNLT56YkJI+IMOZPg==
X-CSE-MsgGUID: 8lVrPUuoTSSaGIjeDjGlHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1573466"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1573466"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 13:47:11 -0700
X-CSE-ConnectionGUID: 0Nbz3UsoSRqsiB/4SgobkQ==
X-CSE-MsgGUID: eqYZDzmdQI++wmluSm++mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="5550741"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Oct 2026 13:47:10 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKMAJ-000000001wR-1hij;
	Fri, 23 Oct 2026 20:47:03 +0000
Date: Fri, 23 Oct 2026 22:46:44 +0200
From: kernel test robot <lkp@intel.com>
To: Matt Turner <mattst88@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Magnus Lindholm <linmag7@gmail.com>
Subject: arch/powerpc/math-emu/fsqrts.c:39:2: warning: variable
 '_FP_PACK_CANONICAL_T_e' set but not used
Message-ID: <202610232211.PH7EKsOW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a78f7ba9f24962c8033e0152bf34a7903ff61ba
commit: b74843b38da8f1186fd7d447646c835b47096a15 alpha: determine tininess after rounding in the FP emulation
date:   3 days ago
config: powerpc64-randconfig-r2103-20261023 (https://download.01.org/0day-ci/archive/20261023/202610232211.PH7EKsOW-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610232211.PH7EKsOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b74843b38da8 ("alpha: determine tininess after rounding in the FP emulation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610232211.PH7EKsOW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/math-emu/fsqrts.c:39:2: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
      39 |         __FP_PACK_DS(frD, R);
         |         ^
   arch/powerpc/include/asm/sfp-machine.h:185:5: note: expanded from macro '__FP_PACK_DS'
     185 |            _FP_PACK_CANONICAL(S, 1, __X);                                       \
         |            ^
   include/math-emu/op-common.h:145:6: note: expanded from macro '_FP_PACK_CANONICAL'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^
   <scratch space>:29:1: note: expanded from here
      29 | FP_DECL_S
         | ^
   include/math-emu/single.h:62:23: note: expanded from macro 'FP_DECL_S'
      62 | #define FP_DECL_S(X)            _FP_DECL(1,X)
         |                                 ^
   include/math-emu/op-common.h:28:32: note: expanded from macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   <scratch space>:32:1: note: expanded from here
      32 | _FP_PACK_CANONICAL_T_e
         | ^
>> arch/powerpc/math-emu/fsqrts.c:39:2: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
   arch/powerpc/include/asm/sfp-machine.h:189:6: note: expanded from macro '__FP_PACK_DS'
     189 |                    _FP_PACK_CANONICAL(D, 2, X);                                 \
         |                    ^
   include/math-emu/op-common.h:145:6: note: expanded from macro '_FP_PACK_CANONICAL'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^
   <scratch space>:87:1: note: expanded from here
      87 | FP_DECL_D
         | ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
      73 | #define FP_DECL_D(X)            _FP_DECL(2,X)
         |                                 ^
   include/math-emu/op-common.h:28:32: note: expanded from macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   <scratch space>:90:1: note: expanded from here
      90 | _FP_PACK_CANONICAL_T_e
         | ^
   2 warnings generated.
--
>> arch/powerpc/math-emu/fsqrt.c:38:2: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
      38 |         __FP_PACK_D(frD, R);
         |         ^
   arch/powerpc/include/asm/sfp-machine.h:176:2: note: expanded from macro '__FP_PACK_D'
     176 |         _FP_PACK_CANONICAL(D, 2, X);                                    \
         |         ^
   include/math-emu/op-common.h:145:6: note: expanded from macro '_FP_PACK_CANONICAL'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^
   <scratch space>:19:1: note: expanded from here
      19 | FP_DECL_D
         | ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
      73 | #define FP_DECL_D(X)            _FP_DECL(2,X)
         |                                 ^
   include/math-emu/op-common.h:28:32: note: expanded from macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   <scratch space>:22:1: note: expanded from here
      22 | _FP_PACK_CANONICAL_T_e
         | ^
   1 warning generated.


vim +/_FP_PACK_CANONICAL_T_e +39 arch/powerpc/math-emu/fsqrts.c

^1da177e4c3f415 arch/ppc/math-emu/fsqrts.c     Linus Torvalds 2005-04-16  38  
d2b194ed820880e arch/powerpc/math-emu/fsqrts.c Kumar Gala     2008-06-04 @39  	__FP_PACK_DS(frD, R);

:::::: The code at line 39 was first introduced by commit
:::::: d2b194ed820880eb19c43b9c10d9f5f30026ee54 powerpc/math-emu: Use kernel generic math-emu code

:::::: TO: Kumar Gala <galak@kernel.crashing.org>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
