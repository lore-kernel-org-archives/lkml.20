Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094229;
	b=W2HMQ8D9S2Gm/emEfANFX57p2pBJuoAV7RPlk8C6UavtOxwzbj9lXRwaZCMf7P5+n3vS
	 m0mVWpUg++EagSyCMM0sIL1bcbTOjb5XVjODRuQpoLMjxFaJ9LDbE6uJ43JmL65PHYIeA
	 g2TVE5SaWgJMogxs5bOghM+DN4i3wLg8SH7S9In3SOFCM6Sxu8Hk3r8Yzx5rldrLXaShX
	 Aq9OLN0mdd0stVgoFJRbQGywYZo45mTjHnxuiYIcASyRsfvUKLyNlsAtj7z09ZM9Luo88
	 GuFqm4QIwT5j6HeJAVDqi6HTf3b1rUQNmu3o5YwTVBlVj6f/V2UIcd5yrnpwvF1AH1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094229;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=br4mcBO5p5oV2REBLLSJrof7pwWkpTewDjKxRL/Xjvo=;
	b=eBsswltIFWIg0a64dbs8ePsb7xACpkk2mcmZFfni/YogXfZXhYFUeCJrKVVGmr8RxZ13
	 zyaftbFmMTKeP5eSLcorzpCb2mq4ssUn8dbQSpP9Uz7H97TN3KCGGjTcBjP0bOLuMiG7e
	 r+FkgMnSiLF8oWYd/Nu035ypI772xC1Lb++PZAA+Bgv8L+j/oR4D7q+Pxe2hVzfRHcopm
	 dfD7qYG6BDGi/OeAewKaiiU1xxIkncAil5wLejow8gK7E8KKATFjt/HQOFo8OApftR2RO
	 h0zoKoMaLWXTUHFNtFfbvTGOoQ2JbOQF63bPv8J3BbwmZrZOVIGTSoNqTFsVcFIXGXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CV1bYybM;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E6C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CV1bYybM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793094228; x=1824630228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H3frxv4/a1bfBw9mHgXQcXtH9OYW1dAQNX19Pf1+ioU=;
  b=CV1bYybMkk5BVJ1f1glhgeYYzwO5n5WBi4TMTld53rJzwybP1d1Zud8D
   RkrbLsqERJX08RmSucJp87KR6RXGYSSupZiweHdCvQAiNqx1q2AAWT++9
   aQWIE6wWiP9rviLn4FQoEtdCT5rcMcSlN5Ssx7rEhQjQx3TRXhF88M3+/
   C64IXd4c3mEhEWxMg/EDTKxuq8eT9EmaSzecMQJ0NDsIfUtvs37migM7V
   ej/JOjb/K8e1/tGRrQ7z5Zp9HJ46UuVFxCJwXYweEFTNS61a0cVVlphT5
   zT5j02pHoKHntn8+P6M6VV0YB9wXxGh/PCQYjzaZIllPETBDZkOS9QaWo
   A==;
X-CSE-ConnectionGUID: B4a1wpxaR7WGZ2ANI9AV0Q==
X-CSE-MsgGUID: mGRjmGEbTp6FCXD+NNPiAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1820781"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1820781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 02:43:48 -0700
X-CSE-ConnectionGUID: BAdwfkrtSvWllZh8ZkVsfg==
X-CSE-MsgGUID: wIs9bqUGRGe0O5p0z1lsUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4458274"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Oct 2026 02:43:47 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLdia-00000000X4y-1XEP;
	Tue, 27 Oct 2026 09:43:44 +0000
Date: Tue, 27 Oct 2026 17:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhang <yuz08559@gmail.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org, Yu Zhang <yuz08559@gmail.com>
Subject: Re: [PATCH] nvmem: core: balance the layout module ref in
 nvmem_cell_get_from_lookup()
Message-ID: <202610271703.wiO2VfuK-lkp@intel.com>
References: <20261026125709.73500-1-yuz08559@gmail.com>
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
In-Reply-To: <20261026125709.73500-1-yuz08559@gmail.com>

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3 next-20261026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhang/nvmem-core-balance-the-layout-module-ref-in-nvmem_cell_get_from_lookup/20261026-225709
base:   linus/master
patch link:    https://lore.kernel.org/r/20261026125709.73500-1-yuz08559%40gmail.com
patch subject: [PATCH] nvmem: core: balance the layout module ref in nvmem_cell_get_from_lookup()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20261027/202610271703.wiO2VfuK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271703.wiO2VfuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271703.wiO2VfuK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/core.c:1327:12: warning: 'nvmem_layout_module_get_optional' used but never defined
    1327 | static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nvmem_layout_module_get_optional +1327 drivers/nvmem/core.c

  1326	
> 1327	static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem);
  1328	static void nvmem_layout_module_put(struct nvmem_device *nvmem);
  1329	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
