Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092009;
	b=5rr083msQV5bAzcPwuI63uYBKQycNU7trL2/vpo87Ygc4cBycazvsSJmArntS/r1tqsb
	 zUTzGOFLG+TakeaoWP8huaZOtfQ9JYJCw94QC9DbaamWZShLhYRwU+oEjuO1UtBRg1HIU
	 2RwPj3tbvzOO8eYzKXNJmu7mfaGeMQePJDDO0rix6lfaX07mNN0BoQ5rWmSiitnVd4YbF
	 NyBXNs4pi/bnW/fNN7+rD1Amnr+JKGqHE6IxJd9t7g+gPp7DWVzYz1X5UB6dbagJg8vu5
	 23XT9CvuFf7E5PTKgQ7lUfoGCOx1RWC1DHlsckj8yxoNz5TIGvErH6Vgxm4WWBOYITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092009;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SeLz6UNnjn09dX2sNJcs/RWFBCrPlJ5rguNKiRoIrmo=;
	b=E5nUoEOF3Q3QPRCSugP2rDYuJUHcn9NYYnDHjkKczMvnqZ766IYZM9kHx9e+w7nH/gAC
	 57IyPc/XD7dbUo6x20V4NCMP4Lvlh6/f180QdE3kfwIfaAvh/OxL/E8J0Z3Fj4F2P0Qrr
	 mEyUsPHvhBD7K/9bnTKOpbHXsUA/0qh6NTpRUaR7JadOKJrFyPXqexCXMQ6ESBkoBMUl+
	 FLmYcosLHkJKPzyHnVmeblo7MAtEDkDTzZh66ZJKx0z+ZAIByD54YOqpr+foIsWZZBOY5
	 x9bwuHhjaKdyyNslJFpyrEwcEuVynht89pjgA0lGD/oBeCBCWcCn+AwB/tpzhgT74qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B9k2sryY;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D91606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B9k2sryY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793092009; x=1824628009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RbhOKmBkGN8cJaPtRjwxG3ml66wPTPjYj6m1E74sTAo=;
  b=B9k2sryYszNZDwDLIrk1tNjR2jd0xx7wL8mQUNop4mBHY3Jk8NpADL9k
   pdIc/mA/KE1+Dg5GmfqPcUS0XzCCD5fXOXlBpxlLDytxbLqdwRPcJOoow
   KrOSeb6j0WtKxVIlItkBQe+HwCP41F/Sc++zCRvHeeFQxncUTi+zR+Pil
   vjd7MIJA+O4nb4qvW+Zjoeq9rNqW3Pk8fM1UKhOilt2YmnzjrLIDYUxcE
   4G6g9iEXjmoFe1owS1LEroiSLb+EiOGFJZqXEwNWqPrE5AeGwaK55PJYW
   71JXxv8M6AfhF949cai6RhfnntsP+s0HN+um3G0pl4THXm13O81V0vIUC
   A==;
X-CSE-ConnectionGUID: VJEu4LbbR3OIDiVHvm5LTA==
X-CSE-MsgGUID: FrC1f1XfTsWjjpjkHMXQLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1817358"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1817358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 02:06:48 -0700
X-CSE-ConnectionGUID: g3fHArBCSBOoeRfubKcGFw==
X-CSE-MsgGUID: SdOrAe6rTB2E9HnHYzcd4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="5006114"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 02:06:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLd8k-00000000X3U-2wia;
	Tue, 27 Oct 2026 09:06:42 +0000
Date: Tue, 27 Oct 2026 17:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhang <yuz08559@gmail.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: Re: [PATCH] nvmem: core: balance the layout module ref in
 nvmem_cell_get_from_lookup()
Message-ID: <202610271602.GRxskiKw-lkp@intel.com>
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
config: hexagon-randconfig-1001-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271602.GRxskiKw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271602.GRxskiKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271602.GRxskiKw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/core.c:1327:12: warning: function 'nvmem_layout_module_get_optional' has internal linkage but is not defined [-Wundefined-internal]
    1327 | static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem);
         |            ^
   drivers/nvmem/core.c:1356:8: note: used here
    1356 |                         if (nvmem_layout_module_get_optional(nvmem)) {
         |                             ^
   1 warning generated.


vim +/nvmem_layout_module_get_optional +1327 drivers/nvmem/core.c

  1326	
> 1327	static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem);
  1328	static void nvmem_layout_module_put(struct nvmem_device *nvmem);
  1329	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
