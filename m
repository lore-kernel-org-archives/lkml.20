Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F4529401
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067780; cv=none; b=EWCLB1gj7fvXfgDdR11DyveCTw2eBOUNRLJV7TOTk1prmukOQwHMMK2KMazqQKNH8zvap48O0hrCcZKwFLCcA7iTVQDFpP1e5NuPg/m+f6GWvIC49isBWAehl58ngWAKCwB4LWrpljR2CHpocORC92QVbz/7i2ePlDAikvF3gVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067780; c=relaxed/simple;
	bh=zK0UVi9dWHfDbHzuZO3crWWWwMQtMZ4hLWNPjSr0u5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wl4IE8zXTkD+l9rbiuCAYsY5rl5apnMkuIm3t8DR5HGA0I3eyv+PQvuHf91mUuhaPKFtfihoPe5DGaf+idvwIcfRGE7Bn6qr905+rvpnoQX4KIoMqdAh37vZBfXK/p2BdfqIgjPALYcpa8UBWkltO78wRFuOV1dVf4wBdG8sFjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXy5zJ/0; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXy5zJ/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790067779; x=1821603779;
  h=date:from:to:cc:subject:message-id;
  bh=zK0UVi9dWHfDbHzuZO3crWWWwMQtMZ4hLWNPjSr0u5o=;
  b=nXy5zJ/0hcKbl4rYYmbM3bYC8d6+yOJ7u6rN1RjmtIbD+//8VqyigsJN
   YyTR1UJA9RbohpYIqWv7iBiOLJ19BFT42sRm4qQHRx3y703YJLInYF97e
   iaTC4SjwwQNmv9c8QWOs4Ozv47phe0p0juEZtJ/pCoeJK4C6xWoUq5Isi
   EY+rsSLo0ZeGwNISJ8Ct6Zqp4VjYyLbpgbvbyXPSQ3odFG+u1OVbuavG5
   /dSEmmLi343E1ZRAsQTAnw8EjhwA6KGygGdWs/xZjmQ8FXvULeq9N6On2
   RHBZzJ+VtLP0IMghNe8XpUXs1lgb3QidjBbkkO0fv/RdR9AmjSqjflh0f
   A==;
X-CSE-ConnectionGUID: gc8MFAOYQXuACAccjJpuSg==
X-CSE-MsgGUID: t6NpkAFATDyvNBlBUYQv1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1156304"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1156304"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:02:58 -0700
X-CSE-ConnectionGUID: IdKNh2rgQBe9jevsghn1eA==
X-CSE-MsgGUID: JltGVy5zRoeJFeJJDuRzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="281108559"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 02:02:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8wOr-00000000FFk-3qsx;
	Tue, 22 Sep 2026 09:02:53 +0000
Date: Tue, 22 Sep 2026 17:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/crypto.c:264:18: sparse: sparse: symbol
 'bpf_crypto_ctx_release_dtor' was not declared. Should it be static?
Message-ID: <202609221605.3H6cpcne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: b40a5d724f29fc2eed23ff353808a9aae616b48a bpf: crypto: Use the correct destructor kfunc type
date:   8 months ago
config: x86_64-randconfig-1301-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221605.3H6cpcne-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221605.3H6cpcne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b40a5d724f29 ("bpf: crypto: Use the correct destructor kfunc type")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221605.3H6cpcne-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/crypto.c:264:18: sparse: sparse: symbol 'bpf_crypto_ctx_release_dtor' was not declared. Should it be static?

vim +/bpf_crypto_ctx_release_dtor +264 kernel/bpf/crypto.c

   263	
 > 264	__bpf_kfunc void bpf_crypto_ctx_release_dtor(void *ctx)
   265	{
   266		bpf_crypto_ctx_release(ctx);
   267	}
   268	CFI_NOSEAL(bpf_crypto_ctx_release_dtor);
   269	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
