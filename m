Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA2D3AC0DD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075063; cv=none; b=nikPksp3pDi4xM1rNquEPzUV4XU+ulNc/ghB01wSLXm3l3Z0Wi0+1rNPr3+AftPD6xV5YuXjRn8Xv+FkBVM8nChW2jJt1mNA/zC9WMfKoT60uxOrd7Hf322Jol9bCydvcB6JI45ROaJCrzsUZVqxVQvqGix9c/6Z4xv19M8oxK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075063; c=relaxed/simple;
	bh=LGCKOHPpAZ51siEENAnNufkjdxmacpkF2dJvRyRRcQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dHcWenqjLeROg2nXNhGvZSQMSfIL4VMCDNfF19pcPGf9yZ1p2cEyTS57kazSVakS6tPJTyA3Yy0LLtcrYmFan+8TJM1qbbM+OftzWhDPDnU0gaCYEacmL65xOsB3Rnw4Ho6bHLiLlrxX/S78kMIIaPvrN+GyMxCJczkK+aWF4Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbEZYQ6Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbEZYQ6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792075060; x=1823611060;
  h=date:from:to:cc:subject:message-id;
  bh=LGCKOHPpAZ51siEENAnNufkjdxmacpkF2dJvRyRRcQs=;
  b=FbEZYQ6YsK/3hLVO3DNvv5GVZjdEIrmoo1a0c4eb52/Ve3DG+CQxe0gJ
   IRcegPZsak/AJnDzKs5FUXO1+GtNs0MuL8NXWJcO8DoWrEqLwUwxmVFeX
   90uAf3Mdoc4BGbGnCsHxjrTTUNd+jZfyllKG4uQ8I1a3Eye+PIv6F7umd
   VqMo3G2t2OyfC1xSfjfBCTzY0rbjyXlRFHxbCtxixQwZG4Zp3h150WQMm
   6cvIeZI8BkUqSiaRJAMTvLkwXwqHstVSx2UTYoNmNtsykHJF4lBaJGaoh
   l5W4wHTvjL4P5D+L4c7aLsdSjnka3SF5sQaTasXb3T26C758uPux/RyT+
   g==;
X-CSE-ConnectionGUID: 8dre1eOnTXS1s0F5UO+LEQ==
X-CSE-MsgGUID: I9imrg1VTc6rOnoHnD515g==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="950914"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="950914"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:37:40 -0700
X-CSE-ConnectionGUID: mvbjDYGLRW+lI46OOyKE2A==
X-CSE-MsgGUID: mfY/4lrZT1CKFim1mskFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1676050"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Oct 2026 07:37:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHMaN-00000000Bih-49WZ;
	Thu, 15 Oct 2026 14:37:35 +0000
Date: Thu, 15 Oct 2026 16:37:27 +0200
From: kernel test robot <lkp@intel.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Warning: drivers/usb/host/octeon-hcd.c:381 struct member
 'sof_timer' not described in 'octeon_hcd'
Message-ID: <202610151637.5srThc2q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Orgad,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: aebbc7d63407f843a1c74806041792db65d69a51 usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers
date:   5 weeks ago
config: mips-randconfig-r2105-20261015 (https://download.01.org/0day-ci/archive/20261015/202610151637.5srThc2q-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151637.5srThc2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/usb/host/octeon-hcd.c:159 struct member 'reserved' not described in 'cvmx_usb_port_status'
   Warning: drivers/usb/host/octeon-hcd.c:235 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Logical transactions may take numerous low level
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'xfersize' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'pktcnt' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'retries' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 Excess struct member 'flags' description in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:335 Excess struct member 'next' description in 'cvmx_usb_pipe' (did you mean one of: 'next_tx_frame')
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'lock' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'init_flags' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'index' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'idle_hardware_channels' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'usbcx_hprt' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'pipe_for_channel' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'indent' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'port_status' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'idle_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'active_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'frame_number' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'active_split' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'periodic' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'nonperiodic' not described in 'octeon_hcd'
>> Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'sof_timer' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:528 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read a USB 32bit CSR. It performs the necessary address swizzle
   Warning: drivers/usb/host/octeon-hcd.c:543 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Write a USB 32bit CSR. It performs the necessary address
   Warning: drivers/usb/host/octeon-hcd.c:559 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return non zero if this pipe connects to a non HIGH speed
   Warning: drivers/usb/host/octeon-hcd.c:575 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Trivial utility function to return the correct PID for a pipe
   Warning: drivers/usb/host/octeon-hcd.c:663 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Shutdown a USB port after a call to cvmx_usb_initialize().
   Warning: drivers/usb/host/octeon-hcd.c:695 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize a USB port for use. This must be called before any
   Warning: drivers/usb/host/octeon-hcd.c:974 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Reset a USB port. After this call succeeds, the USB port is
   Warning: drivers/usb/host/octeon-hcd.c:1007 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Disable a USB port. After this call the USB port will not
   Warning: drivers/usb/host/octeon-hcd.c:1025 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get the current state of the USB port. Use this call to
   Warning: drivers/usb/host/octeon-hcd.c:1055 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Open a virtual pipe between the host and a USB device. A pipe
   Warning: drivers/usb/host/octeon-hcd.c:1168 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Poll the RX FIFOs and remove data as needed. This function is only used
   Warning: drivers/usb/host/octeon-hcd.c:1214 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Fill the TX hardware fifo with data out of the software
   Warning: drivers/usb/host/octeon-hcd.c:1274 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Check the hardware FIFOs and fill them as needed
   Warning: drivers/usb/host/octeon-hcd.c:1310 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Fill the TX FIFO with an outgoing packet
   Warning: drivers/usb/host/octeon-hcd.c:1362 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Perform channel specific setup for Control transactions. All
   Warning: drivers/usb/host/octeon-hcd.c:1511 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Start a channel to perform the pipe's head transaction
   Warning: drivers/usb/host/octeon-hcd.c:1855 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Find a pipe that is ready to be scheduled to hardware.
   Warning: drivers/usb/host/octeon-hcd.c:1913 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Called whenever a pipe might need to be scheduled to the
   Warning: drivers/usb/host/octeon-hcd.c:2086 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Signal the completion of a transaction and free it. The
   Warning: drivers/usb/host/octeon-hcd.c:2143 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Submit a usb transaction to a pipe. Called for all types
   Warning: drivers/usb/host/octeon-hcd.c:2217 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Bulk transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2241 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Interrupt transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2266 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Control transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2297 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Isochronous transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2324 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Cancel one outstanding request in a pipe. Canceling a request
   Warning: drivers/usb/host/octeon-hcd.c:2373 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Cancel all outstanding requests in a pipe. Logically all this
   Warning: drivers/usb/host/octeon-hcd.c:2397 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Close a pipe created with cvmx_usb_open_pipe().
   Warning: drivers/usb/host/octeon-hcd.c:2419 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get the current USB protocol level frame number. The frame
   Warning: drivers/usb/host/octeon-hcd.c:2628 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Poll a channel for status
   Warning: drivers/usb/host/octeon-hcd.c:2970 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Poll the USB block for status and call all needed callback
   Warning: drivers/usb/host/octeon-hcd.c:159 struct member 'reserved' not described in 'cvmx_usb_port_status'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'xfersize' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'pktcnt' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'retries' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 Excess struct member 'flags' description in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:335 Excess struct member 'next' description in 'cvmx_usb_pipe' (did you mean one of: 'next_tx_frame')
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'lock' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'init_flags' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'index' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'idle_hardware_channels' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'usbcx_hprt' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'pipe_for_channel' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'indent' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'port_status' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'idle_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'active_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'frame_number' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'active_split' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'periodic' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'nonperiodic' not described in 'octeon_hcd'
>> Warning: drivers/usb/host/octeon-hcd.c:381 struct member 'sof_timer' not described in 'octeon_hcd'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
