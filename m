Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639420;
	b=Yjm6cbTo/bULNZdM6kumUbOLJsZSJasj9x1JzmnSkWHmQQs3V+vqzOgSIAqgeu1QTirM
	 mrQnluDR2YBUx8YbQ2QJgjisGuLRA0rm9ye5VqxWw6OG8lv5Muwfi98L6K2jHPLXGYrit
	 2cBD+nLzl6TxzKkpgsehQe4Mr32Ml52LMc4tX8tcOURGa6hYP/gEH+6+WQylhM09NA6ut
	 UnQoTJlkIhbnKwxyCzFYp/fYuijaisFtGB9ipi7PZx5H2aQPLVWLJtGoz13gcc4aGAQOl
	 xYL2zCi1t+lsOd0vr3qxunrCikMGQk2KRG5r5nqInBZ5nT8vN65UvVvYTmjXZyg2r9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639420;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OKeJYPIbv73nM8Kd2R/ryZFb7+bbN1s/D2WYENmzkc8=;
	b=np/4wjhqgs4pej4jAWZYoDyMwMYVQeOj6Tc38FBebq03Wa0CdBsABIbedB6Zm/RDyJYm
	 82VLDtk659kEeQhYCB59CxunuGFdrIphnxiVEUSz9kdsEkJQB/GNpA5kdnHNfb2PvQ9Gx
	 X7mwYavIq0TASiA7STiaX4yLTtF02LuVSnE/JQiDF2naeMa0HNMGaTeBd0gqnrjfiqOrJ
	 lTJZN3WN0zS+eCO0Xn7Et7zN1z1PcjClbSkXT8pfL9G9RKAC/t8614tZ6JWVYULq0EHoh
	 mmceTZf4VUgbkiZMUIGgpPS64/OM57BsspKVhm/uP7XcH10Yxv8+g8/JT0+Tr+DaVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VqdlSwDz;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA0606A91B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EA0606A91B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VqdlSwDz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793639419; x=1825175419;
  h=date:from:to:cc:subject:message-id;
  bh=DpqDnbRdrNKzidoRcxSXytjL4gr6xfWPD0OsA6gBELY=;
  b=VqdlSwDzv52anXjU62/2kyWXos6l67BF2NMJWM7wuusPpOT9ilmv2sjK
   5a+aAR1gn4CZbvj7gSOVo9L8HuRkSu1X0CcbMzq97cXI9mkYOFhII8EC4
   vhnE76qzhwWzrXa5d0CoHRA7ucSHaZTmILHdzCOB0X+8RE51i+JNsC+wo
   bM579yTgPbdNOQJz7tHpXfeZUecX3n/q5ZegJqP+FlOzSs/po0FSiU7J0
   c4MmesQi1p20ZIVTlbP3URmmWLRMfReRBlB4DRBGnKmwabtbjgVHtK/ia
   QMaBMn+zij2gGvdy3KJRm9Rn1hkYMu9K4odzTs2oUGUt1fr+lscnaKSYN
   Q==;
X-CSE-ConnectionGUID: Iq99eR4LQgeh6aJ7cZA1aA==
X-CSE-MsgGUID: rgk2sux+Qryk2Wf0IujQig==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2335382"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2335382"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 09:10:19 -0800
X-CSE-ConnectionGUID: 5uJbgv07QqeXrlbRGegevg==
X-CSE-MsgGUID: TZJ4Y+TzTHe8Hs1x4Z/p7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6563349"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2026 09:10:16 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNvXy-000000008gH-1mlp;
	Mon, 02 Nov 2026 17:10:14 +0000
Date: Mon, 02 Nov 2026 18:09:52 +0100
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: drivers/gpu/drm/amd/ras/core/ras_mp1_v15_0.c:83:2-3:
 Unneeded semicolon
Message-ID: <202611021843.XfP1TzKA-lkp@intel.com>
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
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: 87bd1227b14f30195ac7d41195159c099a8d5891 drm/amd/ras: Support obtaining bad page info at boot time for ras_mp1_v15_0
date:   10 weeks ago
config: loongarch-randconfig-r2111-20261102 (https://download.01.org/0day-ci/archive/20261102/202611021843.XfP1TzKA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3e5b45eed6c3ec25f4f1cc81ce0be10106a8f31f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 87bd1227b14f ("drm/amd/ras: Support obtaining bad page info at boot time for ras_mp1_v15_0")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611021843.XfP1TzKA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/ras/core/ras_mp1_v15_0.c:83:2-3: Unneeded semicolon

vim +83 drivers/gpu/drm/amd/ras/core/ras_mp1_v15_0.c

    59	
    60	static int __direct_send_mp1_msg(struct ras_core_context *ras_core,
    61			enum ras_mp1_msg_id msg_id, u32 input, u32 *output)
    62	{
    63		u32 msg_code = 0;
    64		int timeout = 100000;  //100 ms
    65		u32 reg = 0;
    66	
    67		msg_code = ras_mp1_msg_codes[msg_id];
    68		if (!msg_code)
    69			return -EOPNOTSUPP;
    70	
    71		/* Send message and parameter to fw */
    72		RAS_DEV_WREG32_SOC15(ras_core->dev, MP1, 0, regMP1_SMN_C2PMSG_41, 0);
    73		RAS_DEV_WREG32_SOC15(ras_core->dev, MP1, 0, regMP1_SMN_C2PMSG_42, input);
    74		RAS_DEV_WREG32_SOC15(ras_core->dev, MP1, 0, regMP1_SMN_C2PMSG_40, msg_code);
    75	
    76		/* Poll MP1 response */
    77		while (timeout--) {
    78			reg = RAS_DEV_RREG32_SOC15(ras_core->dev, MP1, 0, regMP1_SMN_C2PMSG_41);
    79			if (reg)
    80				break;
    81	
    82			udelay(1);
  > 83		};
    84	
    85		if (reg != MP1_RESP_OK) {
    86			RAS_DEV_ERR(ras_core->dev, "MP1 fail to ack 0x%x for msg: 0x%x, 0x%x, %p\n",
    87				reg, msg_code, input, output);
    88			return -EIO;
    89		}
    90	
    91		/* Read output data */
    92		if (output)
    93			*output = RAS_DEV_RREG32_SOC15(ras_core->dev, MP1, 0, regMP1_SMN_C2PMSG_42);
    94	
    95		return 0;
    96	}
    97	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
