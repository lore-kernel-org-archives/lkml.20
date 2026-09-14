Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90182442B06
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385418; cv=none; b=qNIoYFETqFi+z76Z4Raf8kZZgNVfEe8j/ZZKKW35uXziDznmSOIWThyqC3xVESaNjVRKZD+PD8mwYL3vIF0HrXD0GzLEs+2vap36hqqFZljtEpJsR94ObRkYr9ifLcI9RXT7ldBJd2W6PqRsIzclOHk7k35TWstd9DzOn5RSflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385418; c=relaxed/simple;
	bh=as80AICFOa3ucCrDS8ekVZdkRHxbSqAwgYk3LtJMubg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fs0Xp8VcxCOQ18QIMPPXs9dqcRDJpB0mQalnS30r/YNO4fEohIGUyCeFZC5z/kFDlFJNArMUaVlQh6mRHpLfSb15KxByZdR68WseTHGbvr60RJ+a4TsrsroCO/dPZ0dmx0n0YHTtvuSon+n+lbMUJpfiUKh9y60cwFH4RXK1gOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyEL/rhv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyEL/rhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385416; x=1820921416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=as80AICFOa3ucCrDS8ekVZdkRHxbSqAwgYk3LtJMubg=;
  b=JyEL/rhvhe1IUYxFXrVweWgh674IJYIYu0ZiPNqpBBFctVd+1xgRMKZF
   mMISX3iGqo1zBrw6S6SgGcWG4/jMtVSZDtO8JW3h/YfWw2d7vbVyd3PDd
   WqKGMAuzWLtVmn6ylrE8E/w1MMXzEEZNA+2wW9pMrl1P/z9HvWtRngn0A
   8vKrNfhGqex9slzKh/BYRcrUOSTwk96hMGgyVFxYmL6xybG4z0iv7eBuI
   4flL/96Tvckii5sVLuUjdU8aY5kvGYRGZdLSyK+I6FUy7rR4qWU5j+e8B
   Z9Z2gSoYAI4NGTekRIi3sEKVWAYdaVjK3SqmFbOOu5c5Rp+vQBRmCcdpm
   A==;
X-CSE-ConnectionGUID: 5H6tWHyfRvicyIp8WTx9YA==
X-CSE-MsgGUID: mr4yJDNVSXidPeRWlzsMUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864402"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864402"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:15 -0700
X-CSE-ConnectionGUID: 2/P2/hX5TgyeXYYOKmvq9A==
X-CSE-MsgGUID: E+DRzYNZTEiL+ve3Fzi1+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273132973"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:14 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/17] i3c: Fixes, cleanups and HDR-DDR support
Date: Mon, 14 Sep 2026 14:29:46 +0300
Message-ID: <20260914113003.183150-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

Hi

This series brings a collection of fixes, specification-conformance
cleanups and feature additions to the I3C core and MIPI I3C HCI driver.

The first three patches are independent fixes tagged for stable. The
remaining patches address a mixture of correctness issues in the core
and HCI driver, improve conformance with the I3C and HCI
specifications, add support for configurable device NACK retries, and
finally add HDR-DDR support.

The series is organised as follows:

  Stable fixes (patches 1-3)
  --------------------------

  - Fix an out-of-bounds read in the core DMA bounce-buffer helper.

  - Fix a destination buffer overrun in the HCI DMA path for reads whose
    length is not a multiple of four bytes. The issue is independent of
    IOMMU usage, although the existing workaround was only applied when
    an IOMMU was present.

  - Close a probe-time race in the HCI PCI driver where the LTR sysfs
    attribute becomes visible before drvdata has been initialized.

  Core fixes (patches 4-5)
  ------------------------

  - Fix ACPI target enumeration on multi-instance controllers by
    extracting the bus-controller instance number and PID from the
    correct _ADR fields.

  - Remove a stale GETSTATUS response-length check that became obsolete
    when actual_len-based validation was introduced.

  HCI IBI and suspend fixes (patches 6-11)
  ----------------------------------------

  - Fix the IBI enable error path to unwind controller-side setup when
    ENEC fails.

  - Send DISEC before disabling IBIs in hardware so that an IBI racing
    with teardown is not silently dropped.

  - Avoid accessing controller hardware from ->free_ibi(), where runtime
    PM does not guarantee the device is resumed.

  - Drain all pending IBIs whenever INTR_IBI_READY is received instead
    of processing only the first queued entry.

  - Reorganize the DMA suspend/resume callbacks in preparation for the
    following change.

  - Rework DMA suspend handling to stop Ring Bundles according to the
    HCI specification, synchronize with the interrupt handler, and flush
    any pending IBI before disabling the rings.

  HCI specification cleanups (patches 12-14)
  -------------------------------------------

  - Correct the Response Descriptor DATA_LENGTH field definition.

  - Remove an invalid maximum-transfer-size capability derived from
    reserved HC_CAPABILITIES bits.

  - Remove HDR-BT and Fm/Fm+ definitions that are not defined by any
    released version of the HCI specification.

  Feature additions (patches 15-17)
  ---------------------------------

  - Implement the .set_dev_nack_retry() master operation using DAT
    support provided by HCI v1 controllers.

  - Restrict advertised and permitted HDR modes to the intersection of:
      * controller capabilities,
      * bus-configuration constraints, and
      * target capabilities.

  - Add HDR-DDR private-transfer support to the HCI driver, including
    descriptor generation and capability advertisement when supported by
    both the controller and the active command-descriptor format.


Adrian Hunter (17):
      i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
      i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
      i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
      i3c: master: Match ACPI targets to the correct bus controller instance
      i3c: master: Remove stale GETSTATUS length check
      i3c: mipi-i3c-hci: Fix i3c_hci_enable_ibi() error path
      i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
      i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
      i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
      i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
      i3c: mipi-i3c-hci: Stop rings gracefully when suspending
      i3c: mipi-i3c-hci: Fix Response Descriptor DATA_LENGTH mask
      i3c: mipi-i3c-hci: Remove invalid transfer size limit
      i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
      i3c: mipi-i3c-hci: Support configurable device NACK retries
      i3c: Restrict HDR modes to those supported by the bus and target
      i3c: mipi-i3c-hci: Add HDR-DDR support

 drivers/i3c/device.c                               |  15 ++-
 drivers/i3c/internals.h                            |   2 +
 drivers/i3c/master.c                               |  88 +++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/cmd.h              |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |  28 ++++-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |  99 +++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  25 +++++
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 125 ++++++++++++++-------
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   9 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |   5 +-
 include/linux/i3c/device.h                         |   4 +
 include/linux/i3c/master.h                         |   3 +
 include/linux/platform_data/mipi-i3c-hci.h         |   4 +
 15 files changed, 330 insertions(+), 87 deletions(-)


Regards
Adrian
