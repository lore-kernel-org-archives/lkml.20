Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797796;
	b=kOMTA9OZra6K+9sJbrRZGBIKUzJ4DWyhYNq0u0q3UeJGFSOPGI1DEj/p/BEkqB1UIjeg
	 12NkccHw6zi6tYOELyT5Jdaqy7N/USqLao3y6AZNAI8+494T4U/eTX3AucJTas25jBfqV
	 D9BV691tyX62LstkftfA6L/WbPdXKznatXYI6XZWxATR3qN1LMmYOl0Kycz1jqxP1yKQA
	 OG/Dt6OnFC+GaDb+CVJbaFqpvS3AMjAmuDVjgqYbO4qMLlez+L5fXsOj9z/kVu54hl3/9
	 I4p54+q62sXuu7KlgGE085S4wCWah0rXwY5nw417zZ2BvGpKkngGtW0c0kbSKec/Xyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797796;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mCOgjwJKSs2Rv/DfiBRwTMq+z3t/zgr11rpBBh/KKnw=;
	b=g8FZdOCpoxYAndOwT66jA2kQlyCeeYD2iTuX/hI8oQ2Cl9aTGsSVSZet+M31ch153Glj
	 5BEjAC0DpZ2Tl5jO4XKOul9Iz7EEnGZH1/dRqklB397lR6UskfQhqbj9nVhOfjCstOntu
	 k10D1I/dRk3m6MifjcBSvsYiM7wBzRs2sdwnE0ml8uPgaGKoeffsK4UYL8P1+dJzquX6Q
	 6He79q+tY+ltIG2ICWH+jBwWBj7iteS2wrSZdlUkjiptBWbuD4rFnnHkd5ug3RoJGApKJ
	 IsGIJQFClGwsNjJuPqVWXhni4T0ePH13pdQXxHo+m6yKtwiRAdiFivTvNQqY0AHwjDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="J7iCkH/0";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D6606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J7iCkH/0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794797796; x=1826333796;
  h=date:from:to:cc:subject:message-id;
  bh=kWNo2spHP8ubkHqe7vCfuhXds3F30K5yzt72lCfjHEM=;
  b=J7iCkH/0wFUyUWPt4+WAQqLrpQ3XvFBIdWAm8RaOALVLsdj2Y4W0CnKH
   Lm/9xGfU57PZkBwE9g0aA7kGW6iuhVXC40UgjqtZ3modIE7cImPCWrTgi
   YONncCbL3VR+ryF/rZLLWvpNB+y1+npgMR8K+5PN/pU9UwWQYjINb4HCk
   Mahd4HMRnARRI+rUHnYerP5svLjpQDts1bZ4VYTc0iviAiGZcorSMYh1P
   EQ8UkScgRE6OuSs5eUb8VZv++MhXvnCLcAKev/uEur9PabENCu+oLFrLI
   hYD1MgY1s6niJQ1Fm2mSAzL2Ece9Z3wcgzVkCW6+T7aXNsrVwM91BrbDS
   A==;
X-CSE-ConnectionGUID: 1rX8LLnZSeyodSTiLfaP7Q==
X-CSE-MsgGUID: c3HyDHUoSQu3X0HBHmEO1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3523081"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3523081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 18:56:35 -0800
X-CSE-ConnectionGUID: eNl3SAULSnic5jIiuK3FxA==
X-CSE-MsgGUID: 6+V0A4JZQOGw2ak4PioGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9686477"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 18:56:33 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSmtT-000000002Zv-1fss;
	Mon, 16 Nov 2026 02:56:31 +0000
Date: Mon, 16 Nov 2026 03:55:59 +0100
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: error: kernel-address sanitizer is not supported for this
 target
Message-ID: <202611160342.C2Ii8PRu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Link,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 73b741adb264967093ef4eb59905618a7e0d0de0 rust: Add PowerPC support
date:   4 months ago
config: powerpc-randconfig-2001-20261116 (https://download.01.org/0day-ci/archive/20261116/202611160342.C2Ii8PRu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project cbfac21cd384f6c7c480c2d0026ecedfe2d619e7)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160342.C2Ii8PRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73b741adb264 ("rust: Add PowerPC support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160342.C2Ii8PRu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: kernel-address sanitizer is not supported for this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
