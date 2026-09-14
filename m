Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F245A46982B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395192; cv=none; b=ag4hZQIwxVtc3oRcroSjyVYXTCsUDukPZd3uj5h+y3OfckgdcJ68RPvYeRcb/vGGf284oJeSGQ1nI3RDFKrtmYUndAFNbWj2HR2Aa5iWEcNcpldlKlPYCHkA2SAAgq/xkM1k4MLwM2k5ozvoA/c4XeMIX3Kzs01bLZK63i9HEbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395192; c=relaxed/simple;
	bh=gqMTCSzaftfm5uQHSdHc/hzs5nKlsY49FVembIOJCVw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GliIdU0hqoZ0kt9o19qtFk16ULtKhPKwp0a+M3DRrtcA+1Qi0Geud2lIYY8vbSOhgLAI39PY+A80MG+fU25DYAde3tdj1OShWxm5Ca9QaA5WeSBT/3slL4IoXnSL0ODXLNqFXDq1G8ax9L4/qWrlIHmoTp9fYoClQOH0m+Jf4tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fydv2+BF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fydv2+BF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789395190; x=1820931190;
  h=date:from:to:cc:subject:message-id;
  bh=gqMTCSzaftfm5uQHSdHc/hzs5nKlsY49FVembIOJCVw=;
  b=fydv2+BFc10JiXQSUVxRSXRLuDW8ieds6w09TjeC0dpOzxlSvI1UJwqz
   j7I+9El9wT+TWbvquwQMHtgyg7BSh2I7PZVNuBaC7Eq15wxqc8zEEN53R
   h8hHF3STA1Uk9rteEkHX42YanMvZOqg1Yo6lZH7wBEJtBuCTP8zyhjpwm
   7vHuGGFiPS/oMHIjMShuA8cm2EvRbNvJtBpOQwHQopF4kddxWsmYadb0f
   +wziJEAoCo1krwcUV1ASPZ+fSklqaxwb6mhcP7taU4F+05+W3ImW3cRaZ
   0ujbEF8XYDw0zLZYeMTln5wmlQMkZ+GCVtmbX9Iv4APvnLAlmG8CiA2zO
   g==;
X-CSE-ConnectionGUID: 32x2mn61TAGmL9ePD1YxYw==
X-CSE-MsgGUID: KSbIlU5ERMG0WKeP0hjA/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93571322"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93571322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 07:13:09 -0700
X-CSE-ConnectionGUID: ozPZhHviSoupPoiB9paZ/A==
X-CSE-MsgGUID: x7AuoYUGT8uQU071K3+9OA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2026 07:13:07 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x67Qe-000000000Br-0mjZ;
	Mon, 14 Sep 2026 14:13:04 +0000
Date: Mon, 14 Sep 2026 16:12:45 +0200
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c:17:37:
 warning: result of comparison of constant 4503599627370495 with expression of
 type 'dma_addr_t' (aka 'unsigned int') is always false
Message-ID: <202609141504.5flfpx8O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: 31d3354f42c0da34415164a1f621a195caa1f1bc drm/nouveau: verify that hardware supports the flush page address
date:   10 months ago
config: i386-randconfig-r062-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141504.5flfpx8O-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141504.5flfpx8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 31d3354f42c0 ("drm/nouveau: verify that hardware supports the flush page address")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141504.5flfpx8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c:17:37: warning: result of comparison of constant 4503599627370495 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      17 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.


vim +17 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c

     9	
    10	static void
    11	gb202_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
    12	{
    13		struct nvkm_device *device = fb->subdev.device;
    14		const u64 addr = fb->sysmem.flush_page_addr;
    15	
    16		// Ensure that the address is within hardware limits
  > 17		WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
    18	
    19		nvkm_wr32(device, NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI, upper_32_bits(addr));
    20		nvkm_wr32(device, NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO, lower_32_bits(addr));
    21	}
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
