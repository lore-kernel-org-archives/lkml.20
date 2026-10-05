Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148A36C5BB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196521; cv=none; b=Mv6mgDYpTGOIHDUaejtA8rao5C0mGw9R+uD4MB4LHNvFnYEbihvrOpbPnlCEBiWC3n4Rea4Yv0KyOxLI7yHqo9BFLRL/H+Fva1/z2EpeLs3KCAJhbV6fYIAvhFWFFn2XSbq/3vme8V4XyRrKjjjPIjRcYyDWUQ5UNm0NXvNq/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196521; c=relaxed/simple;
	bh=ah6JDsgaX2W388erYMdp0wX+hxqDaXslZp8xbkBC1iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QPuAgNe4d5n9Ax6+P2J1CineSjVbsxy392ZxA9OS+RoMmgisuxUwiwjUKwaMJRTCIHF+rEtqXNeFmwJVxs+GZBB1AzhG6ZKrcBoF6aifzoQeP+TpiDpv086OHF0fRL3r5kjpwtYsyVrNQnC+Uyvh2zF09yj286xaCYdt+laoyjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePl8oeMh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePl8oeMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791196519; x=1822732519;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ah6JDsgaX2W388erYMdp0wX+hxqDaXslZp8xbkBC1iw=;
  b=ePl8oeMh+qwFhBfTCn3fCCFL0p4wqDAOwGcQw1rUIbWjNQzCrP32ZAxL
   j6zInoQcvraMY0rS0ZI12/FYurHz13zQCgtWVijHUfUwBGq4gVptq9H59
   HUqnfMX0W2sygdb0vbSAYahJJhxMjk2afkxiNty3hbPsTbz0EvjkbPmWJ
   DOx+HwFey2A/YdoTphFntx7MqEaqnB6MbC7EdJEZB95eeX+AkQ+YON0rz
   HVkM11QyXS5o/AULUC018Vfz/o1ttzJyjDS5heWsluPZEPkO8Hsej1PCV
   94jzoWRe/DXx2M1/PqqGsqwX/oGzdOlBaJUokibo7pa/y+hUbDtW98DsB
   g==;
X-CSE-ConnectionGUID: dH9sCyc5SL+M4sgFOuzCzw==
X-CSE-MsgGUID: 36ozyeTVRlKBOwR7153JEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91969882"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91969882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 03:35:19 -0700
X-CSE-ConnectionGUID: /fNOJxxPTDi7sE9f1yzJMQ==
X-CSE-MsgGUID: Aos/UhGGRLmkTFg61b/Nxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="314799005"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2026 03:35:16 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDg2M-0000000005L-1o3m;
	Mon, 05 Oct 2026 10:35:14 +0000
Date: Mon, 05 Oct 2026 12:34:43 +0200
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig"?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>
Subject: drivers/video/fbdev/au1100fb.c:492:33: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202610051231.2dETaRVc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: 6f366e86481a7503a821de82930df517dddd4047 fbdev: au1100fb: Make driv=
er compilable on non-mips platforms
date:   8 months ago
config: mips-randconfig-r2308-20261005 (https://download.01.org/0day-ci/arc=
hive/20261005/202610051231.2dETaRVc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261005/202610051231.2dETaRVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 6f366e86481a ("fbdev: au1100fb: Make driver compilable on non-mips=
 platforms")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051231.2dETaRVc-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/au1100fb.c:492:33: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected char [noderef] __iom=
em *screen_base @@     got unsigned char *fb_mem @@
   drivers/video/fbdev/au1100fb.c:492:33: sparse:     expected char [nodere=
f] __iomem *screen_base
   drivers/video/fbdev/au1100fb.c:492:33: sparse:     got unsigned char *fb=
_mem

vim +492 drivers/video/fbdev/au1100fb.c

^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  404 =20
48c68c4f1b5424 drivers/video/au1100fb.c       Greg Kroah-Hartman 2012-12-21=
  405  static int au1100fb_drv_probe(struct platform_device *dev)
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  406  {
46953e6aab262d drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28=
  407  	struct au1100fb_device *fbdev;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  408  	struct resource *regs_res;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  409  	struct clk *c;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  410 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  411  	/* Allocate new device private */
db66f0252e2f17 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28=
  412  	fbdev =3D devm_kzalloc(&dev->dev, sizeof(*fbdev), GFP_KERNEL);
29914badc59b23 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28=
  413  	if (!fbdev)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  414  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  415 =20
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30=
  416  	if (au1100fb_setup(fbdev))
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30=
  417  		goto failed;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  418 =20
7a192ec334cab9 drivers/video/au1100fb.c       Ming Lei           2009-02-06=
  419  	platform_set_drvdata(dev, (void *)fbdev);
67f30ad19c4b32 drivers/video/fbdev/au1100fb.c Christoph Hellwig  2019-04-28=
  420  	fbdev->dev =3D &dev->dev;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  421 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  422  	/* Allocate region for our registers and map them */
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30=
  423  	regs_res =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30=
  424  	if (!regs_res) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  425  		print_err("fail to retrieve registers resource");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  426  		return -EFAULT;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  427  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  428 =20
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  429  	fbdev->info.fix =3D (struct fb_fix_screeninfo) {
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  430  		.mmio_start =3D regs_res->start,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  431  		.mmio_len =3D resource_size(regs_res),
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  432  		.id =3D "AU1100 FB",
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  433  		.xpanstep =3D 1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  434  		.ypanstep =3D 1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  435  		.type =3D FB_TYPE_PACKED_PIXELS,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  436  		.accel =3D FB_ACCEL_NONE,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  437  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  438 =20
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24=
  439  	if (!devm_request_mem_region(&dev->dev,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  440  				     fbdev->info.fix.mmio_start,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  441  				     fbdev->info.fix.mmio_len,
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  442  				     DRIVER_NAME)) {
c05b7f3d12b945 drivers/video/au1100fb.c       Rodolfo Giometti   2006-05-30=
  443  		print_err("fail to lock memory region at 0x%08lx",
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  444  			  fbdev->info.fix.mmio_start);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  445  		return -EBUSY;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  446  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  447 =20
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  448  	fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.f=
ix.mmio_start);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  449 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  450  	print_dbg("Register memory map at %p", fbdev->regs);
13c89a37c6f6f3 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  451  	print_dbg("phys=3D0x%08x, size=3D%zu", fbdev->regs_phys, fbdev=
->regs_len);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  452 =20
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  453  	c =3D clk_get(NULL, "lcd_intclk");
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  454  	if (!IS_ERR(c)) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  455  		fbdev->lcdclk =3D c;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  456  		clk_set_rate(c, 48000000);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  457  		clk_prepare_enable(c);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  458  	}
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  459 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  460  	/* Allocate the framebuffer to the maximum screen size * nbr of vid=
eo buffers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  461  	fbdev->fb_len =3D fbdev->panel->xres * fbdev->panel->yres *
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  462  		  	(fbdev->panel->bpp >> 3) * AU1100FB_NBR_VIDEO_BUFFERS;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  463 =20
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24=
  464  	fbdev->fb_mem =3D dmam_alloc_coherent(&dev->dev,
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21=
  465  					    PAGE_ALIGN(fbdev->fb_len),
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  466  					    &fbdev->fb_phys, GFP_KERNEL);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  467  	if (!fbdev->fb_mem) {
13c89a37c6f6f3 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  468  		print_err("fail to allocate framebuffer (size: %zuK))",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  469  			  fbdev->fb_len / 1024);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  470  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  471  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  472 =20
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  473  	fbdev->info.fix.smem_start =3D fbdev->fb_phys;
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  474  	fbdev->info.fix.smem_len =3D fbdev->fb_len;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  475 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  476  	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
13c89a37c6f6f3 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  477  	print_dbg("phys=3D0x%pad, size=3D%zuK", &fbdev->fb_phys, fbdev=
->fb_len / 1024);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  478 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  479  	/* load the panel info into the var struct */
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  480  	fbdev->info.var =3D (struct fb_var_screeninfo) {
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  481  		.activate =3D FB_ACTIVATE_NOW,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  482  		.height =3D -1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  483  		.width =3D -1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  484  		.vmode =3D FB_VMODE_NONINTERLACED,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  485  		.bits_per_pixel =3D fbdev->panel->bpp,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  486  		.xres =3D fbdev->panel->xres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  487  		.xres_virtual =3D fbdev->panel->xres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  488  		.yres =3D fbdev->panel->yres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  489  		.yres_virtual =3D fbdev->panel->yres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026-=
02-16  490  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  491 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
 @492  	fbdev->info.screen_base =3D fbdev->fb_mem;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  493  	fbdev->info.fbops =3D &au1100fb_ops;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  494 =20
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21=
  495  	fbdev->info.pseudo_palette =3D
a86854d0c599b3 drivers/video/fbdev/au1100fb.c Kees Cook          2018-06-12=
  496  		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21=
  497  	if (!fbdev->info.pseudo_palette)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  498  		return -ENOMEM;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  499 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  500  	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES=
, 0) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  501  		print_err("Fail to allocate colormap (%d entries)",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  502  			   AU1100_LCD_NBR_PALETTE_ENTRIES);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  503  		return -EFAULT;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  504  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  505 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  506  	/* Set h/w registers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  507  	au1100fb_setmode(fbdev);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  508 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  509  	/* Register new framebuffer */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  510  	if (register_framebuffer(&fbdev->info) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  511  		print_err("cannot register new framebuffer");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  512  		goto failed;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  513  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  514 =20
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  515  	return 0;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  516 =20
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  517  failed:
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  518  	if (fbdev->lcdclk) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  519  		clk_disable_unprepare(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  520  		clk_put(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23=
  521  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  522  	if (fbdev->info.cmap.len !=3D 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  523  		fb_dealloc_cmap(&fbdev->info.cmap);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  524  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  525 =20
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21=
  526  	return -ENODEV;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04=
  527  }
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16=
  528 =20

:::::: The code at line 492 was first introduced by commit
:::::: 3b495f2bb749b828499135743b9ddec46e34fda8 Au1100 FB driver uplift for=
 2.6.

:::::: TO: Pete Popov <ppopov@embeddedalley.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
