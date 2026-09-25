Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966E3B4EB7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357515; cv=none; b=X8iMROWA83JKv7RM+Pqovpg0w+30U1Cd2AuCRxd9/u5EhH0lJPOkDJuiIcwhR264/Yt3jk/mbVCxJZNdRH2MY4jRE3ftc/nREl3tf85d1anQRubsosueL/H918Et5plodZGSLD0+DcQRDuX0YeyCvGs5R2DTAtbPvu0yXY0C61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357515; c=relaxed/simple;
	bh=QDa7wnedvgNfnyK4sByY2bOQExOY/OFvDG2xHnIiLa4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ajtpcF2WshmDxtpLNsHo/J18afC9y3DN0gresU8/7/3pQ/ubJZ5EY/E2hNF5yt91sSbbxZeRFyYJk29pCTAZOIxSNkuHu0IYR6ATRdy3D92+EwDs0Kq8mB3j0JKTAcGK5N6UbKD6oAlSmMM2vaycdXfauhvy9zSDI9chKnPfLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3DVjkwR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3DVjkwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790357513; x=1821893513;
  h=date:from:to:cc:subject:message-id;
  bh=QDa7wnedvgNfnyK4sByY2bOQExOY/OFvDG2xHnIiLa4=;
  b=d3DVjkwRAVx2nDZ5lIhs2nuLFz4rS3OOBPowFZpMA6BDp3rSUwSpsTF5
   XlwrSdaHwNXUfVuIe+eSaENLmzBI5TV/0tb1DoOS6rqZJzkK5aOs3qDq3
   jUuxxTlJTQ6hvnjS6j73ygxSy2GmPV7UKWHknoPYiP4F0bVaK8p0C7v7o
   brQF8KllqXEa7ZrhfIOZZ7cpcqpy0BJ5S3goeNuAKD45Qfpk4MWPeFB0R
   OwZRlUzi+D3WWH65tAss2X/fGfIdwfV9Ww0TE2FZb/EzfWCYWrRV4xG+r
   KD6lb13HcBaAP8xKll2in8hB5z0yMpVhd9NogE1pz7Oh503kFZhrreV15
   Q==;
X-CSE-ConnectionGUID: N9Gw4KxWRUecNS3K990vHg==
X-CSE-MsgGUID: SazSm9DYSYG+pS8At4LGUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="108640159"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="108640159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:31:53 -0700
X-CSE-ConnectionGUID: JjtFgE+XQpyShs7MFsbH6w==
X-CSE-MsgGUID: mg06O3VrSqy55jnQfXb7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273899666"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 10:31:51 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA9m0-000000000qK-49og;
	Fri, 25 Sep 2026 17:31:49 +0000
Date: Fri, 25 Sep 2026 19:31:43 +0200
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <eg@keba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>
Subject: drivers/tty/serial/8250/8250_keba.c:250:1: warning: the
 frame size of 1056 bytes is larger than 1024 bytes
Message-ID: <202609251951.KVWH0guw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: ab9a30d6febf768c057fcde74a46597862db443e serial: 8250: add driver for KEBA UART
date:   10 months ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260925/202609251951.KVWH0guw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251951.KVWH0guw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ab9a30d6febf ("serial: 8250: add driver for KEBA UART")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251951.KVWH0guw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_keba.c: In function 'kuart_probe':
>> drivers/tty/serial/8250/8250_keba.c:250:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     250 | }
         | ^


vim +250 drivers/tty/serial/8250/8250_keba.c

   158	
   159	static int kuart_probe(struct auxiliary_device *auxdev,
   160			       const struct auxiliary_device_id *id)
   161	{
   162		struct device *dev = &auxdev->dev;
   163		struct uart_8250_port uart = {};
   164		struct resource res;
   165		struct kuart *kuart;
   166		int retval;
   167	
   168		kuart = devm_kzalloc(dev, sizeof(*kuart), GFP_KERNEL);
   169		if (!kuart)
   170			return -ENOMEM;
   171		kuart->auxdev = container_of(auxdev, struct keba_uart_auxdev, auxdev);
   172		kuart->flags = id->driver_data;
   173		auxiliary_set_drvdata(auxdev, kuart);
   174	
   175		/*
   176		 * map only memory in front of UART registers, UART registers will be
   177		 * mapped by serial port
   178		 */
   179		res = kuart->auxdev->io;
   180		res.end = res.start + KUART_BASE - 1;
   181		kuart->base = devm_ioremap_resource(dev, &res);
   182		if (IS_ERR(kuart->base))
   183			return PTR_ERR(kuart->base);
   184	
   185		if (kuart->flags & KUART_USE_CAPABILITY) {
   186			/*
   187			 * supported modes are read from capability register, at least
   188			 * one mode other than none must be supported
   189			 */
   190			kuart->capability = ioread8(kuart->base + KUART_CAPABILITY) &
   191					    KUART_CAPABILITY_MASK;
   192			if ((kuart->capability & ~KUART_CAPABILITY_NONE) == 0)
   193				return -EIO;
   194		}
   195	
   196		spin_lock_init(&uart.port.lock);
   197		uart.port.dev = dev;
   198		uart.port.mapbase = kuart->auxdev->io.start + KUART_BASE;
   199		uart.port.irq = kuart->auxdev->irq;
   200		uart.port.uartclk = KUART_CLK;
   201		uart.port.private_data = kuart;
   202	
   203		/* 8 bit registers are 32 bit aligned => shift register offset */
   204		uart.port.iotype = UPIO_MEM32;
   205		uart.port.regshift = KUART_REGSHIFT;
   206	
   207		/*
   208		 * UART mixes 16550, 16750 and 16C950 (for RS485) standard => auto
   209		 * configuration works best
   210		 */
   211		uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_IOREMAP;
   212	
   213		/*
   214		 * UART supports RS485, RS422 and RS232 with switching of physical
   215		 * interface
   216		 */
   217		uart.port.rs485_config = kuart_rs485_config;
   218		if (kuart->flags & KUART_RS485) {
   219			uart.port.rs485_supported.flags = SER_RS485_ENABLED |
   220							  SER_RS485_RTS_ON_SEND;
   221			uart.port.rs485.flags = SER_RS485_ENABLED |
   222						SER_RS485_RTS_ON_SEND;
   223		}
   224		if (kuart->flags & KUART_USE_CAPABILITY) {
   225			/* default mode priority is RS485 > RS422 > RS232 */
   226			if (kuart->capability & KUART_CAPABILITY_RS422) {
   227				uart.port.rs485_supported.flags |= SER_RS485_ENABLED |
   228								   SER_RS485_RTS_ON_SEND |
   229								   SER_RS485_MODE_RS422;
   230				uart.port.rs485.flags = SER_RS485_ENABLED |
   231							SER_RS485_RTS_ON_SEND |
   232							SER_RS485_MODE_RS422;
   233			}
   234			if (kuart->capability & KUART_CAPABILITY_RS485) {
   235				uart.port.rs485_supported.flags |= SER_RS485_ENABLED |
   236								   SER_RS485_RTS_ON_SEND;
   237				uart.port.rs485.flags = SER_RS485_ENABLED |
   238							SER_RS485_RTS_ON_SEND;
   239			}
   240		}
   241	
   242		retval = serial8250_register_8250_port(&uart);
   243		if (retval < 0) {
   244			dev_err(&auxdev->dev, "UART registration failed!\n");
   245			return retval;
   246		}
   247		kuart->line = retval;
   248	
   249		return 0;
 > 250	}
   251	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
