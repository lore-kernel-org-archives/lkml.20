Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269363C8717
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035832; cv=none; b=fLX6TfmnpNlbSHn6DeqfGjOqLULLi5KjOkiczHvgxTJA/PBunoXy37Sp7TdCYew3JnvK58sB6Zq2a8js4HSokM8MJMuQvWH7XIxxlRbMnPdnINaZvC7M0Yo/EnqPHY7rkEohKUu7VNWFS+TkXu2wUSMSedBkklbLGanV3W8KG+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035832; c=relaxed/simple;
	bh=eESLYcWn+SwBCFsdy2YBFXWmSLMh18Tg3jYtJbGyuaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SyBq16FmDD7CICXBD9TJtW0Ql2z8+yySZDMlRj2JIJixWAk/tUIXhIHNDcl69VVDvbAUtOeDQ1kChydWoS7CIUdu3fdURoWxmvF4Qytbjtu1ctn5exFFI83z2AAsxicWVxaAnGDFm5A4gnAD1jRI5F3Q0zMVklI5N/JWVt+UM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbDQ5r3a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbDQ5r3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789035829; x=1820571829;
  h=date:from:to:cc:subject:message-id;
  bh=eESLYcWn+SwBCFsdy2YBFXWmSLMh18Tg3jYtJbGyuaU=;
  b=EbDQ5r3acAiQwCa03WQix9tOa66o7ecVzObeXVzid+ESFFPGDEbVRt9B
   0fiTNHWtUpjDrg6dM78SNgO2pFKJuA5MsaRAp7eRIf60C1X/0iwj+lGJb
   Sl1wlJNt4IL2n1YlCnlcu9fifks5up6F1tpIT2scD20fh7wbRat3uD3cN
   koku6ZU+d9NFteYBFQ0z4S2tpzHkO/yWknlJEymYsZa+nL1BXYWJtmtAF
   VXkZ8i5AvHyTYx7yfynHFIgSqwwVlRgk+/yS9YM3aUFH1DszCLTtOCXbf
   vTnZ6gKF4+4bmvSHAVzGJ9K6rcqYdpzNfQn1hA+9p54DOt0+iibjFsM9T
   Q==;
X-CSE-ConnectionGUID: iJKj+gDsR+KkRPwGF8BU3g==
X-CSE-MsgGUID: hnZf9AUSQ2WDOzjClAiI2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89245546"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89245546"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 03:23:48 -0700
X-CSE-ConnectionGUID: B20D3oFmSDyR4dGDO7qdiA==
X-CSE-MsgGUID: AcpV/YdOT4aa5lx0u0P7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271095830"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2026 03:23:47 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4bwV-000000001h3-46pI;
	Thu, 10 Sep 2026 10:23:43 +0000
Date: Thu, 10 Sep 2026 18:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: include/linux/firmware/qcom/qcom_pas.h:29:22: error: call to
 undeclared function 'ioremap_prot'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609101812.rvVl2iE2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Mukesh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 0b0379fcf9ce395bb51cadb6552ec3b1380436bb remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
date:   6 weeks ago
config: s390-randconfig-r122-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101812.rvVl2iE2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101812.rvVl2iE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b0379fcf9ce ("remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101812.rvVl2iE2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/qcom/qcom_pas.c:9:
>> include/linux/firmware/qcom/qcom_pas.h:29:22: error: call to undeclared function 'ioremap_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^
   arch/s390/include/asm/io.h:36:2: note: expanded from macro 'ioremap_wc'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^
   arch/s390/include/asm/io.h:30:22: note: expanded from macro 'ioremap_prot'
      30 | #define ioremap_prot ioremap_prot
         |                      ^
   In file included from drivers/firmware/qcom/qcom_pas.c:9:
>> include/linux/firmware/qcom/qcom_pas.h:29:16: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/ioremap_prot +29 include/linux/firmware/qcom/qcom_pas.h

    26	
    27	static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
    28	{
  > 29		void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
    30	
    31		if (!ptr)
    32			dev_err(ctx->dev, "unable to map memory region: %pa+%zx\n",
    33				&ctx->mem_phys, ctx->mem_size);
    34		return ptr;
    35	}
    36	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
