Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368769;
	b=rYif5AP6sAjoWm0aYOqUkviWF3GfPkE1jPjo5G28yX0IY6LadTU/9nr0iyYxDdUB55wg
	 Co9xgkBT3lAm5WIgPO54qu03BYSx0glF1/1kjHIn1L8ptLig9b3hR6uOLZErHOFZPB6jp
	 3EkeBNFkPo82EUVTvda0VrdPnmiT79fTsmUTfMFV02az1jqVfRApuVkqz9sj7klpHgr0O
	 cg1JhBZQbJVqG1vxoXjF56zypbt+rpfXqHzc+Bzjva1kPZGB6L6gSbOAq+g2lMYxA82Tm
	 HyhrTQ/xv1XgRFDy/QE6s9BvEKXRI9d/A/Gi33aIVR8dvykVsGhUwP7gYMg+7+XkmIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368769;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KYmy3sRt/faOsbCv/Pv2gEQsPwyqQf5kSJCsjXwcJ14=;
	b=W7l5NO8SpscntC+6n8nUKYmXWG6rm+f0kvpA1L8IrGu9LFiGkAfB4jqO+YWlEGq7jqcr
	 WmNBZZKnLnJ+4o6fOedfdSKU9xCi2Z/uD+oB/AAUsHx9du/CP4JofFsxbnpCi+16m4SG1
	 9pbCXuuaxOxJVWTZlNCBMv269h6SM04NF1wd9JYigJAvbdGUHW2lISr4LWwtZoBVmbh4X
	 ANHUviMzyK3j48i28dGnYhrkzR2jfTqTVrAT4zlbmCsowlkCSbXaHe0hwvZkDH8Lrz/Qz
	 PwvS32ndqn5dMoSPT91ov6p7DzJgAujzlRu4O4+5h4Go8jTCzhbMEC81Zd7LWOBv4uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSXQblqV;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A55606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A55606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSXQblqV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793368768; x=1824904768;
  h=date:from:to:cc:subject:message-id;
  bh=rdCJgTSrci0gACAC2YDiLQxJYLQKEdF1lEVzBwfIChg=;
  b=ZSXQblqVO8HfpLJuhjt6zrwbo6DLh46xXR1nMrdSf5ZMELwIun+9aL6Z
   X3Khr9i/LY8BGJt1nZabsrTVOzkYZEigNS/722LRiBNz6HX5NIcL8d1lR
   S9QRkV7PxUKQzcI9/4+mLaIrI4iUnyj8vz0p82J+X+MMcrVlTBWq7ikwN
   Ex8+eC2JZiGbCz//01p/DbWerjVlhCRBicrj1udHJ9X2BLQ351l8zz5PF
   1MIEa5i8kiZFY+mUtBYLmBRSNwVWzPcz0/cH4+wLbmSzNlChHYIo4OPIF
   dY8Q2Ywr9Ny/4+qfk+msCLkHWrgHSkl0iYxA5S1SQuMKS6fI2YBkrw3zJ
   g==;
X-CSE-ConnectionGUID: QFVVrsHAQoaKMQsEty7nQA==
X-CSE-MsgGUID: +0SPGMijSmi+ctuO92EoJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2224465"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2224465"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 06:59:27 -0700
X-CSE-ConnectionGUID: pVgpvH5MRc+BkUsSvgvN+w==
X-CSE-MsgGUID: DJAdOBjhRA2ZQVr71xGrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7273580"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 30 Oct 2026 06:59:25 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMn8c-000000005b1-1RfG;
	Fri, 30 Oct 2026 13:59:22 +0000
Date: Fri, 30 Oct 2026 14:58:29 +0100
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>
Subject: drivers/phy/mediatek/phy-mtk-pcie-sphy.c:483:2-3: Unneeded
 semicolon
Message-ID: <202610301438.XGYx3jyK-lkp@intel.com>
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
head:   d89e1d186ec9271bf78e62771779e9fc03bf0fc3
commit: e9434ed4effaf46351fce729380d3c8d7d918f20 phy: mediatek: Add support for PCI-Express Gen4 S-PHY
date:   4 weeks ago
config: hexagon-randconfig-r2110-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301438.XGYx3jyK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e9434ed4effa ("phy: mediatek: Add support for PCI-Express Gen4 S-PHY")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301438.XGYx3jyK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/mediatek/phy-mtk-pcie-sphy.c:483:2-3: Unneeded semicolon

vim +483 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

   360	
   361	static int mtk_pcie_sphy_get_calibration_data(struct mtk_pcie_sphy *pcie_sphy)
   362	{
   363		struct mtk_pcie_sphy_efuse *cal = &pcie_sphy->calibration;
   364		struct device *dev = pcie_sphy->dev;
   365		u8 version;
   366		int ret;
   367	
   368		if (pcie_sphy->num_lanes > MTK_PCIE_SPHY_CALIBRATION_MAX_DATA_LANES) {
   369			dev_info(dev, "Skipping PHY calibration for more than %u lanes.\n",
   370				 MTK_PCIE_SPHY_CALIBRATION_MAX_DATA_LANES);
   371			ret = -EOPNOTSUPP;
   372			goto end;
   373		}
   374	
   375		ret = mtk_pcie_sphy_get_one_cal_para(dev, "int-r",
   376						     FIELD_MAX(RG_XTP_GLB_BIAS_INTR_CTRL));
   377		if (ret < 0)
   378			goto end;
   379		cal->int_r_ctrl = ret;
   380	
   381		ret = mtk_pcie_sphy_get_one_cal_para(dev, "xtp-vtrim",
   382						     FIELD_MAX(RG_XTP_GLB_BIAS_V2V_VTRIM));
   383		if (ret < 0)
   384			goto end;
   385		cal->xtp_vtrim = ret;
   386	
   387		ret = mtk_pcie_sphy_get_one_cal_para(dev, "cktx-pmos",
   388						     FIELD_MAX(RG_CKM_CKTX_IMPSEL_PMOS));
   389		if (ret < 0)
   390			goto end;
   391		cal->cktx_impsel.pmos = ret;
   392	
   393		ret = mtk_pcie_sphy_get_one_cal_para(dev, "cktx-nmos",
   394						     FIELD_MAX(RG_CKM_CKTX_IMPSEL_NMOS));
   395		if (ret < 0)
   396			goto end;
   397		cal->cktx_impsel.nmos = ret;
   398	
   399		ret = mtk_pcie_sphy_get_one_cal_para(dev, "cktx-r-mid",
   400						     FIELD_MAX(RG_CKM_CKTX_IMPSEL_SW));
   401		if (ret < 0)
   402			goto end;
   403		cal->cktx_r_mid = ret;
   404	
   405		ret = mtk_pcie_sphy_get_one_cal_para(dev, "rxfe-lanes-rl-ctle",
   406						     FIELD_MAX(RG_XTP_LN_RX_LEQ_RL_CTLE_CAL));
   407		if (ret < 0)
   408			goto end;
   409		cal->rx_leq_rl_ctle = ret;
   410	
   411		ret = mtk_pcie_sphy_get_one_cal_para(dev, "rxfe-lanes-rl-vga",
   412						     FIELD_MAX(RG_XTP_LN_RX_LEQ_RL_VGA_CAL));
   413		if (ret < 0)
   414			goto end;
   415		cal->rx_leq_rl_vga = ret;
   416	
   417		ret = mtk_pcie_sphy_get_one_cal_para(dev, "rxfe-lanes-rl-dfe",
   418						     FIELD_MAX(RG_XTP_LN_RX_LEQ_RL_DFE_CAL));
   419		if (ret < 0)
   420			goto end;
   421		cal->rx_leq_rl_dfe = ret;
   422	
   423		ret = mtk_pcie_sphy_get_one_cal_para(dev, "rx-lanes-imp",
   424						     FIELD_MAX(RG_XTP_LN_RX_IMPSEL));
   425		if (ret < 0)
   426			goto end;
   427		cal->rx_impsel = ret;
   428	
   429		ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-lanes-pmos",
   430						     FIELD_MAX(RG_XTP_LN_TX_IMPSEL_PMOS));
   431		if (ret < 0)
   432			goto end;
   433		cal->tx_impsel.pmos = ret;
   434	
   435		ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-lanes-nmos",
   436						     FIELD_MAX(RG_XTP_LN_TX_IMPSEL_NMOS));
   437		if (ret < 0)
   438			goto end;
   439		cal->tx_impsel.nmos = ret;
   440	
   441		ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-ln0-rswn",
   442						     FIELD_MAX(RG_XTP_LN_TX_RSWN_IMPSEL));
   443		if (ret < 0)
   444			goto end;
   445		cal->tx_rswn_impsel[0] = ret;
   446	
   447		if (pcie_sphy->num_lanes == 2) {
   448			ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-ln1-rswn",
   449							     FIELD_MAX(RG_XTP_LN_TX_RSWN_IMPSEL));
   450			if (ret < 0)
   451				goto end;
   452			cal->tx_rswn_impsel[1] = ret;
   453		}
   454	
   455		ret = mtk_pcie_sphy_get_one_cal_para(dev, "cal-version", 15);
   456		if (ret < 0)
   457			goto end;
   458		version = ret;
   459	
   460		/* Quirk for eFuse calibration table versions 0 to 4 */
   461		if ((version <= MTK_PCIE_SPHY_CALIBRATION_LAST_QUIRK_VER) &&
   462		    cal->rx_leq_rl_ctle == 10) {
   463			cal->rx_leq_rl_vga = cal->rx_leq_rl_ctle;
   464			cal->rx_leq_rl_dfe = cal->rx_leq_rl_ctle;
   465		}
   466	
   467	end:
   468		if (ret < 0) {
   469			/*
   470			 * If any of the calibration values is missing, or if there is
   471			 * no calibration at all in the eFuses, this is not a problem,
   472			 * as the PHY doesn't require one to actually work.
   473			 *
   474			 * Note that if even just one of the calibration values is
   475			 * missing it would not be safe to trust the correctness of
   476			 * the others as this may be a different eFuse layout.
   477			 */
   478			if (ret == -ENOENT || ret == -EOPNOTSUPP) {
   479				cal->supported = false;
   480				return 0;
   481			}
   482			return ret;
 > 483		};
   484		cal->supported = true;
   485	
   486		return 0;
   487	}
   488	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
