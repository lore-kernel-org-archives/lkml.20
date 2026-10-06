Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9643E3CA4A3;
	Tue,  6 Oct 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280576; cv=none; b=mMRL9URCBAZvzyZR/cSCFBsrfB6FDS3t15F8+cQ/4F4vVCOQMCT9xE8HRd9dCIob5m4w/vIUhvK4ZiNfMhkRj/lUueYLSsjd1ncAtp2up5XqJZarvP0iS9Xkd7l/lKAaLUtUP/cefXRv71ahoSIzb8YpCD0+4B4FOSQVIFmKZEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280576; c=relaxed/simple;
	bh=7otKa+GWApZeqC3ipf9Lr4+6RHqfIHCarUORzQocWA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdfKRqiJYYRe8YpMYGrqBfnH8GPy7X384rdaCwVmCnorHpchr0OIhRX3q3dAP0Y+YJ8RsC7F9hi18hRPpGqI/O6bFYrZGUZyLFBoguZjZ07Aj0pPUYpjZ6SmXBCdBhwHASH2ZXI2C2ILifUH13L5VVpUQZ2P/WUvcPZaK48k+kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a25U7s5C; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a25U7s5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791280575; x=1822816575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7otKa+GWApZeqC3ipf9Lr4+6RHqfIHCarUORzQocWA8=;
  b=a25U7s5CPGslbE7X+okGKI8qnNMk6x/QlBBlLa9wZ3HhXDdjBwfe42/C
   gHG680AFtIHjKWd4jkRH7gcHSPuUZf4neK/jSktfnVZOLsPLnPoT/xpqh
   VtTcvtm7YtPz8/RV6w9D66tR8BdN1Mg3D1xzL5CVhI4oNiboyxzWB5No2
   yss8nXsLGuEKSWfts3LTyo5fi2qrtO0KdEVtrO/SEILlK4T4XVc+8GSz2
   Nu//PDTRcER834Losunazj+V6+piddyKmPNK9T3KZp2LMhpf0pQfGuP+V
   /Pefkk4fqLFK2/+bk2zjS2NQjZJ6mDz7VXRp+lnRU9Sh6+RLCM9eZIUpx
   Q==;
X-CSE-ConnectionGUID: WpIf1IyhSd+fvv49WefEUg==
X-CSE-MsgGUID: MZVoux4VRdmzmLvqksPhaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="19401"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="19401"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:56:14 -0700
X-CSE-ConnectionGUID: qVNayI0VRya34JiFRZx3wQ==
X-CSE-MsgGUID: szIgNtfbQSq7kNC5O0B13g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="305038549"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 02:56:12 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1u5-000000001Qu-3Qs7;
	Tue, 06 Oct 2026 09:56:09 +0000
Date: Tue, 6 Oct 2026 17:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH 2/2] bus: add Altera timeout bridge driver
Message-ID: <202610061734.ZXwVnIt2-lkp@intel.com>
References: <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>

Hi Vyacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on a74306e2e676f9775457366fc047a660fbf02f26]

url:    https://github.com/intel-lab-lkp/linux/commits/Vyacheslav-Yurkov-via-B4-Relay/dt-bindings-bus-Add-binding-for-Altera-AXI-Timeout-Bridge/20261003-201919
base:   a74306e2e676f9775457366fc047a660fbf02f26
patch link:    https://lore.kernel.org/r/20261003-feature-timeout-ip-v1-2-8837c311d571%40bruker.com
patch subject: [PATCH 2/2] bus: add Altera timeout bridge driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061734.ZXwVnIt2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061734.ZXwVnIt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061734.ZXwVnIt2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bus/altera-timeout-bridge.c: In function 'bridge_reg_read':
>> drivers/bus/altera-timeout-bridge.c:60:18: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
      60 |         result = readl(driver_data->bridge_registers + offset);
         |                  ^~~~~
   drivers/bus/altera-timeout-bridge.c: In function 'bridge_reg_write':
>> drivers/bus/altera-timeout-bridge.c:69:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
      69 |         writel(value, driver_data->bridge_registers + offset);
         |         ^~~~~~


vim +/readl +60 drivers/bus/altera-timeout-bridge.c

    53	
    54	static u32
    55	bridge_reg_read(struct altera_timeout_bridge_data *driver_data,
    56			u32 offset)
    57	{
    58		u32 result;
    59	
  > 60		result = readl(driver_data->bridge_registers + offset);
    61	
    62		return result;
    63	}
    64	
    65	static void bridge_reg_write(
    66		struct altera_timeout_bridge_data *driver_data,
    67		int offset, u32 value)
    68	{
  > 69		writel(value, driver_data->bridge_registers + offset);
    70	}
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
