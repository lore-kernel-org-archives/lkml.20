Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E349B5DF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078285; cv=none; b=Vued2D7D7lgc389CuT5jEoEcEAETvpJDo0IHSJtsI77uFDfm74oHBkudl5QPc4vShOnV//mN19xRm4qyKx9RFcpbtSIwtk2tqWrUeL8A8EuEGd1k1bavxzvnfOiDe0XWdykoqzrGzccBcFD1w8ouSHQaNO/eFgeo7K6QSBvzRIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078285; c=relaxed/simple;
	bh=1SpQpIZjwS3C9fmGphlWs3iKIBaHrOcbLfdtRL2nj08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rATGtWuTf1oW6jPA7Vo9B52gX3aLZ/KeJuOe05xILxV7b6IEBbMQrizr1q9Iqd6gWnaOS79l3UbwnHbJW8xukkYlPGDe1fTViMz/nksTQVMiMBsrILyALqR0spzjlyY7nWQL+GDudzKZUmifgE1eWCLF02dCKgYbGLvWMTrlPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5kdCdon; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5kdCdon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789078283; x=1820614283;
  h=date:from:to:cc:subject:message-id;
  bh=1SpQpIZjwS3C9fmGphlWs3iKIBaHrOcbLfdtRL2nj08=;
  b=P5kdCdonJCGCG/I8FXzm0Bps7H0lkmzeEYY7pH6uk8vaIv2KoMlCWMrL
   IgzBGzjKEFIYf1S489MOADcAZ0ILZ3yMTFLNorbT3Vj90T4afjPqe01GK
   KAa5LS+CGewuFYnuJkA1cXScb8LoDrevo5HTocZfzOqVdFCjqHK8zAE/A
   YCRJ9Oo6ciGXq/03ebhkk6nkVsrzEXVqQgCDdXbfzj6LGuXTvsVd4MMcS
   UgKtwsHCnQCLAF9A95ChNqzR9Qq1WGN71E6NUBij3qDF5QJVPMg0BBhce
   Y4GL6WoVP1Jd+/xrjyS3fyXty+vzmw3/Skeu8lm4uU+5EHI6Edoh53zgL
   g==;
X-CSE-ConnectionGUID: bGFPq/GvT7CP888apHc3SQ==
X-CSE-MsgGUID: O0K0dgnXSWWMdWkb5M2fYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115083861"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="115083861"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 15:11:23 -0700
X-CSE-ConnectionGUID: gu99ZAVdQkCFk+ICmyHfog==
X-CSE-MsgGUID: f4yBfkz3S3OiGggNcoI8XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="81054"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa012.fm.intel.com with ESMTP; 10 Sep 2026 15:11:21 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4my6-000000000aR-2I6N;
	Thu, 10 Sep 2026 22:10:29 +0000
Date: Fri, 11 Sep 2026 06:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Selvin Xavier <selvin.xavier@broadcom.com>
Subject: drivers/infiniband/hw/bnxt_re/uapi.c:499:30: sparse: sparse:
 symbol 'bnxt_re_create_qp_defs' was not declared. Should it be static?
Message-ID: <202609110534.gyZDGRyo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 7e812673a948395675e9893e75b0fc60d19bbf27 RDMA/bnxt_re: Support doorbells for app allocated QPs
date:   4 months ago
config: x86_64-randconfig-121-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110534.gyZDGRyo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110534.gyZDGRyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7e812673a948 ("RDMA/bnxt_re: Support doorbells for app allocated QPs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110534.gyZDGRyo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/bnxt_re/uapi.c:499:30: sparse: sparse: symbol 'bnxt_re_create_qp_defs' was not declared. Should it be static?

vim +/bnxt_re_create_qp_defs +499 drivers/infiniband/hw/bnxt_re/uapi.c

   456	
   457	DECLARE_UVERBS_NAMED_METHOD(BNXT_RE_METHOD_DBR_ALLOC,
   458				    UVERBS_ATTR_IDR(BNXT_RE_ALLOC_DBR_HANDLE,
   459						    BNXT_RE_OBJECT_DBR,
   460						    UVERBS_ACCESS_NEW,
   461						    UA_MANDATORY),
   462				    UVERBS_ATTR_PTR_OUT(BNXT_RE_ALLOC_DBR_ATTR,
   463							UVERBS_ATTR_STRUCT(struct bnxt_re_db_region,
   464									   umdbr),
   465									   UA_MANDATORY),
   466				    UVERBS_ATTR_PTR_OUT(BNXT_RE_ALLOC_DBR_OFFSET,
   467							UVERBS_ATTR_TYPE(u64),
   468							UA_MANDATORY));
   469	
   470	DECLARE_UVERBS_NAMED_METHOD_DESTROY(BNXT_RE_METHOD_DBR_FREE,
   471					    UVERBS_ATTR_IDR(BNXT_RE_FREE_DBR_HANDLE,
   472							    BNXT_RE_OBJECT_DBR,
   473							    UVERBS_ACCESS_DESTROY,
   474							    UA_MANDATORY));
   475	
   476	DECLARE_UVERBS_NAMED_OBJECT(BNXT_RE_OBJECT_DBR,
   477				    UVERBS_TYPE_ALLOC_IDR(bnxt_re_dbr_cleanup),
   478				    &UVERBS_METHOD(BNXT_RE_METHOD_DBR_ALLOC),
   479				    &UVERBS_METHOD(BNXT_RE_METHOD_DBR_FREE));
   480	
   481	DECLARE_UVERBS_NAMED_METHOD(BNXT_RE_METHOD_GET_DEFAULT_DBR,
   482				    UVERBS_ATTR_PTR_OUT(BNXT_RE_DEFAULT_DBR_ATTR,
   483							UVERBS_ATTR_STRUCT(struct bnxt_re_db_region,
   484									   umdbr),
   485							UA_MANDATORY));
   486	
   487	DECLARE_UVERBS_GLOBAL_METHODS(BNXT_RE_OBJECT_DEFAULT_DBR,
   488				      &UVERBS_METHOD(BNXT_RE_METHOD_GET_DEFAULT_DBR));
   489	
   490	ADD_UVERBS_ATTRIBUTES_SIMPLE(
   491		bnxt_re_qp_create,
   492		UVERBS_OBJECT_QP,
   493		UVERBS_METHOD_QP_CREATE,
   494		UVERBS_ATTR_IDR(BNXT_RE_CREATE_QP_ATTR_DBR_HANDLE,
   495				BNXT_RE_OBJECT_DBR,
   496				UVERBS_ACCESS_READ,
   497				UA_OPTIONAL));
   498	
 > 499	const struct uapi_definition bnxt_re_create_qp_defs[] = {
   500		UAPI_DEF_CHAIN_OBJ_TREE(UVERBS_OBJECT_QP, &bnxt_re_qp_create),
   501		{},
   502	};
   503	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
