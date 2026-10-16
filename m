Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F937204E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121379; cv=none; b=bIfgyEKJU6PT9/UWeyDB/91+s8QGiPK/4NyWxRBs9Ridto0chd2gcJHpscD8Cyc5osjbB1W4pdkfp1buMLLhsVJkLSvmWI3LMZzh9GQuQ2zRL/13V1FRH4SRcGSJgo10dRYy9oxq/4TQt6Dm6lARTNqgp+/FUr+//SyMYdkI5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121379; c=relaxed/simple;
	bh=/lFzdwhtCIEWU3K5mPGLabgZSdZQAy8S/nRkMtxzVsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2SOjjfrueVVudPGyJcAFTBq5wevOrK4/KZWsruQD9fi6TYUPc9TRxBX25IMtEqx96Z88fmwNSlmiE0Mb3D7NvUZzR3MHwA3jkQDVz6rTb5PFgaG9h6aLBn6xST7xXitdAZOfIxEXEPGtIFq4Lp2Cw5h0xsCXhKEssthpXDcS6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYswHrJ2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYswHrJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792121378; x=1823657378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/lFzdwhtCIEWU3K5mPGLabgZSdZQAy8S/nRkMtxzVsc=;
  b=NYswHrJ2Yk2ZDixL5ZKTMYXOPTi/YRFyxYPr7pzM2w1F+zpEgmoOasCW
   GPYDyaA6//0C1zXuN2gYrjQFA/DHauhG0L5yzVjsOMahLzNer46aUT3T8
   Kp4NNh8qHUiLs65oFR1ZGTQ8rgscYiYNZ+DDx+jaZLL6/wnG/mKQ19Ixm
   /QLreK5HGjb0CGcXK57xYsJN1LnWuDnBGwKDkHg87BHRXjBCtzQP6C+56
   oZDzH+3we6eTbW16tqA4WNQIfHxFfWMefcR67K2N3AxO5adw3ZQwC8nmN
   /K0WJq+//hvnfbF+Axh3xO8Grvom8D0ZGqgzZJAPzHUK7o3LKB5UZhJ8X
   w==;
X-CSE-ConnectionGUID: 0wKCorUvQCWq0u1xp6V23g==
X-CSE-MsgGUID: d2GjoiA7SF+SKHcrWvAigQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="793753"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="793753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 20:29:37 -0700
X-CSE-ConnectionGUID: kRsiygrJSRu3idqm8lCtjg==
X-CSE-MsgGUID: wP1Hq+0YQQGjVEwMkm3W7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1924553"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2026 20:29:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHYdQ-00000000HWG-2Wu0;
	Fri, 16 Oct 2026 03:29:32 +0000
Date: Fri, 16 Oct 2026 11:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Timo Joannin <timo.joannin@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, error27@gmail.com, guojy.bj@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: Re: [PATCH v5 2/2] staging: rtl8723bs: unwind cast mess and remove
 phy_stat struct
Message-ID: <202610161124.U5MQW8nK-lkp@intel.com>
References: <20261013191503.152056-3-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013191503.152056-3-timo.joannin@gmail.com>

Hi Timo,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Timo-Joannin/staging-rtl8723bs-rename-struct-phy_status_rpt_8192cd_t-to-rtl8723bs_phy_status_rpt/20261013-211502
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20261013191503.152056-3-timo.joannin%40gmail.com
patch subject: [PATCH v5 2/2] staging: rtl8723bs: unwind cast mess and remove phy_stat struct
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610161124.U5MQW8nK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161124.U5MQW8nK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161124.U5MQW8nK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/hal/odm_HWConfig.c:435:1: error: version control conflict marker in file
     435 | <<<<<<< HEAD
         | ^~~~~~~
>> drivers/staging/rtl8723bs/hal/odm_HWConfig.c:251:13: warning: 'odm_Process_RSSIForDM' defined but not used [-Wunused-function]
     251 | static void odm_Process_RSSIForDM(struct dm_odm_t *pDM_Odm,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/hal/odm_HWConfig.c:96:1: warning: 'odm_rx_phy_status_parsing' defined but not used [-Wunused-function]
      96 | odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +435 drivers/staging/rtl8723bs/hal/odm_HWConfig.c

   250	
 > 251	static void odm_Process_RSSIForDM(struct dm_odm_t *pDM_Odm,
   252					  struct odm_phy_info *pPhyInfo,
   253					  struct odm_packet_info *pPktinfo)
   254	{
   255		s32 UndecoratedSmoothedPWDB, UndecoratedSmoothedCCK,
   256			UndecoratedSmoothedOFDM, RSSI_Ave;
   257		u8 isCCKrate = 0;
   258		u8 RSSI_max, RSSI_min, i;
   259		u32 OFDM_pkt = 0;
   260		u32 Weighting = 0;
   261		PSTA_INFO_T pEntry;
   262	
   263		if (pPktinfo->station_id == 0xFF)
   264			return;
   265	
   266		pEntry = pDM_Odm->pODM_StaInfo[pPktinfo->station_id];
   267	
   268		if (!IS_STA_VALID(pEntry))
   269			return;
   270	
   271		if ((!pPktinfo->bssid_match))
   272			return;
   273	
   274		if (pPktinfo->is_beacon)
   275			pDM_Odm->PhyDbgInfo.NumQryBeaconPkt++;
   276	
   277		isCCKrate = ((pPktinfo->data_rate <= DESC_RATE11M)) ? true : false;
   278		pDM_Odm->RxRate = pPktinfo->data_rate;
   279	
   280		/* Statistic for antenna/path diversity------------------ */
   281		if (pDM_Odm->SupportAbility & ODM_BB_ANT_DIV) {
   282		}
   283	
   284		/* Smart Antenna Debug Message------------------ */
   285	
   286		UndecoratedSmoothedCCK = pEntry->rssi_stat.UndecoratedSmoothedCCK;
   287		UndecoratedSmoothedOFDM = pEntry->rssi_stat.UndecoratedSmoothedOFDM;
   288		UndecoratedSmoothedPWDB = pEntry->rssi_stat.UndecoratedSmoothedPWDB;
   289	
   290		if (pPktinfo->to_self || pPktinfo->is_beacon) {
   291			if (!isCCKrate) { /* ofdm rate */
   292				if (pPhyInfo->rx_mimo_signal_strength[RF_PATH_B] == 0) {
   293					RSSI_Ave = pPhyInfo->rx_mimo_signal_strength
   294							   [RF_PATH_A];
   295					pDM_Odm->RSSI_A =
   296						pPhyInfo->rx_mimo_signal_strength
   297							[RF_PATH_A];
   298					pDM_Odm->RSSI_B = 0;
   299				} else {
   300					pDM_Odm->RSSI_A =
   301						pPhyInfo->rx_mimo_signal_strength
   302							[RF_PATH_A];
   303					pDM_Odm->RSSI_B =
   304						pPhyInfo->rx_mimo_signal_strength
   305							[RF_PATH_B];
   306	
   307					if (pPhyInfo->rx_mimo_signal_strength[RF_PATH_A] >
   308					    pPhyInfo->rx_mimo_signal_strength[RF_PATH_B]) {
   309						RSSI_max =
   310							pPhyInfo->rx_mimo_signal_strength
   311								[RF_PATH_A];
   312						RSSI_min =
   313							pPhyInfo->rx_mimo_signal_strength
   314								[RF_PATH_B];
   315					} else {
   316						RSSI_max =
   317							pPhyInfo->rx_mimo_signal_strength
   318								[RF_PATH_B];
   319						RSSI_min =
   320							pPhyInfo->rx_mimo_signal_strength
   321								[RF_PATH_A];
   322					}
   323	
   324					if ((RSSI_max - RSSI_min) < 3)
   325						RSSI_Ave = RSSI_max;
   326					else if ((RSSI_max - RSSI_min) < 6)
   327						RSSI_Ave = RSSI_max - 1;
   328					else if ((RSSI_max - RSSI_min) < 10)
   329						RSSI_Ave = RSSI_max - 2;
   330					else
   331						RSSI_Ave = RSSI_max - 3;
   332				}
   333	
   334				/* 1 Process OFDM RSSI */
   335				if (UndecoratedSmoothedOFDM <= 0) /*  initialize */
   336					UndecoratedSmoothedOFDM = pPhyInfo->rx_pwd_ba11;
   337				else {
   338					if (pPhyInfo->rx_pwd_ba11 >
   339					    (u32)UndecoratedSmoothedOFDM) {
   340						UndecoratedSmoothedOFDM =
   341							((UndecoratedSmoothedOFDM *
   342							  (Rx_Smooth_Factor - 1)) +
   343							 RSSI_Ave) /
   344							Rx_Smooth_Factor;
   345						UndecoratedSmoothedOFDM =
   346							UndecoratedSmoothedOFDM + 1;
   347					} else {
   348						UndecoratedSmoothedOFDM =
   349							((UndecoratedSmoothedOFDM *
   350							  (Rx_Smooth_Factor - 1)) +
   351							 RSSI_Ave) /
   352							Rx_Smooth_Factor;
   353					}
   354				}
   355	
   356				pEntry->rssi_stat.PacketMap =
   357					(pEntry->rssi_stat.PacketMap << 1) | BIT(0);
   358	
   359			} else {
   360				RSSI_Ave = pPhyInfo->rx_pwd_ba11;
   361				pDM_Odm->RSSI_A = (u8)pPhyInfo->rx_pwd_ba11;
   362				pDM_Odm->RSSI_B = 0;
   363	
   364				/* 1 Process CCK RSSI */
   365				if (UndecoratedSmoothedCCK <= 0) /*  initialize */
   366					UndecoratedSmoothedCCK = pPhyInfo->rx_pwd_ba11;
   367				else {
   368					if (pPhyInfo->rx_pwd_ba11 >
   369					    (u32)UndecoratedSmoothedCCK) {
   370						UndecoratedSmoothedCCK =
   371							((UndecoratedSmoothedCCK *
   372							  (Rx_Smooth_Factor - 1)) +
   373							 pPhyInfo->rx_pwd_ba11) /
   374							Rx_Smooth_Factor;
   375						UndecoratedSmoothedCCK =
   376							UndecoratedSmoothedCCK + 1;
   377					} else {
   378						UndecoratedSmoothedCCK =
   379							((UndecoratedSmoothedCCK *
   380							  (Rx_Smooth_Factor - 1)) +
   381							 pPhyInfo->rx_pwd_ba11) /
   382							Rx_Smooth_Factor;
   383					}
   384				}
   385				pEntry->rssi_stat.PacketMap =
   386					pEntry->rssi_stat.PacketMap << 1;
   387			}
   388	
   389			/* if (pEntry) */
   390			{
   391				/* 2011.07.28 LukeLee: modified to prevent unstable CCK RSSI */
   392				if (pEntry->rssi_stat.ValidBit >= 64)
   393					pEntry->rssi_stat.ValidBit = 64;
   394				else
   395					pEntry->rssi_stat.ValidBit++;
   396	
   397				for (i = 0; i < pEntry->rssi_stat.ValidBit; i++)
   398					OFDM_pkt +=
   399						(u8)(pEntry->rssi_stat.PacketMap >> i) &
   400						BIT(0);
   401	
   402				if (pEntry->rssi_stat.ValidBit == 64) {
   403					Weighting = ((OFDM_pkt << 4) > 64) ?
   404							    64 :
   405							    (OFDM_pkt << 4);
   406					UndecoratedSmoothedPWDB =
   407						(Weighting * UndecoratedSmoothedOFDM +
   408						 (64 - Weighting) *
   409							 UndecoratedSmoothedCCK) >>
   410						6;
   411				} else {
   412					if (pEntry->rssi_stat.ValidBit != 0)
   413						UndecoratedSmoothedPWDB =
   414							(OFDM_pkt *
   415								 UndecoratedSmoothedOFDM +
   416							 (pEntry->rssi_stat.ValidBit -
   417							  OFDM_pkt) *
   418								 UndecoratedSmoothedCCK) /
   419							pEntry->rssi_stat.ValidBit;
   420					else
   421						UndecoratedSmoothedPWDB = 0;
   422				}
   423	
   424				pEntry->rssi_stat.UndecoratedSmoothedCCK =
   425					UndecoratedSmoothedCCK;
   426				pEntry->rssi_stat.UndecoratedSmoothedOFDM =
   427					UndecoratedSmoothedOFDM;
   428				pEntry->rssi_stat.UndecoratedSmoothedPWDB =
   429					UndecoratedSmoothedPWDB;
   430			}
   431		}
   432	}
   433	
   434	/*  Endianness before calling this API */
 > 435	<<<<<<< HEAD
   436	void odm_phy_status_query(struct dm_odm_t *dm_odm,
   437				  struct odm_phy_info *phy_info,
   438	=======
   439	void odm_phy_status_query(struct dm_odm_t *dm_odm,
   440				  struct odm_phy_info *phy_info,
   441	>>>>>>> f52adf8 (staging: rtl8723bs: unwind cast mess and remove phy_stat struct)
   442				  struct rtl8723bs_phy_status_rpt *phy_status,
   443				  struct odm_packet_info *pkt_info)
   444	{
   445		odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
   446	
   447		if (!dm_odm->RSSI_test)
   448			odm_Process_RSSIForDM(dm_odm, phy_info, pkt_info);
   449	}
   450	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
