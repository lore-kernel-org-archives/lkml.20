Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92F33AD85;
	Tue,  1 Sep 2026 03:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231804; cv=none; b=KZv2ZPTFuXame0zxlqo/wBViHk47Pn/K79qjpIK4FLEMU+gH9pyvEBMat/BAW3MFVgWZvAbqNOeBzjyliFmTjGR4Z+WSSQd/hafhfyOS7jEqhIMpU5R3nAy31kviRTahk6a4AKleB/SIXS1g+C2Iv1hDrxlBzalKfqHvaLy183k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231804; c=relaxed/simple;
	bh=Vh9yn8AOoLZrw8IExJUFV06Tkc6vhee21CB9CIKV1XE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rPkrua8KmzhlV22T5nqPUSk4N5CMxsrlXKsF+yuoHa/R4cQoMeitWgpkRtxpY6tYCTPwYaX+GrV0tActRe9MYpcp5Tt3GmldhOYvp3pInhqHg8AA2soiFtbdZ+seWdh3UKSX3I4E/y1yseXz3Q5hyGccQNbWCResfmF0HAqKE1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrHUfQJr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrHUfQJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788231802; x=1819767802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vh9yn8AOoLZrw8IExJUFV06Tkc6vhee21CB9CIKV1XE=;
  b=MrHUfQJrsuvPNvacLVmDP/2+wbCiVpeRFHlBlQdkpjCIk8s226ORD6AO
   oQHhuzTegi08E/nzfvhJFYABC/Vks/JYklSbYkD7NS5sbLBcnDt+dHBal
   YWmSyzs6TUq4/mLMAVbMZI0R6pfRPZtSPoRBDaCopq+n27EsBHEJXQDwk
   pJMy7/ah0DCU0YLXxNxf9uGZ/xL7uLMXxTAFKNoxZglFZxyHNrSiddMCZ
   JB6yAod8cbZmKXGpUacX/yk8V3dV5dJ7z1tjut5IWoE5ZWGNsMuVSF/a7
   zbYz2jFOlODLgmjLpJ3DtiE5DwLc4UUkAijeXmc0znor2TFIEde9UsVVA
   w==;
X-CSE-ConnectionGUID: 4swJl7Z4SqiRGHeavUAu/w==
X-CSE-MsgGUID: 6BGUI/dgS2uQY9YEM9zZ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87785633"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87785633"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:21 -0700
X-CSE-ConnectionGUID: ytU1b5bcT1OUUQyV9Qla5A==
X-CSE-MsgGUID: qqTfeFnlQGWtpCnP62+IBQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 0/3] soundwire: bus: re-enable CLOCK_STOP_MODE1 support
Date: Tue,  1 Sep 2026 11:03:08 +0800
Message-ID: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add CLOCK_STOP_MODE1 back to allow the peripheral to utilize it when
the clock is stopped.
This mode is designed for power-sensitive devices as it enables a deeper
power-saving state, although it does not retain the peripheral's state
during the clock stop.

v2:
 - check slave->probed before looking at the driver to avoid NULL pointer
   dereference.
 - add wake_enable parameter to stop_bus ops to stop the clock but keep the
   bus unwakeable during system suspend.

Bard Liao (3):
  soundwire: bus: add CLOCK_STOP_MODE1 support back
  soundwire: Intel: add wake_enable parameter to stop_bus ops
  soundwire: Intel: stop sdw clock in system suspend

 drivers/soundwire/bus.c              | 54 +++++++++++++++++-----------
 drivers/soundwire/intel.h            |  6 ++--
 drivers/soundwire/intel_auxdevice.c  |  7 ++--
 drivers/soundwire/intel_bus_common.c |  8 ++---
 include/linux/soundwire/sdw.h        |  4 +++
 include/linux/soundwire/sdw_intel.h  |  2 +-
 6 files changed, 50 insertions(+), 31 deletions(-)

-- 
2.43.0

