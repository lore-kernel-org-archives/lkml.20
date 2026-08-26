Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE123B7753
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787777253; cv=none; b=qjHjEKri7p7xgueBYp+ejWT7TvErmdlUHBOk5T1bZSg9oF4EBpXFy7Ho+ux1+V1mB0mKb6vTeAdTAsixwoVaBz1PpsrY6oahBV3PUF7ddTH0YWa/2SJiFXz6ULgEyiNV7xSZn8+9TENoVM1uaVC+vQbYioZyRxdoEB9EaLFcxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787777253; c=relaxed/simple;
	bh=GfFOyiEaSCPadUpdXhKvCE69WqklgSFIZtplxHdc/Q8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cXmgQV2gFs5uJYY1kqxdHz7HHEed9u318e/5qaxYX1V0zGh/r0nwa4LmBr6G/O4ZyvH9z+y5qCavJpwJnOEbJ+F79puZvm4zVUqTlBDYRCQYFE3lO5kj9lR6U/OqDWFATDyZS7dpI3WTn5DrIWR3E8FNrPey9s+Om6DTJ4EQ8BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQS6c4eD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQS6c4eD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787777251; x=1819313251;
  h=date:from:to:cc:subject:message-id;
  bh=GfFOyiEaSCPadUpdXhKvCE69WqklgSFIZtplxHdc/Q8=;
  b=bQS6c4eDL+6IPpnSWSjFgE3sJ9nBfMcwGe5L+OatwTq/LPlQbetxbD+Y
   jKcU6GH/UYwWUZm3SoNqg+NspN+12I32NP6yfsANZQ+AWRn19F3yNMSGM
   icCV0ha3XL8U3kfzf2Z3QUIscRZNfYNVooYx9m1maVH+U5uBuuM+zcnOn
   6CSmZiFmgPKdbu41PnTHA/okAYqMKuN/cBmWAjtcFgAYp2PaQVwq8GMs4
   d7LrLF0dBZeSdxWyfTlYV4ko3uoGWJr3Y2hHaBHfYmywPXP7VrBDBVmEo
   18yeNF8vv3SrI880MIZNTOOxechEm/eowAVuCOGOpm3qPWBg42pBdE9WO
   A==;
X-CSE-ConnectionGUID: gEErOCWJQ5yT41+MFGXW7Q==
X-CSE-MsgGUID: vxSHqK+nTNiCdeSbe0Krvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="91950802"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="91950802"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 13:47:30 -0700
X-CSE-ConnectionGUID: X9cC6tknRd+ALO6HRxqeVA==
X-CSE-MsgGUID: LVl1vp2RSB6dRMDN1y7Ciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="272916415"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Aug 2026 13:47:28 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzKWr-000000000Zt-45Zh;
	Wed, 26 Aug 2026 20:47:25 +0000
Date: Wed, 26 Aug 2026 22:47:13 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_OF_PLATFORM when selected by ECONET
Message-ID: <202608262221.CZIny8DH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d45774af09f1c681c754c4b7cdfb5d7f72fd9
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   1 year, 3 months ago
config: mips-kismet-CONFIG_SERIAL_OF_PLATFORM-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262221.CZIny8DH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262221.CZIny8DH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262221.CZIny8DH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
