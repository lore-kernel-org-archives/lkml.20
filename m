Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B62D2D7DEA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788397338; cv=none; b=A/9B/XaogWfPH9kNo+1cx8u8G7H5t0Pb1ZQedkuBOmg/jo2EpIlkV4mPm7f/VOrqQKmT+PbmNpISoMIWyPAqCJTNH8kNbgD40a82lmXaM590jgAuP0UwrRdHffpXzqSvAOpTxVMcn8H3UpHg0wVfBmsD7P8b68gF0iEmLgXT4+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788397338; c=relaxed/simple;
	bh=mzpSld7mMa2pmAPMO+GjddAFb56G5K3CVJzRqKJvnr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmXC0cQ0loP1sYvsQCVZapnq7PoDCt9Hj+6vn3GlEDqg6LkHyqdfWkiTn81YA9xXh2EuPMZ/OF5x2dxDinjZPrZlgxSd0PYA/Xxsr3OgZRWNHBufWkm3Hm7a1qgGZ9nGauZJPLqkQGcCmTTnk4/41rg1uOzK7hukDWvfCQBi81M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+/siKuV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+/siKuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788397337; x=1819933337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzpSld7mMa2pmAPMO+GjddAFb56G5K3CVJzRqKJvnr4=;
  b=B+/siKuVZ0QvzITu1JPp5lI4yU88oemQf2ig4n6Th3wbIQfttPPQ0sMZ
   rMHMPBWNxh8C2vcdq5+2qpMJtkv5eLZEdqCDGMh8txkJJfCTA0Q3l+7Qk
   TY/x0L/MCSkuHJphRZKsFqpVwnUmoHrLBivm8nfvq/mxshQxd6aJZ92WJ
   9OC7wJxkDiIWeCq9o90z0pMh6CQBEHm0PQn7/nxH27maaMvRfsWs7cAS4
   qzCMAjkOGDXZxi5ONiH8DqunT6rV0Iu3KP2rbj+fb/TXRuX0X1UUsTsy8
   WBhdj6zfITiyzy4uQ8xurqF46O9MKfjI/vNbP/IcVmbxD8gWNVe+rzvJs
   A==;
X-CSE-ConnectionGUID: bERczqPPSLqK6bb8rVAe+g==
X-CSE-MsgGUID: 7elWuUwSRYam1Q3OorS4Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="114408464"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="114408464"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 18:02:16 -0700
X-CSE-ConnectionGUID: 8+64UIlRQ3q9hk5+K2gTbA==
X-CSE-MsgGUID: eP+Ms3VfSEiuKnN71Ga68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263398749"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 18:02:14 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1vqF-000000003Yg-2w60;
	Thu, 03 Sep 2026 01:02:11 +0000
Date: Thu, 3 Sep 2026 09:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <include@grrlz.net>,
	Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gcov: use memcpy for counter value dump in
 convert_to_gcda
Message-ID: <202609030814.OqCixUGW-lkp@intel.com>
References: <20260901090622.18431-1-include@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901090622.18431-1-include@grrlz.net>

Hi Bradley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v7.3-rc1 next-20260902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/gcov-use-memcpy-for-counter-value-dump-in-convert_to_gcda/20260901-090622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260901090622.18431-1-include%40grrlz.net
patch subject: [PATCH] gcov: use memcpy for counter value dump in convert_to_gcda
config: alpha-randconfig-r061-20260903 (https://download.01.org/0day-ci/archive/20260903/202609030814.OqCixUGW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030814.OqCixUGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030814.OqCixUGW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/gcov/gcc_4_7.c: In function 'convert_to_gcda':
>> kernel/gcov/gcc_4_7.c:389:15: warning: unused variable 'cv_idx' [-Wunused-variable]
     389 |  unsigned int cv_idx;
         |               ^~~~~~


vim +/cv_idx +389 kernel/gcov/gcc_4_7.c

5f41ea0386a534 Frantisek Hrbata 2013-11-12  375  
5f41ea0386a534 Frantisek Hrbata 2013-11-12  376  /**
5f41ea0386a534 Frantisek Hrbata 2013-11-12  377   * convert_to_gcda - convert profiling data set to gcda file format
5f41ea0386a534 Frantisek Hrbata 2013-11-12  378   * @buffer: the buffer to store file data or %NULL if no data should be stored
5f41ea0386a534 Frantisek Hrbata 2013-11-12  379   * @info: profiling data set to be converted
5f41ea0386a534 Frantisek Hrbata 2013-11-12  380   *
5f41ea0386a534 Frantisek Hrbata 2013-11-12  381   * Returns the number of bytes that were/would have been stored into the buffer.
5f41ea0386a534 Frantisek Hrbata 2013-11-12  382   */
7a1d55b987dfcb Johannes Berg    2021-05-06  383  size_t convert_to_gcda(char *buffer, struct gcov_info *info)
5f41ea0386a534 Frantisek Hrbata 2013-11-12  384  {
5f41ea0386a534 Frantisek Hrbata 2013-11-12  385  	struct gcov_fn_info *fi_ptr;
5f41ea0386a534 Frantisek Hrbata 2013-11-12  386  	struct gcov_ctr_info *ci_ptr;
5f41ea0386a534 Frantisek Hrbata 2013-11-12  387  	unsigned int fi_idx;
5f41ea0386a534 Frantisek Hrbata 2013-11-12  388  	unsigned int ct_idx;
5f41ea0386a534 Frantisek Hrbata 2013-11-12 @389  	unsigned int cv_idx;
5f41ea0386a534 Frantisek Hrbata 2013-11-12  390  	size_t pos = 0;
5f41ea0386a534 Frantisek Hrbata 2013-11-12  391  
5f41ea0386a534 Frantisek Hrbata 2013-11-12  392  	/* File header. */
5f41ea0386a534 Frantisek Hrbata 2013-11-12  393  	pos += store_gcov_u32(buffer, pos, GCOV_DATA_MAGIC);
5f41ea0386a534 Frantisek Hrbata 2013-11-12  394  	pos += store_gcov_u32(buffer, pos, info->version);
5f41ea0386a534 Frantisek Hrbata 2013-11-12  395  	pos += store_gcov_u32(buffer, pos, info->stamp);
5f41ea0386a534 Frantisek Hrbata 2013-11-12  396  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
