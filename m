Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921224;
	b=1bPFXtT2U/2L3hqWRN5gXj1MjOVasZ/4mUPRVWfOPcuO3+V1wwa1ZrCLybd4a68jpV8B
	 rRDtrjIaX1ELWNM8EMi8XdqOG6ljKf1AoQjn4oAV72NH717Maj15BCv1Qx5QtEIu51EUk
	 kKy74AxmWNJ7R79x6KDkW2NEXuWGXG5Kqh2CHQsWLu40HEPHviSP2ODP/x9yvlt22wHQ5
	 JIMk1W9XK0QYYUyY1KroK8Onbk62FZTcg8+lnJ3iePlX+7GEfU5iVE9d6qMatjVJdEor8
	 DG+PgiZ8EhOgZT03E3U3huNrybTXTTaLGjTArySBAHTB5DABTcr8dtf3HR1oKsEWYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921224;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jSJWGcVnNMGByPlmzCOyAgYgk+YfDmAjzO7dDGTuRwg=;
	b=hGQQs1uxvs/Ri87Vj8Nfkq7C6GAmYF2qTjoTHqh7hPrdQBYCk8hfRf4pb2uNsz6N2MUd
	 aV42baZmrBk2vGg5Ly0ZTWEIKpQetoDMePYcWXwnt/m0JvaT2tQe53isvEBbnPYsfyl4b
	 E1yoBjzzDaX4juwAsCqpdgR+EHaN+OrmjT4oa2a6nSefbo1nBWv9ij359HFNdc9h0dXBK
	 gOGkK3dYs2KvgaDbQNrCE1p7WWXcMGgq8879OjBx99d7B+3Om8xnlxQpUHVJ57C//wHlV
	 HaQVLn2t9cJjTQ+cpkF5bir/tiF6iC97dSzU7bC6O7Bl+NK6re7oaE8FDGTJVeGej7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TihgjNIW;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A88E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TihgjNIW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794921224; x=1826457224;
  h=date:from:to:cc:subject:message-id;
  bh=zPXirlT/HgBkiLCBv1wsmov1Zqg76bgR0pLqzF42djg=;
  b=TihgjNIWE8z0jX7fxqG74n4wlwQw4tVeV7jceympYSlfRVsaF0gDEPmj
   z9nS0heQHQV/psvQckzoYdvif3w8EZ4T2bMgJH+3DbrtZ9LpA8q7sdZ7C
   kRkNkYIkNoaYCLaYoBjN6aSIzU3WRtr5V2qiSB9lMO02oidWGF69dcrhQ
   yk2bI8w54XEcNsabGV0toKAtmi8NS5MmIuvnC8IqJHDc3uFDummU1QelU
   FIEYoPucgNbofsE/0cG7WWhMqfKb9+oDOe3a6grikb/0F7mqXqwGni8cl
   vJem9uzZGIUR+x5V8Ob14eEHPQ22x9hPsLSjdCOLQQJ1ifPtzy863aBxx
   g==;
X-CSE-ConnectionGUID: //5a3Lt7Q76OFFsltIAKAg==
X-CSE-MsgGUID: urGJew2sTNSFLcn+uvCqMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3712630"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3712630"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:11:52 -0800
X-CSE-ConnectionGUID: kCksjsTQTEShu8VyhfBQ/A==
X-CSE-MsgGUID: 8eEux4VPSOaNs/hjPtHP3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10193328"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 05:11:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTIyS-0000000037Q-1RKM;
	Tue, 17 Nov 2026 13:11:48 +0000
Date: Tue, 17 Nov 2026 14:11:00 +0100
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>
Subject: drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use
 ARRAY_SIZE
Message-ID: <20261117140555.KfUW4BDK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: ce26f588c8310e0fdd1bc7524a86fdf0ef6b1c85 misc: rp1: drop overlay support
date:   11 months ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/archive/20261117/20261117140555.KfUW4BDK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce26f588c831 ("misc: rp1: drop overlay support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117140555.KfUW4BDK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use ARRAY_SIZE
   drivers/pinctrl/pinctrl-rp1.c:444:33-34: WARNING: Use ARRAY_SIZE

vim +343 drivers/pinctrl/pinctrl-rp1.c

e3ce7b89738833 Andrea della Porta 2025-06-24  339  
e3ce7b89738833 Andrea della Porta 2025-06-24  340  #define PIN_ARRAY(...) \
e3ce7b89738833 Andrea della Porta 2025-06-24  341  	(const unsigned int []) {__VA_ARGS__}
e3ce7b89738833 Andrea della Porta 2025-06-24  342  #define PIN_ARRAY_SIZE(...) \
e3ce7b89738833 Andrea della Porta 2025-06-24 @343  	(sizeof((unsigned int[]) {__VA_ARGS__}) / sizeof(unsigned int))
e3ce7b89738833 Andrea della Porta 2025-06-24  344  #define RP1_GROUP(name, ...) \
e3ce7b89738833 Andrea della Porta 2025-06-24  345  	PINCTRL_PINGROUP(#name, PIN_ARRAY(__VA_ARGS__), \
e3ce7b89738833 Andrea della Porta 2025-06-24  346  			 PIN_ARRAY_SIZE(__VA_ARGS__))
e3ce7b89738833 Andrea della Porta 2025-06-24  347  

:::::: The code at line 343 was first introduced by commit
:::::: e3ce7b897388339b407d57969acaa26063e38209 pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support

:::::: TO: Andrea della Porta <andrea.porta@suse.com>
:::::: CC: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
