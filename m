Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382444E020D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680452; cv=none; b=dmX983IclQYikGqeJBFofwysFtFCTExyOHmb7zAGPKzqR/3w9k5ZWxC7xJGorMZedhNMUxE9P96EYWy9WAVguar4N8uFoIWiBWjmaE7q/xBKQ6KA7g6eZEcm+RBnBjaIw74gA0pyc48GRFdQzWNS1QFSL5uouBig4e1bEQ6wavg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680452; c=relaxed/simple;
	bh=444qcTyDFssSONN2CAoNIZgSixEPRidjUfw6eJHjHNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DM7u3RdnFjNz4WLomPIZKNnEyABvwSIjpM+loMJAeY9lEkVMBMgprlG6frfuruJMJv3EhjMZ6pjkJuc/kuWL3pxBP1F0aC6vx3whIL1moCwtjptppM7OUDnQzxCp/EZbqTrCvjl2XJ6AOhSN53mBvZcpxPc013nrOUeggQAReaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTJEbNxd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTJEbNxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789680449; x=1821216449;
  h=date:from:to:cc:subject:message-id;
  bh=444qcTyDFssSONN2CAoNIZgSixEPRidjUfw6eJHjHNo=;
  b=VTJEbNxd5z7VMmhZhEupAF29YPlJ0udsyfXTcP4c2VDj+Su9ZlNKfgQg
   EZpsR6pTOt1Uo7wnspaGJ6ZtbA9e55XmTTfjA5RqZFl06GJWuCIu6tIiP
   54Qa8lLgfuPqdOntwp5kv3w+0dqRqTd35AFNXZCqtXXFsnWCRkI683k2o
   giD3YVXIG7QTRKEaUyVBTmglUD2uMHwQddgHsCvVd7ctQzyuxkZb/dn7Q
   2uFsHva+tbnHAcT+NmWIz2eQgA72OJWeqnpEASHndDvQ/GbQiVc7QD6Tr
   KfTfL+m/+/ZyQT7EwfxFPQ5ttm2psKjNAuWWGsSi3NOFOx4oXI0kOfWh7
   A==;
X-CSE-ConnectionGUID: 4lkPQtSCTxaaGEhOUMSDIg==
X-CSE-MsgGUID: QlH3YVz8Qeyy+KrEDq/5IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93982798"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93982798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 14:27:23 -0700
X-CSE-ConnectionGUID: bFEm+EQMTimLl/OZJHvS6A==
X-CSE-MsgGUID: DxDXIpJvSt6n1RwsFLqfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276005691"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2026 14:27:21 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7JdX-000000000lc-0dj4;
	Thu, 17 Sep 2026 21:27:19 +0000
Date: Thu, 17 Sep 2026 23:26:59 +0200
From: kernel test robot <lkp@intel.com>
To: Johnson Tsai <wenjie.tsai@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Ping-Ke Shih" <pkshih@realtek.com>
Subject: ld.lld: error: undefined symbol:
 led_classdev_multicolor_unregister
Message-ID: <202609172315.ZYoKvKBS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5a051f6b840d48f159166ef073d3021989bfb50
commit: 721d90c8509aee195c3714b70c4cff612fbb3a1c wifi: rtw89: add multicolor LED support for RTL8852CU valve board
date:   8 weeks ago
config: hexagon-randconfig-r072-20260915 (https://download.01.org/0day-ci/archive/20260917/202609172315.ZYoKvKBS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609172315.ZYoKvKBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 721d90c8509a ("wifi: rtw89: add multicolor LED support for RTL8852CU valve board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609172315.ZYoKvKBS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: led_classdev_multicolor_register_ext
   >>> referenced by led_mc.c:67 (drivers/net/wireless/realtek/rtw89/led_mc.c:67)
   >>>               drivers/net/wireless/realtek/rtw89/led_mc.o:(rtw89_led_mc_init) in archive vmlinux.a
   >>> referenced by led_mc.c:67 (drivers/net/wireless/realtek/rtw89/led_mc.c:67)
   >>>               drivers/net/wireless/realtek/rtw89/led_mc.o:(rtw89_led_mc_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: led_classdev_multicolor_unregister
   >>> referenced by led_mc.c:80 (drivers/net/wireless/realtek/rtw89/led_mc.c:80)
   >>>               drivers/net/wireless/realtek/rtw89/led_mc.o:(rtw89_led_mc_deinit) in archive vmlinux.a
   >>> referenced by led_mc.c:80 (drivers/net/wireless/realtek/rtw89/led_mc.c:80)
   >>>               drivers/net/wireless/realtek/rtw89/led_mc.o:(rtw89_led_mc_deinit) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
