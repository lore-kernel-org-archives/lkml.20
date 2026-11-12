Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518472;
	b=E/VbRW+sGdUypIQYGJH2qMaRtScAPCOK3NO5d5Zg5fucKGE+nEBXgWJtLDteEqmUVFxz
	 jlyx+h0xXRRHbf4YpMhSJ0Kqros2DLZzBuFnjXu0Iv5NM1DRk9APZ4184kskMnLFwoy5g
	 ajPriTpdITwtXZ6sfwnvjARS00dZ0xdugSG6R4nsIqhogWqVMUzV1k9pomRohDeZ8pMfH
	 Rupmn/lM+H3bpLp9cp/tMCixOY3FVhk4g+3YqfV5wbO9R11MflF8oPPABcGLo0JHQGWoi
	 a+gjm1upAA3y0DzSmKEGPXJQ3ajEgWxytl93HpIgVoYpQH6EasbfS8mrr22vUVcyBCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518472;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mtkUO4l/EDx0qjj08HflpQcLxDfz4VYpO2be4/eOvKU=;
	b=dPV+pzqq1Ijd1PORud0cod/cNDvCfcneZbRlk1f5tvtz3DOk0ypEAIXYNsTH/5iOWF9D
	 AjXFxwSP5b+stm1U9zqUabcoHyCfylT3dq5vtT5FPFxdA5nnNnptpTuoDYL+mJoG+ZHZE
	 J+TbNsWJuKV3PG1e2/XVXqB2Gooqm3Aec6WcJgSh4mes0TJIcMCxWZlKQQLkISQqUgrJX
	 uUhuOS63zo1yUcZQ9lwBAdFriAk4fpZKGKnv2OjeQstVKQqXvs278xKwnng4c07bxqQLO
	 mrlWAYuVrOiMT+TNmFi5iy2jI1DRKHbjMwXeeUyiOiB7mHrlRS2SuLIS5B1FhPpchQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KvvpJuA5;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 243CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KvvpJuA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794518471; x=1826054471;
  h=date:from:to:cc:subject:message-id;
  bh=dbRmGMHAvM6mCZ7s56NaDMhVjgRmnrwVFnFgM/xI0UA=;
  b=KvvpJuA5OPwxP+o/3MZ2otY7kZWHft1Tbl5iQzncQkTr8QqcCSmGBzLi
   8QAStD06fsXUzSrKMd1CQNc4xnX1F0fOUhsIuTEjzM384PR4/uDcZ2CEJ
   Lp5v3sK7Tz8P3IDCgBUGFuHK65UvmGi2Ym095C/kyExeyIF+6Y+3BdqDG
   bRml0MAOtZXiCPNNMuP+FN7adb1caX1YtXOm0xdR7Q/8CFgfa2vrx4L0v
   WZZdwjVBwi3mziWjyhaIHZCsStMg1dUOTR6RUXEMEqVViIxG6DuuUqEEb
   s/AFB7QVDIUY/G8F2SXxCwX77EnheER3rXbbplBKeRusTcR4KW0WSacwv
   Q==;
X-CSE-ConnectionGUID: cGJWjlufTJaiYJtXFbFSag==
X-CSE-MsgGUID: ttHBX2WeSJuTrd5AtxlyZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3352849"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3352849"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 13:21:10 -0800
X-CSE-ConnectionGUID: 5KprF6oARuiz5Jh5d9dQeA==
X-CSE-MsgGUID: fDxc8okuR6OSQmpsW6pvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8695515"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2026 13:21:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRcEE-000000000xq-3tuS;
	Thu, 12 Nov 2026 21:21:06 +0000
Date: Thu, 12 Nov 2026 22:20:26 +0100
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: drivers/misc/lkdtm/lkdtm.o: error: objtool:
 execute_location.specialized.1+0x34: can't find jump dest instruction at
 lkdtm_rodata_do_nothing+0x0
Message-ID: <202611122247.EuFOb7hi-lkp@intel.com>
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
head:   ee83899302a0457a3ba47464a13e8682bd7ba27d
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   6 months ago
config: loongarch-randconfig-r2106-20261112 (https://download.01.org/0day-ci/archive/20261112/202611122247.EuFOb7hi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122247.EuFOb7hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122247.EuFOb7hi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/lkdtm.o: error: objtool: execute_location.specialized.1+0x34: can't find jump dest instruction at lkdtm_rodata_do_nothing+0x0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
