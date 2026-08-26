Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B7D344D83
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759437; cv=none; b=gETYnrKCW14j7XR/R1vEmRo5DuS44tqjD/nwA0YOKz1KyK9wOQDBv/UAsX8Pt9cBfLxdK6BiCeX1d3b952koAq4nvwS9D+b1EF7Xf5L5yQcRJ+HO81yg7iRHgm0wOXfb2SAc+suWzHs2F9a71NniI7k8NOmHS0Rg/vKaA4VlMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759437; c=relaxed/simple;
	bh=WusBKUA3t87kZV2RPaPl+39j0z7WMo4fuiWjBmL6hnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JCMJffpB+8e6c2atLTAIDntAvofT6iFsA05dG5V6rStPYBnNcgxX0KUtMYjJUgWJrk/L96mqTSj8IC2w9xz1bqMzXiVa4iuoZHr3f56ajtPM1D6XAMWWJXYXR5GALAIve3gAVDCqUKEHNcqOAxyaahJ50UKtSdJ0a08mskaygl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y87WFY0v; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y87WFY0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787759427; x=1819295427;
  h=date:from:to:cc:subject:message-id;
  bh=WusBKUA3t87kZV2RPaPl+39j0z7WMo4fuiWjBmL6hnw=;
  b=Y87WFY0v/kY0KOBmYDjPih3FlHbpc+RZ9P6ZmPJH1uHPJxalDfAXos70
   J5KQVWs+v+XK+MrNaapyhDlCGqOG2Q8b//TF34aG01t3hTbCBV6T0CV0p
   stsh3BQZbzutNczP/fPuEmycxp1C8NsJ0qf+CGfuxpIji+sAgUw3pVKWB
   ajUmrfuQq+0EqT7aUdMhY2T8ECzRmjsNypisekGf1UDyCSPXfp0xjWfar
   sRcNhoWtNG6rm6PDM6CYCHF+bdziOa1VYQrecI7bQ27zfM6csr1WQQW9s
   uzzggzpJBLy1rDHrWcwuo7KfpYAN+qGKzUYreuyIH2EySNboizJ1mv5ME
   g==;
X-CSE-ConnectionGUID: +W9creAcR5ma41RhIJOjIA==
X-CSE-MsgGUID: u19cZu39SLGmQ1ArhoWfTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99591170"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="99591170"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 08:50:20 -0700
X-CSE-ConnectionGUID: npOaV18ITvezOI+m5kJrag==
X-CSE-MsgGUID: 900Fe9J8RkekJRFHDf+geA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271415075"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2026 08:50:20 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzFtI-000000000NB-3a1T;
	Wed, 26 Aug 2026 15:50:16 +0000
Date: Wed, 26 Aug 2026 17:49:34 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_8250 when selected by ECONET
Message-ID: <202608261714.iV8EPluN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   1 year, 3 months ago
config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261714.iV8EPluN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261714.iV8EPluN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 79ee1d20e37c ("mips: econet: Fix incorrect Kconfig dependencies")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261714.iV8EPluN-lkp@intel.com/

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
