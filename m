Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA061CDFCA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487032; cv=none; b=EdWvEWeICY4rio6q2wJbfO8rlQxUH0BB5/uQ2Mx9kRbeOcft9qjaFZZCKni0s27Ypw38cieyKctZyf9Bfx/mbHTh9+LfEW0Q9ly5IINCrmaXYQYL2hLeAGP9cqgBYlBp2hZ2zAUXwfWzrO9cD7OajfEGniBADoR2CzxMJk3feUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487032; c=relaxed/simple;
	bh=mhpxVGplR0e8xQEe073+FugnxISMpeqmlCxTCkV0UYs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fncB0QFw3ibq0OHI3MnT1xtGaZwVXmanqLu3Vou5crajgKaQmrBHh2KVefMeplAvBFWR2dR0w+kWeSh/C/PKm/ZkpfB87vz00yhH+uYI9Ekmp6yxyUs0Q3FR1UrTzNyWXIgIRgzSjrd7JDa0SgRXpEXuVUF7Hsgl1yfK4h45PoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mo5aB+gF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mo5aB+gF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791487030; x=1823023030;
  h=date:from:to:cc:subject:message-id;
  bh=mhpxVGplR0e8xQEe073+FugnxISMpeqmlCxTCkV0UYs=;
  b=mo5aB+gFxyDOU6X3pbdMtPfS00aL2uzeB/hSblEcv/VClznhKSNlSddM
   FDGLRJ50UGhAhhFKYC8cxl6F5iDqWeDVT4ewUWPD9EogHGuxDIFV6/cH1
   kUTY78AWAL2cEazdytDx5+8aj1Qdrpuc8jvpAOIW6fWldUKVtECRPJ18k
   QdxnM9mUVBp18uDGfcK4gClnd+SRa5PfHV0cEqBt7q0jHMfOwz7BJFkup
   M1Ac8Lj6U3SS7irycbtBEgPkw+Pj68N5ek62bs/Rvq9yENX9x54TH4Dy5
   aWqcbmLy7RgzMpFervzOMq89Ma8ryhDcdUhqkeqpgYq7F49b+CihFjK6a
   Q==;
X-CSE-ConnectionGUID: S++A5hVURaqw4WR1nfZX8A==
X-CSE-MsgGUID: 0z5EILDhQj+yLbKMsuLjgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="175690"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="175690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 12:17:08 -0700
X-CSE-ConnectionGUID: 4iXiOpUyQ3GCtNXfVO5CMg==
X-CSE-MsgGUID: lk2pCIr9T1eB2ul9VIJAvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="65875"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Oct 2026 12:17:07 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEtc0-000000005wM-1vMZ;
	Thu, 08 Oct 2026 19:17:04 +0000
Date: Thu, 08 Oct 2026 21:16:47 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/gadget/udc/pxa25x_udc.c:232:2: error: #error
 "Can't configure both IXP and PXA"
Message-ID: <202610082137.QmoxNDcI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c377d19d4a5116d9bec5203aa3c6c11523e7898
commit: 2262f02ac2aa545560a7f182c8e6b5c98e72763c ARM: ixp4xx: Relax endianness
date:   3 months ago
config: arm-randconfig-r2202-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082137.QmoxNDcI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610082137.QmoxNDcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2262f02ac2aa ("ARM: ixp4xx: Relax endianness")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610082137.QmoxNDcI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/pxa25x_udc.c:144: warning: "UDCCS_IO_ROF" redefined
     144 | #define UDCCS_IO_ROF    (1 << 2)        /* Receive overflow */
         | 
   drivers/usb/gadget/udc/pxa25x_udc.c:141: note: this is the location of the previous definition
     141 | #define UDCCS_IO_ROF    (1 << 3)        /* Receive overflow */
         | 
>> drivers/usb/gadget/udc/pxa25x_udc.c:232:2: error: #error "Can't configure both IXP and PXA"
     232 | #error "Can't configure both IXP and PXA"
         |  ^~~~~


vim +232 drivers/usb/gadget/udc/pxa25x_udc.c

c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  137  
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  138  #define UDCCS_IO_RFS	(1 << 0)	/* Receive FIFO service */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  139  #define UDCCS_IO_RPC	(1 << 1)	/* Receive packet complete */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  140  #ifdef CONFIG_ARCH_IXP4XX /* FIXME: is this right?, datasheed says '2' */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  141  #define UDCCS_IO_ROF	(1 << 3)	/* Receive overflow */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  142  #endif
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  143  #ifdef CONFIG_ARCH_PXA
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28 @144  #define UDCCS_IO_ROF	(1 << 2)	/* Receive overflow */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  145  #endif
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  146  #define UDCCS_IO_DME	(1 << 3)	/* DMA enable */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  147  #define UDCCS_IO_RNE	(1 << 6)	/* Receive FIFO not empty */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  148  #define UDCCS_IO_RSP	(1 << 7)	/* Receive short packet */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  149  
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  150  #define UDCCS_INT_TFS	(1 << 0)	/* Transmit FIFO service */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  151  #define UDCCS_INT_TPC	(1 << 1)	/* Transmit packet complete */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  152  #define UDCCS_INT_FTF	(1 << 2)	/* Flush Tx FIFO */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  153  #define UDCCS_INT_TUR	(1 << 3)	/* Transmit FIFO underrun */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  154  #define UDCCS_INT_SST	(1 << 4)	/* Sent stall */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  155  #define UDCCS_INT_FST	(1 << 5)	/* Force stall */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  156  #define UDCCS_INT_TSP	(1 << 7)	/* Transmit short packet */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  157  
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  158  #define UICR0_IM0	(1 << 0)	/* Interrupt mask ep 0 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  159  #define UICR0_IM1	(1 << 1)	/* Interrupt mask ep 1 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  160  #define UICR0_IM2	(1 << 2)	/* Interrupt mask ep 2 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  161  #define UICR0_IM3	(1 << 3)	/* Interrupt mask ep 3 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  162  #define UICR0_IM4	(1 << 4)	/* Interrupt mask ep 4 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  163  #define UICR0_IM5	(1 << 5)	/* Interrupt mask ep 5 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  164  #define UICR0_IM6	(1 << 6)	/* Interrupt mask ep 6 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  165  #define UICR0_IM7	(1 << 7)	/* Interrupt mask ep 7 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  166  
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  167  #define UICR1_IM8	(1 << 0)	/* Interrupt mask ep 8 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  168  #define UICR1_IM9	(1 << 1)	/* Interrupt mask ep 9 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  169  #define UICR1_IM10	(1 << 2)	/* Interrupt mask ep 10 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  170  #define UICR1_IM11	(1 << 3)	/* Interrupt mask ep 11 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  171  #define UICR1_IM12	(1 << 4)	/* Interrupt mask ep 12 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  172  #define UICR1_IM13	(1 << 5)	/* Interrupt mask ep 13 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  173  #define UICR1_IM14	(1 << 6)	/* Interrupt mask ep 14 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  174  #define UICR1_IM15	(1 << 7)	/* Interrupt mask ep 15 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  175  
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  176  #define USIR0_IR0	(1 << 0)	/* Interrupt request ep 0 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  177  #define USIR0_IR1	(1 << 1)	/* Interrupt request ep 1 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  178  #define USIR0_IR2	(1 << 2)	/* Interrupt request ep 2 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  179  #define USIR0_IR3	(1 << 3)	/* Interrupt request ep 3 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  180  #define USIR0_IR4	(1 << 4)	/* Interrupt request ep 4 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  181  #define USIR0_IR5	(1 << 5)	/* Interrupt request ep 5 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  182  #define USIR0_IR6	(1 << 6)	/* Interrupt request ep 6 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  183  #define USIR0_IR7	(1 << 7)	/* Interrupt request ep 7 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  184  
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  185  #define USIR1_IR8	(1 << 0)	/* Interrupt request ep 8 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  186  #define USIR1_IR9	(1 << 1)	/* Interrupt request ep 9 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  187  #define USIR1_IR10	(1 << 2)	/* Interrupt request ep 10 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  188  #define USIR1_IR11	(1 << 3)	/* Interrupt request ep 11 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  189  #define USIR1_IR12	(1 << 4)	/* Interrupt request ep 12 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  190  #define USIR1_IR13	(1 << 5)	/* Interrupt request ep 13 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  191  #define USIR1_IR14	(1 << 6)	/* Interrupt request ep 14 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  192  #define USIR1_IR15	(1 << 7)	/* Interrupt request ep 15 */
c5418a0b98c1ff drivers/usb/gadget/udc/pxa25x_udc.c Arnd Bergmann  2016-01-28  193  
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  194  /*
9198769363d4dc drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2005-05-07  195   * This driver handles the USB Device Controller (UDC) in Intel's PXA 25x
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  196   * series processors.  The UDC for the IXP 4xx series is very similar.
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  197   * There are fifteen endpoints, in addition to ep0.
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  198   *
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  199   * Such controller drivers work with a gadget driver.  The gadget driver
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  200   * returns descriptors, implements configuration and data protocols used
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  201   * by the host to interact with this device, and allocates endpoints to
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  202   * the different protocol interfaces.  The controller driver virtualizes
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  203   * usb hardware so that the gadget drivers will be more portable.
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  204   *
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  205   * This UDC hardware wants to implement a bit too much USB protocol, so
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  206   * it constrains the sorts of USB configuration change events that work.
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  207   * The errata for these chips are misleading; some "fixed" bugs from
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  208   * pxa250 a0/a1 b0/b1/b2 sure act like they're still there.
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  209   *
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  210   * Note that the UDC hardware supports DMA (except on IXP) but that's
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  211   * not used here.  IN-DMA (to host) is simple enough, when the data is
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  212   * suitably aligned (16 bytes) ... the network stack doesn't do that,
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  213   * other software can.  OUT-DMA is buggy in most chip versions, as well
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  214   * as poorly designed (data toggle not automatic).  So this driver won't
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  215   * bother using DMA.  (Mostly-working IN-DMA support was available in
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  216   * kernels before 2.6.23, but was never enabled or well tested.)
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  217   */
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  218  
ad8c623f4f4808 drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2007-06-30  219  #define	DRIVER_VERSION	"30-June-2007"
9198769363d4dc drivers/usb/gadget/pxa2xx_udc.c     David Brownell 2005-05-07  220  #define	DRIVER_DESC	"PXA 25x USB Device Controller driver"
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  221  
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  222  
7a8576204333d1 drivers/usb/gadget/pxa25x_udc.c     Philipp Zabel  2008-06-22  223  static const char driver_name [] = "pxa25x_udc";
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  224  
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  225  static const char ep0name [] = "ep0";
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  226  
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  227  
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  228  #ifdef CONFIG_ARCH_IXP4XX
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  229  
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  230  /* cpu-specific register addresses are compiled in to this code */
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  231  #ifdef CONFIG_ARCH_PXA
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16 @232  #error "Can't configure both IXP and PXA"
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  233  #endif
^1da177e4c3f41 drivers/usb/gadget/pxa2xx_udc.c     Linus Torvalds 2005-04-16  234  

:::::: The code at line 232 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
