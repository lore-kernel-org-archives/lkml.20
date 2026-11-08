Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124875;
	b=FvTem8na3C7lNd+ugzBsqAh3ORTpuVAc2hyy4QVso0dXkOz8zAE2OE9VlFDkF5akgcOa
	 6LbYKp3pWwfToQjR8IPRgG/p0d+CmRfG+qG3ZfjCrHystJ5Jc5wYcv7mBw6sozIvqeoSY
	 tGxMR5S7Lnd3omHPXeZPQqEFcNk+DuS31EjfcnjGjv1k6AkKjwIjZ5JQ0ePfl5LXrkSId
	 dgyzAsGKRo13Ga07TwGI1JS+6X5u/6O7ek3ve519IbQkLtWH/OfPE00dzR9BkUwx7ULQ1
	 kaokMVWG+yi7d+NrEIAVRdopCGyd8DWEOxaXrubxlEPV1hvWSujBzrV7Y+j5OH7OIsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=OToWvZXTkI8yCBRekwg8WTjPaP9TAsMtaLsxrAlnWOM=;
	b=eSF7MWxR3f7WCwj8ZSFRztH9iLoafvnoBYxu9WXCpL3eTxSyJ9XjTDOQK2Pka/5ya/o9
	 W1NQ/kREb5qWHJ3Ong/xRCDynUjNwFybPWM4lqS3qbivs7MeNml9HTEQvjifJV7DXlzsD
	 x+zrZvWrLAl7zC8y3xQT2FyBcltKeevxbwkKbS/3FjcQkI4d9vF9qt5vyWOp49daTqeN4
	 quh1ugbmdTHgIRVWdArgDB++1ChiRpFrNU64lBy/92F4v2WipkU6sUAFLCAYWtBZ0WB7v
	 WB86dOJ2+VR9zJ0EpN3QC3trcxAUeaNdFClzuY900XPmdyO8Aj88TfaoZmZGQOmCzug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RFFN4dd8;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0FB606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E0FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RFFN4dd8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794124873; x=1825660873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OAbDCZBxNG+SwfuY+DrR5QnL0/jt29FFINE4f0zF4A8=;
  b=RFFN4dd8v8WBXEfGMBD0Rn7lEbIgz0QUH8y9EMbzAmcoP2HBSyO7E+Rw
   5ORh/wJfOjBfO5wHt/nPT6qvMLhiyPPeTZ47GCpbbz1hgh1LsaqyQMxJt
   Yha78BPD0y7ZIOXButkNbm3ae540XIfpbzG5Nzt0WWuaVG0LWlX7qYw7k
   oIFA3zxx7jyxLdOInK1bhodxFrufadIdP+55ztezHDUUO2ztBBC1zwjGH
   JXRgjcAHkwVmOTzOG6fEgoUKsl+VRkJeVzdvIwyzRdonqkdRqXpkA1cSr
   Ro2AdQQhI8HwGlQcgpZGDboO5Okg9qUP8DJoIwdEKidyfgL3/syYy6xnO
   w==;
X-CSE-ConnectionGUID: mHNPqnpyTASD33XoVpwwHA==
X-CSE-MsgGUID: aUlAmv5bSdyzdjSO6OWb/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2774137"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2774137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 00:01:13 -0800
X-CSE-ConnectionGUID: Yv51+sO7SHmM5h8hENEHgg==
X-CSE-MsgGUID: aO5BipszQECso+sY2FOlMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7762616"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Nov 2026 00:01:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPxpt-00000000BC1-1Anc;
	Sun, 08 Nov 2026 08:01:09 +0000
Date: Sun, 08 Nov 2026 09:00:21 +0100
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>
Subject: base.c:undefined reference to `wmi_has_guid'
Message-ID: <202611080829.SRhOjp4G-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa4ad798f6f681031775266044ba1b0cf3c670bd
commit: 884d53763d304af64a9b795161f9fc3b83a5e3d8 platform/wmi: Remove dependency on CONFIG_X86
date:   4 weeks ago
config: loongarch-randconfig-r2105-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080829.SRhOjp4G-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080829.SRhOjp4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 884d53763d30 ("platform/wmi: Remove dependency on CONFIG_X86")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080829.SRhOjp4G-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `wmi_wmmx_mxmi':
   base.c:(.text+0x68): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `mxm_shadow_wmi':
>> base.c:(.text+0x1d0): undefined reference to `wmi_has_guid'
>> loongarch64-linux-ld: base.c:(.text+0x264): undefined reference to `wmi_evaluate_method'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
