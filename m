Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500189;
	b=IKLe/PHZtW9BfoDzWxcMEHY5MMqt2GBQPNHfU67sTLxOQqjVQEZSAobFrp79JPr+L9w1
	 49dEThRvZnLZ/yXI/KlR4gkjOZwui2J2/yr+h7r2tF/TwP8LFes3V9rFY4yFwDTXh4ye7
	 cBRSAekXXv1tOxXFVkPEFyH1FxC7DXHm1OGyuk7H6CZzEQlG+0XMENKoHwfXz+dM8TmrG
	 GaZqAt1a5H2FIvPeHIs8TjHJrjnmOEG5RNvLd3MoeSXA1qU5G/MT2y9NQaBwvaPMuvmf3
	 iwZmPGBYfIMjkAoxOfztS0fgQTbaLkD3M5nZwtat3AAVVrQYDeZX8IYjStp0b77xRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500189;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2zkIwgx7KpVel0dp5RKFUNmPsf0yAK60wdcEswbaqeA=;
	b=XQN2VLW1cPC1D8uR3DVDY5wm2gpW3bvWacCTI/aU8p4IRHnuh1Jd7eKeTPMIuHeuzb7K
	 oRtgVYe+CUqZjxBC1UJtN+BZD0rX8SVZNP+Z5wxWN2+uqHAK1EIyU9ZaT/963KlAmRWKz
	 GpA8tvS+WMAuNaseH2pkqj2qaN9XgtAQ+qOIv3dQTeQtp80kBfoSQ0sG2Y2fnjbBZKY4A
	 GuBfMu6eFE4SbQD92ZaqaFbHe4lRHJkauUmn2uAmdsBYSkNSRAHbdtJ3y0QpCIFpGmPdn
	 zsilu/axV/NGf8aL4a+EEuurNEgINhRt/pV7lSdHXi8KReS9oRDKwJKz9z/R8b8yi2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgGom+il;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08126606A880;
	Thu, 12 Nov 2026 16:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08126606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgGom+il
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794500189; x=1826036189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nImn2zfNJCiLqwjUQuwz6k3lP2UNsG9/Llh1rT3KZkw=;
  b=YgGom+iljPxqKf7W9sEvXQkkjioFUA1zW/VV9WPjDVnHv3hv2ohO+mi9
   kN8DTSrBh0MDW99qd3/8FiZGMvfOPLzEazhT2vxpFCOG7Ig9hHq8Dd8lO
   KJHlKPnaYIXAXDrB+hhK9SGSJPYmD8M/jgrh1TrGcIg3FyyjY7ZlxmtSW
   mjjPLpNr7Rnm0BPD0x94nfLZON4WWOTPOhRWxH3tYJy8Ht7QyIFeDxQ4s
   FE4qvteYw70INqLnb5lLzMniQ8RnekdaIDWi+3UeIYPATrjY9WNbNS0Qm
   hu0VY1gub8P3+tAF8iElQxy4KZLe14Hl+F/YjJ16xwuou30TiW75c+ifZ
   g==;
X-CSE-ConnectionGUID: 2IekCDKmSBSlNDVjF6Y+UA==
X-CSE-MsgGUID: Ym7zdKF5Tv2c0/kcDqkHOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3324058"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3324058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:16:28 -0800
X-CSE-ConnectionGUID: ssVOz9eyRmyhYzMROW3lrQ==
X-CSE-MsgGUID: jwX6ZGn2TLKhc7tFueDCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8862437"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 08:16:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRXTK-000000011i7-0aXn;
	Thu, 12 Nov 2026 16:16:22 +0000
Date: Fri, 13 Nov 2026 00:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Moteen Shah <m-shah@ti.com>, conor+dt@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, u-kumar1@ti.com, gehariprasath@ti.com,
	m-shah@ti.com, vigneshr@ti.com, afd@ti.com, a-limaye@ti.com,
	y-abhilashchandra@ti.com, johan@kernel.org, kees@kernel.org,
	jm@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] soc: ti: Add TDA54 SCM configuration syscon
 support
Message-ID: <202611130001.dmwqpc05-lkp@intel.com>
References: <20261112081047.1550471-5-m-shah@ti.com>
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
In-Reply-To: <20261112081047.1550471-5-m-shah@ti.com>

Hi Moteen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Moteen-Shah/dt-bindings-soc-ti-Document-the-ti-tda54-mcu-scm-conf/20261112-134044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261112081047.1550471-5-m-shah%40ti.com
patch subject: [PATCH v3 4/4] soc: ti: Add TDA54 SCM configuration syscon support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261113/202611130001.dmwqpc05-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130001.dmwqpc05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130001.dmwqpc05-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/ti/tda54-mcu-sysconf.c:14:10: fatal error: linux/soc/ti/k3-socinfo.h: No such file or directory
      14 | #include <linux/soc/ti/k3-socinfo.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/soc/ti/tda54-mcu-sysconf.c

  > 14	#include <linux/soc/ti/k3-socinfo.h>
    15	#include <linux/types.h>
    16	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
