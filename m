Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334634;
	b=EP4DHs1+nBoaP9VJu1goMe3ujOXK+hDsTlCUW0MeP5QgbujnVgKtvJCNd+R2jCnUI6bj
	 jGc3ZyxMLdet+/cRCQuQ5VIhDLUwAycIanyiymA8GobhqE3pnOSKBh6TWlZPrdfAbYu2L
	 DyO24UVmqXNOaReSCVWvbaOK296U9BlGkazS/Dyyn4W1nERiA85xdegsag3CPpIoGdBmL
	 BNrm8TQ6KXVcevJtJ1OrCF0fyaXf3ICeuGxgG+/NGAmrf/A8H7P7u+yLArd2mk3wgWdLv
	 /pjeCBi8cPheFG12/VCWdwWmy1JbB/wKqhEB3BDfa4Hbhc+wv8dRFiO2yywVzXt6FEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334634;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uVW86SaIsVQ1pRfuXiCieb6sjN02/CSz/lkj8IUV8/I=;
	b=nL+cCngugWHJvvV9OZNg16sYgybIJAjnDTj4uhBvSSmkDs+Jl6xG82YvK/u9rjaNZmYh
	 8DwTEsPWcCYvYDrJvDGW9tCw/CEpqPbWKTy3BsJfVC8CjO4Jj0eTD95bgihgLEKF1pMjF
	 uI1GeXslNJZ7rv/GlWJbDcnOhNwcMB+IAYelPneXmQgeFraaLX3ei+TQqbfmCdIDTu0Iz
	 92kOqjBt3YtzP9XW2LwpHK4J3VyvsGzH6p6nAzXWoSut30kaE5B2yV0ekUiM2Nm3v+4n3
	 IEpdn2NJunR9YISzqJEfYyuhGO76gg12wL/LGIFeBaBEjhGJyfnxyk8h6padoP7D8EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DHO5EuYw;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C666606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C666606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DHO5EuYw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794334633; x=1825870633;
  h=date:from:to:cc:subject:message-id;
  bh=4HfgLbOM3A/ev4u8W2Hzd/Y/C0hVfaFcq/wgf+gEoKU=;
  b=DHO5EuYw9wCWXUs9uUhKECe8ap94TiTFWXirrNo1dBAKazL+xkfmWl8d
   gIWlY/0YphMPifk9z9dFUKhYIOgLnr9HNgkiD7t233mYYwYbNNd/c6pBf
   SCqo3WzTregs/o23tGyOf0uXOiIFSU3xNJkqIyagKNW2ElBf049c5nfPd
   UAHgJ+McXTGMzQKB3M8P0PKr685zPQCjSQDADqwzNI7K2VzBfDVvkNCuZ
   NZcAmBUQDccXk7K0rKNiSvDKv1eXGJ+llWZehE6drS2qLrHBOQ+Nb+36Z
   SujwMY17bGI67ELN295Vv+cs0YsMVJhAnvf09K6NVax+qLO+5YHa/QpJF
   Q==;
X-CSE-ConnectionGUID: 7FnFR/CSQcyC612JNgNvYA==
X-CSE-MsgGUID: GkyXTETBTqiiQC+eSw80Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3112028"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3112028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 10:17:12 -0800
X-CSE-ConnectionGUID: GlJXzI56S6i2HfV891mHeQ==
X-CSE-MsgGUID: uCVtrcNwSZSLR8uxhBhpLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8085574"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 10:17:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQqP6-000000000KN-0ES8;
	Tue, 10 Nov 2026 18:17:08 +0000
Date: Tue, 10 Nov 2026 19:16:39 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Nathan Chancellor <nathan@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __arch_xprod_64+0xf4 (section: .text.unlikely) -> set_reset_devices (section:
 .init.text)
Message-ID: <202611101916.F9L97HFD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Arnd,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b3dfbde62cf1981c4638939c159dfd087b7a72e9
commit: 94bfc7f3b0c7c33331ba4ff6cc64ff309dfcbce8 err.h: use __always_inline on all error pointer helpers
date:   5 months ago
config: xtensa-randconfig-r2111-20261108 (https://download.01.org/0day-ci/archive/20261110/202611101916.F9L97HFD-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101916.F9L97HFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 94bfc7f3b0c7 ("err.h: use __always_inline on all error pointer helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101916.F9L97HFD-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x30 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: __arch_xprod_64+0xf0 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: __arch_xprod_64+0xf4 (section: .text.unlikely) -> set_reset_devices (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
