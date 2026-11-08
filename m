Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794098294;
	b=EDvzAZFgTq7Wx7JphhoWncyg/MPub8zwuUDk4PHE4P3t8P7A/1k7HjAuVDMm1nenUbZ7
	 rWGRA3mHMztGtlPLLsYh5mMke67/+wK/zinz+iOyZ5U892WCKSCOnwMKB885F2G/94RYp
	 YHrusZUYq6OIxA5FPWGP2nm8wB6+toBx883lL3OSxF6LBJodFICcQbKRBzVHL40A4cLl4
	 sjruP+9yeabvn0+uqoclgdt3/DiITxSH3Qn2UyCU1bLQovXTlfNe8qjBjCFEqCUf5RIY1
	 dESMlYRfQV5bpHrVzbEQWLzUt28pd1EPDtNR9Ibl5O3sle4xwsmf5PToKkJllRdLbcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794098294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NGZJqrpE9457gDQ9lfdUH9HDytNAJxlUbieJ0cTZYYI=;
	b=jE7MKByCA+R1FiPg1KnWbqWoUsHUqdO4aczR1QD6vpLztJScbW4n7/n5Eo9vhDlhZGts
	 HGqdzrqaiQ0edS007xGx33jgp7xtnZ4LbnVkWosrr7yH90ytO9xa68/PAnsXAr5fkP1bM
	 SNBZVlT8slSIc/fssdWtqu6iqmU5NGYIPHMpkc8Ow9aNUCQ8qLj5dLlpj5xkcsEJsP2Gk
	 27YC56KFZVg0Ik1iYMrNcFy2CpxOM9pQm0c4VJ7mRcrHhhmyo/ZXRdoz2RXC3FKZWEd/z
	 t/uElov9ZC4Ls2K0P1qbzwpfpYp/rI5PyigmgdszJTWSH8JJuFjx2k0O2MA2KnrFCdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O1vfp0i7;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D0606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0D0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O1vfp0i7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794098292; x=1825634292;
  h=date:from:to:cc:subject:message-id;
  bh=XrjSmX/UlaxCRP9GNdPZk451ZMJqtRQ/jhy/8atDk0c=;
  b=O1vfp0i7PD54Q1OQ0z9bK8Q95CSkxL3QF2RYHeYdtg9RlhUThiPRgJjc
   Te5y4H7cCsj/k8Cq2vL5H+UITa15zF9AVHRIqRpaEdFRGV5XbLYIPGpi7
   PNhIN6e8SAXhoBrpuvZ6HpLZVBi4H76tlMk1x/Qagu6FM+CqGR3diE8OS
   jDVDud8/5eCJlQThJLWKAkmjmr4bbHvVmnVDRE+DDzpa7DMlb1VgAyDTF
   6uiiuPfqGkG3PU2u/n4mK49WT9lV/yeWSJVKM/3Yp/ghqFlI9vj53D0Iy
   clGiVveNI8IKrA+ZodoKb17R6CU7y1VHywqRUuUPGkqrYF1fZPHMV0iXM
   A==;
X-CSE-ConnectionGUID: mLPRFmPXT2eMXa4hNqbWGQ==
X-CSE-MsgGUID: qKXspmCYRSicrj17XR2lFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2907702"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2907702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 16:38:11 -0800
X-CSE-ConnectionGUID: kq3HLBMmSPKXV1jXRi/dyA==
X-CSE-MsgGUID: Yb6TzSGCSPCXOBlI5lIQsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7604471"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2026 16:38:10 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPqv9-00000000Aud-1Kbv;
	Sun, 08 Nov 2026 00:38:07 +0000
Date: Sun, 08 Nov 2026 01:37:08 +0100
From: kernel test robot <lkp@intel.com>
To: David Yang <mmyangfl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: ld.lld: error: call to __compiletime_assert_538 marked
 "dontcall-error": BUILD_BUG_ON failed: len % sizeof(u64_stats_t)
Message-ID: <202611080132.HOUebIbl-lkp@intel.com>
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
head:   a41e364995bbcfa627418a70fe913c35b7510728
commit: 35710f0db8011e7ebbfb5b929a0575c3a09b761d macsec: fix memcpy with u64_stats
date:   10 months ago
config: um-randconfig-r2107-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080132.HOUebIbl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080132.HOUebIbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35710f0db801 ("macsec: fix memcpy with u64_stats")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080132.HOUebIbl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_538 marked "dontcall-error": BUILD_BUG_ON failed: len % sizeof(u64_stats_t)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
