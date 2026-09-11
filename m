Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22D2F2619;
	Fri, 11 Sep 2026 00:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088068; cv=none; b=OCrHXYkyvUmoyqvgSRhteyP9DzMH2Ei54ND6ncumt6kp9WM5c5XTn3t00qZtqflAz/gfw61RnlnM4H0mm9+4b0bmdrH3iXXj168KhnBCPE91sw8H/wnncWTyEymCb2o/2tJUbTIfXMFcRdUNOc0nzPeW+75y8xaeE6lEb6KL7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088068; c=relaxed/simple;
	bh=OwmtVl1WVrvjj5XSnNIGOFIhDbNRedd7Pj9lbKYaalU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C1xxQgSPF7yEcYgXJyMOyFcN1KlHrHKtbcIhTkmLyNKyRoSvdl35rXC7JnkFN2E7ifrVrj1m18+BH+1ftH5uz69TFk7/2J/qO3dE71+laKyP1BXXlq9EaYtmqX3gipwRH+IlsJdYALjJUfwmwGd1kw+YRN8HEmAUu7ff2YNmfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+ZiRj/I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+ZiRj/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789088068; x=1820624068;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OwmtVl1WVrvjj5XSnNIGOFIhDbNRedd7Pj9lbKYaalU=;
  b=S+ZiRj/IsyIaXG/kyh1l1X867KodUBhxzqRWK6+8iATOyw1gER+SkW1J
   vebp7xzCw0RvesfMjV2RftT7RQkH3gClY7FfI3QHEnImf9siRMwxY0U8L
   c0bkf49UH/EBdV0Qb3GtxxEaAiJtwOWzbz3solQUmIqCzgR3hVOTofsrD
   7/aNKcTOInLzb7Xqkm6RoKFe7LDCuLMZ0a+/oIt7a73EjMpa+8kH0t4Ds
   1z9Hrqv1hY5nRNGFvwRv3d23lPi3WRsLZehy6uYJly/K9wurLS74rfpUZ
   PntV0cTvCHHAS74w3NjPbXiyYneoSfdOqpzx37IQ//5e2g3vNU81giUrj
   g==;
X-CSE-ConnectionGUID: YEyBpyHNQ/uFnXipym6kEQ==
X-CSE-MsgGUID: t8v87GBKSA629C7dyL4Viw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89565915"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89565915"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 17:54:27 -0700
X-CSE-ConnectionGUID: V+nwWiuhRBS/1JmboJOPcQ==
X-CSE-MsgGUID: 2bVHKFTZRlS5EOLlSZCw3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="271311658"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 17:54:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com,
	ckeepax@opensource.cirrus.com
Subject: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro
Date: Fri, 11 Sep 2026 08:54:18 +0800
Message-ID: <20260911005418.1416726-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

