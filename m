Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B863443C3A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759051; cv=none; b=bzPy1G994WBZcjNfpNkEZYUuK7VDsmgp141Dc3pK/pUH8157SLFj/fpGcdXhccDLJwwr851VXPN4QRLkw0OKQa4fXRykTee2ieogN7d7hj3Zl138pJjAS1TlxowpPmyfdvXiC+/I308d5P3OIj084GO/kd3qg0u4ag2prJrwHz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759051; c=relaxed/simple;
	bh=9ky0IW3EitQYC5fFyUFcWYGFGcICMCuO7b24arrXqfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HPU3rqA9WP0bB2b8nUBJCW5KIj/cXJK9fhSL99gb/vm/IBpM3lGkdYKsKRjfB1TFiyMKxp2KxdrLH1P0SzLbIzFoLy9/+y5abXZHTxAbRcYu+hXuzaf8q5uHJVVcGFjRgfyBH0U7pxktYV713BVKlWQkUyMrPtSiqJcFeoQu238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HI92Dgpy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HI92Dgpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759049; x=1822295049;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9ky0IW3EitQYC5fFyUFcWYGFGcICMCuO7b24arrXqfY=;
  b=HI92DgpycrpKoHhLASnjm+3SyJrxJEGiI9rgw/LabvhElhKfZlGlPaon
   Hq38U5Rs/GPou3Rtl+OvuFNXHDRa/Z5ccLyTupaJfIf/MDwZatbYTD0YC
   U7UfjYMKxrgGtabwYpa+jvAn0D0bS/nStVrG+Pz+8+T/4ArLHTvFPnpZ1
   OLvt70IJTw9JRgbDK5ijhqp+0dsEZJKo+zx7PqNxiFrlCb6Zt+CdAIfmE
   IdOGYkEG3qU8I058fvmTJ8NBJX7vC1/iTDKRVmdPZHhanAGUfjEm6gwHt
   AD664xNVlVfIBis//S52SutHgqs7jkRZTcQ5BtdVdz4BbaYeIId9aa6Us
   w==;
X-CSE-ConnectionGUID: lZbg77nGSBay5Vi57P5pnA==
X-CSE-MsgGUID: uZRylfpHQhOpus1WKgpPvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90621780"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90621780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:04:09 -0700
X-CSE-ConnectionGUID: IYhwnEZ7RsyYP3E4UuiqCQ==
X-CSE-MsgGUID: 8DQwwxzYShWtBM5ykfjEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275188571"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 02:04:07 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 0/7] media: ipu6: add IPU8 support
Date: Wed, 30 Sep 2026 12:01:41 +0300
Message-ID: <20260930090148.3980652-1-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds IPU8 support to the unified ipu6 driver, following the
same enablement already used for IPU7/IPU7P5, and ports it from
drivers/staging/media/ipu7 where it already exists.

It adds the IPU8 PCI ID, InSys ABI updates, and the chip/MMU bring-up
(NDE control, TSC sync, MMU hardware tables) needed to boot IPU8
firmware. IS_IPU7() and IS_IPU8() are kept as independent checks rather
than folding IPU8 into IS_IPU7(), so each call site states explicitly
which hardware it applies to.

Tested on IPU8 hardware.

Divyamani Tripathi (7):
  media: ipu6: update ipu7 InSys ABI to 1.2.1.20251215_224531
  media: ipu6: add IS_IPU8() macro
  media: ipu6: add IPU8 InSys ABI 1.0.14 support
  media: ipu6: make ipu7 gpreg stride configurable as per IPU version
  media: ipu6: add IPU8 isys chip/MMU enablement
  media: ipu6: add IPU8 psys MMU table and PLL power sequencing
  media: ipu6: add PCI ID for IPU8

 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  61 +++-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  15 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  14 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   3 +
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   4 +-
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |   6 +
 drivers/media/pci/intel/ipu6/ipu6.c           |  59 +++-
 drivers/media/pci/intel/ipu6/ipu6.h           |   5 +
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  83 +++++-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h   |  78 +++++-
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.c  |   6 +-
 .../pci/intel/ipu6/ipu7-isys-csi2-regs.h      |   2 +
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c    | 262 +++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h    | 115 ++++++++
 include/media/ipu6-pci-table.h                |   2 +
 16 files changed, 672 insertions(+), 45 deletions(-)

-- 
2.43.0

