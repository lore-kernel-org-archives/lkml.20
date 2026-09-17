Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A13953A8A4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652395; cv=none; b=AcDjajHKhV289aArMT6GQ8tdvFoQlkvG8JuhQToBgEjqW+xU58kF68YwITc6h3oFAsFYKCd/CWC6TWcASH6gQng5PiWg9719tXeqb6ygwLN6eEUMLoo4YetUYGO5DReR3Z5DyPeReNVQSokgfg524KTSlqn2CXoFxVJaYcXobos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652395; c=relaxed/simple;
	bh=OWWuR7rBxaqD33VyihkwJ695nHYFAwO0VHcJcoyMqvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YcfTKGqqGizhhsovG91TfFiWeraqdC45oju8HA+NUe1bvxGN2gEOPldRmyVgLrNB9zUFL2PGvlXNd4OVKoAbxO7w2uotxhf9qZUdOwSEipoxHPXL826ybpiG4SirBlPKPrE9wRXkyZGq4LvYc8gggVd4Z6mmEhfKbye996piMCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g61A/662; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g61A/662"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789652387; x=1821188387;
  h=date:from:to:cc:subject:message-id;
  bh=OWWuR7rBxaqD33VyihkwJ695nHYFAwO0VHcJcoyMqvg=;
  b=g61A/662NYwuQz48kBQJJKPkX0P1hHyK8cw1OK98jhssYRE7MeBmOGAR
   5l6XObXgP/cJd+B1keOfAIC1SbgGj5nI3w3LhSWXcblE4RmjF3n7GQDG+
   9GHCxLvtQmryceuoFyXBIYj40M5B5Hw1bmKBzGIAoYK1rPZmsuLQC8eUX
   WTa7jyPif8ku7C/7YEId8DilyxAgVK//XiUSUw8zTT0wjn1pjhVsNVOwA
   mxjBxYUFVrWFcrYGTdU/LHIiLaXgj5j/+5n4D1Ho0oOAQE3p95vYgfFlH
   0iTIyVnSRUlxlN7yiL+D8pyaEeLcTLE6b+sPc6dh3aSY1RFjphBD/mTpR
   Q==;
X-CSE-ConnectionGUID: 56RM9fRsQWKr7akr+HtM+w==
X-CSE-MsgGUID: LjAPqw5IRbumYr//bxdrdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100738329"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100738329"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:39:45 -0700
X-CSE-ConnectionGUID: 7hZosOZoSJOaIXsEondsdA==
X-CSE-MsgGUID: X4k6WamUSk+abaQEbnEfmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2203000"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 06:39:43 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7CKz-000000000bw-1TpD;
	Thu, 17 Sep 2026 13:39:41 +0000
Date: Thu, 17 Sep 2026 15:38:46 +0200
From: kernel test robot <lkp@intel.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Link Mauve <linkmauve@linkmauve.fr>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: warning: unknown and unstable feature specified for
 `-Ctarget-feature`: `mma`
Message-ID: <202609171549.xeqQabC6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   238650ef6c7c7cca08e032527329424c9fbd70e5
commit: bc87cbdb952e9223616b839d64bdb4723aa2ed1d powerpc: Enable Rust for ppc64le
date:   7 weeks ago
config: powerpc64-randconfig-r2201-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc87cbdb952e ("powerpc: Enable Rust for ppc64le")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171549.xeqQabC6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unknown and unstable feature specified for `-Ctarget-feature`: `mma`
   |
   = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
   = help: consider filing a feature request
--
>> warning: unstable feature specified for `-Ctarget-feature`: `vsx`
   |
   = note: this feature is not stably supported; its behavior can change in the future
--
>> warning: unknown and unstable feature specified for `-Ctarget-feature`: `hard-float`
   |
   = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
   = help: consider filing a feature request
--
>> warning: unstable feature specified for `-Ctarget-feature`: `altivec`
   |
   = note: this feature is not stably supported; its behavior can change in the future

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
