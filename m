Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B199C37DAC0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917183; cv=none; b=UiPCL9tmjkjAygjRDPcBXCqrHYMNRHg2xR/Jk7m7QVHIEVXigjeHmjgmqHQV6kCyZ6oH/YxX7eYw0MKlleLsXLf3qBCEhCOIpK/DXVb3hvdVyWFrghVyFiB0PqM2g9l1UCFMxKH2w0MaCjeR7Q1ezTBf1Yp9f54hR7NJxguQaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917183; c=relaxed/simple;
	bh=Z2edKeOm5BBnQ4W9RLinP98zDmiS3txFiZEhbqTZ0vM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOktFOjvbZ+RuZ6tK55hdgpzwhKchlXoJPDpwxLPQhGQzCPsL8RUJAZetykV4rchHafYnG+0BH2My3GEnYTkvVf0H8Qjd0wf1TpBKAuefr/iqrAM/g9JFW297yb9tzAXOqTihAuSxphg+r4pfr/GR8idDvqQ5tm0SJOheL0ZgQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AX0MNJr4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AX0MNJr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917181; x=1821453181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z2edKeOm5BBnQ4W9RLinP98zDmiS3txFiZEhbqTZ0vM=;
  b=AX0MNJr4EkY/3Vj5z45S3k7x3EwA7Kd+JfQ1LYWmNZ2utyt94FYD4Jyb
   i+G3P5t3V2CpUOTJrv2mTs6VugIZnTZ2gbRhFZc6fIDEM3dhOHd9lMXw5
   dyY+BS3+QNiXKMoSweW901/V9M34ZW+wzaBKwrrn2n4bk0PCmRNNQNAHg
   Q3J6lx0/qZTrKrFJ2mJcjEkJAvUZdHbTHSgnxVTIZkq3lswx78RJ6ABHk
   6/1G69ShZTgLm1NKL2aEOX+TUqZeGT9q2snBMrPNIji5+bG4uJYmuhqEH
   sGrcZNinn1JW0bH0XGNm9F9sHxS0xWSYbOoCCY6bz8M6LHjjLzTaC3nbb
   A==;
X-CSE-ConnectionGUID: 0XOzCbIdQCmSAJa8QENlcQ==
X-CSE-MsgGUID: e/JBLuAAT7SZMMTqPwiQYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548396"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548396"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:00 -0700
X-CSE-ConnectionGUID: LOV2uXevTdeBiH6ucO90OQ==
X-CSE-MsgGUID: 3qcAJXkbSYqIY19IwaSvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352361"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:12:59 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 00/17] i3c: Fixes, cleanups and HDR-DDR support
Date: Sun, 20 Sep 2026 18:12:30 +0300
Message-ID: <20260920151248.46936-1-adrian.hunter@intel.com>
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

  - Restore controller state when enabling IBIs fails, so that a failed
    ENEC does not leave controller-side setup in place.

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


Changes in V3:

    i3c: mipi-i3c-hci: Support configurable device NACK retries
	Moved the retry count range check and the loop over allocated
	DAT entries from the DAT layer into i3c_hci_set_dev_nack_retry(),
	and removed the set_all_nack_retry() DAT operation.
	Moved the DAT_0_DEV_NACK_RETRY_CNT definition to dat.h so that it
	is visible to the caller.
	Amended the commit message accordingly.

    Added Frank Li's Reviewed-by tags.

Changes in V2:

    i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
	Added the slub_debug report to the commit message.

    i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix i3c_hci_enable_ibi() error path", to say what the patch does
	rather than that it fixes something.

    i3c: mipi-i3c-hci: Stop rings gracefully when suspending
	Added comments explaining the choice of the RING_STOP_TIMEOUT_US
	and RING_STOP_SLEEP_US values.

    i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix Response Descriptor DATA_LENGTH mask", to name the macro and
	the corrected bit range.

    Added Frank Li's Reviewed-by tags.


Adrian Hunter (17):
      i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
      i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
      i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
      i3c: master: Match ACPI targets to the correct bus controller instance
      i3c: master: Remove stale GETSTATUS length check
      i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
      i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
      i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
      i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
      i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
      i3c: mipi-i3c-hci: Stop rings gracefully when suspending
      i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
      i3c: mipi-i3c-hci: Remove invalid transfer size limit
      i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
      i3c: mipi-i3c-hci: Support configurable device NACK retries
      i3c: Restrict HDR modes to those supported by the bus and target
      i3c: mipi-i3c-hci: Add HDR-DDR support

 drivers/i3c/device.c                               |  15 ++-
 drivers/i3c/internals.h                            |   2 +
 drivers/i3c/master.c                               |  88 +++++++++++--
 drivers/i3c/master/mipi-i3c-hci/cmd.h              |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |  28 ++++-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 106 +++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  13 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 136 +++++++++++++++------
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   9 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |   5 +-
 include/linux/i3c/device.h                         |   4 +
 include/linux/i3c/master.h                         |   3 +
 include/linux/platform_data/mipi-i3c-hci.h         |   4 +
 15 files changed, 335 insertions(+), 88 deletions(-)


Regards
Adrian
