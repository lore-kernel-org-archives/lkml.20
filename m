Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F8331EA5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380754; cv=none; b=VylA6vQkTsx7s/h6w5YT8JD6cnPWtlcR769bKRNqfvXbYXFcMqsxGhx2bnXxf3pYD3E2Ly2faZKvH8jUSOX7m5jTJ/Yr0Yw+oopi3JP0iQtqsDtvEqoqFWvVySr3ZSFnypFblQnD49+7D0dlAQCs0BjJY/D/UwiDYnQ2xuEYGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380754; c=relaxed/simple;
	bh=fLNXnmy3ks5cPz3XbdUbetsxcG8HjC0hCQl8h/Kpevg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gQoy8dHcyq/T1trSHE01ylRk7oa01FzplW2P7t8XcYqXuZJ4y//XCiMEAk3o4/H+ZEH7ARlpnGwlLwEyFTpVgyzaojRURqcUQFcKNN9wxxNuwanaPbLgb80lI+V2ynQJBgmkG1i26QKA5uRSj6THjwAoJnObzu2AVf4TTNJYqSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk3rMMue; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk3rMMue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789380753; x=1820916753;
  h=date:from:to:cc:subject:message-id;
  bh=fLNXnmy3ks5cPz3XbdUbetsxcG8HjC0hCQl8h/Kpevg=;
  b=hk3rMMue1wBepIPoWDGIiw99nZP4S1IzfCA95lRjRCMkykQX7mDn6S4o
   X7dHUOt2Tk/sxBP40lhFOOoSvTfZ5z0JiC/qd0CzXZue3h8pTLodEYa2D
   n3Z42YRrXZZxYdoE9J2CveW/EBe5kWNts2STOVb5CLFgAE9618SCuEL21
   7LwqCTkclHwESdz2C+/5CkkfR/obB29dW77E7f+2gDX3pSLqwejFV91Db
   D4UdyPPDfoEgKRqrnSwph37DGC6WSKeqMmk+CeU0f9hCbdG1FrImaDHFN
   b8l8VzPtYwdf/QkF1QcV59tmy+4YiLS3HgT5bHmBQSDydxayKCG4ikYu6
   Q==;
X-CSE-ConnectionGUID: FBp1y9vgR02yg7B6iXbx6g==
X-CSE-MsgGUID: i7k3NsGMQomYbIjwxVKAsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="115266300"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="115266300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:12:32 -0700
X-CSE-ConnectionGUID: GN5Me/jXSvqguXbJR2kC3A==
X-CSE-MsgGUID: InaHuhsbQzylm6sjVlzgdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270799696"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2026 03:12:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x63fo-000000002lD-2h3V;
	Mon, 14 Sep 2026 10:12:28 +0000
Date: Mon, 14 Sep 2026 18:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 hung_task_blocker_to_lock+0x48 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202609141856.psi6N6tP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: efdcfd9b4f4f07aa70663ee02a79dbdf980bf582 tracing: Use seq_buf for string concatenation
date:   7 weeks ago
config: xtensa-randconfig-r112-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141856.psi6N6tP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141856.psi6N6tP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: efdcfd9b4f4f ("tracing: Use seq_buf for string concatenation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141856.psi6N6tP-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x3c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: hung_task_blocker_to_lock+0x48 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
