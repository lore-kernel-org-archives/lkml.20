Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006791;
	b=VMxWziE9OMyyc0qgJCF6L9gtjV41rO1AgloGI8E9QBL+G2tjruBnCl67WDKDHHZBtFO9
	 4HiuoWJ5QkbUGPKiKu62ttkFaKr90Gp6LI8GVc2Yx0A4ug/JAk31LsHPFt7CdOOGsP84F
	 EumIvipJJWR34RptZpNr6DQqGn1vS7gBor+4YAri3M9mc15FozICpivqZVsnlAw/MCKzK
	 KLML1xaTgN5TL7ikI36nBdtwTRXZwaXs8U7RGtib8g3g9ssJcvDFwaNS++HtzpQyOQu94
	 p+YKLkpXYBXkuGTF70MbtIpXMlirqgnh8tl95FO3K2kD87VpOJ5qpFBrvN2l+0wpcYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006791;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=hPWKcpA8gbc6K+qpk4qE0+1VJLR5wZ99w4qWO8xJTy0=;
	b=Y2pVIrZv0OeumlqkzTNgMrt9nfTeFnmXr875EQFckM3I/E0Zq2hXz41uG9GVIvcAjZTl
	 98d57VpwSuzJVTa1yxjR5SXroZsp3eM2tCcCRp8Iqi5VGEUag1L8WZt1q245NwlZ4bPrv
	 L/p66awkJfj7w77vA5mrX0bEqGjTdP1qcIWMpZdZgfcGdYtEug8EsHgeJK5UxGSkaV5Hk
	 VYaL+2hCpqltUnxGS0eOZ1yuuQdnKz3+6MOt2ChYsYsA6P26H0XBQScGCpaOZxIOF4NwR
	 S/d/ai802ZF+FzyUPy61mIVjaqqFpdYP6S/mMrAjld11qXHeoPZ3FS0hCR7dSVy2fHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G0UbGaI9;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD7606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BD7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G0UbGaI9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794006788; x=1825542788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvBbdnT9G2yc1/b3L8ujEA7BGXcYFu+3P0AbMue/Nzs=;
  b=G0UbGaI9u1e84cY9TvCalJAQjadZdvOznJQeDCtoV867ULF4mCtskFwi
   dGQkLQlRsJkYD8COirRbOwsmS1tJUpfDlGi2s+TwAss+HnFoKFtGoyQDS
   nMLNYNEF+ofaJxs+lXybAozVsWTmPuvOplYX0cpexypYDK9xuqlQj/rH3
   8EGJCgkoxZapLCRWi3JqH9jHAK4SjNAQWTrzuJYKHwe+jBLRlYhbguJtZ
   p0LnP7ff/8TjxbWySbmG2qy1clgCL3Qo3MvZmOIc2FUK2vceqmjeQD9Cb
   CfLc87PbZJDOsmAQ+px5z5P/2VJCLBN9RC0QVtdofsIKrUmDxtGUy0d+2
   w==;
X-CSE-ConnectionGUID: Xi9bzpjZReG7sjzV0XWJ0A==
X-CSE-MsgGUID: tyALKniLRaGohX+Jh7mO5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2706202"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2706202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 15:13:04 -0800
X-CSE-ConnectionGUID: h+2wbBgxTt6Vc+d+Gwt+gA==
X-CSE-MsgGUID: ExUNlSkzSBG3AmjgmDAW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7735845"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2026 15:13:00 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPT7B-00000000APL-2uLr;
	Fri, 06 Nov 2026 23:12:57 +0000
Date: Sat, 07 Nov 2026 00:12:36 +0100
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>
Subject: base.c:undefined reference to `wmi_evaluate_method'
Message-ID: <202611070038.qzOOv1De-lkp@intel.com>
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
head:   d48723711bae9b8cdc56719c448ba42fef28cbee
commit: 884d53763d304af64a9b795161f9fc3b83a5e3d8 platform/wmi: Remove dependency on CONFIG_X86
date:   4 weeks ago
config: riscv-randconfig-r2108-20261106 (https://download.01.org/0day-ci/archive/20261107/202611070038.qzOOv1De-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070038.qzOOv1De-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 884d53763d30 ("platform/wmi: Remove dependency on CONFIG_X86")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070038.qzOOv1De-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `wmi_wmmx_mxmi':
>> base.c:(.text+0x6e): undefined reference to `wmi_evaluate_method'
>> riscv64-linux-ld: base.c:(.text+0x1de): undefined reference to `wmi_has_guid'
   riscv64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `mxm_shadow_wmi':
   base.c:(.text+0x230): undefined reference to `wmi_evaluate_method'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
