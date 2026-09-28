Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2037A843;
	Mon, 28 Sep 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593018; cv=none; b=DOPae21jEZc/l4763VjLMMxOzjkHsA2/er4Kl+BE4oMBOrc1S2MZ6H6xhJFea3HrbYwSeeIiDejR7z3wFmLXDTqjYZGPX50ybOa78Y4olxO9cGbxzZPToIrM7KF7QrGk2QxYExMZLF0ANdx4LGhM9XvEoMu5L0ZlEX4WVAhehJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593018; c=relaxed/simple;
	bh=MkFeP6/IUGbctPHCxkkp0pgvH9N3vuOac0bzy/eom8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4t15LxAfqqvdIGRIhi/I2qPT29HH5R0LxWU+j9k1dyLoF/ClznBor4d98CqTkCvB/nOK168RNhENwfB0ICDb1QvqlH3Q5jk/+e+qJ/5J7Rm0pztvvcb8uEnNjLZiDEqSatC0q47vXGxNopPZKmGc0lbMJi1St5q1TjlCMgt2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vi7jwbQy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vi7jwbQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790593017; x=1822129017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MkFeP6/IUGbctPHCxkkp0pgvH9N3vuOac0bzy/eom8Y=;
  b=Vi7jwbQyq/f7Bg/GXBWe2um6o8Be7BwHe+396wyI9MXmAz8ONaBWJD6G
   9qMyxSOzaRIwHMksULKqhxOsAzTBDzvU21EXqjttJIyKJ1+SetQvCnqNU
   HgYKfCEmZi2z3CwguWldNU3cNH0r3K0lVZxij+pIqJJjayRJck28vrLHx
   UQUtNNOtFOJ8NxJmrOXKB/nL9pLEJNPfS26uwa0R3EZ6Ej29axEKC3+wZ
   GY1fymQSUsBevR4ZCLenVhxC1/1ckMAQ3T0uoaXeaci6c0lS9BjbjF6zW
   PmqZLbTRI/lSvVTvfEyOFdO/QUKh2csmX5A0OI+QANrpck3+TNzwetnAY
   A==;
X-CSE-ConnectionGUID: VSyaTJ3RQ2GjcVVfdryCBA==
X-CSE-MsgGUID: DQ+ByBT3Tmi/yNcfwLD75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101857557"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="101857557"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:56:56 -0700
X-CSE-ConnectionGUID: uktShu6pTYWVFe48e1WR9A==
X-CSE-MsgGUID: DAHVpW5XQECHFgIPXpFo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274559684"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:56:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/2] soundwire: dmi-quirks: Disable ghost rt711 on Lenovo Yoga Slim 7
Date: Mon, 28 Sep 2026 18:56:40 +0800
Message-ID: <20260928105640.3014318-3-yung-chuan.liao@linux.intel.com>
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

The device reports both cs42l43 and rt711. But the rt711 codec does not
physically exist. Adding a quirk to disable the ghost device.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 0b4f5cec8cfd..11bd4d2681ab 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -111,6 +111,15 @@ static const struct adr_remap ghost_realtek[] = {
 	{}
 };
 
+static const struct adr_remap ghost_rt711[] = {
+	/* rt711 on link0 */
+	{
+		0x000030025d071101ull,
+		0x0000000000000000ull
+	},
+	{}
+};
+
 static const struct dmi_system_id adr_remap_quirk_table[] = {
 	/* TGL devices */
 	{
@@ -249,6 +258,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83R0"),
+		},
+		.driver_data = (void *)ghost_rt711,
+	},
 	{}
 };
 
-- 
2.43.0

