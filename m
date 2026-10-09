Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA453C457F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791580102; cv=none; b=tdXp15K7PC9uGF9gPg1rlBRMDP009FzP8w4xelhR65YZD/DiHrr/0Vl5ZxQWSq2m8azF9wLoUe7HKXGeq90IKxkWVMdBJfnfniaE3OwY/d0G4MXuo+mb4gTtKnPO7Oae+RXelu4xhYZvdFDaVLBeMcl1uQeL8M56Fvf0zJcmeAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791580102; c=relaxed/simple;
	bh=QNgRiWK9GEexVlRe8MvJbUo8Iypa80NlOpAE/rGnwdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AO0B9FfwDzBEcAgGmbm1fSyCmnpwA3Mk9HW5W+QEZkDyXoXxy75L/2mo1Cbq836r67dsN+IoXcUwYlhp2wJK/ijEwJQgM5PYu4CoXEBCLIh0nJzaM84dCjt/ubiwWn5vhJRu7A5TtUmQwr5H7x235led3c6JJqY+YSiHSxV/y8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nd75qdiP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nd75qdiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791580101; x=1823116101;
  h=date:from:to:cc:subject:message-id;
  bh=QNgRiWK9GEexVlRe8MvJbUo8Iypa80NlOpAE/rGnwdM=;
  b=Nd75qdiPfibq22q02xUUYwaMgAS+6PFNGVp7YnXQ+h5Pg3snsSWHYrYX
   bWExsRxzzCYIXkM6Tu6yG+XlYrDoqihKz9WZ1KMd2ydOKnXNs7zTWwVq0
   vv0yuQSO4gu9tbIkiCVpSU2GHVsrk20WMS+spElrMi19H+Vsomb7phm5y
   0FiFy9kCXpHoAPzRCuxCMRpNXVDNRtnxcug8KqvdAmbamHPIbx9Dab5B0
   WQpDi/Zyy2Oc2NNBx8TklmVTPm3Wb9Kjj0svACAy8KLKRou3bbDFchupW
   rUENKr9LPS2Puka4iYwNBtSeWxSH1ekheZt8UrJ7lc1zukWdaRvMJv3w5
   Q==;
X-CSE-ConnectionGUID: 7caw0lgTS8mOdGo3pCtBqg==
X-CSE-MsgGUID: v2L7CwQUQR+XgZsV0fqA8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="284749"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="284749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 14:08:20 -0700
X-CSE-ConnectionGUID: m64ck0qSQxyZP+QuO8fHlQ==
X-CSE-MsgGUID: L7cM3WkbS8i6bYGde5xW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="385138"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2026 14:08:18 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFHpA-000000007JL-0GYh;
	Fri, 09 Oct 2026 21:08:16 +0000
Date: Fri, 09 Oct 2026 23:07:35 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 run_init_process+0x6c (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <202610092339.vKkIdXug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af32da41b0327b9c6a37856ba82b6760d6c8d10e
commit: 9a8e296958884b807a02759975170b6559901242 fs: make userspace_init_fs a dynamically-initialized pointer
date:   3 months ago
config: xtensa-randconfig-r2304-20261009 (https://download.01.org/0day-ci/archive/20261009/202610092339.vKkIdXug-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610092339.vKkIdXug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a8e29695888 ("fs: make userspace_init_fs a dynamically-initialized pointer")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610092339.vKkIdXug-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: run_init_process+0x6c (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
