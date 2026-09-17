Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E04E36C5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672460; cv=none; b=cjrgyke26VvXOSWPbe6IP99xY00AuyELu1LVYsVv1Mxlx+dm+FE33jjqYUSENclRkTUgFeVBUYGEWz1yOCzzNum5vcz8o343zlXR3tPilve+F6m6z8oo2eBuTfC3/WQpccSFOr4CrACwsdgirq8sdlkbQy7jxWqpvfGGI73N+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672460; c=relaxed/simple;
	bh=Ygh1Shgl/gNfzc7vwVHMLOMwehx0u2/hUTIwlKl3shI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xqfl1yorSaHnI4Ca+vzKp298leOSuids22bZ71j614d2gsv0LdeR+L6yvwdrFQaxHfzVqv8SSY/KN2w40kSj3vxEVQmwHv47XzyiPe9a9ulg8dKDJigVsRkgsDmiKXtIqbogJLSm0HSnIKEwvuvRT2jV3p+K1if/RpEZl9qxsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekepH2t4; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekepH2t4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672458; x=1821208458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ygh1Shgl/gNfzc7vwVHMLOMwehx0u2/hUTIwlKl3shI=;
  b=ekepH2t4sdK26mtE11Qk9nFc9EMVCDt+utGnT5tJfjPo0Ju9JJt2vnWY
   3tag3B2ZLPp+8zoYRX4G7TzUQL6uHAEHFvPWC56V70zKDy05z1TbEGuS5
   vaklR0bDREeePfcyJNNHDfImpvSU6QPOUTWC0gSXwT2kJPsFJfxxV0XVy
   ZYQHDjzIvEz+ThiDVTI0lLCiMVo1Li3rqQ5BZFcjK75Y37FW9Tgiwnp/X
   L0Mn6oD9YFPxLSxjtdTkaypKQ9k/af+fFzGrgA2Fl0vRvWJ+NoS+HvBUJ
   dK6hGkQ5OYb34JYfb1h8r5OjBo+6MOuFsxj/wTWX3gVpobVgYszT95wyR
   g==;
X-CSE-ConnectionGUID: 2gIXrpb/S62OCQGHrCdjDw==
X-CSE-MsgGUID: ZyMiRgkdS1ygkcNhU2Qu8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639912"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:18 -0700
X-CSE-ConnectionGUID: PoIuiAs9TTSL9nP2JA51vA==
X-CSE-MsgGUID: s2ADALTDQRq8roI4ZaniFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271971"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:16 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/17] i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
Date: Thu, 17 Sep 2026 22:13:45 +0300
Message-ID: <20260917191356.133242-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

i3c_hci_enable_ibi() performs controller-side setup before sending the
ENEC CCC to enable IBIs on the target.  If the ENEC CCC fails, the
function returns an error but leaves the controller configured as if IBI
enabling had succeeded.

Fix the error path by undoing the earlier setup when the ENEC CCC fails,
ensuring the controller state remains consistent with the failed enable
operation.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix i3c_hci_enable_ibi() error path", to say what the patch does
	rather than that it fixes something.


 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8b3a87d8a8bb..166d9f70f435 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -703,11 +703,15 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	int ret;
 
 	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
 	scoped_guard(spinlock_irqsave, &hci->lock)
 		hci->ibi_devs[dev_data->dat_idx] = dev;
-	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (ret)
+		__i3c_hci_disable_ibi(hci, dev);
+	return ret;
 }
 
 static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
-- 
2.53.0

