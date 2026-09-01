Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7D337699;
	Tue,  1 Sep 2026 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232237; cv=none; b=mXw4XtZJjneK+Y9zJbj9ctdWwGHuehh9HUp4T0TUdmpM1m1HVIjNg8VbyZqnMccl2EMAS2jIo4Y623E9GYWxMKSgRfEw7NXjPSJ3tQyoVLrkTTTyV9OeL1o2xdeToI3KLwl5bDETDg0gX95+32PRzHglF9Gzzk/X3L/+cthWUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232237; c=relaxed/simple;
	bh=RXOnqEFuiTPcTiBJvmay0tVlElbYaZAdOsj4AR7J6MU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fppM4jOCLTouMwMZv1QvTmD8Seb5EvWtmwinFre0VuvkCl+0+avdnTi/qr5/IJz6FcfJZrHeJtwA+4eOSyqBRLJ8f9ayIzt4zRCigcul9hRqyyy7M/39EzAuUwBJngDIrN7ASgFnomlxReUj4ex+C7sRJb4N5kLJs6hCB0jwnQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/PSAybb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/PSAybb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788232234; x=1819768234;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RXOnqEFuiTPcTiBJvmay0tVlElbYaZAdOsj4AR7J6MU=;
  b=i/PSAybbqJJjsiTv28h4zJMWFVXdkw8ODT8L+lHmPZqB/bCrEx3PWr00
   oNxVQivE2zhbrSz2R2yDKX+oSmjKLzKxuGTX59FRQmlDoNxvvDSa+J7M3
   JXYOvffnBf8BFvKgxs1O9BYcYAUmQvmH56Yo/xUFmNk+r24HA/E0m+BdV
   tf9awVv+YA46/qFspYBnMtFV/mMVdyAXjRaIZlQFp6TiOT42Dmg9HbtnW
   +DYvVUde/d99om5X2b//UZzuOLlYn9iBIJPosKx0zK08xyO2XbpxghbSP
   2cc62GCFOE1lYN6Ny7yr/gO8Muzw0CWVLgpcGDt/VC9O8YWGz2Wn2ZyX7
   w==;
X-CSE-ConnectionGUID: K0FIrChGRsGFdSDw9f17Lw==
X-CSE-MsgGUID: HxOscLGOSMukQoSQRH4YYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111421282"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="111421282"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:10:29 -0700
X-CSE-ConnectionGUID: beLC63LbQEqTp3dzS7uTAA==
X-CSE-MsgGUID: J3VsElasR+GR+F8v37UHEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="264679830"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:10:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com,
	david.lin@intel.com
Subject: [PATCH] soundwire: cadence_master: wait and cancel cdns->work before clock stop
Date: Tue,  1 Sep 2026 11:10:19 +0800
Message-ID: <20260901031019.233254-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A peripheral event could happen during the clock stop process. We need
to wait for the event be handled before stopping the bus clock.
Otherwise, we will get the IO transfer timed out issue.

Fixes: af4cc917826f ("soundwire: cadence: mask Slave interrupt before stopping clock")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: David Lin <david.lin@intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
---
 drivers/soundwire/cadence_master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 6fa3739221ee..c41971f4f177 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1702,6 +1702,13 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
 		return 0;
 	}
 
+	/*
+	 * wait for any in-flight peripheral event handling to complete before stopping the clock.
+	 * No need to disable peripheral interrupts before canceling the work, as the peripheral
+	 * interrupts are already masked before the work is scheduled.
+	 */
+	cancel_work_sync(&cdns->work);
+
 	/*
 	 * Before entering clock stop we mask the Slave
 	 * interrupts. This helps avoid having to deal with e.g. a
-- 
2.43.0

