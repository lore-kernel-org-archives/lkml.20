Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D23F824D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755701; cv=none; b=T2BHDBoSF+mcQ//VFzxH/5Fx0dPQ6OwSSo/FW1pybQ9x/uyEVVqdGJ2S4Or5DNsfo6yEAadZKlEG8viI0dISTeKP+YTxh8Q9txGv3al0hCjCUpW0B53PIYPdb8qCdhnmiUtxnyHdgjB6XapqYuNtV40rWOpVoZHPfzaQQBCXNd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755701; c=relaxed/simple;
	bh=wxNIErIkY3cbHPh5ByekYSee7DzS9pmP+VGVTwhVi+w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LSHYz9niV0GKN9eay72XGhYfsh9sXbsQBATW05ME3OQvWj3CyJvzDUVXnoLS4sfthXuY5z3nTYl78/4FgUabnDa+K5g84BNaar+9HSQkJhZdQEhQvctaxGGtMOkCtVq+pfVx/HTzz7WvY8MP4H3SF7DxPuV7KZRCbud/f5LG0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwaMWIUH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwaMWIUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787755700; x=1819291700;
  h=date:from:to:cc:subject:message-id;
  bh=wxNIErIkY3cbHPh5ByekYSee7DzS9pmP+VGVTwhVi+w=;
  b=mwaMWIUHaUrAJm+eq3pOMm90ZWcXEvXeHs5tincPJsOvxSZlJ/jwzn0+
   ViSGt0+Wo9TGqJ91m89Pi+66PxcdUGbevGd68PoOE28rSFzH7+WehBMbL
   9AkK5kJg9BOxyMiUHm+VRrhuAkHyK0fUZo4BAaeRsK8EySS2WVJKn9MEX
   wr2vvn1x1OucnHCllFeGJEqiU8LhDyOQvCb/3r1GM7TeF6T3iya5/qE0/
   iYeobOlBImOIghbqfaaMKp7h50fkOWG3Jbdp0fkD7B9zA01IZg9wEB68G
   on1T7cwipT6HIFh3Xxn9DNviUkAghR7iyjss8rsg+daB5F7uQbl2IH+Ze
   g==;
X-CSE-ConnectionGUID: qMCYEF7LSUaC30CKoxQv+A==
X-CSE-MsgGUID: zAWiZ0w8TWu0rqoFsQt/9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="75780509"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="75780509"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:48:19 -0700
X-CSE-ConnectionGUID: 9NCvFcGYTbabrzAkPL5g6A==
X-CSE-MsgGUID: owmpwoZLQ364dXoVHpKBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="297489720"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2026 07:48:17 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzEvG-000000000Kf-3kfP;
	Wed, 26 Aug 2026 14:48:14 +0000
Date: Wed, 26 Aug 2026 16:47:43 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202608261629.bWYag5Vt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   1 year, 3 months ago
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261629.bWYag5Vt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261629.bWYag5Vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261629.bWYag5Vt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
