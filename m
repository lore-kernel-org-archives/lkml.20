Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E053E52ED28
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169492; cv=none; b=T7CoYikRCVEH5c1xXqfLEY0Wm/sx3+Pqf9lfXD8C+n+n/vcAmEp1nzCnoT0spx+YCn1yW6DKAcJcRBZvvrcmUrkUEA/TYUv1G6Pa6OWbMWMWbIjmJAXsPeLAW6wlzN/XeQMtN06jgB/4SSDDibfsoTKrmFPZT8iLaC9v160XPec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169492; c=relaxed/simple;
	bh=VqTuNWTEVQUTU9m6cK3XARaLQEY06U77JRvzuEC1uVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HHjATX1Eod8WanSFyeiZFFAA85vPqmN5BSWuWcA59vtDNmXduZecbrre8vetudXGumz4rp+WicHmBXTNaGHzMd8wuBZ723Q96oEU8EfoqL9RxVRh/qzQErTp1Plecx9fKcYVHSuHzeYmAupNxxFALfHx02OcNnAYWpDsh2j/6jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrpYc15N; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrpYc15N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790169490; x=1821705490;
  h=date:from:to:cc:subject:message-id;
  bh=VqTuNWTEVQUTU9m6cK3XARaLQEY06U77JRvzuEC1uVU=;
  b=JrpYc15NnkUJOuZ2vShtXTuOwmy7TXgWUM2CKBW+bWy5itEzYXm7LQRp
   A8u28etSbsFrV9tqjaC9kB4bMxMOfvsmZVqS+0VaS2ct59yrItDXtjl1j
   9XWf6f2jBL15FjZ0qFrTgjnc4g73FSnprv9ucZczIuOGQS/opfHQSPvVC
   Jhv2MB2Gqln+0Xd4ZBvsuxDn6MLH/0aMqsHMTuELNyM9GviHUST/LkC0i
   /+l9IJgd/+FJclNIBr+PC/2GMIIchaT28rpqA0PB4WEdvqeedLRne78t0
   J+ANzpBPZGb1rb9TF53SUDklvADjBgmVsVdsV9DWMA+j9cDwBojxx4qMq
   w==;
X-CSE-ConnectionGUID: 0PI7RY+HSU+KfaUKjq/6hQ==
X-CSE-MsgGUID: 8ky2e5y1QrSJe2hTNHGgMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1371207"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1371207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:18:09 -0700
X-CSE-ConnectionGUID: UksniICeRMaFP9GzcnD68w==
X-CSE-MsgGUID: Z7hQ9IX4TyeV6agQAltUOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272218126"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 06:18:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9MrM-00000000H7K-1qtX;
	Wed, 23 Sep 2026 13:18:04 +0000
Date: Wed, 23 Sep 2026 21:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>,
 David Disseldorp <ddiss@suse.de>, SeongJae Park <sj@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 trace_initcall_level+0x88 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <202609232149.A8u4hH6s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Mike,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 3fb2d124b64716f16355b9b722b2f062c0702f24 init: do_mounts: use kmalloc() for allocations of temporary buffers
date:   4 months ago
config: xtensa-randconfig-r1303-20260923 (https://download.01.org/0day-ci/archive/20260923/202609232149.A8u4hH6s-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232149.A8u4hH6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3fb2d124b647 ("init: do_mounts: use kmalloc() for allocations of temporary buffers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232149.A8u4hH6s-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x88 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/xtensa/platforms/iss/simdisk.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
