Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FBE478E47
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772343; cv=none; b=tsVhmNU9e3RcNpslsPlc5JLHRGhHHy30aZbW1aErubFlYoI0YWegnAINRwGOHvwZMf2KEFRoIgJJShQTXBG//Y5+2ExVTClvQOWJX9K4F59dzJD1hv6g1zVQhEsTPhHXOhcyK/4n3wBNhw0wtEFTbOuuCPGpa9IePoR8h9X2BWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772343; c=relaxed/simple;
	bh=ZobIw/Au4MEs8cYNYrYzG2aDYuHf7N/6pNB0UxTrZlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HGiBOf5edThF9WDGC4MAfszhiPucQWmDDJVTKItCmp7aeuXHylF83r61Cf42tAz32DKXFLFWlMeCLnw3oB1WQVzinx1kladAGZ8WZwtrZ/pMO4hxhQNwSuCFH5rY1KwSpwAgGXjDG6CGzw+PHkRr1lkKvGBhxbikG2HCnicZLr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3YYLVge; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3YYLVge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787772337; x=1819308337;
  h=date:from:to:cc:subject:message-id;
  bh=ZobIw/Au4MEs8cYNYrYzG2aDYuHf7N/6pNB0UxTrZlA=;
  b=a3YYLVgexTsyI/Byr7fISj0WEDPaUsLmbINmUgfYMpfAcvlqbYVEm0i1
   2KPrK9gVVgHmzQVz2X7e3QdqI1HmZZg7ram0l+w9iQ3m2Zp4lkwfFmZpB
   n2SSwFNV/0/XY/iQzN4SJcCTEBoInn7QzU4FO5uwuR3c5zx/IhnQmizmg
   iRSXND7xBMn9Y5WayHyn9kNwpZQ5chyV9BxI/4jMAg1DzBtSh2WnO5xG2
   nnjcI2EA4tXRJs2vyx8/0MFKVL3P5EACnvv8CCZGDq8JG16Vg419q6agt
   5cLc+TpYIjRGGZ92ZhsaTlQJYTDvbUE2yxwCXcudLuo6l90ouwNKWkzDR
   g==;
X-CSE-ConnectionGUID: w+Xc8TXQT1m8YwXq0EIoUA==
X-CSE-MsgGUID: t41pKcgTT5aBq7FBxU6qmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88141212"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88141212"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 12:25:29 -0700
X-CSE-ConnectionGUID: 2Lutdag7Q5+P7cmjWGpjtg==
X-CSE-MsgGUID: I0NyYaWYSRWcGWlDlpnt9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="305885835"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Aug 2026 12:25:28 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzJFV-000000000Z7-16m8;
	Wed, 26 Aug 2026 19:25:25 +0000
Date: Wed, 26 Aug 2026 21:24:30 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_8250 when selected by ECONET
Message-ID: <202608262155.9Dk0AJMm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d45774af09f1c681c754c4b7cdfb5d7f72fd9
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   1 year, 3 months ago
config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262155.9Dk0AJMm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262155.9Dk0AJMm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 79ee1d20e37c ("mips: econet: Fix incorrect Kconfig dependencies")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262155.9Dk0AJMm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_8250
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
