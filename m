Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898373;
	b=0EsWRx8vO4MnfeytwpVfGl+ijoifNEAA+tSV1kxjsjzcARV0fI1J5ZZ7a3W6FQ6C7VpS
	 GJPCajipZN7XL0WMoWsiPsx5VNoH9UWsQdhBbOa4kubBJfiD+7j3p8yIXcToheiuJUYOn
	 lv+c2on7Ni7q02R380sVMNJwsUTWy50IhHN5xnaj8nDSc7Je5T4ujyGYxpZIu+Oc0ql5t
	 +XTVMcItFU8Zv3Tl8DbSGmeQQADJOuCQeEzX62kXRFekj1CSTcNKzopoWSCGMW2cZTwOx
	 IMa52g3aRwKkYLh567dqrDFx24krB/aoe5xykUd11/Hrz8juShgYEatYvwpzCj52AtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898373;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yR4h9DQyRef4iX+qSBPRunUjxxdOQr85IfciZS30LXg=;
	b=jqx0eo36ooINsRJelW1K+4lcn+BB2SDD91s7BC9JO9cvSQOjfmiGhc6sLR6+410Z8p3K
	 5gi96yw0vtqyJiou2enr34CL8dHyF9gW6QWzY+gy1yVum1sl4gW9ya32zbE9gGLTecFWi
	 H/t9f+Di097xxT16cxaRaRqqDVvFQwhlF2QvfOCq/zwyi+L1025fwjq43kETq0kutqmo5
	 g89JeHeL1Q/jrlJeT1MfHeHUEWOsdyjMqOZtYLjJtAYFo3yWf+IkGmWQq8CVJL+hRrZTX
	 0t75WLhCI9utu1HuswWe0S6T2nwp2yItDKdCFIWjKoePJtMZIKG62zN3WGNnJU/WtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dd8ggBWo;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163A606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3163A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dd8ggBWo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794898372; x=1826434372;
  h=date:from:to:cc:subject:message-id;
  bh=U6jRohgevbPzDYIXw5SThEpxmyRWy54eaCrdvKq0fFA=;
  b=dd8ggBWonXTPIj3abdMY9JN1vnoxuamkzGy/SwyJu6mYU+Kwa+iRZSuP
   ZPJD3E7yxUBrpeC1lMH8QAQ6UYtZ4WqH+Ef/1TDIunm2zDfcIE8YagwFP
   BQij6BLxDmORnIa6KRsr0Frw4Xeu9LnUzc3jEMeLBHvhDP/N/3QoRc5UQ
   MedqYKHPhGCxAC9Fihb0TibDQ7eQWRu/kKsGWmNqyc6gSdjNPle4i4Qjz
   tGru/Q6ITidbmDTq65ruPSuWjAWTDQ+ugRN1xk0itpZbYJ9umsRiqQCk4
   9qwfD44gB6aOzOf21LfpMMcqvAk4CxoCbZoBaocun4yEduz3XE9oh5paG
   w==;
X-CSE-ConnectionGUID: UawkR9utQA2XP77hvoeQRg==
X-CSE-MsgGUID: gu1hKQ9GRtqHVF7laAxK3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3665744"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3665744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:49:28 -0800
X-CSE-ConnectionGUID: O++D5D4eSxOjLFjdxjNAdQ==
X-CSE-MsgGUID: IqzjhdzERmunAZoutvXmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9925823"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 22:49:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTD0N-0000000030C-0qC8;
	Tue, 17 Nov 2026 06:49:23 +0000
Date: Tue, 17 Nov 2026 07:49:11 +0100
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>
Subject: drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use
 ARRAY_SIZE
Message-ID: <202611170729.LNqlHdfg-lkp@intel.com>
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
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170729.LNqlHdfg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce26f588c831 ("misc: rp1: drop overlay support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170729.LNqlHdfg-lkp@intel.com/

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
