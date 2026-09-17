Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9CB3F929B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633114; cv=none; b=BcDWQJnHEgunRIa5A59bFr6ixk6N599pAThTU+JxcA1pw4v0KaBEsZTXQv/XYuQQvguec8ED0XHdMli2S6LTT/0xqz4rmxTVaQV1o3V4Sviigq7UcvcJUz7qomy1tKN2YJ/KVDh3Qsvfm3N5fJPbiJOyA2Q7Lj6GOs0Tozpc2EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633114; c=relaxed/simple;
	bh=dYbk1THEv35Zk2pwEj5prq9m/1F4Op6cXZpxMJISa1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RQJvYYWnQddWfspNF3pgbvYUppF1Bzq6SYuluIqGJHu1TLu+sWUmluYddzJ8KmnW9OTG4SngHmPmXpgPDBRJo7KvgBx4sCMQVLExtScc9Lsuyp6cQ3inD3wRZtfG3fNadXFZ/m43oSBBWvlObM7Fitob0HbDpFhun6ECNQS8qYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M17rNVTL; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M17rNVTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789633112; x=1821169112;
  h=date:from:to:cc:subject:message-id;
  bh=dYbk1THEv35Zk2pwEj5prq9m/1F4Op6cXZpxMJISa1w=;
  b=M17rNVTLOO8ytGAXjKbbL4WFKdYOs3uOY5SK1eiJpUrZbIfcdZLDJuHx
   wXVDkYDeyd7sJ81SvYW0c2ujbxT/rPHDPei4FXtxOCreGXvG9nc6QP9iu
   CDpxuAX+rK5GbByaoqz3mpgKM1EaC8YcDRKJEa+pX5Q+YC12G9uKmmjSe
   KaN79ZlAu5iioPujfj49AC0D2CDC635y3HZnycwHDZdRTLgtcSHeeeUOI
   H+MuQczI4Vk0fIrKwhL7Wbb4Fcnra+0UBiUvF1/qS21Q8LGzL93XAntMC
   SMvEVbJwyZZNItOMytWM/h0vIWjFNbMKu2K1NV7YZWUUL1/dL8FIlhT5J
   A==;
X-CSE-ConnectionGUID: 6kwELDX8QbK34WGDE+kqgw==
X-CSE-MsgGUID: r7CzzmAdQaSXPcbAZMGiVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="539071"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="539071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:18:31 -0700
X-CSE-ConnectionGUID: rNwzWt2FQFisOlRGxeGubg==
X-CSE-MsgGUID: UwqbRiQtR+ic7kCvSEkCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="298735016"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Sep 2026 01:18:30 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x77K7-000000007N3-2ghZ;
	Thu, 17 Sep 2026 08:18:27 +0000
Date: Thu, 17 Sep 2026 16:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/mmc/host/wmt-sdmmc.c:241:39: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202609171639.ppn4Bdj8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
date:   1 year ago
config: riscv-randconfig-r1309-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171639.ppn4Bdj8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171639.ppn4Bdj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7cd8db0fb0b2 ("mmc: add COMPILE_TEST to multiple drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171639.ppn4Bdj8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/mmc/host/wmt-sdmmc.c:241:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/mmc/host/wmt-sdmmc.c:241:39: sparse:     expected unsigned int
   drivers/mmc/host/wmt-sdmmc.c:241:39: sparse:     got restricted __be32 [usertype]

vim +241 drivers/mmc/host/wmt-sdmmc.c

3a96dff0f828ae Tony Prisk 2012-11-18  221  
3a96dff0f828ae Tony Prisk 2012-11-18  222  static void wmt_mci_read_response(struct mmc_host *mmc)
3a96dff0f828ae Tony Prisk 2012-11-18  223  {
3a96dff0f828ae Tony Prisk 2012-11-18  224  	struct wmt_mci_priv *priv;
3a96dff0f828ae Tony Prisk 2012-11-18  225  	int idx1, idx2;
3a96dff0f828ae Tony Prisk 2012-11-18  226  	u8 tmp_resp;
3a96dff0f828ae Tony Prisk 2012-11-18  227  	u32 response;
3a96dff0f828ae Tony Prisk 2012-11-18  228  
3a96dff0f828ae Tony Prisk 2012-11-18  229  	priv = mmc_priv(mmc);
3a96dff0f828ae Tony Prisk 2012-11-18  230  
3a96dff0f828ae Tony Prisk 2012-11-18  231  	for (idx1 = 0; idx1 < 4; idx1++) {
3a96dff0f828ae Tony Prisk 2012-11-18  232  		response = 0;
3a96dff0f828ae Tony Prisk 2012-11-18  233  		for (idx2 = 0; idx2 < 4; idx2++) {
3a96dff0f828ae Tony Prisk 2012-11-18  234  			if ((idx1 == 3) && (idx2 == 3))
3a96dff0f828ae Tony Prisk 2012-11-18  235  				tmp_resp = readb(priv->sdmmc_base + SDMMC_RSP);
3a96dff0f828ae Tony Prisk 2012-11-18  236  			else
3a96dff0f828ae Tony Prisk 2012-11-18  237  				tmp_resp = readb(priv->sdmmc_base + SDMMC_RSP +
3a96dff0f828ae Tony Prisk 2012-11-18  238  						 (idx1*4) + idx2 + 1);
3a96dff0f828ae Tony Prisk 2012-11-18  239  			response |= (tmp_resp << (idx2 * 8));
3a96dff0f828ae Tony Prisk 2012-11-18  240  		}
3a96dff0f828ae Tony Prisk 2012-11-18 @241  		priv->cmd->resp[idx1] = cpu_to_be32(response);
3a96dff0f828ae Tony Prisk 2012-11-18  242  	}
3a96dff0f828ae Tony Prisk 2012-11-18  243  }
3a96dff0f828ae Tony Prisk 2012-11-18  244  

:::::: The code at line 241 was first introduced by commit
:::::: 3a96dff0f828ae9dfb43efd49a9b67a74c6dc360 mmc: SD/MMC Host Controller for Wondermedia WM8505/WM8650

:::::: TO: Tony Prisk <linux@prisktech.co.nz>
:::::: CC: Chris Ball <cjb@laptop.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
