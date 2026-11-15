Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737817;
	b=hFGpaQ5A6gs6n5xhfSAr0kgfNusdlRK/1THB6EvpNCjoiGJxyPn/mV3J12h7Av+GdBAe
	 K+8no7CuJmOLPcKVNmD0x+hA3qcOyz+OmK4qs4yglSYYEVUO/HDbw2++EDPew5N8kozsz
	 zeMKKONChffJxf4FSWqLXUNmeBSUQweg6g2UzqF1fKgtSQL0UvnN+YCUv6jRuv63kSJOy
	 ufoCqXbdcmJ5fpTkj31aimvQUt0YYcHh3Qt9w+p0/jFmLCkfbbvfZjHCVBllvRuxELPEi
	 Wb59RyFpFgFQj8E5UvTHIamJq8oaz1Dk4xjaBy+a8tVzfjLAYpOa7ac39GWho5cXb7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737817;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=00VIZ6kQpj8jagqrdbp6UEBmQwfQV9xG13VWSJFLGJg=;
	b=mL3G3iVQ2pj4E3BX/5JknYQ2+J6VT/VkbxAgnTjtiP66Pzk+z+KawjhRwZQUGYjfFfAt
	 wR0lEmuxJ2StD/ZAQy39DUsad2dK/aiPIc9xO0FqQemIXyWp/LJgbg08iZLCpXurAQOFz
	 bj0Ek76TJrNJchqSunvSZTP3ZLz+YlHBEaG3qXjmo4ol7gLCJOAHazbNaGfV4VQNZHtVZ
	 L02Cc+qzz/mly1BcITHChQhwS4bSLNNx8HFpOh3+Uyi0VK+uI6ykMb1IIvFwKo6QP6Etv
	 /Y63p/hUBGozkh6/MTqG8kWSO8/LwDh8eL2WJCc3inUD3PB7MZsQ/gnr3l+Pl9vPhPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TqNYDqKV;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D784606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D784606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TqNYDqKV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794737816; x=1826273816;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mn0qdXqQCRTCNjeDYTLkTuicpbM2WUpT1b+LM6nOLtA=;
  b=TqNYDqKV9vkJkLYUzJkMWzjynQcl8mWsk7ZSGchT4poLrYbxk0tbq8+b
   U4JAEBICshVtDsvhL4w7hK3PhX59247kWLWPsVnzrm/rYOoADKSt7DOgX
   CsyTOjNsZcWUFQ78HwPCA3Xt2ohEYnyy/1stpvQDifAp5BVa6O0t8ou9G
   61x1WVXwbBXrqlrdiaegYrwB9dQqiR7qrqnxVydlaxjw6eZtbDdeA5yUm
   yWyOqVyGZfDKBvKpJXcmAPZZ9M2x+8+wgMX5oQzZUTccGi3a3+na/BikC
   cby4m5Kc16EzdBuhiTlRJ5JyZD++JKKAcaSivUFm48dFQ4LwgMpG6l3Hi
   Q==;
X-CSE-ConnectionGUID: /iqO9yHuTayEBJLFAmNwiw==
X-CSE-MsgGUID: Oj6Bg7PETKOdMPdgE9UQpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3398464"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3398464"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:16:56 -0800
X-CSE-ConnectionGUID: Nw8CfmkvR8aQ3iJH/7HMRQ==
X-CSE-MsgGUID: /jOnF0swSS+F1g85WOFijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9660886"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2026 02:16:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSXI3-0000000028m-3ihj;
	Sun, 15 Nov 2026 10:16:51 +0000
Date: Sun, 15 Nov 2026 11:16:31 +0100
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/phy/phy-fsl-usb.c:884:30: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202611151137.gimk4KBL-lkp@intel.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Johan,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: a71f5aef1be98fb10f00e66a0ac4ef23ba9c877f USB: gadget: fsl-udc: enab=
le compile testing
date:   4 months ago
config: arm-randconfig-r2300-20261115 (https://download.01.org/0day-ci/arch=
ive/20261115/202611151137.gimk4KBL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c06=
93becb96c1610aeb87445a50df00d58a823cd)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261115/202611151137.gimk4KBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: a71f5aef1be9 ("USB: gadget: fsl-udc: enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151137.gimk4KBL-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/phy/phy-fsl-usb.c:64:60: sparse: sparse: symbol 'b_srp_fail_=
tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:65:9: sparse: sparse: symbol 'b_srp_wait_t=
mr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:65:26: sparse: sparse: symbol 'a_wait_enum=
_tmr' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:110:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:110:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:110:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:105:5: sparse: sparse: symbol 'write_ulpi'=
 was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:122:15: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:122:15: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:122:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:132:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:132:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:132:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:118:6: sparse: sparse: symbol 'fsl_otg_chr=
g_vbus' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:140:15: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:140:15: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:140:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:150:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:150:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:150:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:136:6: sparse: sparse: symbol 'fsl_otg_dis=
chrg_vbus' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:159:23: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:159:23: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:159:23: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:160:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:160:17: sparse:     expected void volatile=
 [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:160:17: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:162:23: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:162:23: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:162:23: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:164:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:164:17: sparse:     expected void volatile=
 [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:164:17: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:154:6: sparse: sparse: symbol 'fsl_otg_drv=
_vbus' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:176:15: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:176:15: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:176:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:183:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:183:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:183:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:172:6: sparse: sparse: symbol 'fsl_otg_loc=
_conn' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:195:15: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:195:15: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:195:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:201:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:201:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:201:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:191:6: sparse: sparse: symbol 'fsl_otg_loc=
_sof' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:212:15: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:212:15: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:212:15: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:214:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:214:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:214:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:206:6: sparse: sparse: symbol 'fsl_otg_sta=
rt_pulse' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:222:6: sparse: sparse: symbol 'b_data_puls=
e_end' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:241:6: sparse: sparse: symbol 'b_vbus_puls=
e_end' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:254:6: sparse: sparse: symbol 'b_srp_end' =
was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:269:6: sparse: sparse: symbol 'a_wait_enum=
' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:279:6: sparse: sparse: symbol 'set_tmout' =
was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:285:5: sparse: sparse: symbol 'fsl_otg_ini=
t_timers' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:342:6: sparse: sparse: symbol 'fsl_otg_uni=
nit_timers' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:450:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:450:19: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:450:19: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:452:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:452:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:452:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:453:16: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:453:16: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:453:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:446:6: sparse: sparse: symbol 'otg_reset_c=
ontroller' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:475:20: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:475:20: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:475:20: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:458:5: sparse: sparse: symbol 'fsl_otg_sta=
rt_host' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:525:5: sparse: sparse: symbol 'fsl_otg_sta=
rt_gadget' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:582:23: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:582:23: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:582:23: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:618:31: sparse: sparse: Using plain intege=
r as NULL pointer
   drivers/usb/phy/phy-fsl-usb.c:713:18: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:713:18: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:713:18: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:717:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:717:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:717:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:707:13: sparse: sparse: symbol 'fsl_otg_is=
r' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c:782:22: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.c:782:22: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.c:782:22: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.c:786:31: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.c:786:31: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.c:786:31: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.c:858:21: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct usb_dr_mmap *s=
tatic [toplevel] usb_dr_regs @@     got void [noderef] __iomem * @@
   drivers/usb/phy/phy-fsl-usb.c:858:21: sparse:     expected struct usb_dr=
_mmap *static [toplevel] usb_dr_regs
   drivers/usb/phy/phy-fsl-usb.c:858:21: sparse:     got void [noderef] __i=
omem *
   drivers/usb/phy/phy-fsl-usb.c:860:21: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected void [noderef] __iome=
m *regs @@     got void * @@
   drivers/usb/phy/phy-fsl-usb.c:860:21: sparse:     expected void [noderef=
] __iomem *regs
   drivers/usb/phy/phy-fsl-usb.c:860:21: sparse:     got void *
>> drivers/usb/phy/phy-fsl-usb.c:884:30: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void volatile [nodere=
f] __iomem *io_addr @@     got struct usb_dr_mmap *dr_mem_map @@
   drivers/usb/phy/phy-fsl-usb.c:884:30: sparse:     expected void volatile=
 [noderef] __iomem *io_addr
   drivers/usb/phy/phy-fsl-usb.c:884:30: sparse:     got struct usb_dr_mmap=
 *dr_mem_map
   drivers/usb/phy/phy-fsl-usb.c:891:16: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:891:16: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:891:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:893:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:893:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:893:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:896:16: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:896:16: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:896:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:898:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:898:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:898:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:901:16: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:901:16: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:901:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:906:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:906:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:906:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:909:16: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:909:16: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:909:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:924:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:924:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:924:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:928:42: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:928:42: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:928:42: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:930:42: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:930:42: sparse:     expected void volatile=
 [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:930:42: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:934:16: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:934:16: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:934:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:937:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:937:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:937:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:944:13: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:944:13: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:944:13: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:955:16: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:955:16: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:955:16: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:958:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *addr @@     got unsigned int * @@
   drivers/usb/phy/phy-fsl-usb.c:958:9: sparse:     expected void volatile =
[noderef] __iomem *addr
   drivers/usb/phy/phy-fsl-usb.c:958:9: sparse:     got unsigned int *
   drivers/usb/phy/phy-fsl-usb.c:833:5: sparse: sparse: symbol 'usb_otg_sta=
rt' was not declared. Should it be static?
>> drivers/usb/phy/phy-fsl-usb.c:995:18: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void volatile [nodere=
f] __iomem *io_addr @@     got void * @@
   drivers/usb/phy/phy-fsl-usb.c:995:18: sparse:     expected void volatile=
 [noderef] __iomem *io_addr
   drivers/usb/phy/phy-fsl-usb.c:995:18: sparse:     got void *
   drivers/usb/phy/phy-fsl-usb.c:1005:24: sparse: sparse: symbol 'fsl_otg_d=
river' was not declared. Should it be static?
   drivers/usb/phy/phy-fsl-usb.c: note: in included file:
   drivers/usb/phy/phy-fsl-usb.h:348:17: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.h:348:17: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'
   drivers/usb/phy/phy-fsl-usb.h:348:17: sparse: sparse: undefined identifi=
er '__builtin_infer_alloc_token'

vim +884 drivers/usb/phy/phy-fsl-usb.c

0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   874 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   875  	/* request irq */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   876  	p_otg->irq =3D platform_get_irq(pdev, 0);
ecc2f30dbb2596 drivers/usb/phy/phy-fsl-usb.c Sergey Shtylyov        2021-08=
-09   877  	if (p_otg->irq < 0)
ecc2f30dbb2596 drivers/usb/phy/phy-fsl-usb.c Sergey Shtylyov        2021-08=
-09   878  		return p_otg->irq;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   879  	status =3D request_irq(p_otg->irq, fsl_otg_isr,
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   880  				IRQF_SHARED, driver_name, p_otg);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   881  	if (status) {
7e062c0f888800 drivers/usb/otg/fsl_otg.c     Heikki Krogerus        2012-02=
-13   882  		dev_dbg(p_otg->phy.dev, "can't get IRQ %d, error %d\n",
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   883  			p_otg->irq, status);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18  @884  		iounmap(p_otg->dr_mem_map);
7e062c0f888800 drivers/usb/otg/fsl_otg.c     Heikki Krogerus        2012-02=
-13   885  		kfree(p_otg->phy.otg);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   886  		kfree(p_otg);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   887  		return status;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   888  	}
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   889 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   890  	/* stop the controller */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   891  	temp =3D fsl_readl(&p_otg->dr_mem_map->usbcmd);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   892  	temp &=3D ~USB_CMD_RUN_STOP;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   893  	fsl_writel(temp, &p_otg->dr_mem_map->usbcmd);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   894 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   895  	/* reset the controller */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   896  	temp =3D fsl_readl(&p_otg->dr_mem_map->usbcmd);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   897  	temp |=3D USB_CMD_CTRL_RESET;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   898  	fsl_writel(temp, &p_otg->dr_mem_map->usbcmd);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   899 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   900  	/* wait reset completed */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   901  	while (fsl_readl(&p_otg->dr_mem_map->usbcmd) & USB_CMD_CTRL_RES=
ET)
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   902  		;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   903 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   904  	/* configure the VBUSHS as IDLE(both host and device) */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   905  	temp =3D USB_MODE_STREAM_DISABLE | (pdata->es ? USB_MODE_ES : 0=
);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   906  	fsl_writel(temp, &p_otg->dr_mem_map->usbmode);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   907 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   908  	/* configure PHY interface */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   909  	temp =3D fsl_readl(&p_otg->dr_mem_map->portsc);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   910  	temp &=3D ~(PORTSC_PHY_TYPE_SEL | PORTSC_PTW);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   911  	switch (pdata->phy_mode) {
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   912  	case FSL_USB2_PHY_ULPI:
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   913  		temp |=3D PORTSC_PTS_ULPI;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   914  		break;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   915  	case FSL_USB2_PHY_UTMI_WIDE:
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   916  		temp |=3D PORTSC_PTW_16BIT;
4e71e079432e3e drivers/usb/phy/phy-fsl-usb.c Gustavo A. R. Silva    2020-07=
-07   917  		fallthrough;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   918  	case FSL_USB2_PHY_UTMI:
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   919  		temp |=3D PORTSC_PTS_UTMI;
4e71e079432e3e drivers/usb/phy/phy-fsl-usb.c Gustavo A. R. Silva    2020-07=
-07   920  		fallthrough;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   921  	default:
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   922  		break;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   923  	}
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   924  	fsl_writel(temp, &p_otg->dr_mem_map->portsc);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   925 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   926  	if (pdata->have_sysif_regs) {
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   927  		/* configure control enable IO output, big endian register */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   928  		temp =3D __raw_readl(&p_otg->dr_mem_map->control);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   929  		temp |=3D USB_CTRL_IOENB;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   930  		__raw_writel(temp, &p_otg->dr_mem_map->control);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   931  	}
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   932 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   933  	/* disable all interrupt and clear all OTGSC status */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   934  	temp =3D fsl_readl(&p_otg->dr_mem_map->otgsc);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   935  	temp &=3D ~OTGSC_INTERRUPT_ENABLE_BITS_MASK;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   936  	temp |=3D OTGSC_INTERRUPT_STATUS_BITS_MASK | OTGSC_CTRL_VBUS_DI=
SCHARGE;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   937  	fsl_writel(temp, &p_otg->dr_mem_map->otgsc);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   938 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   939  	/*
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   940  	 * The identification (id) input is FALSE when a Mini-A plug is=
 inserted
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   941  	 * in the devices Mini-AB receptacle. Otherwise, this input is =
TRUE.
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   942  	 * Also: record initial state of ID pin
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   943  	 */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   944  	if (fsl_readl(&p_otg->dr_mem_map->otgsc) & OTGSC_STS_USB_ID) {
e5ba1c024aa0c2 drivers/usb/phy/phy-fsl-usb.c Felipe Balbi           2014-11=
-12   945  		p_otg->phy.otg->state =3D OTG_STATE_UNDEFINED;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   946  		p_otg->fsm.id =3D 1;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   947  	} else {
e5ba1c024aa0c2 drivers/usb/phy/phy-fsl-usb.c Felipe Balbi           2014-11=
-12   948  		p_otg->phy.otg->state =3D OTG_STATE_A_IDLE;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   949  		p_otg->fsm.id =3D 0;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   950  	}
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   951 =20
523e531ea694ea drivers/usb/phy/phy-fsl-usb.c Greg Kroah-Hartman     2013-06=
-28   952  	pr_debug("initial ID pin=3D%d\n", p_otg->fsm.id);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   953 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   954  	/* enable OTG ID pin interrupt */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   955  	temp =3D fsl_readl(&p_otg->dr_mem_map->otgsc);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   956  	temp |=3D OTGSC_INTR_USB_ID_EN;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   957  	temp &=3D ~(OTGSC_CTRL_VBUS_DISCHARGE | OTGSC_INTR_1MS_TIMER_EN=
);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   958  	fsl_writel(temp, &p_otg->dr_mem_map->otgsc);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   959 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   960  	return 0;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   961  }
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   962 =20
41ac7b3ab7fe1d drivers/usb/otg/fsl_otg.c     Bill Pemberton         2012-11=
-19   963  static int fsl_otg_probe(struct platform_device *pdev)
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   964  {
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   965  	int ret;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   966 =20
19f9e188deb4bb drivers/usb/phy/phy-fsl-usb.c Jingoo Han             2013-07=
-30   967  	if (!dev_get_platdata(&pdev->dev))
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   968  		return -ENODEV;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   969 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   970  	/* configure the OTG */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   971  	ret =3D fsl_otg_conf(pdev);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   972  	if (ret) {
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   973  		dev_err(&pdev->dev, "Couldn't configure OTG module\n");
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   974  		return ret;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   975  	}
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   976 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   977  	/* start OTG */
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   978  	ret =3D usb_otg_start(pdev);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   979  	if (ret) {
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   980  		dev_err(&pdev->dev, "Can't init FSL OTG device\n");
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   981  		return ret;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   982  	}
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   983 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   984  	return ret;
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   985  }
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   986 =20
ba1e43522f3290 drivers/usb/phy/phy-fsl-usb.c Uwe Kleine-K=C3=B6nig       20=
23-03-19   987  static void fsl_otg_remove(struct platform_device *pdev)
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   988  {
19f9e188deb4bb drivers/usb/phy/phy-fsl-usb.c Jingoo Han             2013-07=
-30   989  	struct fsl_usb2_platform_data *pdata =3D dev_get_platdata(&pdev=
->dev);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   990 =20
41ca62e3e21e48 drivers/usb/phy/phy-fsl-usb.c Duoming Zhou           2025-12=
-05   991  	disable_delayed_work_sync(&fsl_otg_dev->otg_event);
662dca54ca67c9 drivers/usb/otg/fsl_otg.c     Kishon Vijay Abraham I 2012-06=
-22   992  	usb_remove_phy(&fsl_otg_dev->phy);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   993  	free_irq(fsl_otg_dev->irq, fsl_otg_dev);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   994 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18  @995  	iounmap((void *)usb_dr_regs);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   996 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   997  	fsl_otg_uninit_timers();
7e062c0f888800 drivers/usb/otg/fsl_otg.c     Heikki Krogerus        2012-02=
-13   998  	kfree(fsl_otg_dev->phy.otg);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18   999  	kfree(fsl_otg_dev);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18  1000 =20
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18  1001  	if (pdata->exit)
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18  1002  		pdata->exit(pdev);
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18  1003  }
0807c500a1a6d7 drivers/usb/otg/fsl_otg.c     Li Yang                2011-04=
-18  1004 =20

:::::: The code at line 884 was first introduced by commit
:::::: 0807c500a1a6d7fa20cbd7bbe7fea14a66112463 USB: add Freescale USB OTG =
Transceiver driver

:::::: TO: Li Yang <leoli@freescale.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
