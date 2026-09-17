Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B6526AAA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651730; cv=none; b=KhHu5Avq7IBB6Bq6LlKQTYaEY1qpdt/TpflM6eRe+w7/p0pu14lcKK9qjnmEHvbqwtCVKVbP3irSBe7q13ynXVko2CukR6DSKho0Qj2ZflupLF4HIBDZEszH+HqWhB1kim5HuJLqi15wlmtqJ3I6lMq2aO3oNJQUdamPEBPYFVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651730; c=relaxed/simple;
	bh=VFMW7WqD2H7/PGZFsYRVm7qkjfszn4L3nBbD2J+r3Uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FzO3Bkq0TvEnYMAjBwpANKKIlxaIdm8CI6kDSgpt/p/QcPNWdmxah+i2tScgRMihh3rOCzpyxm4O6S6wOCq+mxZY8GyTU7hKTYKGW0SX73S+X93/G9aJxzoeANrtWd0racgRzorS/aXcDrus4fReOYMyfLnPuKDZNPnSQVQiXTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LK4faxT9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LK4faxT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789651728; x=1821187728;
  h=date:from:to:cc:subject:message-id;
  bh=VFMW7WqD2H7/PGZFsYRVm7qkjfszn4L3nBbD2J+r3Uo=;
  b=LK4faxT92Pkx7nBJQwxlMT2IQqBfNohNDZoVxS1etFYq8siwQ+aLmr4m
   Lcn/vKMHW0iFXm3xgRMi2MNzOrlCUxCCJxis9dBqTPMp4JJj6gmoCJN6N
   Kll0xK+5V21iXOgsBkC2Y1Ill3yYAx0Y4xsHoqBwV9GP6penp3l3k54KG
   ZqaXmpgzSjsnwZoniAzfrELfNjszN6l/DcStYwWjNJqwZo43vgE8Ji4iR
   waUjf674zsAIZzCkzWVZfEdiWVol3SGxW88QoCZzPeN7eh7fZlgRX9zSG
   KfghTKIneCLYZXEL7eCWq+I9oWoULtfSEStBqIxN93sgmytWHwM/5cYjt
   w==;
X-CSE-ConnectionGUID: KNREj6pBQ9q5OcsXrSq19Q==
X-CSE-MsgGUID: jgrgHmVzS4yOh1Po67+NwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77638084"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77638084"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:28:44 -0700
X-CSE-ConnectionGUID: B3l6yliPRmyukrASCpvjsA==
X-CSE-MsgGUID: LRF0M+P1Shijj+3iwJQDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267549048"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2026 06:28:43 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7CAK-000000000bg-26uK;
	Thu, 17 Sep 2026 13:28:40 +0000
Date: Thu, 17 Sep 2026 15:28:13 +0200
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulfh@kernel.org>
Subject: drivers/mmc/host/bcm2835.c:1343:3-16: opportunity for
 str_enabled_disabled(host -> dma_dev)
Message-ID: <202609171525.Y5oqkp1i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   238650ef6c7c7cca08e032527329424c9fbd70e5
commit: 5608386899d9de8030980bce3d05bded28f9bfb8 mmc: bcm2835: DMA mapping improvements
date:   9 weeks ago
config: riscv-randconfig-r2104-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171525.Y5oqkp1i-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c20428cbb5f551d54520d492b1d27011e4076f5b)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5608386899d9 ("mmc: bcm2835: DMA mapping improvements")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171525.Y5oqkp1i-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mmc/host/bcm2835.c:1343:3-16: opportunity for str_enabled_disabled(host -> dma_dev)

vim +1343 drivers/mmc/host/bcm2835.c

  1256	
  1257	static int bcm2835_add_host(struct bcm2835_host *host)
  1258	{
  1259		struct mmc_host *mmc = mmc_from_priv(host);
  1260		struct device *dev = &host->pdev->dev;
  1261		char pio_limit_string[20];
  1262		int ret;
  1263	
  1264		if (!mmc->f_max || mmc->f_max > host->max_clk)
  1265			mmc->f_max = host->max_clk;
  1266		mmc->f_min = host->max_clk / SDCDIV_MAX_CDIV;
  1267	
  1268		mmc->max_busy_timeout = ~0 / (mmc->f_max / 1000);
  1269	
  1270		dev_dbg(dev, "f_max %d, f_min %d, max_busy_timeout %d\n",
  1271			mmc->f_max, mmc->f_min, mmc->max_busy_timeout);
  1272	
  1273		/* host controller capabilities */
  1274		mmc->caps |= MMC_CAP_SD_HIGHSPEED | MMC_CAP_MMC_HIGHSPEED |
  1275			     MMC_CAP_NEEDS_POLL | MMC_CAP_HW_RESET | MMC_CAP_CMD23;
  1276	
  1277		spin_lock_init(&host->lock);
  1278		mutex_init(&host->mutex);
  1279	
  1280		if (!host->dma_chan_rxtx) {
  1281			dev_warn(dev, "unable to initialise DMA channel. Falling back to PIO\n");
  1282		} else {
  1283			host->dma_cfg_tx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
  1284			host->dma_cfg_tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
  1285			host->dma_cfg_tx.direction = DMA_MEM_TO_DEV;
  1286			host->dma_cfg_tx.src_addr = 0;
  1287			host->dma_cfg_tx.dst_addr = host->phys_addr + SDDATA;
  1288	
  1289			host->dma_cfg_rx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
  1290			host->dma_cfg_rx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
  1291			host->dma_cfg_rx.direction = DMA_DEV_TO_MEM;
  1292			host->dma_cfg_rx.src_addr = host->phys_addr + SDDATA;
  1293			host->dma_cfg_rx.dst_addr = 0;
  1294	
  1295			if (!dmaengine_slave_config(host->dma_chan_rxtx,
  1296						   &host->dma_cfg_tx) &&
  1297			    !dmaengine_slave_config(host->dma_chan_rxtx,
  1298						   &host->dma_cfg_rx)) {
  1299				host->dma_dev =
  1300					dmaengine_get_dma_device(host->dma_chan_rxtx);
  1301			}
  1302		}
  1303	
  1304		mmc->max_segs = 128;
  1305		mmc->max_req_size = 524288;
  1306		if (host->dma_dev) {
  1307			mmc->max_req_size = min_t(size_t, mmc->max_req_size,
  1308					dma_max_mapping_size(host->dma_dev));
  1309		}
  1310		mmc->max_seg_size = mmc->max_req_size;
  1311		mmc->max_blk_size = 1024;
  1312		mmc->max_blk_count =  65535;
  1313	
  1314		/* report supported voltage ranges */
  1315		mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
  1316	
  1317		INIT_WORK(&host->dma_work, bcm2835_dma_complete_work);
  1318		INIT_DELAYED_WORK(&host->timeout_work, bcm2835_timeout);
  1319	
  1320		/* Set interrupt enables */
  1321		host->hcfg = SDHCFG_BUSY_IRPT_EN;
  1322	
  1323		bcm2835_reset_internal(host);
  1324	
  1325		ret = request_threaded_irq(host->irq, bcm2835_irq,
  1326					   bcm2835_threaded_irq,
  1327					   0, mmc_hostname(mmc), host);
  1328		if (ret) {
  1329			dev_err(dev, "failed to request IRQ %d: %d\n", host->irq, ret);
  1330			return ret;
  1331		}
  1332	
  1333		ret = mmc_add_host(mmc);
  1334		if (ret) {
  1335			free_irq(host->irq, host);
  1336			return ret;
  1337		}
  1338	
  1339		pio_limit_string[0] = '\0';
  1340		if (host->dma_dev && (PIO_THRESHOLD > 0))
  1341			sprintf(pio_limit_string, " (>%d)", PIO_THRESHOLD);
  1342		dev_info(dev, "loaded - DMA %s%s\n",
> 1343			 host->dma_dev ? "enabled" : "disabled", pio_limit_string);
  1344	
  1345		return 0;
  1346	}
  1347	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
