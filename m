Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834417C203;
	Tue,  1 Sep 2026 01:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226105; cv=none; b=q/X/gniB+PQawcGT4FoQOEuYD1qWFcZbl7RHW16Vfl7seitMpvF3iuM4ofB/uyra0AeA1DxHls5c563WQnovfpHl293taq3pfJbCa2A4MnDugCizpDY4VtWyQdnJJOBffUpUJzVgwLTUpv+ZrTJpha/Dcy6FBXKHwiUZ5Gld2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226105; c=relaxed/simple;
	bh=sgvbyFeVDD2VUkE72Rfyoj6DToIUZ1P9nyimssBtAYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCv3jBCvjhE6609laXPFuMUmPyxkp6B1G5G0TfD4U7DK/80qiWkp5futClIJurIScDJ3cixjRnMcc0bR9aHHlihSvbHoaFsGc3gCEqVDybBSQykrOV6k2aY0QrDrP96pjQUmDoBqmnJ2k0/vuwiWVyLrDikkF4i7zDa6ce88A+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBiDoplN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBiDoplN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788226103; x=1819762103;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sgvbyFeVDD2VUkE72Rfyoj6DToIUZ1P9nyimssBtAYM=;
  b=TBiDoplN3QHTJHfelsv36nF1+5y9sQy3avl0RzCc4lGEgPZztIRwQWSU
   xW/fkEfwgmQV60/dxXuYuUGFS2Tq44lK1g4OD5Uef4uKbczqGUvcCCu+I
   ClVpw9bjOgI0yE6Yi1UsQ3xaTTAaCtVZkCA6BEuKsOCRQYYrB6Fpa/3cU
   c0HYjDmqyuv61oLtcK9YU3aG7AFDONUArlHy87X3Gjmj9VQDp53uC2VKO
   IRxg3naef3H5PJuLV4dh/PoU2N7jEtJRjO7xpnlN9v5zMujFcgcjOXIKn
   JICIyuFT10y01WuU58Uq9WinqLCh6f5XA3/LliOq1iVXzyNDovPQ/MHRi
   A==;
X-CSE-ConnectionGUID: JK7kT05WRjyO3rw6Pjrw/g==
X-CSE-MsgGUID: DslhQs5bSSOi7NQ6eZ5X+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87779154"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87779154"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:28:22 -0700
X-CSE-ConnectionGUID: hvwh1JSpQRe2HFtTFfoCZA==
X-CSE-MsgGUID: ZnP5uCpOQ/GRnsmiJ/kvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="262815950"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:28:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com,
	niranjan.hy@ti.com
Subject: [PATCH] soundwire: intel_auxdevice: add tac5xx2 family to wake_capable_list
Date: Tue,  1 Sep 2026 09:28:12 +0800
Message-ID: <20260901012812.231057-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niranjan H Y <niranjan.hy@ti.com>

Add tac5572, tac5682 to the wake_capable_list as it can generate jack
events whilst the bus is stopped.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index a8407560bf4f..f5124621c52f 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -74,6 +74,8 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x025d, 0x721},
 	{0x025d, 0x722},
 	{0x04b3, 0x9356},
+	{0x0102, 0x5572},
+	{0x0102, 0x5682},
 };
 
 static bool is_wake_capable(struct sdw_slave *slave)
-- 
2.43.0

