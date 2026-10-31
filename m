Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793485641;
	b=qRZjNlKxwrpmopiWUyTz7GMIG9RG71+C1Gn0F+QfjwnVKweT8mfeIN6Ky7cmilkXjHm9
	 mF0CsBwBrt3q/rJT2Tjb7aIJiRbYtfNhHeaF88vIeljinAyWbaeUEIKeXJ5qTZaAVxZZP
	 1+smgRPrqKe6hbQnneNXoMpQY1uhmiRyzgPPstU2y1eHyYF18kb0RPGDJt1EDfvnp2oKa
	 9rgCJ9dXrnFp+EXX8NrJzlzrFAe+smgTL2TCoyY2t23F4mMNcaFuc9KOsIre9ZEbRfCSC
	 Klu/NQTsOHCD0v3s8baCMFyo1Ud3zxbQ/v0GbjECZZssSp8E79eKFPLbxMYH0M8Qneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793485641;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VENq0Iix7b95GPB+Wr72ioiMmn1QsBy1MmnsAYRr8OE=;
	b=useSe4imTo2loLCyF4nmCthrdc8AUf7pxXTV7iQs4epbZYekfQ+11zl863QDo2A6sOJY
	 VyXPQNbBwSLrbFfV6wWrdPSt1py+czVWxsNJssZvcg9a5fITKIkjCuwpCKeS3WevNUfJB
	 /P0223j7WR55CFr6v2MyfVhbwveYxA6XFranIijEMQZOptZkvIQ3zLj348hzEHVgu/wxs
	 EvNJA3XyzngLAq1fB4q7rflLGtUOrK00g9vibw3S6DWfYIUDDAhDt/1bMJWLQlqRNMixO
	 lgOMZcY3CQCt83ajCGmfbGVujTrvMeHpqjAYdrTmR8zAZV9EqjLXyAUklu1QDFfVBuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLxyLEVI;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C42606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLxyLEVI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793485637; x=1825021637;
  h=date:from:to:cc:subject:message-id;
  bh=P9uxY+lHxSaZp2CpLBsiCd5w2JQMWOALK63Q4WYupyQ=;
  b=hLxyLEVI6jBxbRFZ/OTKqN8hVxL8WI2uFu+kw1zup8w1eIz0Lkj+wgJz
   pVt4f5OzTIKH7jg7olIAf/O4j/VrZRgCYVEP4DeJHeLYpDHw/I7VJ9QX6
   0m2A+tFMgQ4AWjZo7mTUgUgjzdHtj50nouAy0i7dv2F/VnRaW8VLFn2by
   IeWIZimIwyOAsU788VnO9ex1yT5Ksi2CRh3FRe1rMqBfAhw4lWbUXPDn6
   GA4mdVi8PgGvlV/2LaQhn0XYFfbf8QDO5WcYbP6nw4QYRnaYNcL10jzNW
   PIihqE1HxFvz6JLOPukSUxYdT1sCu9VrTyB5JDHjqe3qnBRXms02g2dOS
   Q==;
X-CSE-ConnectionGUID: bWFckgkcTpynDadOHVvEUQ==
X-CSE-MsgGUID: rnEb+sI5QrCE0GKWQk14rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2219137"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2219137"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 15:27:16 -0700
X-CSE-ConnectionGUID: Zij44SW3T+q3J1Qlje/tZA==
X-CSE-MsgGUID: tvGJfVqrTXiwWL4gBiXGJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="7563678"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 15:27:15 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNHXc-0000000069X-1iw8;
	Sat, 31 Oct 2026 22:27:12 +0000
Date: Sat, 31 Oct 2026 23:26:14 +0100
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (fffffffffff000 becomes fffff000)
Message-ID: <202610312330.qcAdRikr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0
commit: e71e00127110dedc6a9e746178282b4dac97ed96 iommupt: Add the RISC-V page table format
date:   8 months ago
config: um-randconfig-r2310-20261031 (https://download.01.org/0day-ci/archive/20261031/202610312330.qcAdRikr-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610312330.qcAdRikr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e71e00127110 ("iommupt: Add the RISC-V page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610312330.qcAdRikr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, drivers/iommu/generic_pt/fmt/iommu_template.h):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)

vim +273 include/linux/bitops.h

c320592f3f2a1e Wolfram Sang       2025-01-07  261  
952043ac12a117 Steven Whitehouse  2009-04-23  262  /**
952043ac12a117 Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  265   *
4945cca232ce8b Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117 Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117 Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117 Steven Whitehouse  2009-04-23  269   */
6606c8c7e81886 Kees Cook          2025-08-04  270  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117 Steven Whitehouse  2009-04-23  271  {
952043ac12a117 Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117 Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117 Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117 Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117 Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117 Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117 Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117 Steven Whitehouse  2009-04-23  279  }
952043ac12a117 Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
