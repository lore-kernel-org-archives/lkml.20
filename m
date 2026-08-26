Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339E36897F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768024; cv=none; b=MSLp4tj6t9E6yNL9ya7rOAfTVy4KjLjWJZgpfa/XyUWpqgqV784zfuBzVYnjHSMrPI2AKSew8+8ZCo/G67K+Fp47N7/NdpeixJJIBJr3s//CfAPssZbeEbwk4hOSrVwvxrKe8qWs6iYu5xSES7ag3SN2LIvu27cYNZC80wayQak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768024; c=relaxed/simple;
	bh=7hACW6gqwn+kYHLYeH9RIrv0GGWGhAtvLcPUpFtkEhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UTbe9+fc01Cu/8/Gc2N35W5iG5fJYr62J1Uda57j2q5PRLYE+eWL7rJKhD6aA0yxljVqywVwyhJJq4VAA6H4Scm6kmc2mkjKGu20rgD0byxiH2Gy6OopukcLGBqoMpGsMoOCysloEZjOIcadrhqbU0XMW0cOX/H/DBc3jtNtDDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbiP46EY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbiP46EY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787768014; x=1819304014;
  h=date:from:to:cc:subject:message-id;
  bh=7hACW6gqwn+kYHLYeH9RIrv0GGWGhAtvLcPUpFtkEhA=;
  b=TbiP46EY8SN4KY94egOtzWUue4zriwHZXFu677dqN94Ljz01tKlsyssH
   4o/qQ8bcXjO2l6r/JPUVHO5Rs4WTCFZxDVfL/ZWYF/dIOq5DebJHF41J9
   E0k8OqIXJZmK1ig65srghgc3NtcYVjfQgYAHG5dYsUm8MoI4RetWyqqRL
   woRJ5N4EPtnnEcZfRDlvHDN0iB6TJjImGjIndQYQ6QbJnWw2L7/ljAWTc
   h6fMalwGtomGmeWqkMGdb3kegCGOQDgRLdmApCKqFd2vcn6VDoYPcUiaU
   9NqpiLwPZhcwvGfeoq0H602LMzRLssnm2M/RgiERO4aKX8/YZWc5DqOVf
   w==;
X-CSE-ConnectionGUID: JeXChk/HRt2VFU9rloWNbQ==
X-CSE-MsgGUID: QqUdH8f8R3K3/fXoTkpvMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92120503"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="92120503"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:13:28 -0700
X-CSE-ConnectionGUID: 1oxNJB+2TVW9EHc+Usq7yw==
X-CSE-MsgGUID: stahew9TSAOJ61CiVS1zJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="267069089"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2026 11:13:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzI7o-000000000YT-311m;
	Wed, 26 Aug 2026 18:13:24 +0000
Date: Wed, 26 Aug 2026 20:12:43 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202608262023.aWiCeMHm-lkp@intel.com>
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
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262023.aWiCeMHm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262023.aWiCeMHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262023.aWiCeMHm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
