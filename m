Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771198;
	b=R1pUJPMjyk9e2txoLYtDZm+Y4yatlCGjsLjv0/9vyS6hohxYX8BYOMZBqCpFhArW+Uo2
	 wUb8rDdFHIKWidHI4b/kpKWcXuhaUm7nscZT/TZZELEiCOT7fxHQRe/YWtiDViBs0Itqz
	 ZSzeNQH8/sw1rrrZtWaqICAZ5FQB+/82GjIb9lQEqreJuf/6u4useiGCZuHGaVviuIAue
	 zrikqW50UUpryBDwid4xz99/G2HzHHi3civST8FGmj04TP3ffePygRjel2/ZnlegDXEgL
	 j9vxjWCIQ11hEZ4YTvtVNMYxF1vJfkcCuV+LNOqEuljUkSQImzZJWEX6jrg15C1z3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771198;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J/dWx4XyY9Qu61P8ybBzax3t6bA7XT2OkEgtv4viqsc=;
	b=F4ZHCE2LP6oXCWsStr2lkf9Dfv4AZD29uvHd/Mo0L70wZ6+ao8Gev/MSjSazKIFDhY0B
	 KTnLFnB8EuEkLPmuYVfzBiH6t9J7JX+2aI/lPT26FIbNILp8zwJP9NC2G2SJ7Hanj8eqA
	 MNWJt65OtsHlWKYgGZip1Pj4xmBvEQvb2lzik8Sualj0gjll3W86/qXi7JeAm0nWYSKpR
	 gQOMI/A6dzGl8E6+gk6icFGDcr/FWvv0qKd2UAeI0yqlN2Llw7iidLG84C2tuK6akDMQ+
	 FAjt5fO7QLlKsFCl1MmlGPoTzmR0Fv6nPbvSGEQTCwA+yVHkaYN7Rs2TmGoWyhS/bYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Y+tZw4/L";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF08606D824;
	Wed,  4 Nov 2026 05:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF08606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y+tZw4/L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793771197; x=1825307197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qhahMrQYHLJ+Qp5l4x02iu2RBmtmF/q7vKTTQcducQ4=;
  b=Y+tZw4/LSgeNwFygAiznkKhJTPTqVxPshonNRiapGnzHZlxVf4IKO9r0
   nGeiVOEC1yJ3IbjobBFzmJTa9snv+uxbwWp+XEqKjMJb6gPC7hkGdo+1Y
   gjuCSj0LxlM3Sz7uoZLA+elYqNpI5StB0mxlnbgt812yw6JsdFaO50nkj
   Z9WV3w8EC6/QifuplYUZ/gH4SProE2pagywjJ1Kh1zf/jkrGrln2q5nBg
   K8Xso90J94kG/TxYVEb5EldR/u9JP+FUtqjZ8B1sZOI5saifQV/9RN/uc
   7xfG+GoCv1wBJ8GMA07KrtqlwBhe8PviArj8u3c9hpsy7K+ywEoUPVM1E
   g==;
X-CSE-ConnectionGUID: jw2vics/RImOmb5WfjdFZA==
X-CSE-MsgGUID: ubm+ejkrSA6n4cDYbAwE3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2608629"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2608629"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 21:46:36 -0800
X-CSE-ConnectionGUID: S2thmX75Qq211O7/p4MTlw==
X-CSE-MsgGUID: BV6HQmkQTH+rilKIKIhjKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6448714"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2026 21:46:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOTpL-00000000jpl-1Agm;
	Wed, 04 Nov 2026 05:46:27 +0000
Date: Wed, 4 Nov 2026 13:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tiwai@suse.de,
	andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com, baojun.xu@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com,
	pin-hao.huang@hp.com, Syed.SabaKareem@amd.com
Subject: Re: [PATCH v1] ASoC: tas2783-sdw: Add basic BPT support
Message-ID: <202611041243.Bn9AJATC-lkp@intel.com>
References: <20261103133853.1612-1-baojun.xu@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103133853.1612-1-baojun.xu@ti.com>

Hi Baojun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master next-20261030]
[cannot apply to v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ASoC-tas2783-sdw-Add-basic-BPT-support/20261103-213853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261103133853.1612-1-baojun.xu%40ti.com
patch subject: [PATCH v1] ASoC: tas2783-sdw: Add basic BPT support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20261104/202611041243.Bn9AJATC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041243.Bn9AJATC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041243.Bn9AJATC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2783-sdw.c:1369:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1369 |         if (ret) {
         |             ^~~
   sound/soc/codecs/tas2783-sdw.c:1362:9: note: initialize the variable 'ret' to silence this warning
    1362 |         s32 ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1369 sound/soc/codecs/tas2783-sdw.c

  1357	
  1358	static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
  1359	{
  1360		struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
  1361		uint val;
  1362		s32 ret;
  1363	
  1364		if (tas_dev->hw_init)
  1365			return 0;
  1366	
  1367		regmap_read(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 7), &val);
  1368		dev_dbg(dev, "Got B0P0R7 = %02X with %d.", val, ret);
> 1369		if (ret) {
  1370			dev_err(dev, "Get FW download status failed, err=%d", ret);
  1371			return ret;
  1372		}
  1373		if (val != 0x22) {
  1374			tas_dev->fw_dl_success = false;
  1375			ret = regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
  1376			if (ret) {
  1377				dev_err(dev, "sw reset failed, err=%d", ret);
  1378				return ret;
  1379			}
  1380			usleep_range(2000, 2200);
  1381			regcache_cache_only(tas_dev->regmap, false);
  1382			tas_dev->fw_use_fallback = false;
  1383			ret = tas_fw_load(tas_dev, slave);
  1384			if (!ret && tas_dev->fw_use_fallback)
  1385				ret = tas_fw_load(tas_dev, slave);
  1386		}
  1387		if (!ret) {
  1388			if (tas_dev->sa_func_data)
  1389				ret = sdca_regmap_write_init(dev, tas_dev->regmap,
  1390							     tas_dev->sa_func_data);
  1391			else
  1392				ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
  1393							     ARRAY_SIZE(tas2783_init_seq));
  1394	
  1395			/* Re-active AMP after resume. */
  1396			regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 2), 0);
  1397			if (ret)
  1398				dev_err(tas_dev->dev,
  1399					"init writes failed, err=%d", ret);
  1400			else
  1401				tas_dev->hw_init = true;
  1402		}
  1403	
  1404		return ret;
  1405	}
  1406	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
