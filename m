Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819623DB332
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221710; cv=none; b=U4fYt/YDy4HB9D1D0+rgwpqwzb61SxabK1q2tANCTH7sKklgzurq4KnuUuuPX/59zvYc4wMNWBZbutfd8gQ60+UJIK+mvcfAEgXNb1mpTjYX1ZKGWqvIX7al0WbIXpywWMSCu9V6GY13yDMiQsPlf1zCeRvewHnv+nxlKQtOhSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221710; c=relaxed/simple;
	bh=XpNk1q5111XBtD3ATUFRM0hRDnhnDffjoK5AeYZoBFE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=InLyw10CSX5tuTD3asi3V+EGqIAo3YKpiJ26J7GizMkWd0H9K7VZaeg3t6c0l22yVxDFL+mkSCgMI/orLsXFQxZe9Avk125Fed/2iOR2hnyHg0hiZSB4AqH1HWHrYp6tn6XbNqU60+mDPtst/GAoH87G7dc+zmKMtEsBU7YQtEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOpfPbPr; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOpfPbPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790221707; x=1821757707;
  h=date:from:to:cc:subject:message-id;
  bh=XpNk1q5111XBtD3ATUFRM0hRDnhnDffjoK5AeYZoBFE=;
  b=HOpfPbPr2so1RcRG9lBuREKk5rzFUGgG6XpHCR5SMFiotCP7PvUkqk22
   i71SCuTN9CfW7amBwdY7idPVrDIBdhOgGi60d+ueYMhYS8+5FMiP1jvWE
   YDPdI56zzaICuRuhAw7FS0eBGvkFMGycM6sbbvdlCH6W/VQOQqtx56Znz
   Tr/ZEUj/676hYR0O+ec2bgVPr75q5ysKTwKlTXC/enI+qFRBtQ81dvmRH
   HmvrtxfAJ3yQKDQB0pn3qZo3sv5LUPsn68X9zWfyjmXmIYB2ckA24ZJCM
   /Te+NwC15Ao87q+GwlrY/7tnPKgMrItEgUH/O+V2HhCWSioddIqQ9gWeN
   Q==;
X-CSE-ConnectionGUID: u1uRxGrbTimmDupACFLC9g==
X-CSE-MsgGUID: khv4kAbITqyj50OkNVUzeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1494505"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1494505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:48:24 -0700
X-CSE-ConnectionGUID: m6g9dujdQE2yCE9iA7F9Ug==
X-CSE-MsgGUID: 6cEOReRkQIuMjqDHc/iGgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="281992716"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 20:48:22 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9aRX-00000000IAi-355I;
	Thu, 24 Sep 2026 03:48:19 +0000
Date: Thu, 24 Sep 2026 11:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202609241102.b0Z14B7C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: f08e7a4e8d6ac4de677727af352ea33c6ce9f444 pmdomain: mediatek: Add support for MFlexGraphics
date:   10 months ago
config: sparc-randconfig-r1301-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241102.b0Z14B7C-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241102.b0Z14B7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f08e7a4e8d6a ("pmdomain: mediatek: Add support for MFlexGraphics")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241102.b0Z14B7C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned long @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     got unsigned long
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] ipi_magic @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     got unsigned int [usertype] ipi_magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:472:19: sparse: sparse: restricted signed int degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [assigned] [usertype] base @@     got unsigned int [usertype] shared_mem_phys @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     expected restricted __le64 [assigned] [usertype] base
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     got unsigned int [usertype] shared_mem_phys
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] size @@     got unsigned int shared_mem_size @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     expected restricted __le32 [assigned] [usertype] size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     got unsigned int shared_mem_size
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     got int
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] power_state @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     expected restricted __le32 [usertype] power_state
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     got int
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] gpu_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     expected restricted signed int [usertype] gpu_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] stack_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     expected restricted signed int [usertype] stack_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:578:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:579:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:593:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:594:46: sparse: sparse: restricted __le32 degrades to integer

vim +509 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c

   504	
   505	static int mtk_mfg_power_control(struct mtk_mfg *mfg, bool enabled)
   506	{
   507		struct mtk_mfg_ipi_msg msg = {};
   508	
 > 509		msg.cmd = CMD_POWER_CONTROL;
 > 510		msg.u.power_state = enabled ? 1 : 0;
   511	
   512		return mtk_mfg_send_ipi(mfg, &msg);
   513	}
   514	
   515	static int mtk_mfg_set_oppidx(struct mtk_mfg *mfg, unsigned int opp_idx)
   516	{
   517		struct mtk_mfg_ipi_msg msg = {};
   518		int ret;
   519	
   520		if (opp_idx >= mfg->num_gpu_opps)
   521			return -EINVAL;
   522	
   523		msg.cmd = CMD_FIX_DUAL_TARGET_OPPIDX;
 > 524		msg.u.dual_commit.gpu_oppidx = opp_idx;
   525		msg.u.dual_commit.stack_oppidx = opp_idx;
   526	
   527		ret = mtk_mfg_send_ipi(mfg, &msg);
   528		if (ret) {
   529			dev_err(&mfg->pdev->dev, "Failed to set OPP %u: %pe\n",
   530				opp_idx, ERR_PTR(ret));
   531			return ret;
   532		}
   533	
   534		return 0;
   535	}
   536	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
