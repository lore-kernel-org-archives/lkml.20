Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063330;
	b=SEWsNyZ/47s2L4tSuYrIKYgo/+tuAIygAqh3o7BiNRxRgz25E93vMD3FPUAfmv8x1T87
	 R1YUIk9SPelH3fQheW7JSu080rqH/jvRILLGv260LJPDxYwtTQDJLMmZ2LqY8XBNXYjdC
	 UxvOI0kBbvsIJVE/A1MHxnq1qq1Cy/nL0ddj6d147qa5/vS02wgjeKAbXmWjuPKQd2Hll
	 k4/C21odM03hppX/L4Sr7spJfzMnEmI+0AFyy88XUNw32+nSPmgyaMplZRTgY3U9wxl7J
	 6Ud//JgkE1NwjnjuZguBFBal5tLBAGvvwbE+1Ah/qnobks9TU6kpMERA9+p6xRbwuYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063330;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=N+FY3Xyt9LRFMWhhSp5zYlqrMv7mXqtxBXgGwZ12aGc=;
	b=wL0smWpeF55wNmFvnbS8PRRDU/4bxt4MbFk9lPMTRKHc4s5L/qj0LVn24EYvO6R45fDK
	 PjEiCculSbT9buPxZltzFXuqGOQ+oO6uC71RDzGTYLizfCwa3aD7KVOnBAVVTfhx3bRHE
	 BsI3d6kUCZO0xxPIYaW9I8f57cQuYpuTdLs4pZ2UxkvLnlwflOsuMrcgleaUV3ifBQg+q
	 58TQzb0RYzO9BH0Sq1vQXe0B5G6RlXFbWn9ydv2lfQiMWIk0xtwYoYIlIgiTmwrqyhdon
	 TZVdXogrLCsKUnUHVO/T7YviYfiqOUJhJV3gNjQGogUB5Uzhn2Jpf8/lT98OYf8ajNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bB5YVJUC;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66D606A31A;
	Tue, 27 Oct 2026 01:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA66D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bB5YVJUC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793063328; x=1824599328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oV4ISgvIUb/za+DawkDMzX6NLsw6XNdYHJqPyp8mAoA=;
  b=bB5YVJUC8rfgKqSRevLb3DPNjDffoEs7H7S1Js97opFix8Xs2/r4XY5b
   DGInkfYx1VXgGan3Hl+JciEoCbJ2pCPpUtynewbyLFtK0dyJ1djd0OhSZ
   bO9aCBZXPtA//Yeysz3L88fF+0GsOFh8fOtyLk4Q6sWXO/1RZOjtRGdjv
   MJMbfOAlxrnpsAQGW7grnl68mpG2pTpbE3pR6MC5FQH/bIrkXngwRn+9z
   oyACUoGKKBdUG6YZYI+Zj2J4xxdXKufx+wxJ2vSKEJ7WbYm8binpYsA63
   q9MJiUcsHJgDvboWmoVq7aa0GuKvQRcBCxjuepkrB+HABueD/WMMrN9l3
   Q==;
X-CSE-ConnectionGUID: Nk86K7KhQfSmpZ/F6dmXEg==
X-CSE-MsgGUID: 1/VG+2fgSzCLo+u8/rChDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1642310"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1642310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 18:08:48 -0700
X-CSE-ConnectionGUID: bbmpIGSAQZ2xxEwuKNnKQg==
X-CSE-MsgGUID: 4EBT/wssT+mH4Px8zY9Pgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4318562"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Oct 2026 18:08:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLVgA-00000000Wey-1k3D;
	Tue, 27 Oct 2026 01:08:42 +0000
Date: Tue, 27 Oct 2026 09:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>,
	Lina Iyer <ilina@codeaurora.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
Message-ID: <202610270827.7SxHabHO-lkp@intel.com>
References: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>
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
In-Reply-To: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/irqchip-qcom-pdc-Handle-ESPIs-in-qcom-pdc-ranges/20261022-104402
base:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
patch link:    https://lore.kernel.org/r/20261022-topic-pdc_map_espi-v1-1-7c481a42bac5%40oss.qualcomm.com
patch subject: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270827.7SxHabHO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/qcom-pdc.c:12:
>> include/linux/irqchip/arm-gic-v3.h:605:10: fatal error: 'asm/arch_gicv3.h' file not found
     605 | #include <asm/arch_gicv3.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +605 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e109 Andre Przywara        2014-11-12  604  
7936e914f7b0827 Jean-Philippe Brucker 2015-10-01 @605  #include <asm/arch_gicv3.h>
021f653791ad17e Marc Zyngier          2014-06-30  606  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
