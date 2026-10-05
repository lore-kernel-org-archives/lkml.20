Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701DF4A2A49
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210021; cv=none; b=g6cJGg+FicuLmCxNfMOM3sxlK7LgwRJNNORsKLWNUZZLXfxa9Xea+SHiJZS5JoOxYZQsn2FJfx5ifMu/2dc44HkHLMNxWRqEgNjO8hlAGxxtYm91O6bVmZPx8Me+6BfTeu0M/dHJZreXHmRLU1xKR0iYd124tsalSRQ5WMwr6k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210021; c=relaxed/simple;
	bh=AAiZAurQb496xANjh938zyOwop/Y+FOeAtVnPaqwKnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k2cN2NAuz5d7mKKqJuqQ193AbgXUPVqKARgB+ocXg3ov/p8op7Evy7M9gWJ0WqFf36pccg9GMhP1sTMJSrr+f3cqt0vrfNQW6/VO06eCq2od7XiIx8qkvLqD78b6KaJWmhZ2zzol23shTO/wewkxFHz6IBR6Mu01UbjSqfo291I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNZOxrfD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNZOxrfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791210014; x=1822746014;
  h=date:from:to:cc:subject:message-id;
  bh=AAiZAurQb496xANjh938zyOwop/Y+FOeAtVnPaqwKnI=;
  b=CNZOxrfDjZBFkEFqk7/O2uYfK+Sy8wtoHRtRyxECVQmyvQpKcjbaJsxC
   aBgLZloQEYkCCFZ4OrNpT/yWwLWXQy2AaNql/NCpPcVQFTEo6bV9cUtqy
   FFRkMMLqttoFXKKwDRJdIYe9mY6RgLhHklRYrg+HcLJ0O6ZKtQcwxgjzu
   B3xoE4CRUZ8/Pc8BbMnvsNZAwIaX7oksrkzeYo61oabwaTvAVltXB3FiD
   +bhPSBgy3upGZsWIoGnfQTI+rOSvjZWDnzs5kn1Xo8F99ncDCeddKIRjf
   XW3ArO3pjjV5EUwnAzoxRj55ItL5QmSjk8q69VEaztdLKG8VXV1NZr8Fc
   A==;
X-CSE-ConnectionGUID: C4EPd4t4SriosXjTJpWFGQ==
X-CSE-MsgGUID: ACgpeLVMRgWIy60QaPZRtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91013248"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91013248"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:19:29 -0700
X-CSE-ConnectionGUID: 5kucTfoCQOSBOO11phYSSA==
X-CSE-MsgGUID: NXsIL9sdQWKIRYYJnqV2Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="284917017"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Oct 2026 07:19:25 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDjXH-0000000009P-3YyJ;
	Mon, 05 Oct 2026 14:19:23 +0000
Date: Mon, 05 Oct 2026 16:18:30 +0200
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202610051611.wKVwypdk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: f08e7a4e8d6ac4de677727af352ea33c6ce9f444 pmdomain: mediatek: Add support for MFlexGraphics
date:   11 months ago
config: loongarch-randconfig-r2302-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051611.wKVwypdk-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051611.wKVwypdk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f08e7a4e8d6a ("pmdomain: mediatek: Add support for MFlexGraphics")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051611.wKVwypdk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned long @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     got unsigned long
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] ipi_magic @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     got unsigned int [usertype] ipi_magic
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:472:19: sparse: sparse: restricted signed int degrades to integer
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [assigned] [usertype] base @@     got unsigned long long [usertype] shared_mem_phys @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     expected restricted __le64 [assigned] [usertype] base
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     got unsigned long long [usertype] shared_mem_phys
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] size @@     got unsigned int shared_mem_size @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     expected restricted __le32 [assigned] [usertype] size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     got unsigned int shared_mem_size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] power_state @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     expected restricted __le32 [usertype] power_state
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] gpu_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     expected restricted signed int [usertype] gpu_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     got unsigned int opp_idx
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] stack_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     expected restricted signed int [usertype] stack_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     got unsigned int opp_idx
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:578:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:579:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:593:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:594:46: sparse: sparse: restricted __le32 degrades to integer

vim +458 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c

   411	
   412	static int mtk_mfg_eb_off(struct mtk_mfg *mfg)
   413	{
   414		struct device *dev = &mfg->pdev->dev;
   415		struct mtk_mfg_ipi_sleep_msg msg = {
   416			.event = 0,
   417			.state = 0,
 > 418			.magic = GPUEB_SLEEP_MAGIC
   419		};
   420		u32 val;
   421		int ret;
   422	
   423		ret = mbox_send_message(mfg->slp_mbox->ch, &msg);
   424		if (ret < 0) {
   425			dev_err(dev, "Cannot send sleep command: %pe\n", ERR_PTR(ret));
   426			return ret;
   427		}
   428	
   429		ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
   430					 !(val & PWR_ACK_M), GPUEB_POLL_US,
   431					 GPUEB_TIMEOUT_US);
   432	
   433		if (ret) {
   434			dev_err(dev, "Timed out waiting for EB to power off, val=0x%08X\n", val);
   435			return ret;
   436		}
   437	
   438		return 0;
   439	}
   440	
   441	/**
   442	 * mtk_mfg_send_ipi - synchronously send an IPI message on the gpufreq channel
   443	 * @mfg: pointer to this driver instance's private &struct mtk_mfg
   444	 * @msg: pointer to a message to send; will have magic filled and response assigned
   445	 *
   446	 * Send an IPI message on the gpufreq channel, and wait for a response. Once a
   447	 * response is received, assign a pointer to the response buffer (valid until
   448	 * next response is received) to @msg.
   449	 *
   450	 * Returns 0 on success, negative errno on failure.
   451	 */
   452	static int mtk_mfg_send_ipi(struct mtk_mfg *mfg, struct mtk_mfg_ipi_msg *msg)
   453	{
   454		struct device *dev = &mfg->pdev->dev;
   455		unsigned long wait;
   456		int ret;
   457	
 > 458		msg->magic = mfg->ipi_magic;
   459	
   460		ret = mbox_send_message(mfg->gf_mbox->ch, msg);
   461		if (ret < 0) {
   462			dev_err(dev, "Cannot send GPUFreq IPI command: %pe\n", ERR_PTR(ret));
   463			return ret;
   464		}
   465	
   466		wait = wait_for_completion_timeout(&mfg->gf_mbox->rx_done, msecs_to_jiffies(500));
   467		if (!wait)
   468			return -ETIMEDOUT;
   469	
   470		msg = mfg->gf_mbox->rx_data;
   471	
 > 472		if (msg->u.return_value < 0) {
   473			dev_err(dev, "IPI return: %d\n", msg->u.return_value);
   474			return -EPROTO;
   475		}
   476	
   477		return 0;
   478	}
   479	
   480	static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
   481	{
   482		struct device *dev = &mfg->pdev->dev;
   483		struct mtk_mfg_ipi_msg msg = {};
   484		int ret;
   485	
   486		dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", mfg->shared_mem_size);
   487		memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
   488	
   489		msg.cmd = CMD_INIT_SHARED_MEM;
 > 490		msg.u.shared_mem.base = mfg->shared_mem_phys;
 > 491		msg.u.shared_mem.size = mfg->shared_mem_size;
   492	
   493		ret = mtk_mfg_send_ipi(mfg, &msg);
   494		if (ret)
   495			return ret;
   496	
   497		if (readl(mfg->shared_mem + GF_REG_MAGIC) != GPUEB_MEM_MAGIC) {
   498			dev_err(dev, "EB did not initialise shared memory correctly\n");
   499			return -EIO;
   500		}
   501	
   502		return 0;
   503	}
   504	
   505	static int mtk_mfg_power_control(struct mtk_mfg *mfg, bool enabled)
   506	{
   507		struct mtk_mfg_ipi_msg msg = {};
   508	
   509		msg.cmd = CMD_POWER_CONTROL;
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
 > 523		msg.cmd = CMD_FIX_DUAL_TARGET_OPPIDX;
   524		msg.u.dual_commit.gpu_oppidx = opp_idx;
 > 525		msg.u.dual_commit.stack_oppidx = opp_idx;
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
   537	static int mtk_mfg_read_opp_tables(struct mtk_mfg *mfg)
   538	{
   539		struct device *dev = &mfg->pdev->dev;
   540		struct mtk_mfg_opp_entry e = {};
   541		unsigned int i;
   542	
   543		mfg->num_gpu_opps = readl(mfg->shared_mem + GF_REG_GPU_OPP_NUM);
   544		mfg->num_stack_opps = readl(mfg->shared_mem + GF_REG_STK_OPP_NUM);
   545	
   546		if (mfg->num_gpu_opps > MAX_OPP_NUM || mfg->num_gpu_opps == 0) {
   547			dev_err(dev, "GPU OPP count (%u) out of range %u >= count > 0\n",
   548				mfg->num_gpu_opps, MAX_OPP_NUM);
   549			return -EINVAL;
   550		}
   551	
   552		if (mfg->num_stack_opps && mfg->num_stack_opps > MAX_OPP_NUM) {
   553			dev_err(dev, "Stack OPP count (%u) out of range %u >= count >= 0\n",
   554				mfg->num_stack_opps, MAX_OPP_NUM);
   555			return -EINVAL;
   556		}
   557	
   558		mfg->gpu_opps = devm_kcalloc(dev, mfg->num_gpu_opps,
   559					     sizeof(struct dev_pm_opp_data), GFP_KERNEL);
   560		if (!mfg->gpu_opps)
   561			return -ENOMEM;
   562	
   563		if (mfg->num_stack_opps) {
   564			mfg->stack_opps = devm_kcalloc(dev, mfg->num_stack_opps,
   565						       sizeof(struct dev_pm_opp_data), GFP_KERNEL);
   566			if (!mfg->stack_opps)
   567				return -ENOMEM;
   568		}
   569	
   570		for (i = 0; i < mfg->num_gpu_opps; i++) {
   571			memcpy_fromio(&e, mfg->shared_mem + GF_REG_OPP_TABLE_GPU + i * sizeof(e),
   572				      sizeof(e));
   573			if (mem_is_zero(&e, sizeof(e))) {
   574				dev_err(dev, "ran into an empty GPU OPP at index %u\n",
   575					i);
   576				return -EINVAL;
   577			}
 > 578			mfg->gpu_opps[i].freq = e.freq_khz * HZ_PER_KHZ;
   579			mfg->gpu_opps[i].u_volt = e.voltage_core * 10;
   580			mfg->gpu_opps[i].level = i;
   581			if (i < mfg->variant->turbo_below)
   582				mfg->gpu_opps[i].turbo = true;
   583		}
   584	
   585		for (i = 0; i < mfg->num_stack_opps; i++) {
   586			memcpy_fromio(&e, mfg->shared_mem + GF_REG_OPP_TABLE_STK + i * sizeof(e),
   587				      sizeof(e));
   588			if (mem_is_zero(&e, sizeof(e))) {
   589				dev_err(dev, "ran into an empty Stack OPP at index %u\n",
   590					i);
   591				return -EINVAL;
   592			}
   593			mfg->stack_opps[i].freq = e.freq_khz * HZ_PER_KHZ;
   594			mfg->stack_opps[i].u_volt = e.voltage_core * 10;
   595			mfg->stack_opps[i].level = i;
   596			if (i < mfg->variant->turbo_below)
   597				mfg->stack_opps[i].turbo = true;
   598		}
   599	
   600		return 0;
   601	}
   602	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
