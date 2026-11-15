Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737817;
	b=AI98B82YQ+v3w8aNoS8V+uOmUkiaSkW43/07pl7QHjpvGc1gwGnAekN29n1EEPeHwdNO
	 hlhney9P7YvlDY+qKVqVq55cQ2vhk41lp0oiYGcWAg2leZwKyl29gP0dKS7RaqgWXjHlE
	 q2tLZ6ChuDRP7Mr4HRLuCGEWzp3GVAj59X7Q/lZmt1WKj2gozyTPFMVXrjBvOmECqsvNu
	 bvVWkY+TqLAMN3DRbVz3VEkQIBEdJwnwTw7Clo0teQvzuSje6DCFubV1raWE4qHYU/Yii
	 JugOpIdIjKKfaGlUwHU6usx9GYxBOlZye7Iq6mM0p7mfncOqVdU5aaBqv1FkfTPFETQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737817;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uLfGyjUN+tdddIdW2x+So3Hbvi1HPK0wSrgfxThymyM=;
	b=MY8aH4idYklnVev+xlzgVRAb6lAEoxsEVmXmsAEkm56yO5u6Cdd85GWhghuMIiI0dNFT
	 4zPI3nbLgOc8xDawnzgVIEZ4kid8RspkOXSFlX0t9O38+nDW8jDUJhUJnaplNZZvCszIN
	 xRP/lmftqJuKZnS5yEO4uXNH02xDIRaYA8aI/vg6tdy9IP+FeMlHj6bnLPDGB9trdHdfN
	 JsP4uhj9A9+PxTusnhj1yGmV+fn9ptEeh+atDhpTux/hIe+IVGJYlMCkkMAk9t45c4iKh
	 FRwq/ZcsbsBUaQeR6mDwZ6OHKfQrnoh7M8imTQ9w/P4WI00w8pLHrrcRUBZvaA3PfTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="c2kb/Vcz";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47809606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47809606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2kb/Vcz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794737817; x=1826273817;
  h=date:from:to:cc:subject:message-id;
  bh=Z2r4js7MrLMtIUujMG/QLsWeS2pIcIQC0/TdUpK3ong=;
  b=c2kb/VczI5NNALsnbssGDVzEafDTRTMBrvUI4CmqmNr4ALweqbLCqZEN
   /DRvwfeOoI9iHxXRi+SIcrgM80dyZxbcYXdTg8mVTYWTMhmzjT+6Z7E1Z
   wdhsqJLy5H3Fy0JOczMQ6bth46Fg2xgdT6m4NU6UY68BvLFQG506LNrH6
   0r+Bdrp3IGkzAJ7HuPTil7OAiEWu69PjCdboS/mOzfietfjvHMQGyCiQ2
   53M+QsLs8O5fUnJuXsDBeF0lWYWzx+8ZOL3o6HCxxJXNby+3t7kg77Djv
   a+CM0JogOIBr433iXxvTA0UU/wfJnSmxT4mP6YaELH4pvx/gaEXhHYdIm
   w==;
X-CSE-ConnectionGUID: V+e2QepFSb+XTLN9nY2X7Q==
X-CSE-MsgGUID: 51Ql7RytSbSTXEH8ermrfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3398465"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3398465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:16:56 -0800
X-CSE-ConnectionGUID: qHi5URmXSCWX9SeNQE2haQ==
X-CSE-MsgGUID: 6AE5U0cWSSSPQRaQte6fUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9660889"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2026 02:16:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSXI3-0000000028k-3UBi;
	Sun, 15 Nov 2026 10:16:51 +0000
Date: Sun, 15 Nov 2026 11:16:28 +0100
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: drivers/dma/bestcomm/gen_bd.c:144:22: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202611151128.F2RcT2V4-lkp@intel.com>
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
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 57946765c242005bdb16d17944c27662c8c5b013 dmaengine: bestcomm: Enable compile testing
date:   6 weeks ago
config: powerpc-randconfig-r2301-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151128.F2RcT2V4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151128.F2RcT2V4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 57946765c242 ("dmaengine: bestcomm: Enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151128.F2RcT2V4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/bestcomm/gen_bd.c:144:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *a @@     got struct bcom_bd *bd @@
   drivers/dma/bestcomm/gen_bd.c:144:22: sparse:     expected void volatile [noderef] __iomem *a
   drivers/dma/bestcomm/gen_bd.c:144:22: sparse:     got struct bcom_bd *bd
   drivers/dma/bestcomm/gen_bd.c:227:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *a @@     got struct bcom_bd *bd @@
   drivers/dma/bestcomm/gen_bd.c:227:22: sparse:     expected void volatile [noderef] __iomem *a
   drivers/dma/bestcomm/gen_bd.c:227:22: sparse:     got struct bcom_bd *bd

vim +144 drivers/dma/bestcomm/gen_bd.c

7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  111  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  112  int
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  113  bcom_gen_bd_rx_reset(struct bcom_task *tsk)
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  114  {
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  115  	struct bcom_gen_bd_priv *priv = tsk->priv;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  116  	struct bcom_gen_bd_rx_var *var;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  117  	struct bcom_gen_bd_rx_inc *inc;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  118  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  119  	/* Shutdown the task */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  120  	bcom_disable_task(tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  121  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  122  	/* Reset the microcode */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  123  	var = (struct bcom_gen_bd_rx_var *) bcom_task_var(tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  124  	inc = (struct bcom_gen_bd_rx_inc *) bcom_task_inc(tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  125  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  126  	if (bcom_load_image(tsk->tasknum, bcom_gen_bd_rx_task))
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  127  		return -1;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  128  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  129  	var->enable	= bcom_eng->regs_base +
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  130  				offsetof(struct mpc52xx_sdma, tcr[tsk->tasknum]);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  131  	var->fifo	= (u32) priv->fifo;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  132  	var->bd_base	= tsk->bd_pa;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  133  	var->bd_last	= tsk->bd_pa + ((tsk->num_bd-1) * tsk->bd_size);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  134  	var->bd_start	= tsk->bd_pa;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  135  	var->buffer_size = priv->maxbufsize;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  136  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  137  	inc->incr_bytes	= -(s16)sizeof(u32);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  138  	inc->incr_dst	= sizeof(u32);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  139  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  140  	/* Reset the BDs */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  141  	tsk->index = 0;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  142  	tsk->outdex = 0;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  143  
adec566b05288f2 drivers/dma/bestcomm/gen_bd.c         Anatolij Gustschin 2021-10-14 @144  	memset_io(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  145  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  146  	/* Configure some stuff */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  147  	bcom_set_task_pragma(tsk->tasknum, BCOM_GEN_RX_BD_PRAGMA);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  148  	bcom_set_task_auto_start(tsk->tasknum, tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  149  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  150  	out_8(&bcom_eng->regs->ipr[priv->initiator], priv->ipr);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  151  	bcom_set_initiator(tsk->tasknum, priv->initiator);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  152  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  153  	out_be32(&bcom_eng->regs->IntPend, 1<<tsk->tasknum);	/* Clear ints */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  154  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  155  	return 0;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  156  }
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  157  EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_reset);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  158  

:::::: The code at line 144 was first introduced by commit
:::::: adec566b05288f2787a1f88dbaf77ed8b0c644fa dmaengine: bestcomm: fix system boot lockups

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
