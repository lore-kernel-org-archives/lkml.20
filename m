Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927986;
	b=knwG/ROFv1/Vu7zzINXsUrnFzczwmi+v6bKxA2NpF34yD1rXKWujAq4tfeF7yBrBGjIl
	 TNGKvXBqUuO1/jxgLsJ+ogVlTBB9mBPPjZgI8c2vhrd8BZP/Ph2kdmqxMII+7oOwYGC4q
	 g9OuSaXETwWmtmLXyROAqY2+CtJ499lo4mtZ7zUaAYe66HrUkrHvfz20Rk7vcvBSVWF2U
	 FZkGQlVXxIWy6i4Xdu5RKNwlxcTnfCLY4+MvHR2UITmPFc016tQnQlG32h5k7VREZMSyl
	 itYQ3WsrASvg/j46q655A2PQTbQ5XUnv63YForovmRa8XuRy8GfL+H42itKxJCUcIJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927986;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ua+INsmy4uhlQErQcxDGsb1d1oetenRoWNHuRrVHb0Y=;
	b=1iKcZuTcwxDgjaP51947nU5ONEVKx+Oyiehx2dFtOMmuAP0AgfNXA7cFGefr5lQSZBr7
	 MWxKF/l/7JpOuJ4XzkPjX08NEcn+m8tyGeslxMMjTupa6P/48Siz0O08VlzCvbmABFnSu
	 YZqWznztpT/sxWN2YclIgztm/OMdtYwnn3sVcRlmihZYvCpPbSk2n/B0nJUSiyIdWPbkP
	 68IwhJV2XJyawJvKK5GU7WWRfuFVBlYPQkc4QhIJtmnZffDU3x/+dpXP9CSPJr81erfzZ
	 /gkf4PP5Fo87wGnB51asF1WFz7Yq+I0Y6QuZBpY67p3BZXZ0kkaCuiy8SSnaJ8mFCGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hzsnpH+V;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C45606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C45606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hzsnpH+V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794927984; x=1826463984;
  h=date:from:to:cc:subject:message-id;
  bh=Q0xYGDHNETOUqB/QHbEJguMLOAs6v1zmKrmjlcI07uI=;
  b=hzsnpH+V+bNWDgmX0DFKAuVgx5fp7BxmP8Q7n91TTfkWV52qy4B9VR03
   SBr7nQyz/uwk+YltXEB7pYQIR8gzMGdtXRBuhHnv61XVrnvmRiL3avfJv
   uM6VkoDkLdpE29dPuol4TXqjhUtnaf19Skk9LWb5mVqwAJO/PJ3BjzoFs
   Ae1Zxb4SG1hsc7o4Cs2ISThA6Mc6VeQBRdy5698XMXzL1ZtNTkrl4uhge
   Mjnw/eiM2lIIfMQtjn5H27IqXURiGlgaDPmd5XH1FCgDT9OFGH9yWCgfv
   sAz32n1/hfZ30rem/khdajXBLmfzUFCRyaGaTinCw8coQDPdco2i1Rq1r
   w==;
X-CSE-ConnectionGUID: bSgEpBJwShiO1mspg1A9Kg==
X-CSE-MsgGUID: CMN2fk9rR9OC2Xdk481GwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3600352"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3600352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 07:06:23 -0800
X-CSE-ConnectionGUID: boyGYROLRnWkAXxfrj0zfg==
X-CSE-MsgGUID: yFXtow2IQjSNvjcnXYHwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10038394"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2026 07:06:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTKlH-0000000038o-3SrS;
	Tue, 17 Nov 2026 15:06:19 +0000
Date: Tue, 17 Nov 2026 16:05:45 +0100
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: drivers/soc/mediatek/mtk-dvfsrc.c:524:2-3: Unneeded
 semicolon
Message-ID: <20261117160346.MCgJLmbK-lkp@intel.com>
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
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 75cf308fee7e4b3038741f96fd90afc3bd871e64 soc: mediatek: mtk-dvfsrc: Add support for DVFSRCv4 and MT8196
date:   10 months ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/archive/20261117/20261117160346.MCgJLmbK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 75cf308fee7e ("soc: mediatek: mtk-dvfsrc: Add support for DVFSRCv4 and MT8196")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117160346.MCgJLmbK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/mtk-dvfsrc.c:524:2-3: Unneeded semicolon

vim +524 drivers/soc/mediatek/mtk-dvfsrc.c

   475	
   476	static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
   477	{
   478		struct dvfsrc_opp *dvfsrc_opps;
   479		struct dvfsrc_opp_desc *desc;
   480		u32 num_opps, gear_info;
   481		u8 num_vcore, num_dram;
   482		u8 num_emi;
   483		int i;
   484	
   485		num_opps = dvfsrc_get_opp_count_v4(dvfsrc);
   486		if (num_opps == 0) {
   487			dev_err(dvfsrc->dev, "No OPPs programmed in DVFSRC MCU.\n");
   488			return -EINVAL;
   489		}
   490	
   491		/*
   492		 * The first 16 bits set in the gear info table says how many OPPs
   493		 * and how many vcore, dram and emi table entries are available.
   494		 */
   495		gear_info = dvfsrc_readl(dvfsrc, DVFSRC_GEAR_INFO_L);
   496		if (gear_info == 0) {
   497			dev_err(dvfsrc->dev, "No gear info in DVFSRC MCU.\n");
   498			return -EINVAL;
   499		}
   500	
   501		num_vcore = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info) + 1;
   502		num_dram = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info) + 1;
   503		num_emi = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info) + 1;
   504		dev_info(dvfsrc->dev,
   505			 "Discovered %u gears and %u vcore, %u dram, %u emi table entries.\n",
   506			 num_opps, num_vcore, num_dram, num_emi);
   507	
   508		/* Allocate everything now as anything else after that cannot fail */
   509		desc = devm_kzalloc(dvfsrc->dev, sizeof(*desc), GFP_KERNEL);
   510		if (!desc)
   511			return -ENOMEM;
   512	
   513		dvfsrc_opps = devm_kcalloc(dvfsrc->dev, num_opps + 1,
   514					   sizeof(*dvfsrc_opps), GFP_KERNEL);
   515		if (!dvfsrc_opps)
   516			return -ENOMEM;
   517	
   518		/* Read the OPP table gear indices */
   519		for (i = 0; i <= num_opps; i++) {
   520			gear_info = dvfsrc_get_opp_gear(dvfsrc, num_opps - i);
   521			dvfsrc_opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
   522			dvfsrc_opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
   523			dvfsrc_opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
 > 524		};
   525		desc->num_opp = num_opps + 1;
   526		desc->opps = dvfsrc_opps;
   527	
   528		/* Assign to main structure now that everything is done! */
   529		dvfsrc->curr_opps = desc;
   530	
   531		return 0;
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
