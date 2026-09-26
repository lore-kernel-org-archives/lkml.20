Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFBB38886A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403691; cv=none; b=jLroa1YHdoUAs2n5M7rhrzp3pE10vLDmCt2Pjqp/slGUk8BJ3+b4x1LyEPlGwYCQzOGGconJQuvmaOsgw93te6D+7OZv8YkR1OtRqqZD32V3pnOif4AJ2w0edTHdOpeW7vMFFrIuowfrCOmKqLcLVCip8lfZ0sopy5JUgAnO6Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403691; c=relaxed/simple;
	bh=FsJEOoBystBOM6ZmtA3HmnD/NNCRcjmf4087p83ek00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q0wOEGls6q2Fwm6RgIrYpgz0UTKgAcmxDEoLDC8F9397p5ImuwIQOG2Ng7RBL+puMgbqjeoNi8PG8GwNPlyw02shOQK58KtRTULACYbRqO0p0UmtO7N7XV78Pdtb+CqrsyPy2BFcMJmI57xf5lG6fjC8oG77HUw2+P3gTYTQhBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6lVPnKF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6lVPnKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790403687; x=1821939687;
  h=date:from:to:cc:subject:message-id;
  bh=FsJEOoBystBOM6ZmtA3HmnD/NNCRcjmf4087p83ek00=;
  b=O6lVPnKFRoDNUxgLoePWZAhXxDWgtZ4R3CYF6OI9zro3ckNeac15KXZ8
   rbDVhkFbXF97WZePwZTuV53jqsAQTFgIOZxGvDWnKW8+haQ+//h7yL4OM
   7LVSdaSWrQk/LWdlsMsEcJ9IccqEu0/lSfA/hOsnO9UgKua9Io7UUsi1x
   tdSvIZ5wzI/2oMfQ09BIgAUPjXAEKqax4Ai+tR+cbow50lwRwgCS+6zde
   PUShg75DclzvbcbUqvp1+dwFNqucc86Hn2V10VQtN2ehDfdqCSpVrJPiO
   JWB2XNO51mbohvNcpnfmd1cUb2J6jxJmmphTfoKi159ASLPhgFhMGKZDB
   g==;
X-CSE-ConnectionGUID: KrYCllWRTXuAwDDmsxqWrw==
X-CSE-MsgGUID: DdDXbLdwTxSvDlCD+5nvhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101844002"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="101844002"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 23:21:26 -0700
X-CSE-ConnectionGUID: AN11i6h9QD2pygVswgjLWQ==
X-CSE-MsgGUID: m4GTmKDdTTeeCWQvwY+SbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273723509"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 23:21:25 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xALml-000000000Pj-0APo;
	Sat, 26 Sep 2026 06:21:23 +0000
Date: Sat, 26 Sep 2026 08:20:40 +0200
From: kernel test robot <lkp@intel.com>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/ptp/ptp_ocp.c:2559:1: warning: the frame size of
 1040 bytes is larger than 1024 bytes
Message-ID: <202609260832.yA7jIeSA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6812ce4e4379ffc99c52401ec28f0d7ffbc36206
commit: af1ba61b62be975902c5a4babcc7952f6dfdbd29 serial: 8250: allow low-level drivers to override break control
date:   8 weeks ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260926/202609260832.yA7jIeSA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260832.yA7jIeSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af1ba61b62be ("serial: 8250: allow low-level drivers to override break control")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260832.yA7jIeSA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_ocp.c: In function 'ptp_ocp_serial_line.isra':
>> drivers/ptp/ptp_ocp.c:2559:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2559 | }
         | ^
--
   drivers/tty/serial/8250/8250_bcm2835aux.c: In function 'bcm2835aux_serial_probe':
>> drivers/tty/serial/8250/8250_bcm2835aux.c:174:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     174 | }
         | ^
--
   drivers/tty/serial/8250/8250_bcm7271.c: In function 'brcmuart_probe':
>> drivers/tty/serial/8250/8250_bcm7271.c:1117:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1117 | }
         | ^
--
   drivers/tty/serial/8250/8250_em.c: In function 'serial8250_em_probe':
>> drivers/tty/serial/8250/8250_em.c:200:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     200 | }
         | ^
--
   drivers/tty/serial/8250/8250_ingenic.c: In function 'ingenic_uart_probe':
>> drivers/tty/serial/8250/8250_ingenic.c:315:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     315 | }
         | ^
--
   drivers/tty/serial/8250/8250_ioc3.c: In function 'serial8250_ioc3_probe':
>> drivers/tty/serial/8250/8250_ioc3.c:76:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
      76 | }
         | ^
--
   drivers/tty/serial/8250/8250_loongson.c: In function 'loongson_uart_probe':
>> drivers/tty/serial/8250/8250_loongson.c:173:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     173 | }
         | ^
--
   drivers/tty/serial/8250/8250_men_mcb.c: In function 'serial_8250_men_mcb_probe':
>> drivers/tty/serial/8250/8250_men_mcb.c:232:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     232 | }
         | ^
--
   drivers/tty/serial/8250/8250_mtk.c: In function 'mtk8250_probe':
>> drivers/tty/serial/8250/8250_mtk.c:600:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     600 | }
         | ^
--
   drivers/tty/serial/8250/8250_omap.c: In function 'omap8250_probe':
>> drivers/tty/serial/8250/8250_omap.c:1612:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1612 | }
         | ^
--
   drivers/tty/serial/8250/8250_pxa.c: In function 'serial_pxa_probe':
>> drivers/tty/serial/8250/8250_pxa.c:144:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     144 | }
         | ^
..


vim +2559 drivers/ptp/ptp_ocp.c

773bda96492153 Jonathan Lemon 2021-08-03  2538  
773bda96492153 Jonathan Lemon 2021-08-03  2539  static int
773bda96492153 Jonathan Lemon 2021-08-03  2540  ptp_ocp_serial_line(struct ptp_ocp *bp, struct ocp_resource *r)
773bda96492153 Jonathan Lemon 2021-08-03  2541  {
773bda96492153 Jonathan Lemon 2021-08-03  2542  	struct pci_dev *pdev = bp->pdev;
773bda96492153 Jonathan Lemon 2021-08-03  2543  	struct uart_8250_port uart;
773bda96492153 Jonathan Lemon 2021-08-03  2544  
773bda96492153 Jonathan Lemon 2021-08-03  2545  	/* Setting UPF_IOREMAP and leaving port.membase unspecified lets
773bda96492153 Jonathan Lemon 2021-08-03  2546  	 * the serial port device claim and release the pci resource.
773bda96492153 Jonathan Lemon 2021-08-03  2547  	 */
773bda96492153 Jonathan Lemon 2021-08-03  2548  	memset(&uart, 0, sizeof(uart));
773bda96492153 Jonathan Lemon 2021-08-03  2549  	uart.port.dev = &pdev->dev;
773bda96492153 Jonathan Lemon 2021-08-03  2550  	uart.port.iotype = UPIO_MEM;
773bda96492153 Jonathan Lemon 2021-08-03  2551  	uart.port.regshift = 2;
773bda96492153 Jonathan Lemon 2021-08-03  2552  	uart.port.mapbase = pci_resource_start(pdev, 0) + r->offset;
773bda96492153 Jonathan Lemon 2021-08-03  2553  	uart.port.irq = pci_irq_vector(pdev, r->irq_vec);
773bda96492153 Jonathan Lemon 2021-08-03  2554  	uart.port.uartclk = 50000000;
c17c4059df2471 Jonathan Lemon 2022-03-09  2555  	uart.port.flags = UPF_FIXED_TYPE | UPF_IOREMAP | UPF_NO_THRE_TEST;
773bda96492153 Jonathan Lemon 2021-08-03  2556  	uart.port.type = PORT_16550A;
773bda96492153 Jonathan Lemon 2021-08-03  2557  
773bda96492153 Jonathan Lemon 2021-08-03  2558  	return serial8250_register_8250_port(&uart);
773bda96492153 Jonathan Lemon 2021-08-03 @2559  }
773bda96492153 Jonathan Lemon 2021-08-03  2560  

:::::: The code at line 2559 was first introduced by commit
:::::: 773bda96492153e11d21eb63ac814669b51fc701 ptp: ocp: Expose various resources on the timecard.

:::::: TO: Jonathan Lemon <jonathan.lemon@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
