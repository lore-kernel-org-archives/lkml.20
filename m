Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93F4EF14D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100115; cv=none; b=cjsTEoB3T3BCDF2lP6dt2cFZjQZdn0T7QEkRnWPLBBCwlQMpbVQ+TtlIj/DsB+cPB8STRF7U7op3nepxZWOWLKDCSLEl1TcpbM/emwvq4Z5SkNaFSRkEMJy55Ifp/f2DQE6Ee5LiM/8dH4wdmJMHfR5udTEgPq/5LFhbcCN92Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100115; c=relaxed/simple;
	bh=VOxMxCDPWN+fLBBRLpSJMHD9RS9TItpTF8mT+aGjZRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IcTQSbdXlneJFGZDHLRmahnpoPpjxg4uRoNFDihehJSFkfY6b/zaXHvl0D00ee9HxZlFzdEg/wH2sRLXRnuLx0G49bHI7ze6LYCjCa+xPd3/QN9Ky8cQxvVf9O2dqNOiXnxXXG4qusJjOKqOaOOKkJp6t/uqoj7P49PJ5vVAfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c80LvQ5E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c80LvQ5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100105; x=1823636105;
  h=date:from:to:cc:subject:message-id;
  bh=VOxMxCDPWN+fLBBRLpSJMHD9RS9TItpTF8mT+aGjZRs=;
  b=c80LvQ5EWrMM7oRpyT5G2R+8IAazMyKdFJ46V4lcNHalljLAs3GYlqfG
   woV+XjdXhogVzWPi7bAktj37BqJOzPKpY/kAu9ZmDZ0H4MDGg4vqnxyIv
   cxuWQkmb5XwbLcQPuMYrcn2S9HgSLqZp5i8V/4uCatr6c6hrG0CuaQKzD
   sMvBT5J9TZKUZSjEXVB+WCvaRFAQS+iVBdCR8KX34TFMuFndQAGtU3w/Z
   /CWWZsu1N7raRNsvhf46zUeE4M1BZ6kXyuCGxcfeYNWd47EAjkgUOLTQ6
   yElDtQdgQCeMpjhGBJjX6K3IKcuktftDTajEEY3Muz+rtq6JZdgyJavpb
   A==;
X-CSE-ConnectionGUID: VEc6HxybT1C9is2aH1yK9A==
X-CSE-MsgGUID: cdxVmPD9RpCKeYVSX9ymQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="780943"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="780943"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:35:04 -0700
X-CSE-ConnectionGUID: mvG7m/LrSmyS0h15KCAu1g==
X-CSE-MsgGUID: 1anueJecSXGqUZG9ipQh7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1706475"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2026 14:35:03 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHT6K-00000000BrD-18XT;
	Thu, 15 Oct 2026 21:35:00 +0000
Date: Thu, 15 Oct 2026 23:34:17 +0200
From: kernel test robot <lkp@intel.com>
To: Richard Patel <ripatel@wii.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:irq/core 3/7] kernel/irq/manage.c:1208:2: error:
 implicit declaration of function 'clear_and_wake_up_bit'; did you mean
 'clear_pfnblock_bit'?
Message-ID: <202610152305.qx1OoHrk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   4351cc74202857f5b85b3573c477c9f798f5cd88
commit: 313fa9ffa302f81b437e1ebbb1e6abae06be0cad [3/7] genirq: Defer kfree(irqaction) until irq_thread_dtor() finishes
config: xtensa-randconfig-2001-20261015 (https://download.01.org/0day-ci/archive/20261015/202610152305.qx1OoHrk-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610152305.qx1OoHrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610152305.qx1OoHrk-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/manage.c: In function 'irq_thread_dtor':
>> kernel/irq/manage.c:1208:2: error: implicit declaration of function 'clear_and_wake_up_bit'; did you mean 'clear_pfnblock_bit'? [-Werror=implicit-function-declaration]
     clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
     ^~~~~~~~~~~~~~~~~~~~~
     clear_pfnblock_bit
   kernel/irq/manage.c: In function 'irq_stop_thread':
>> kernel/irq/manage.c:1866:2: error: implicit declaration of function 'wait_on_bit'; did you mean 'llist_on_list'? [-Werror=implicit-function-declaration]
     wait_on_bit(&action->thread_flags, IRQTF_EXIT_WORK, TASK_UNINTERRUPTIBLE);
     ^~~~~~~~~~~
     llist_on_list
   cc1: some warnings being treated as errors


vim +1208 kernel/irq/manage.c

  1202	
  1203	static void irq_thread_dtor(struct callback_head *unused)
  1204	{
  1205		struct irqaction *action = kthread_data(current);
  1206	
  1207		__irq_thread_dtor(action);
> 1208		clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
  1209	}
  1210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
