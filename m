Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9BD46AA88;
	Mon, 28 Sep 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593016; cv=none; b=IKXO46KpvKqf2l/Lmcdb6907pXUx9sgMi8HFM1Oro0Mq1fWB+tK6AaC4bfcJbVXzj2RYd5/sSJDnX5taYgEoIN6cpoK3413kqSs5kwUMkmpf6MsSscJXGVkr/aUwHMt9+HkoDhuzjQEAcBDJLdLT/1S8rxakEEuRfnvnXqHx/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593016; c=relaxed/simple;
	bh=OwmtVl1WVrvjj5XSnNIGOFIhDbNRedd7Pj9lbKYaalU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ry7ZII8Ys/0ONz11lFgV0eu87oOTpByJBzbUVR8bZoPZzRp3AlSSdratSUshLClxK/eaIoMnaCkb6rPj8NU2p9ksOZBRClXg3/ObX7dMCmkb19nYmvWRg3P1bCiIInBHyUt7TGU6hyppabTuZO3M2PJdRDh0xlvh9VgQp8z9lZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuABtE2Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuABtE2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790593015; x=1822129015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OwmtVl1WVrvjj5XSnNIGOFIhDbNRedd7Pj9lbKYaalU=;
  b=DuABtE2YjhFPeGKk/koBjtwbfL81ALfci88AFzOIn+D5nhxkCpDURmmT
   nweWNPQgflf5ZHtcjkXZkgr23FQ3q9s2jHUM4NkOQ3IjcedGPoxt+EUO7
   /Q7xjEqG46tzKhh3/utu8F9uPYXia/3NbQyuJP48SN02NcK+rIX1sohxl
   hbznCdsiJ03b/zaiZD8USeZpaUUmT1vMkKyLnGwZpbtisZ5BV8qgEThDC
   6L0zWzNPI9tQ49tcbEk42dxWHefOOa520zX8gMbim60OLoUFgKqzW+zjI
   fZ0TSviUfAYkawD5yb9nUxlcZR6hexmnNMpVvLsarmjg27WXo9pMMs2f9
   w==;
X-CSE-ConnectionGUID: O4Ss2VWaTCOLEreKiz/yPw==
X-CSE-MsgGUID: A2TI82PBTk+tPN4yqItuiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101857550"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="101857550"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:56:55 -0700
X-CSE-ConnectionGUID: HybPG6ASStu5e3dmMUoymQ==
X-CSE-MsgGUID: fS9FHTK/RL6xXYrWyB4QVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274559677"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:56:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/2] soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro
Date: Mon, 28 Sep 2026 18:56:39 +0800
Message-ID: <20260928105640.3014318-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928105640.3014318-1-yung-chuan.liao@linux.intel.com>
References: <20260928105640.3014318-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another Lenovo module that has a Realtek device in the ACPI that
doesn't exist in the physical hardware.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 72e59b50b685..0b4f5cec8cfd 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -235,6 +235,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83SN"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.43.0

