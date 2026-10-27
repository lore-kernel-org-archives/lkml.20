Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067244;
	b=pjF0IJpnAGZxKcybrnFaLNnknqxrysRtrY+DNZKQpjD8Cn2Z5XxDHR9tlgVF/60O5zc6
	 6pqgLn3KwJxW6+FMKxxK6B5hXUM3NNnZmTKSw4nnr89dB7d8uf5m+4VHBgpVHE16Guczv
	 cCSis3QG0I6qyDkIkDbhyqEWufU4KPTEeKctqseUousbW1UiCNLpXJNN8RXyQCkGwTeIB
	 T3N30nBQw5qDqVshKcpJdLShMx3LP2OCtYq1HoHhWYaD+bcS/4GuZ4pKVtLGQDBz/+tPS
	 Uld4npfWtbGDL2qdCj3LHTOEYnsO1iunNtcigKOrfxvUeVorYy6DfObs5UkJdFDY34g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067244;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9XQYM4CdUlCvpW1E1LWQozi4IAjXoDDAUa6YcxOY6CI=;
	b=jOim0KXJxV6oV9F2+w9o9RnS+O80liI58USv4t+GWYoLqDykRhswMgNkmNDxgoF6iagu
	 6TyczTLCmMEqGVHKMflb5ORVWFUDaWOy18KgQ3LhB1GTPQsozJIPN2GA24QVgSfynGS2P
	 4w+/c9WzK95XH/c6jJN8DvMxPowxol1AHOuG3f4egCGO+ZL3sco8l/ORgyFKM7snlanXi
	 wsrUCH0eR3lAZy7d64Tke7cTVLdR08X5AlF0Tyt5o+WYguenfiPToLNON+jFC9pGTQEJe
	 Fu34/nQ92cpN5k9U7NpenPavjO3ZgksBoug0KrtCb5kMJWmDRqArdgFT8YfwPwiPfAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5U9zrzf;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA151606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA151606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5U9zrzf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793067241; x=1824603241;
  h=date:from:to:cc:subject:message-id;
  bh=4gSng04JXd1E+Nayk7qIU0NHKSiNcfdbx/qUlYLss1s=;
  b=L5U9zrzfZgJsPgDwXP2okBs1xBPVBXqKUb73WuuaeHYYvIVThsIWSwMZ
   CUE+exEWLaS+S/jnHohD8eV40nujyD68Z07y+DwJUSu5z+g0WmS+kQRU5
   VhUsYX2ab7FlhfyHh5LWksJqDtUTIM8NcC0y9NCAaI7EvUwZp+qs4MJmT
   UyBQS5vxHEzsYZPNOTMj3uy4hehiXrqWh9rVVsqruZo/yILWixQW1w3Mz
   PPzxKvM9T3d987emjayE4ImD4ry1gvz7zIu3KMu5hSb7grM9kAPRKjeDN
   j8b4C/B+H9Cvc8qtKWwMtK+JVslrJk2fGlgt+q88ttaMhH6UySB0BQAow
   g==;
X-CSE-ConnectionGUID: wrIZnIYKTZemD1VqPIKCag==
X-CSE-MsgGUID: 44aywQYXRnmwY+c9WKN8WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1765570"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1765570"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:14:01 -0700
X-CSE-ConnectionGUID: xgDdThVMR66V9moA02IFUQ==
X-CSE-MsgGUID: SgD1D80jQhW+9LuRLI+85g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6251978"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 19:14:00 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLWhJ-000000004LX-3UNJ;
	Tue, 27 Oct 2026 02:13:57 +0000
Date: Tue, 27 Oct 2026 03:13:49 +0100
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/cpm_uart.c:1533:31: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202610270303.TbvTqZ1N-lkp@intel.com>
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
head:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
commit: 831603b3e8aa3892de229fda846b2f859c518699 serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq
date:   4 months ago
config: powerpc-randconfig-r2304-20261026 (https://download.01.org/0day-ci/archive/20261027/202610270303.TbvTqZ1N-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270303.TbvTqZ1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 831603b3e8aa ("serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270303.TbvTqZ1N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/cpm_uart.c:1091:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc volatile [usertype] *bdp @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur @@
   drivers/tty/serial/cpm_uart.c:1091:13: sparse:     expected struct cpm_buf_desc volatile [usertype] *bdp
   drivers/tty/serial/cpm_uart.c:1091:13: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur
   drivers/tty/serial/cpm_uart.c:1110:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc volatile [usertype] *bdp @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_bd_base @@
   drivers/tty/serial/cpm_uart.c:1110:21: sparse:     expected struct cpm_buf_desc volatile [usertype] *bdp
   drivers/tty/serial/cpm_uart.c:1110:21: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_bd_base
   drivers/tty/serial/cpm_uart.c:1113:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur @@     got struct cpm_buf_desc [usertype] * @@
   drivers/tty/serial/cpm_uart.c:1113:23: sparse:     expected struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur
   drivers/tty/serial/cpm_uart.c:1113:23: sparse:     got struct cpm_buf_desc [usertype] *
>> drivers/tty/serial/cpm_uart.c:1533:31: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tty/serial/cpm_uart.c:1532:43: sparse: signed value source

vim +1533 drivers/tty/serial/cpm_uart.c

  1515	
  1516	static int cpm_uart_probe(struct platform_device *ofdev)
  1517	{
  1518		int index = probe_index++;
  1519		struct uart_cpm_port *pinfo = &cpm_uart_ports[index];
  1520		int ret;
  1521	
  1522		pinfo->port.line = index;
  1523	
  1524		if (index >= UART_NR)
  1525			return -ENODEV;
  1526	
  1527		platform_set_drvdata(ofdev, pinfo);
  1528	
  1529		/* initialize the device pointer for the port */
  1530		pinfo->port.dev = &ofdev->dev;
  1531	
  1532		pinfo->port.irq = platform_get_irq(ofdev, 0);
> 1533		if (pinfo->port.irq < 0)
  1534			return pinfo->port.irq;
  1535	
  1536		ret = cpm_uart_init_port(ofdev->dev.of_node, pinfo);
  1537		if (!ret)
  1538			return uart_add_one_port(&cpm_reg, &pinfo->port);
  1539	
  1540		return ret;
  1541	}
  1542	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
