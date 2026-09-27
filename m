Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A33CAE74
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499956; cv=none; b=JKvaxJk+4dMFURlTb9R1h8BzZ2zP4ewwIlHsCVfUvogWGmDz/uGfypwV0q0uaNbx71/BRqfpfUkk+tcMPSF3rWdGwA7a2NJ2dODMT7iQsRVvpOgbGkeV20ab8gEkMAAXJRYDciUXRE8An5gfhU6lfzOT+Z8K1ejwXkPBD593bOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499956; c=relaxed/simple;
	bh=Fqj3j+eDeNTJEbTlJvXs9gtTHN/wPlb/grwNyEpL5tM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvnapPMJN1nt3tH2e0MD0mheL1RCT821ujnS06Zk0bhhFXt7llUXoERWMloyl1rj9jDG2qL0YWQKufM1E9HpWsfWhcRk4tpayP5fiKp/IWdSwtnWR3uLvYsmauYsndsh1/ZhCC4CQzz+Ff6HAHEgJpDz5rq+7uRA+nN3mEfHL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoLsytgO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoLsytgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790499955; x=1822035955;
  h=date:from:to:cc:subject:message-id;
  bh=Fqj3j+eDeNTJEbTlJvXs9gtTHN/wPlb/grwNyEpL5tM=;
  b=OoLsytgOW2LoAS4VCDH0mUBmTk+fGw5q/FHO8qUkdWrTpv/x9fQbWvhY
   wWun3wgQuF/Xh8M6YIy5Flc2FeYvLm++NEK2Cc0v++NCjbBGRJ4q1cVnE
   TgqLyy9quQwHD6zY08dsd1h3Ag76a7r+nJqWU6FgQUfriPyOeZimrnic0
   iZr0rRgv0KUyhKBW73R6p0dYXqIyJu2TSmATBuBYW7R/fxD4cMhU7VQrA
   WJEMjff4QGjCguFUgUeXTbLI23Kpc5m+nmGUo5Zm69piQ5mFuYt/wZgot
   TsE3BIlsbVGYQ4oxCiymiPKoHIhPyhX7BR2oJtcCERGeXauEkYn38pN28
   g==;
X-CSE-ConnectionGUID: 5kUB3SfWTMyu/xwFL0q05A==
X-CSE-MsgGUID: EdbZIOrORymrV6auU2TcXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="107604201"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="107604201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 02:05:54 -0700
X-CSE-ConnectionGUID: h4rPzDNuTryCYJIayttvcQ==
X-CSE-MsgGUID: WrlXIi7jRgGUVBSuVBVpDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274290012"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2026 02:05:52 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAkpS-000000000WF-0Ko9;
	Sun, 27 Sep 2026 09:05:50 +0000
Date: Sun, 27 Sep 2026 11:05:44 +0200
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Alexey Gladkov <legion@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: xtensa-linux-objcopy: stNM3Sx7: warning: allocated section
 `.DebugInterruptVector.text' not in segment
Message-ID: <202609271017.LT1Q3K8p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd179f8a05be3ccae366b9b96e176b51fbe54aab
commit: 3e86e4d74c0490e5fc5a7f8de8f29e7579c9ffe5 kbuild: keep .modinfo section in vmlinux.unstripped
date:   1 year ago
config: xtensa-randconfig-r2202-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271017.LT1Q3K8p-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271017.LT1Q3K8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271017.LT1Q3K8p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   xtensa-linux-objcopy: vmlinux: section `.WindowVectors.text' can't be allocated in segment 1
   LOAD: .rodata __param __modver __ex_table .notes .data .init.text .init.data .init.rodata .data..percpu .dummy .WindowVectors.text
   xtensa-linux-objcopy: vmlinux: section `.DebugInterruptVector.text' can't be allocated in segment 3
   LOAD: .WindowVectors.text .DebugInterruptVector.text
>> xtensa-linux-objcopy: stNM3Sx7: warning: allocated section `.DebugInterruptVector.text' not in segment

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
