Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198DE395AF2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399393; cv=none; b=Ibgy1tqZbWxJki6+nYMJH1mnSVknNx0XkUYqFQBEfMfxXEqI0xlvquMOKYgw/4B/wgogzANSzReVlYbDJWXPkB9gDqcPDIKeOvw2iq2+AUZNt5MdEm2B+eQ6bSwt7te4Kdu4n5I0RKxeqwfrRgrfYoHA8ztg+WUXe0sNfdW9kIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399393; c=relaxed/simple;
	bh=wPvHnkvaNuhKYIlnSxSumS4o1qBEw/bryvaEhnIEG4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lP9je+z1xHpooGKuSJRClWbN1HeBb0rDUPFiEYYzgUmvjfamDd+3pWEZ+e3nItho1c/JbIDis7O6zTgXH8sG3avvFHGi7StPkes5+suFSZIzxuq1SL7TQ3LCE31t71YhRN3tD0wUVgae6aoEYD8rkSpzu9y5Gt2qnrxTviDsceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WByy84kt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WByy84kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790399389; x=1821935389;
  h=date:from:to:cc:subject:message-id;
  bh=wPvHnkvaNuhKYIlnSxSumS4o1qBEw/bryvaEhnIEG4M=;
  b=WByy84ktmQVQgV/xOSXy562GNhHMR0Z1rMoNFMkoHEGHTWWGFnv3O/24
   7OfA6mFCdeciNACNQLfWxntIKrSg/zoUohDladUApSKFK0kim6YHJbiho
   IkrADxCLrI8GhBap2cp46JFMTUC1E3V81bJk4arKDFLHkmhQS4gTCq+uH
   oFLaRzrhu/ncczJxvc+lJTi0AEVe6Fj9NpVx5YSjSFtHVdEerwXyI+5GZ
   fNxB78FOrV3ci4NpAf1UY/iuAPQuieb4IJ2LHV9+lJVZoipgd9Q4mK2TO
   7TGkG+bAeAWBPpbZDnQPqnfiwUSipKFjonZqgg7F0JRhamhNEz5MUQhY/
   A==;
X-CSE-ConnectionGUID: ybCMX1HjRjeY3TWaj8NcCA==
X-CSE-MsgGUID: BRdlLzduTlaWeBNwzFH/Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91202349"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="91202349"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 22:09:48 -0700
X-CSE-ConnectionGUID: MN3UPBXMSjehDaDInnFi8Q==
X-CSE-MsgGUID: Ot5YbGFRT6KXwEzPqKLwDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274588376"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Sep 2026 22:09:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAKfQ-00000000LXV-0p7T;
	Sat, 26 Sep 2026 05:09:44 +0000
Date: Sat, 26 Sep 2026 13:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Michael Schmitz <schmitzmic@gmail.com>
Subject: drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202609261313.kgFtkz2t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
commit: d463633d63e6aa10384683bf39971a4b00780c56 fbdev: atafb: Add support for SuperVidel's SuperBlitter
date:   5 weeks ago
config: m68k-randconfig-r1308-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261313.kgFtkz2t-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261313.kgFtkz2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261313.kgFtkz2t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/atafb.c:2824:9: sparse: sparse: switch with no cases
   drivers/video/fbdev/atafb.c:1092:34: sparse: sparse: Using plain integer as NULL pointer
>> drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/atafb.c:2641:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
   drivers/video/fbdev/atafb.c:2641:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/atafb.c:2641:27: sparse:     got void *
   drivers/video/fbdev/atafb.c:2815:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atafb.c:2815:32: sparse:     expected void *dst
   drivers/video/fbdev/atafb.c:2815:32: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/atafb.c:3353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [toplevel] external_screen_base @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/atafb.c:3353:38: sparse:     expected void *static [toplevel] external_screen_base
   drivers/video/fbdev/atafb.c:3353:38: sparse:     got void [noderef] __iomem *
   drivers/video/fbdev/atafb.c:3424:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *static [toplevel] external_screen_base @@
   drivers/video/fbdev/atafb.c:3424:33: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/atafb.c:3424:33: sparse:     got void *static [toplevel] external_screen_base
   drivers/video/fbdev/atafb.c:3428:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/atafb.c:3428:34: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/atafb.c:3428:34: sparse:     got void *

vim +/__iomem +2457 drivers/video/fbdev/atafb.c

  2436	
  2437	static void svblit_fillrect(struct fb_info *info,
  2438				    const struct fb_fillrect *rect)
  2439	{
  2440		u32 bytespp = info->var.bits_per_pixel / 8;
  2441		u32 pitch = info->fix.line_length;
  2442		u8 *line;
  2443		u32 pix;
  2444	
  2445		svblit_wait();		/* the CPU is about to touch the fb */
  2446	
  2447		if (rect->rop != ROP_COPY || rect->height <= 1 ||
  2448		    rect->height > 4096) {
  2449			cfb_fillrect(info, rect);
  2450			return;
  2451		}
  2452	
  2453		pix = (info->fix.visual == FB_VISUAL_TRUECOLOR) ?
  2454			((u32 *)info->pseudo_palette)[rect->color] : rect->color;
  2455	
  2456		/* draw the first line with the CPU ... */
> 2457		line = (u8 *)info->screen_base + rect->dy * pitch +
  2458		       rect->dx * bytespp;
  2459		switch (bytespp) {
  2460		case 1:
  2461			memset(line, pix, rect->width);
  2462			break;
  2463		case 2:
  2464			memset16((u16 *)line, pix, rect->width);
  2465			break;
  2466		default:
  2467			memset32((u32 *)line, pix, rect->width);
  2468			break;
  2469		}
  2470	
  2471		/* ... and let the blitter replicate it into the other lines */
  2472		svblit_copy(external_addr + rect->dy * pitch + rect->dx * bytespp,
  2473			    external_addr + (rect->dy + 1) * pitch +
  2474			    rect->dx * bytespp,
  2475			    rect->width * bytespp, 0, pitch, rect->height - 1);
  2476	}
  2477	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
