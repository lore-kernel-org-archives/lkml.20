Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF573D812A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555431; cv=none; b=ObdXhF8bEQjSW5KdE1gzurgKt9n3XgL7JVDp7Hs03duL3kOlBQ1tFx6cCM/TNNLKNC2H06FvdlinnHTdWTpWzKZEhOj7lc+hQBftXl3fpem12U/tWgRAazPP8v6ZbEs955qnt4t8Am1KjPagSQ3QVEezjKbVZwFBvfqAjEPcblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555431; c=relaxed/simple;
	bh=GxWVmNRkh2Z8KL+QBjs7KNg3QGHI9+Yr9TIjg64DVpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pEJ2O4mFPEkP5nqkHNQ1TfHm5TO3zm+N++Dr9hkeIDz90ekQY+A+dDz5ITACc0W4J2Of+kv7WsrCwKWJYs6ROQtZPHq/8N9hYKxC/UrUrHttdaDyPxzwR94Ap4UFJDO2bI4LdSi7WQIZTAWgtp6thOHS06DEmgcPnQnGTtWblzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKRExRct; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKRExRct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788555424; x=1820091424;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GxWVmNRkh2Z8KL+QBjs7KNg3QGHI9+Yr9TIjg64DVpE=;
  b=nKRExRctsPvP8O+v/CJucPqqWprKitTXL/wj7DD42Kjwzx63Y+zDSBPC
   t13gzxyPa2Icgq742yx8azWtRe7cYXQIqmuFI6OVSMMwyi39AwUdTVXFp
   EII9vYp2+v+op5g6pxaA5w3v85mKZQ9lidNFPexQQvi2GklYMTyDd8jHo
   DQl8Qb4UOK0PmETeit7oeTPFaQsqfLwQkLXHtObf2UvVKICzPaFQ1u/3Z
   /B6PZU4NeTIoh4VY/i+xR4K8jJz7Fwi+3JzKs9a4LinQp2q61IKcW85Tl
   p1Rza3hL9tB2111FXBnS0n1dKXum+9QFzMRBV17G5Q0kvWpaXt5aK6kr5
   w==;
X-CSE-ConnectionGUID: Xgoq8Ef0QqWKth6j00D8rA==
X-CSE-MsgGUID: l6RwMpifTrelxaHjk7QUqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88940724"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88940724"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:57:02 -0700
X-CSE-ConnectionGUID: KPhvBcd8QZONVq2fHti+Og==
X-CSE-MsgGUID: odt9zNJCQUaSvJcVKUfO9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="308348283"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2026 13:57:00 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2ay1-00000000A9w-1bL9;
	Fri, 04 Sep 2026 20:56:57 +0000
Date: Sat, 05 Sep 2026 04:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/gadget/udc/fsl_udc_core.c:2164:27: sparse:
 sparse: dereference of noderef expression
Message-ID: <202609050437.vTOOVr5h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   986c24e0fe44f844b44d365b71ce831947f50298
commit: a71f5aef1be98fb10f00e66a0ac4ef23ba9c877f USB: gadget: fsl-udc: enab=
le compile testing
date:   8 weeks ago
config: mips-randconfig-r121-20260904 (https://download.01.org/0day-ci/arch=
ive/20260905/202609050437.vTOOVr5h-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0ed=
d1b088cc36b4faee80358c925a91e16006258)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260905/202609050437.vTOOVr5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: a71f5aef1be9 ("USB: gadget: fsl-udc: enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050437.vTOOVr5h-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/gadget/udc/fsl_udc_core.c:69:33: sparse: sparse: incorrect t=
ype in initializer (different base types) @@     expected restricted __le16=
 [usertype] wMaxPacketSize @@     got int @@
   drivers/usb/gadget/udc/fsl_udc_core.c:69:33: sparse:     expected restri=
cted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/fsl_udc_core.c:69:33: sparse:     got int
   drivers/usb/gadget/udc/fsl_udc_core.c:509:30: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] max_pkt_length @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:509:30: sparse:     expected unsig=
ned int [usertype] max_pkt_length
   drivers/usb/gadget/udc/fsl_udc_core.c:509:30: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:681:15: sparse: sparse: undefined =
identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:681:15: sparse: sparse: undefined =
identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:681:15: sparse: sparse: undefined =
identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:707:26: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] next_dtd_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:707:26: sparse:     expected unsig=
ned int [usertype] next_dtd_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:707:26: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:711:30: sparse: sparse: invalid as=
signment: &=3D
   drivers/usb/gadget/udc/fsl_udc_core.c:711:30: sparse:    left side has t=
ype unsigned int
   drivers/usb/gadget/udc/fsl_udc_core.c:711:30: sparse:    right side has =
type restricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:739:44: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] next_td_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:739:44: sparse:     expected unsig=
ned int [usertype] next_td_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:739:44: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:790:21: sparse: sparse: cast to re=
stricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:792:27: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] size_ioc_sts @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:792:27: sparse:     expected unsig=
ned int [usertype] size_ioc_sts
   drivers/usb/gadget/udc/fsl_udc_core.c:792:27: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:796:24: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] buff_ptr0 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:796:24: sparse:     expected unsig=
ned int [usertype] buff_ptr0
   drivers/usb/gadget/udc/fsl_udc_core.c:796:24: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:797:24: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] buff_ptr1 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:797:24: sparse:     expected unsig=
ned int [usertype] buff_ptr1
   drivers/usb/gadget/udc/fsl_udc_core.c:797:24: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:798:24: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] buff_ptr2 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:798:24: sparse:     expected unsig=
ned int [usertype] buff_ptr2
   drivers/usb/gadget/udc/fsl_udc_core.c:798:24: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:799:24: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] buff_ptr3 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:799:24: sparse:     expected unsig=
ned int [usertype] buff_ptr3
   drivers/usb/gadget/udc/fsl_udc_core.c:799:24: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:800:24: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] buff_ptr4 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:800:24: sparse:     expected unsig=
ned int [usertype] buff_ptr4
   drivers/usb/gadget/udc/fsl_udc_core.c:800:24: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:824:27: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] size_ioc_sts @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:824:27: sparse:     expected unsig=
ned int [usertype] size_ioc_sts
   drivers/usb/gadget/udc/fsl_udc_core.c:824:27: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:851:47: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] next_td_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:851:47: sparse:     expected unsig=
ned int [usertype] next_td_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:851:47: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:859:26: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] next_td_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:859:26: sparse:     expected unsig=
ned int [usertype] next_td_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:859:26: sparse:     got restricted=
 __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:1369:33: sparse: sparse: incorrect=
 type in assignment (different base types) @@     expected unsigned short [=
usertype] @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:1369:33: sparse:     expected unsi=
gned short [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:1369:33: sparse:     got restricte=
d __le16 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:1585:32: sparse: sparse: cast to r=
estricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1586:30: sparse: sparse: cast to r=
estricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1612:37: sparse: sparse: cast to r=
estricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1617:26: sparse: sparse: cast to r=
estricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1622:39: sparse: sparse: cast to r=
estricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1624:59: sparse: sparse: incorrect=
 type in assignment (different base types) @@     expected unsigned int [us=
ertype] size_ioc_int_sts @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:1624:59: sparse:     expected unsi=
gned int [usertype] size_ioc_int_sts
   drivers/usb/gadget/udc/fsl_udc_core.c:1624:59: sparse:     got restricte=
d __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:1643:28: sparse: sparse: cast to r=
estricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:2253:20: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2253:20: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2253:20: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2286:36: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2286:36: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2286:36: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2372:26: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2372:26: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
   drivers/usb/gadget/udc/fsl_udc_core.c:2372:26: sparse: sparse: undefined=
 identifier '__builtin_infer_alloc_token'
>> drivers/usb/gadget/udc/fsl_udc_core.c:2164:27: sparse: sparse: dereferen=
ce of noderef expression
   drivers/usb/gadget/udc/fsl_udc_core.c:2167:27: sparse: sparse: dereferen=
ce of noderef expression

vim +2164 drivers/usb/gadget/udc/fsl_udc_core.c

b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2025 =20
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2026  static int fsl_proc_read(struct seq_file *m, void *v)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2027  {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2028  	unsigned long flags;
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2029  	int i;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2030  	u32 tmp_reg;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2031  	struct fsl_ep *ep =3D NULL;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2032  	struct fsl_req *req;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2033 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2034  	struct fsl_udc *udc =3D udc_controller;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2035 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2036  	spin_lock_irqsave(&udc->lock, flags);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2037 =20
dc0d5c1e5c7532e drivers/usb/gadget/fsl_usb2_udc.c     Joe Perches        20=
07-12-17  2038  	/* ------basic driver information ---- */
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2039  	seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2040  			DRIVER_DESC "\n"
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2041  			"%s version: %s\n"
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2042  			"Gadget driver: %s\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2043  			driver_name, DRIVER_VERSION,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2044  			udc->driver ? udc->driver->driver.name : "(none)");
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2045 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2046  	/* ------ DR Registers ----- */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2047  	tmp_reg =3D fsl_readl(&dr_regs->usbcmd);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2048  	seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2049  			"USBCMD reg:\n"
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2050  			"SetupTW: %d\n"
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2051  			"Run/Stop: %s\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2052  			(tmp_reg & USB_CMD_SUTW) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2053  			(tmp_reg & USB_CMD_RUN_STOP) ? "Run" : "Stop");
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2054 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2055  	tmp_reg =3D fsl_readl(&dr_regs->usbsts);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2056  	seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2057  			"USB Status Reg:\n"
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2058  			"Dr Suspend: %d Reset Received: %d System Error: %s "
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2059  			"USB Error Interrupt: %s\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2060  			(tmp_reg & USB_STS_SUSPEND) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2061  			(tmp_reg & USB_STS_RESET) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2062  			(tmp_reg & USB_STS_SYS_ERR) ? "Err" : "Normal",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2063  			(tmp_reg & USB_STS_ERR) ? "Err detected" : "No err");
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2064 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2065  	tmp_reg =3D fsl_readl(&dr_regs->usbintr);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2066  	seq_printf(m,
984e833c2bb6cba drivers/usb/gadget/fsl_udc_core.c     Masanari Iida      20=
12-11-01  2067  			"USB Interrupt Enable Reg:\n"
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2068  			"Sleep Enable: %d SOF Received Enable: %d "
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2069  			"Reset Enable: %d\n"
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2070  			"System Error Enable: %d "
2003a419c7f3b59 drivers/usb/gadget/udc/fsl_udc_core.c Colin Ian King     20=
20-08-05  2071  			"Port Change Detected Enable: %d\n"
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2072  			"USB Error Intr Enable: %d USB Intr Enable: %d\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2073  			(tmp_reg & USB_INTR_DEVICE_SUSPEND) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2074  			(tmp_reg & USB_INTR_SOF_EN) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2075  			(tmp_reg & USB_INTR_RESET_EN) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2076  			(tmp_reg & USB_INTR_SYS_ERR_EN) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2077  			(tmp_reg & USB_INTR_PTC_DETECT_EN) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2078  			(tmp_reg & USB_INTR_ERR_INT_EN) ? 1 : 0,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2079  			(tmp_reg & USB_INTR_INT_EN) ? 1 : 0);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2080 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2081  	tmp_reg =3D fsl_readl(&dr_regs->frindex);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2082  	seq_printf(m,
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2083  			"USB Frame Index Reg: Frame Number is 0x%x\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2084  			(tmp_reg & USB_FRINDEX_MASKS));
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2085 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2086  	tmp_reg =3D fsl_readl(&dr_regs->deviceaddr);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2087  	seq_printf(m,
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2088  			"USB Device Address Reg: Device Addr is 0x%x\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2089  			(tmp_reg & USB_DEVICE_ADDRESS_MASK));
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2090 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2091  	tmp_reg =3D fsl_readl(&dr_regs->endpointlistaddr);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2092  	seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2093  			"USB Endpoint List Address Reg: "
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2094  			"Device Addr is 0x%x\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2095  			(tmp_reg & USB_EP_LIST_ADDRESS_MASK));
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2096 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2097  	tmp_reg =3D fsl_readl(&dr_regs->portsc1);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2098  	seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2099  		"USB Port Status&Control Reg:\n"
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2100  		"Port Transceiver Type : %s Port Speed: %s\n"
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2101  		"PHY Low Power Suspend: %s Port Reset: %s "
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2102  		"Port Suspend Mode: %s\n"
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2103  		"Over-current Change: %s "
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2104  		"Port Enable/Disable Change: %s\n"
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2105  		"Port Enabled/Disabled: %s "
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2106  		"Current Connect Status: %s\n\n", ( {
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2107  			const char *s;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2108  			switch (tmp_reg & PORTSCX_PTS_FSLS) {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2109  			case PORTSCX_PTS_UTMI:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2110  				s =3D "UTMI"; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2111  			case PORTSCX_PTS_ULPI:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2112  				s =3D "ULPI "; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2113  			case PORTSCX_PTS_FSLS:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2114  				s =3D "FS/LS Serial"; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2115  			default:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2116  				s =3D "None"; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2117  			}
e538dfdae85244f drivers/usb/gadget/fsl_udc_core.c     Michal Nazarewicz  20=
11-08-30  2118  			s;} ),
e538dfdae85244f drivers/usb/gadget/fsl_udc_core.c     Michal Nazarewicz  20=
11-08-30  2119  		usb_speed_string(portscx_device_speed(tmp_reg)),
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2120  		(tmp_reg & PORTSCX_PHY_LOW_POWER_SPD) ?
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2121  		"Normal PHY mode" : "Low power mode",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2122  		(tmp_reg & PORTSCX_PORT_RESET) ? "In Reset" :
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2123  		"Not in Reset",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2124  		(tmp_reg & PORTSCX_PORT_SUSPEND) ? "In " : "Not in",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2125  		(tmp_reg & PORTSCX_OVER_CURRENT_CHG) ? "Dected" :
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2126  		"No",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2127  		(tmp_reg & PORTSCX_PORT_EN_DIS_CHANGE) ? "Disable" :
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2128  		"Not change",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2129  		(tmp_reg & PORTSCX_PORT_ENABLE) ? "Enable" :
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2130  		"Not correct",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2131  		(tmp_reg & PORTSCX_CURRENT_CONNECT_STATUS) ?
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2132  		"Attached" : "Not-Att");
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2133 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2134  	tmp_reg =3D fsl_readl(&dr_regs->usbmode);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2135  	seq_printf(m,
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2136  			"USB Mode Reg: Controller Mode is: %s\n\n", ( {
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2137  				const char *s;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2138  				switch (tmp_reg & USB_MODE_CTRL_MODE_HOST) {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2139  				case USB_MODE_CTRL_MODE_IDLE:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2140  					s =3D "Idle"; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2141  				case USB_MODE_CTRL_MODE_DEVICE:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2142  					s =3D "Device Controller"; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2143  				case USB_MODE_CTRL_MODE_HOST:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2144  					s =3D "Host Controller"; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2145  				default:
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2146  					s =3D "None"; break;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2147  				}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2148  				s;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2149  			} ));
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2150 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2151  	tmp_reg =3D fsl_readl(&dr_regs->endptsetupstat);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2152  	seq_printf(m,
9d9d88c80e80397 drivers/usb/gadget/fsl_usb2_udc.c     Will Newton        20=
08-08-12  2153  			"Endpoint Setup Status Reg: SETUP on ep 0x%x\n\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2154  			(tmp_reg & EP_SETUP_STATUS_MASK));
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2155 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2156  	for (i =3D 0; i < udc->max_ep / 2; i++) {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2157  		tmp_reg =3D fsl_readl(&dr_regs->endptctrl[i]);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2158  		seq_printf(m, "EP Ctrl Reg [0x%x]: =3D [0x%x]\n", i, tmp_=
reg);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2159  	}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2160  	tmp_reg =3D fsl_readl(&dr_regs->endpointprime);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2161  	seq_printf(m, "EP Prime Reg =3D [0x%x]\n\n", tmp_reg);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2162 =20
2ea6698d7b9266d drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin 20=
11-04-18  2163  	if (udc->pdata->have_sysif_regs) {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23 @2164  		tmp_reg =3D usb_sys_regs->snoop1;
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2165  		seq_printf(m, "Snoop1 Reg : =3D [0x%x]\n\n", tmp_reg);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2166 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2167  		tmp_reg =3D usb_sys_regs->control;
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2168  		seq_printf(m, "General Control Reg : =3D [0x%x]\n\n", tmp=
_reg);
2ea6698d7b9266d drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin 20=
11-04-18  2169  	}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2170 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2171  	/* ------fsl_udc, fsl_ep, fsl_request structure informatio=
n ----- */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2172  	ep =3D &udc->eps[0];
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2173  	seq_printf(m, "For %s Maxpkt is 0x%x index is 0x%x\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2174  			ep->ep.name, ep_maxpacket(ep), ep_index(ep));
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2175 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2176  	if (list_empty(&ep->queue)) {
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2177  		seq_puts(m, "its req queue is empty\n\n");
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2178  	} else {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2179  		list_for_each_entry(req, &ep->queue, queue) {
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2180  			seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2181  				"req %p actual 0x%x length 0x%x buf %p\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2182  				&req->req, req->req.actual,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2183  				req->req.length, req->req.buf);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2184  		}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2185  	}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2186  	/* other gadget->eplist ep */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2187  	list_for_each_entry(ep, &udc->gadget.ep_list, ep.ep_list) {
79149b8bd0270a2 drivers/usb/gadget/fsl_udc_core.c     Ido Shayevitz      20=
12-03-12  2188  		if (ep->ep.desc) {
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2189  			seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2190  					"\nFor %s Maxpkt is 0x%x "
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2191  					"index is 0x%x\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2192  					ep->ep.name, ep_maxpacket(ep),
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2193  					ep_index(ep));
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2194 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2195  			if (list_empty(&ep->queue)) {
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2196  				seq_puts(m, "its req queue is empty\n\n");
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2197  			} else {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2198  				list_for_each_entry(req, &ep->queue, queue) {
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2199  					seq_printf(m,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2200  						"req %p actual 0x%x length "
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2201  						"0x%x  buf %p\n",
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2202  						&req->req, req->req.actual,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2203  						req->req.length, req->req.buf);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2204  				}	/* end for each_entry of ep req */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2205  			}	/* end for else */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2206  		}	/* end for if(ep->queue) */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2207  	}	/* end (ep->desc) */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2208 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2209  	spin_unlock_irqrestore(&udc->lock, flags);
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2210  	return 0;
77cd02c151cb6b7 drivers/usb/gadget/fsl_udc_core.c     David Howells      20=
13-04-10  2211  }
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2212 =20
3f3942aca6da351 drivers/usb/gadget/udc/fsl_udc_core.c Christoph Hellwig  20=
18-05-15  2213  #define create_proc_file() \
3f3942aca6da351 drivers/usb/gadget/udc/fsl_udc_core.c Christoph Hellwig  20=
18-05-15  2214  	proc_create_single(proc_filename, 0, NULL, fsl_proc_read)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2215  #define remove_proc_file()	remove_proc_entry(proc_filename,=
 NULL)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2216 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2217  #else				/* !CONFIG_USB_GADGET_DEBUG_FILES */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2218 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2219  #define create_proc_file()	do {} while (0)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2220  #define remove_proc_file()	do {} while (0)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2221 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2222  #endif				/* CONFIG_USB_GADGET_DEBUG_FILES */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2223 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2224  /*---------------------------------------------------------=
----------------*/
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2225 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2226  /* Release udc structures */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2227  static void fsl_udc_release(struct device *dev)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2228  {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2229  	complete(udc_controller->done);
37c4fd8c7551c74 drivers/usb/gadget/fsl_udc_core.c     Anton Vorontsov    20=
09-10-29  2230  	dma_free_coherent(dev->parent, udc_controller->ep_qh_size,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2231  			udc_controller->ep_qh, udc_controller->ep_qh_dma);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2232  	kfree(udc_controller);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2233  }
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2234 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2235  /**********************************************************=
********
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2236  	Internal structure setup functions
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2237  ***********************************************************=
********/
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2238  /*---------------------------------------------------------=
---------
24b804e40f23a19 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2239   * init resource for global controller called by fsl_udc_pr=
obe()
24b804e40f23a19 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2240   * On success the udc handle is initialized, on failure it =
is
24b804e40f23a19 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2241   * unchanged (reset).
24b804e40f23a19 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2242   * Return 0 on success and -1 on allocation failure
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2243   ----------------------------------------------------------=
--------*/
da150573648a190 drivers/usb/gadget/fsl_udc_core.c     Peter Chen         20=
14-05-18  2244  static int struct_udc_setup(struct fsl_udc *udc,
4365831dadfeeeb drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-06-06  2245  		struct platform_device *pdev)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2246  {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2247  	struct fsl_usb2_platform_data *pdata;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2248  	size_t size;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2249 =20
e01ee9f509a9271 drivers/usb/gadget/fsl_udc_core.c     Jingoo Han         20=
13-07-30  2250  	pdata =3D dev_get_platdata(&pdev->dev);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2251  	udc->phy_mode =3D pdata->phy_mode;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2252 =20
bf4afc53b77aeaa drivers/usb/gadget/udc/fsl_udc_core.c Linus Torvalds     20=
26-02-21 @2253  	udc->eps =3D kzalloc_objs(struct fsl_ep, udc->max_ep);
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2254  	if (!udc->eps) {
6025f20f16c25d2 drivers/usb/gadget/udc/fsl_udc_core.c Uwe Kleine-K=C3=B6nig=
   2024-03-04  2255  		dev_err(&udc->gadget.dev, "kmalloc udc endpoint stat=
us failed\n");
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2256  		goto eps_alloc_failed;
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2257  	}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2258 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2259  	/* initialized QHs, take care of alignment */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2260  	size =3D udc->max_ep * sizeof(struct ep_queue_head);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2261  	if (size < QH_ALIGNMENT)
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2262  		size =3D QH_ALIGNMENT;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2263  	else if ((size % QH_ALIGNMENT) !=3D 0) {
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2264  		size +=3D QH_ALIGNMENT + 1;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2265  		size &=3D ~(QH_ALIGNMENT - 1);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2266  	}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2267  	udc->ep_qh =3D dma_alloc_coherent(&pdev->dev, size,
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2268  					&udc->ep_qh_dma, GFP_KERNEL);
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2269  	if (!udc->ep_qh) {
6025f20f16c25d2 drivers/usb/gadget/udc/fsl_udc_core.c Uwe Kleine-K=C3=B6nig=
   2024-03-04  2270  		dev_err(&udc->gadget.dev, "malloc QHs for udc failed=
\n");
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2271  		goto ep_queue_alloc_failed;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2272  	}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2273 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2274  	udc->ep_qh_size =3D size;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2275 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2276  	/* Initialize ep0 status request structure */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2277  	/* FIXME: fsl_alloc_request() ignores ep argument */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2278  	udc->status_req =3D container_of(fsl_alloc_request(NULL, G=
FP_KERNEL),
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2279  			struct fsl_req, req);
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2280  	if (!udc->status_req) {
6025f20f16c25d2 drivers/usb/gadget/udc/fsl_udc_core.c Uwe Kleine-K=C3=B6nig=
   2024-03-04  2281  		dev_err(&udc->gadget.dev, "kzalloc for udc status re=
quest failed\n");
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2282  		goto udc_status_alloc_failed;
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2283  	}
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2284 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2285  	/* allocate a small amount of memory to get valid address =
*/
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2286  	udc->status_req->req.buf =3D kmalloc(8, GFP_KERNEL);
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2287  	if (!udc->status_req->req.buf) {
6025f20f16c25d2 drivers/usb/gadget/udc/fsl_udc_core.c Uwe Kleine-K=C3=B6nig=
   2024-03-04  2288  		dev_err(&udc->gadget.dev, "kzalloc for udc request b=
uffer failed\n");
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2289  		goto udc_req_buf_alloc_failed;
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2290  	}
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2291 =20
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2292  	udc->resume_state =3D USB_STATE_NOTATTACHED;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2293  	udc->usb_state =3D USB_STATE_POWERED;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2294  	udc->ep0_dir =3D 0;
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2295  	udc->remote_wakeup =3D 0;	/* default to 0 on reset */
b504882da539c17 drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-04-23  2296 =20
4365831dadfeeeb drivers/usb/gadget/fsl_usb2_udc.c     Li Yang            20=
07-06-06  2297  	return 0;
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2298 =20
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2299  udc_req_buf_alloc_failed:
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2300  	kfree(udc->status_req);
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2301  udc_status_alloc_failed:
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2302  	kfree(udc->ep_qh);
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2303  	udc->ep_qh_size =3D 0;
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2304  ep_queue_alloc_failed:
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2305  	kfree(udc->eps);
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2306  eps_alloc_failed:
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2307  	udc->phy_mode =3D 0;
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2308  	return -1;
4ab2b48c98f2ec9 drivers/usb/gadget/udc/fsl_udc_core.c Nicholas Mc Guire  20=
18-08-30  2309 =20

:::::: The code at line 2164 was first introduced by commit
:::::: b504882da539c17ce6fee9da2a97f2fafabd495d USB: add Freescale high-spe=
ed USB SOC device controller driver

:::::: TO: Li Yang <leoli@freescale.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
