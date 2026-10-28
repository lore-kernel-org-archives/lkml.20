Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184882;
	b=Lk+6sOghtWBMhRfNJQ8hoh4nqXs1utT9ZF5d/Y4tcVuTqjCd4d0H3R16Kq9tICR7ktSb
	 PNq1BnB3gWQwRXtBKPVc48sPpw/EorNDyFezfz5b9a+34glL2vMTmEUqXFYmAGb06EYMY
	 el523D8SllFiN1qNr+HQfepUF7ETHA8POtC6l+M4EDq8dO45cPnQ/15zIPLeLqmVhbmop
	 om9sjzYs/kKifjSD6Ku7WA26cZg9WL8UIPdv85fmGorVqbWiLRQuvELtK0hMdVnDzEJHZ
	 kQTbLG6gH5E1OLQ3Pkm4yA8RUqgTiLLe1qBZ0KFt4m/92ifZZqHwoHcKZa2px1byY+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uoyhanJreUhzLPDA+ljmTZwIPetuIE1Ivz/9P3UXD3E=;
	b=2A9YFwDouqXR3PAcwhWkymGiASN+mJkbjS6VtQlpYi2+VKz/cOCE1X469ZT2y+w1JhJV
	 pP7WwsIqXLrMFWlC7okpe4avAdyhegXsKemxYMqdWaQqN4Lup6cGcqv8mPMZfiREAfacU
	 fpqeax4DWyrigj3Ysux2dkvuS75Btj3tSSxRUCO6OmPtIIwt22QjSqgB8HL+WBxHuDHu0
	 kv4jbL0DTy26nY577za/pk8aqdLlYvllQNPuasJj7rdx4nJ2Zd+jUkF9C04if9sfvY8lu
	 liM2wpDLy+VNNABcIkBdcIMkZmjbAS14FDbie5R8rmLenYffIa9YkhwtFrKT5WJatTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyYCa32g;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D03606A31A;
	Wed, 28 Oct 2026 10:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyYCa32g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793184882; x=1824720882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3aNUzcd8LQRCPT46+lVga/502IGAQyJemLKQGD1rOQ=;
  b=iyYCa32g6GAaHdc8hvExBOlmo2wYbFCBnrsPazv8w+QLO4hYRAbkfVM2
   Odd9IlCgJFmf6TxAcz0Ukv/jAzeDlKaQQM7PCVYlQT3Z49zir/veI9wX1
   6Uu24t7O50tB1T/HBvpNWh2owSeZnmiZmeWZuOaXH1u68yhDO3wiBCpVd
   J6Yo7rRinfKa3AxVPrq8Z44B6k69HOYvOJiA39r5VgtCeM3ToTGBddO1i
   xKm7mOoljopmCrwYfiTNcFrItuUbVvUxaLggRPrltnT4/sBPxeEA0wicu
   EGQhRUhzjtyzMv+FFjxcatSAMZzeRvJM80F8MTFSZdB2y8fBIHlr0/Ash
   g==;
X-CSE-ConnectionGUID: GjaOzkquTdm3dm20YgECwg==
X-CSE-MsgGUID: A5gwxbZET/6RWjHeAstxnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1891174"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1891174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:54:41 -0700
X-CSE-ConnectionGUID: gSq73B0+TAqXDZb1qQLHYg==
X-CSE-MsgGUID: h2GJqdhjSLmk9ONPpyHirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5153537"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2026 03:54:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM1Ig-00000000Ybs-3trJ;
	Wed, 28 Oct 2026 10:54:34 +0000
Date: Wed, 28 Oct 2026 18:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
Message-ID: <202610281810.Or8lhrj7-lkp@intel.com>
References: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614]

url:    https://github.com/intel-lab-lkp/linux/commits/christian-koever-draxl-student-uibk-ac-at/dt-bindings-firmware-amlogic-meson-gxbb-sm-add-amlogic-meson-s4-sm/20261025-202143
base:   7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
patch link:    https://lore.kernel.org/r/20261025192144.208954-3-christian.koever-draxl%40student.uibk.ac.at
patch subject: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
config: arm64-randconfig-1000-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281810.Or8lhrj7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281810.Or8lhrj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281810.Or8lhrj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/meson/meson_sm.c: In function 'meson_sm_power_off_prepare':
>> drivers/firmware/meson/meson_sm.c:318:6: error: implicit declaration of function 'freeze_secondary_cpus'; did you mean 'thaw_secondary_cpus'? [-Werror=implicit-function-declaration]
     if (freeze_secondary_cpus(0))
         ^~~~~~~~~~~~~~~~~~~~~
         thaw_secondary_cpus
   cc1: some warnings being treated as errors


vim +318 drivers/firmware/meson/meson_sm.c

   308	
   309	/*
   310	 * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
   311	 * power key it jumps back to the kernel instead of booting, which hangs the
   312	 * board. Setting the shutdown flag first makes it cold-boot instead, and the
   313	 * secondary CPUs must have been taken down through PSCI CPU_OFF beforehand,
   314	 * otherwise the wake-up path hangs as well.
   315	 */
   316	static int meson_sm_power_off_prepare(struct sys_off_data *data)
   317	{
 > 318		if (freeze_secondary_cpus(0))
   319			pr_warn("meson-sm: failed to stop secondary CPUs\n");
   320	
   321		return NOTIFY_DONE;
   322	}
   323	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
