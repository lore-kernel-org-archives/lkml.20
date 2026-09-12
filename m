Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363D938A715
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253211; cv=none; b=K7jhiRWe1eqHeLRU11MiGpldZAvrErrAGQO7m4GqWmCLRrw03wrClm5QRCudK4wP/7uLERBlXtd9FixDhZC/FAi5eTHdmvd+2tF/dfw1ixc/DDCnYJ5TjT0JHkoMiwnWuF6OaIlZfbCXjsaHMd8mD6QYZf2oKQpxUFuCwXsOKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253211; c=relaxed/simple;
	bh=yDpyHvYbbWSkYkmWXV2urC6uHh5C/2nangAwNM8kY4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CRURlovlx8FLw2Cx0FiAu54VH+05HDR6r+hCHRIpz3ujm7h1uASnEFY0wJzPV/E41pgfSOrOx2TESRsJPdgQUTZcZgtdQMUdp48gJGN2SK2pLrTWX/Xi4eghNEFi8rqo1CyUWwkig6QYjGtcxm96vTdQ6F6lerLnnJ5ELSp/lUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sv0jp8hN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sv0jp8hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789253209; x=1820789209;
  h=date:from:to:cc:subject:message-id;
  bh=yDpyHvYbbWSkYkmWXV2urC6uHh5C/2nangAwNM8kY4M=;
  b=Sv0jp8hNMr1AKX27/NI1or7YWy0krv+98FAA6IPNVFAy37GspUYYExFw
   SnpiH89cTe62ieUS6VNfrCBl87ydTdy2m93mQDZYZhadKVmk5L7k7onBZ
   7M1GExGH7Jr8+bma7YFp8YpiKfIOkYo1B/duXFBU+gvwk/T2SFPByIfOy
   usW2VT1KPO47pTxnRn2U/LkLiu1iZ/HzAW27M78Er/WK61rs2zJ7l+E/H
   u5w/hV3Vq5rXOP7xqLkPR7DBP6GQgpyz0GOJU9bPiWtmuxmEpTvRYYAjf
   +oN2pZYfvIqHg2PRBRIyM9CH4AagEj5RZ6wE1XxjAb3ZpobxRtN0FdEjl
   w==;
X-CSE-ConnectionGUID: /I7ObAoOSQeTQLL7b9trdA==
X-CSE-MsgGUID: fbS4bUktRbC2fueVfMMllA==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="93496568"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="93496568"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 15:46:48 -0700
X-CSE-ConnectionGUID: W3m6SbCuSl+iMQes90vTfA==
X-CSE-MsgGUID: X/sMXmuSTWq9CGsrfYHdSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="269646171"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2026 15:46:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5WUe-000000003Kr-2Kc1;
	Sat, 12 Sep 2026 22:46:44 +0000
Date: Sun, 13 Sep 2026 06:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulfh@kernel.org>
Subject: drivers/mmc/host/sdhci-of-k1.c:340
 spacemit_sdhci_execute_tuning() warn: always true condition '(retry_delays[i]
 <= 255) => (0-255 <= 255)'
Message-ID: <202609130631.SPU5X5CN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: e9cb83c10071808aa7db4582e007a650aa6aa183 mmc: sdhci-of-k1: add comprehensive SDR tuning support
date:   4 months ago
config: arc-randconfig-r072-20260907 (https://download.01.org/0day-ci/archive/20260913/202609130631.SPU5X5CN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e9cb83c10071 ("mmc: sdhci-of-k1: add comprehensive SDR tuning support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130631.SPU5X5CN-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-of-k1.c:340 spacemit_sdhci_execute_tuning() warn: always true condition '(retry_delays[i] <= 255) => (0-255 <= 255)'

vim +340 drivers/mmc/host/sdhci-of-k1.c

   259	
   260	static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
   261	{
   262		int current_len = 0, current_start = 0;
   263		int max_pass_len = 0, max_pass_start = 0;
   264		struct mmc_host *mmc = host->mmc;
   265		struct mmc_ios ios = mmc->ios;
   266		u8 final_delay;
   267		int ret = 0;
   268		int i;
   269	
   270		/*
   271		 * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
   272		 * if clock frequency is greater than 100MHz in these modes.
   273		 */
   274		if (host->clock < 100 * 1000 * 1000 ||
   275		    !(ios.timing == MMC_TIMING_MMC_HS200 ||
   276		      ios.timing == MMC_TIMING_UHS_SDR50 ||
   277		      ios.timing == MMC_TIMING_UHS_SDR104))
   278			return 0;
   279	
   280		if (mmc->caps2 & MMC_CAP2_NO_MMC) {
   281			spacemit_sdhci_set_tx_dline_reg(host, SPACEMIT_TX_TUNING_DLINE_REG);
   282			spacemit_sdhci_set_tx_delay(host, SPACEMIT_TX_TUNING_DELAYCODE);
   283			spacemit_sdhci_tx_tuning_prepare(host);
   284	
   285			dev_dbg(mmc_dev(host->mmc), "TX tuning: dline_reg=%d, delaycode=%d\n",
   286				SPACEMIT_TX_TUNING_DLINE_REG, SPACEMIT_TX_TUNING_DELAYCODE);
   287		}
   288	
   289		spacemit_sdhci_prepare_tuning(host);
   290	
   291		for (i = SPACEMIT_RX_TUNE_DELAY_MIN; i <= SPACEMIT_RX_TUNE_DELAY_MAX; i++) {
   292			spacemit_sdhci_set_rx_delay(host, i);
   293			ret = mmc_send_tuning(host->mmc, opcode, NULL);
   294	
   295			dev_dbg(mmc_dev(host->mmc), "RX delay %d: %s\n",
   296				i, ret == 0 ? "pass" : "fail");
   297	
   298			if (ret == 0) {
   299				/* Test passed - extend current window */
   300				if (current_len == 0)
   301					current_start = i;
   302				current_len++;
   303			} else {
   304				/* Test failed - check if current window is best so far */
   305				if (current_len > max_pass_len) {
   306					max_pass_len = current_len;
   307					max_pass_start = current_start;
   308				}
   309				current_len = 0;
   310			}
   311		}
   312	
   313		if (current_len > max_pass_len) {
   314			max_pass_len = current_len;
   315			max_pass_start = current_start;
   316		}
   317	
   318		if (max_pass_len < 3) {
   319			dev_err(mmc_dev(host->mmc), "Tuning failed: no stable window found\n");
   320			return -EIO;
   321		}
   322	
   323		final_delay = max_pass_start + max_pass_len / 2;
   324		spacemit_sdhci_set_rx_delay(host, final_delay);
   325		ret = mmc_send_tuning(host->mmc, opcode, NULL);
   326		if (ret) {
   327			u8 retry_delays[] = {
   328				max_pass_start + max_pass_len / 4,
   329				max_pass_start + (3 * max_pass_len) / 4,
   330				max_pass_start,
   331				max_pass_start + max_pass_len - 1
   332			};
   333			int retry_count = ARRAY_SIZE(retry_delays);
   334	
   335			dev_warn(mmc_dev(mmc), "Primary delay %d failed, trying alternatives\n",
   336				 final_delay);
   337	
   338			for (i = 0; i < retry_count; i++) {
   339				if (retry_delays[i] >= SPACEMIT_RX_TUNE_DELAY_MIN &&
 > 340				    retry_delays[i] <= SPACEMIT_RX_TUNE_DELAY_MAX) {
   341					spacemit_sdhci_set_rx_delay(host, retry_delays[i]);
   342					ret = mmc_send_tuning(host->mmc, opcode, NULL);
   343					if (!ret) {
   344						final_delay = retry_delays[i];
   345						dev_info(mmc_dev(mmc), "Retry successful with delay %d\n",
   346							 final_delay);
   347						break;
   348					}
   349				}
   350			}
   351	
   352			if (ret) {
   353				dev_err(mmc_dev(mmc), "All retry attempts failed\n");
   354				return -EIO;
   355			}
   356		}
   357	
   358		dev_dbg(mmc_dev(host->mmc),
   359			"Tuning successful: window %d-%d, using delay %d\n",
   360			max_pass_start, max_pass_start + max_pass_len - 1, final_delay);
   361	
   362		return 0;
   363	}
   364	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
