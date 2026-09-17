Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1A499F21
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634571; cv=none; b=mtMOEcsmra/R3iCWuwSddmEXS+j7BNVdOdBzefKeP5VotBPtfImRz227cVqnRxJvtvahJp/vLsrXbHTXc9ppHfyfgURMJKy0Aoe5EnyNH/Yjw0t9OKbNfcELVlLArpvxH3qTHVfD01pmnLZBPOMNMGaUeNNrg5UEsLNJWXuzziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634571; c=relaxed/simple;
	bh=dDYrvLxzGuAyRUKfxqQiunKzUA0FUN/PVRjEgoW2ZsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q69w5YQezUB16ebzImNqMahtpmqvcXwto4AePzG8yDGqv9SWom7TzgIw5KyitgkHlm6JpRpkA3HIFDAQvrJDxlN1B1sgqDN+Qv72cc6N4zT2+HxUw2BKwAYJHyaFKJi55o+6d9H+V4v+ZmpxYURTzBIOq2HWXE+PKZdNudeS3DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OV6cDIw2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OV6cDIw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789634568; x=1821170568;
  h=date:from:to:cc:subject:message-id;
  bh=dDYrvLxzGuAyRUKfxqQiunKzUA0FUN/PVRjEgoW2ZsA=;
  b=OV6cDIw2iiQn9ubhwHXmqp4lg1r1NxJq1QfpBoi0VWipjrx7XYGh0duZ
   32NA1WxCjcisMBVKJHFXYk0dYMVL+EAzGVLpygJ75JsxQVIXJKWzwAjTY
   3aSWAfYHn4LuVh7HqBIldx8zdH3NovbG887zfGS8TQMZajsci4e4GgKr+
   vLyJHm/VjntUdeQzFlQsksxi2dlEBlh/aKtwzBuv1BKk7ewBM+ax8THql
   Ae+JmgNHh26Q1hhzFNfdR+ToNUNRHUjQuf3wxG5hEoDmxHcmEVX5JbHHn
   mwkxI3BIoycFs+6TWg7rb5AX0SIyTXQ2onYkZN5+njqSaP6k8solWpVnY
   w==;
X-CSE-ConnectionGUID: Efy45KOBRSG+vmFT8psyyA==
X-CSE-MsgGUID: O+C0H/ZvRemyySDp+yINng==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90051587"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90051587"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:42:40 -0700
X-CSE-ConnectionGUID: oxMLzW00THG/tEH2rf3LBg==
X-CSE-MsgGUID: ulo9XoEHTAO2NJFCe+5Erg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1870916"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 17 Sep 2026 01:42:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x77hT-000000007Ph-1Qrb;
	Thu, 17 Sep 2026 08:42:35 +0000
Date: Thu, 17 Sep 2026 16:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa-dev@sang-engineering.com>,
 Srinivas Kandagatla <srini@kernel.org>
Subject: drivers/nvmem/m24lr.c:343:24: sparse: sparse: cast to
 restricted __le16
Message-ID: <202609171615.pqY38RUJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Bartosz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: cf09b7a05618bea99468b67fe80202efba1b48ad eeprom: move nvmem EEPROM drivers to drivers/nvmem/
date:   7 weeks ago
config: x86_64-randconfig-1301-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171615.pqY38RUJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171615.pqY38RUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cf09b7a05618 ("eeprom: move nvmem EEPROM drivers to drivers/nvmem/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171615.pqY38RUJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvmem/m24lr.c:343:24: sparse: sparse: cast to restricted __le16
>> drivers/nvmem/m24lr.c:343:24: sparse: sparse: cast from restricted __le64
>> drivers/nvmem/m24lr.c:346:24: sparse: sparse: cast to restricted __le32
   drivers/nvmem/m24lr.c:346:24: sparse: sparse: cast from restricted __le64

vim +343 drivers/nvmem/m24lr.c

cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  323  
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  324  static ssize_t m24lr_read_reg_le(struct m24lr *m24lr, u64 *val,
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  325  				 unsigned int reg_addr,
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  326  				 unsigned int reg_size)
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  327  {
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  328  	ssize_t ret;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  329  	__le64 input = 0;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  330  
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  331  	ret = m24lr_read(m24lr, (u8 *)&input, reg_size, reg_addr, false);
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  332  	if (IS_ERR_VALUE(ret))
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  333  		return ret;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  334  
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  335  	if (ret != reg_size)
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  336  		return -EINVAL;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  337  
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  338  	switch (reg_size) {
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  339  	case 1:
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  340  		*val = *(u8 *)&input;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  341  		break;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  342  	case 2:
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17 @343  		*val = le16_to_cpu((__le16)input);
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  344  		break;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  345  	case 4:
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17 @346  		*val = le32_to_cpu((__le32)input);
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  347  		break;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  348  	case 8:
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  349  		*val = le64_to_cpu((__le64)input);
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  350  		break;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  351  	default:
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  352  		return -EINVAL;
b009c1dbfc9854c drivers/misc/eeprom/m24lr.c Chen Ni              2025-08-21  353  	}
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  354  
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  355  	return 0;
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  356  }
cd5c5e0231c538a drivers/misc/eeprom/m24lr.c Abd-Alrhman Masalkhi 2025-07-17  357  

:::::: The code at line 343 was first introduced by commit
:::::: cd5c5e0231c538a5d2d4a73f3b3ffc77ff08449c eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips

:::::: TO: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
