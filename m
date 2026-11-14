Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628105;
	b=dUvB+Tb+xlj8O3Uu2fZnojQa8tAPiZlJwSdQZ/Tk3+pCxz8KdGlitiFwJ6EDj8UVA2AS
	 SwvP0ZwugfohNNFqk2sNMZbOBHDCFsM+wjC/tPAtU/t3MLqx6PFsfxlMhCCQt5URAKFvD
	 ehHE9CfQnsr464cq+XI8JuEfVJ8kyGyAtJJ0oSqrZaK/w8Fhn4GpzW1wGI396ZcFsMYRH
	 3PFVaKIKilRsLAHsCWqzHTN8unfJawjKB5v0QnPVI0kcfd4P/d6Udt8mLl5MEoxU195s0
	 Og5bZgVFU605rAJteSBJFImdaLb35WTpq5jfJb91pBGMu6v+Zt57kqCNYjjuABaIeug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628105;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rn7Hkl4NxcizDjym71I1dpr0NgTfsllR9nBrg/Zt84s=;
	b=CsWITSN8lHHSBtooDtSCmlSax/skHlFKHvvklJuHHFN0yfOcZp5nN5ZWWu9xy+PZ0vYp
	 5oWd9TRN3UBezuz0iJ3CeALI+UeE1jaqo9INDrAi7XVoN2+4cGo0/4BErDovyk2UMszzY
	 A/bl8ygVpjdmds2rG2mryDU+92bYF2D80VLeAe3EYAbQ3Mwt13BWDNMS41S7wiJvigpEr
	 H9cJ1E2osqJzV8KnSnjWHo2/BzIUCVenB93GFBElllRcSj6k5NpsQczY7/XIu6yJmYhCs
	 Sjn2rLuoWw3NNEmC7IxJNkoXxHY2CVYU66j9ULgrM01SlOCuszOLcLCWkHFsVn+BzWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="T8CCp/AY";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F9606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5F9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8CCp/AY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794628105; x=1826164105;
  h=date:from:to:cc:subject:message-id;
  bh=bihrLIOCvNUuc3YdNa2HMLWj03qdc31MlySz2Gp9ZWQ=;
  b=T8CCp/AYPA/Zvu0RyasbGPHNjJ4Fi5Y9g0kyAplsBSWV5nLc4dwcLQID
   YNjJoZ8OBJWb+05PuggCYaW+L/4utMrIdjDtwQlZd0ugtv8BrRi9btkLa
   0T3t3xS7eZZOzFtq78fRYxWLKznU3hTTgsxuoHPk8T5K47FFCNTF4XHst
   TmVBOclR1orYKW4QJHS07pZ/D4+JbAksttHhJcetwNCRbJo2BHg2c9Duv
   jBUTZfkldR7XMgLSIrAkdE8yGcAq5vjmYFnnx7A09gZ+dC7kCTyGRA501
   AwZttBOFU6mv4B4Z75xb/BNUoi7HendD1BiyXlFLM7guan3yviTXvodWr
   Q==;
X-CSE-ConnectionGUID: 530siwewQg6skAqWN0fZ+A==
X-CSE-MsgGUID: QXOgVmPUR/edgwaWpMjpqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3316939"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3316939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 19:48:25 -0800
X-CSE-ConnectionGUID: Lton5EYyT1KxLD2ZPoqXPw==
X-CSE-MsgGUID: YAiPG/yQQA644kzAj2kagg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9417457"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 19:48:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS4kW-000000001Tx-40uK;
	Sat, 14 Nov 2026 03:48:20 +0000
Date: Sat, 14 Nov 2026 04:47:52 +0100
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: drivers/misc/lkdtm/bugs.c:492:31: warning: unsequenced
 accesses to volatile qualified 'element_count'
Message-ID: <202611140405.wMowxoPE-lkp@intel.com>
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
head:   97d73c8251226cf27cc6656b4c542869bb8c69fa
commit: a120a832e3ebca48474d7183ddeadf4138472535 lkdtm/bugs: Add __counted_by_ptr() test PTR_BOUNDS
date:   10 months ago
config: mips-randconfig-2000-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140405.wMowxoPE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140405.wMowxoPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a120a832e3eb ("lkdtm/bugs: Add __counted_by_ptr() test PTR_BOUNDS")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140405.wMowxoPE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/lkdtm/bugs.c:492:31: warning: unsequenced accesses to volatile qualified 'element_count' [-Wunsequenced]
     492 |         inst->array[element_count] = element_count;
         |                     ~~~~~~~~~~~~~    ^
   1 warning generated.


vim +/element_count +492 drivers/misc/lkdtm/bugs.c

   475	
   476	static void lkdtm_FAM_BOUNDS(void)
   477	{
   478		struct lkdtm_cb_fam *inst;
   479	
   480		inst = kzalloc(struct_size(inst, array, element_count + 1), GFP_KERNEL);
   481		if (!inst) {
   482			pr_err("FAIL: could not allocate test struct!\n");
   483			return;
   484		}
   485	
   486		inst->count = element_count;
   487		pr_info("Array access within bounds ...\n");
   488		inst->array[1] = element_count;
   489		ignored = inst->array[1];
   490	
   491		pr_info("Array access beyond bounds ...\n");
 > 492		inst->array[element_count] = element_count;
   493		ignored = inst->array[element_count];
   494	
   495		kfree(inst);
   496	
   497		pr_err("FAIL: survived access of invalid flexible array member index!\n");
   498	
   499		if (!IS_ENABLED(CONFIG_CC_HAS_COUNTED_BY))
   500			pr_warn("This is expected since this %s was built with a compiler that does not support __counted_by\n",
   501				lkdtm_kernel_info);
   502		else if (IS_ENABLED(CONFIG_UBSAN_BOUNDS))
   503			pr_expected_config(CONFIG_UBSAN_TRAP);
   504		else
   505			pr_expected_config(CONFIG_UBSAN_BOUNDS);
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
