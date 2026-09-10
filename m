Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2D9456E07
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037289; cv=none; b=WUKRZdp2Irmxlgey50rKK83Xj23zW/l2jU3BXts2zw0jfzGzqMlZ2B+UZUjYOb7Tad5vFjnaopn1lGmAqBLJw4L7OUpgYsmqf0iFM3q5VsaIrRJHmhvDZHxzeq+s+RFJfWoCg0Gg/etQaDmYgKslfKHVehhb6oW8kZxJOmBuMt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037289; c=relaxed/simple;
	bh=CKJP3LWV0XbiTPX5pJ7NiWChkdlri8kaJ5mSH2lh3xY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zj8FQ9CusqmiKglzGjsXZmAj3w9Nk0IXk3hnKoZMW6982vfUFFs/DbmpdYxkN79k9Veb1iICy5DW77Lm8xtuPIh9I8hCQoMFEpJ41wMEJcL8QH7wVNkJ6es9iFa6xUIqFBTTDt2/mC4ydSn2eReb4I/3w39ZcaD6Pb6fpbM0fpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhCJR6Ye; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhCJR6Ye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789037284; x=1820573284;
  h=date:from:to:cc:subject:message-id;
  bh=CKJP3LWV0XbiTPX5pJ7NiWChkdlri8kaJ5mSH2lh3xY=;
  b=JhCJR6YeEVwaEmaaU+mCDxZvv8YElTU8ONTtMp2VAb9Drp1iyJ6V1rtg
   9ONLKvqlo2p21yKq7o95SQKJEP4dZ3cEXDZRQbH2asp6FdiKvulzyQXPI
   s+8+UxXHwFZTy9vzOb/T9I4XJUX+n5bHlDG+OEtekPVdjgJcICnKK6j+O
   Bhjzm+eBnrrlHoAAA2THrwMoTCA4tN5/kBN8a72A5taDWRY7rKD6iD7r3
   gILnb0w5ixQk9R3VqiHeI0tg5BOuju/yWCHA4fXY9jOycgf+k1/HUz9jG
   Js85p8CUkR83IRurG8J2gIasCcFuRI2pPnyYiz38/zmsMrlLPJqu9w8VI
   w==;
X-CSE-ConnectionGUID: gdxY01GgSr6XK53bw/x7OA==
X-CSE-MsgGUID: gmFg5KUIRMaBfPHNO3JPug==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="5083"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="5083"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 03:48:00 -0700
X-CSE-ConnectionGUID: AVaUdzUaS9yIf3iUXs2YDA==
X-CSE-MsgGUID: ym2N2vwNQP6JzLl8MfS//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301487735"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 03:47:58 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4cJv-000000001i7-3UeU;
	Thu, 10 Sep 2026 10:47:55 +0000
Date: Thu, 10 Sep 2026 18:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: arch/s390/include/asm/io.h:30:22: error: implicit
 declaration of function 'ioremap_prot'; did you mean 'ioremap_np'?
Message-ID: <202609101854.0eBirOer-lkp@intel.com>
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
config: s390-randconfig-r121-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101854.0eBirOer-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101854.0eBirOer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b0379fcf9ce ("remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101854.0eBirOer-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/firmware/qcom/qcom_scm.c:13:
   include/linux/firmware/qcom/qcom_pas.h: In function 'qcom_pas_ctx_map':
>> arch/s390/include/asm/io.h:30:22: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_np'? [-Werror=implicit-function-declaration]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~
   arch/s390/include/asm/io.h:30:22: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +30 arch/s390/include/asm/io.h

cd24834130ac655 Jan Glauber 2012-11-29  26  
b43b3fff042d08a Baoquan He  2023-07-06  27  /*
b43b3fff042d08a Baoquan He  2023-07-06  28   * I/O memory mapping functions.
b43b3fff042d08a Baoquan He  2023-07-06  29   */
b43b3fff042d08a Baoquan He  2023-07-06 @30  #define ioremap_prot ioremap_prot
b43b3fff042d08a Baoquan He  2023-07-06  31  #define iounmap iounmap
b43b3fff042d08a Baoquan He  2023-07-06  32  

:::::: The code at line 30 was first introduced by commit
:::::: b43b3fff042d08a0bcc0a6d87c3216b44860298e s390: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
