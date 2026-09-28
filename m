Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF2B36B903
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615789; cv=none; b=KDbr1uyT9BBmB+NXojf+muJxVH6scnesPmPqH6jJPKQqYgoSHukTumz731wePWR22dHCx9wOrVRy2INxfa4gjyJi5roZXNUI2RhTwlqrTUTLlj47U6moDHN12O8OqdnqqF9Hg1fxJw86n9qiQBUFaD+SahV9Ezsp6rrWp2Hl124=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615789; c=relaxed/simple;
	bh=f2Ir7CF+hoIlrKDbBfk8rabd0NBVb9hTVvcWsALIKEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qvk4vTIJ6QOJPJCpk8RzzxOcc8Vi3zYFFZLzOuZMg588jpdkW4BVwwlXarMZU0EDkvIU0SQPKQXs8sK9EvDQyZnIPdcRI//4NUpZA/JBCZ2++ZZHiNHVr8ukAgXL8LN0kN9s8+Sw1SeRDQUlEFR+15WzHJfm/SmV1s065HYY/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Huptsbr5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Huptsbr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790615787; x=1822151787;
  h=date:from:to:cc:subject:message-id;
  bh=f2Ir7CF+hoIlrKDbBfk8rabd0NBVb9hTVvcWsALIKEw=;
  b=Huptsbr5y5VFNPX6H+d7222p20ErUHSuntuZBGwakoknlazO5savZGLY
   aKjUmxVf0mee+LwGLOtYatyYx6Qdv6iUt33CAlh2zwGYqnUedsso2x4Be
   vn7JY0pcIkVgCYKXQSPGm0Z9NeuOZ4XUkexFJm3rR8m3wq8l3kaC4YPV7
   9u3hU6vt4J3k3oiM51aXwR6CvW8XgOMbqBbKX4mukp/nwAYzvx4Jb0Pde
   XQS0b6L98jQfejICNcoTgfkzC9QAI0aYboqIWXOswKHpybwQFYPmE2KaE
   HRjBHDctFNFKGml2vXwFUsaDhzYLWEcgDaLZ0X+4ZnGPykWzFn+Qfjfpe
   Q==;
X-CSE-ConnectionGUID: BrWg9IDfTMaLX7jvnSXCQQ==
X-CSE-MsgGUID: 4aYsYgjuTbKPkqHpu0fMGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102692631"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="102692631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 10:16:27 -0700
X-CSE-ConnectionGUID: U9K5xuNFQN2c0ccpZ4n2ZA==
X-CSE-MsgGUID: J2Y14AFDRJGAvpph+PolHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="278310102"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2026 10:16:24 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBExf-0000000014d-1lxP;
	Mon, 28 Sep 2026 17:16:19 +0000
Date: Mon, 28 Sep 2026 19:15:42 +0200
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/phy/phy-fsl-usb.c:110:9: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202609281938.kuwyhhWS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: a71f5aef1be98fb10f00e66a0ac4ef23ba9c877f USB: gadget: fsl-udc: enable compile testing
date:   3 months ago
config: mips-randconfig-r2301-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281938.kuwyhhWS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281938.kuwyhhWS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a71f5aef1be9 ("USB: gadget: fsl-udc: enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281938.kuwyhhWS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/phy/phy-fsl-usb.c:49:20: sparse: sparse: symbol 'otg_suspend_state' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:60:22: sparse: sparse: symbol 'a_wait_vrise_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:60:41: sparse: sparse: symbol 'a_wait_bcon_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:60:59: sparse: sparse: symbol 'a_aidl_bdis_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:61:9: sparse: sparse: symbol 'b_ase0_brst_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:61:27: sparse: sparse: symbol 'b_se0_srp_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:64:22: sparse: sparse: symbol 'b_data_pulse_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:64:41: sparse: sparse: symbol 'b_vbus_pulse_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:64:60: sparse: sparse: symbol 'b_srp_fail_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:65:9: sparse: sparse: symbol 'b_srp_wait_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:65:26: sparse: sparse: symbol 'a_wait_enum_tmr' was not declared. Should it be static?
>> drivers/usb/phy/phy-fsl-usb.c:110:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:110:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:110:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:105:5: sparse: sparse: symbol 'write_ulpi' was not declared. Should it be static?
>> drivers/usb/phy/phy-fsl-usb.c:122:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:122:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:122:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:132:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:132:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:132:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:118:6: sparse: sparse: symbol 'fsl_otg_chrg_vbus' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:140:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:140:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:140:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:150:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:150:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:150:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:136:6: sparse: sparse: symbol 'fsl_otg_dischrg_vbus' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:159:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:159:23: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:159:23: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:160:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:160:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:160:17: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:162:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:162:23: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:162:23: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:164:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:164:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:164:17: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:154:6: sparse: sparse: symbol 'fsl_otg_drv_vbus' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:176:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:176:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:176:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:183:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:183:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:183:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:172:6: sparse: sparse: symbol 'fsl_otg_loc_conn' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:195:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:195:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:195:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:201:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:201:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:201:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:191:6: sparse: sparse: symbol 'fsl_otg_loc_sof' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:212:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:212:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:212:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:214:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:214:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:214:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:206:6: sparse: sparse: symbol 'fsl_otg_start_pulse' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:222:6: sparse: sparse: symbol 'b_data_pulse_end' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:241:6: sparse: sparse: symbol 'b_vbus_pulse_end' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:254:6: sparse: sparse: symbol 'b_srp_end' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:269:6: sparse: sparse: symbol 'a_wait_enum' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:279:6: sparse: sparse: symbol 'set_tmout' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:285:5: sparse: sparse: symbol 'fsl_otg_init_timers' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:342:6: sparse: sparse: symbol 'fsl_otg_uninit_timers' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:450:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:450:19: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:450:19: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:452:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:452:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:452:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:453:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:453:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:453:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:446:6: sparse: sparse: symbol 'otg_reset_controller' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:475:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:475:20: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:475:20: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:458:5: sparse: sparse: symbol 'fsl_otg_start_host' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:525:5: sparse: sparse: symbol 'fsl_otg_start_gadget' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:582:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:582:23: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:582:23: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:618:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/phy/phy-fsl-usb.c:713:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:713:18: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:713:18: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:717:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:717:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:717:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:707:13: sparse: sparse: symbol 'fsl_otg_isr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:858:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct usb_dr_mmap *static [toplevel] usb_dr_regs @@     got void [noderef] __iomem * @@
   drivers/usb/phy/phy-fsl-usb.c:858:21: sparse:     expected struct usb_dr_mmap *static [toplevel] usb_dr_regs
   drivers/usb/phy/phy-fsl-usb.c:858:21: sparse:     got void [noderef] __iomem *
   drivers/usb/phy/phy-fsl-usb.c:860:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void * @@
   drivers/usb/phy/phy-fsl-usb.c:860:21: sparse:     expected void [noderef] __iomem *regs
   drivers/usb/phy/phy-fsl-usb.c:860:21: sparse:     got void *
>> drivers/usb/phy/phy-fsl-usb.c:884:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got struct usb_dr_mmap *dr_mem_map @@
   drivers/usb/phy/phy-fsl-usb.c:884:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:884:30: sparse:     got struct usb_dr_mmap *dr_mem_map
   drivers/usb/phy/phy-fsl-usb.c:891:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:891:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:891:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:893:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:893:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:893:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:896:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:896:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:896:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:898:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:898:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:898:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:901:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:901:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:901:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:906:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:906:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:906:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:909:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:909:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:909:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:924:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:924:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:924:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:928:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:928:42: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:928:42: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:930:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:930:42: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:930:42: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:934:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:934:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:934:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:937:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:937:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:937:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:944:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:944:13: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:944:13: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:955:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:955:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:955:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:958:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:958:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/phy/phy-fsl-usb.c:958:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:833:5: sparse: sparse: symbol 'usb_otg_start' was not declared. Should it be static?
>> drivers/usb/phy/phy-fsl-usb.c:995:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/usb/phy/phy-fsl-usb.c:995:18: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:995:18: sparse:     got void *
   drivers/usb/phy/phy-fsl-usb.c:1005:24: sparse: sparse: symbol 'fsl_otg_driver' was not declared. Should it be static?

vim +110 drivers/usb/phy/phy-fsl-usb.c

0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  104  
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  105  int write_ulpi(u8 addr, u8 data)
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  106  {
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  107  	u32 temp;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  108  
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  109  	temp = 0x60000000 | (addr << 16) | data;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18 @110  	fsl_writel(temp, &usb_dr_regs->ulpiview);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  111  	return 0;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  112  }
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  113  
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  114  /* -------------------------------------------------------------*/
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  115  /* Operations that will be called from OTG Finite State Machine */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  116  
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  117  /* Charge vbus for vbus pulsing in SRP */
da8cc16724da29 drivers/usb/phy/phy-fsl-usb.c Anton Tikhomirov 2013-10-03  118  void fsl_otg_chrg_vbus(struct otg_fsm *fsm, int on)
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  119  {
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  120  	u32 tmp;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  121  
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18 @122  	tmp = fsl_readl(&usb_dr_regs->otgsc) & ~OTGSC_INTSTS_MASK;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  123  
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  124  	if (on)
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  125  		/* stop discharging, start charging */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  126  		tmp = (tmp & ~OTGSC_CTRL_VBUS_DISCHARGE) |
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  127  			OTGSC_CTRL_VBUS_CHARGE;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  128  	else
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  129  		/* stop charging */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  130  		tmp &= ~OTGSC_CTRL_VBUS_CHARGE;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  131  
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  132  	fsl_writel(tmp, &usb_dr_regs->otgsc);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  133  }
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang          2011-04-18  134  

:::::: The code at line 110 was first introduced by commit
:::::: 0807c500a1a6d7fa20cbd7bbe7fea14a66112463 USB: add Freescale USB OTG Transceiver driver

:::::: TO: Li Yang <leoli@freescale.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
