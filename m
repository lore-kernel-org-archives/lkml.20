Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7C4DA9B0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672463; cv=none; b=JAMEG29pAwQqPZIYcBqJV1SvvN7OUgyWADhapgAgBIYTZD+xMnmoziJgIdt7GisFN6esK+QVdm5WXKXksZOqGvj1Na8suh80EnlVn7RgWk41VGWRX+Jjm29emLYogrTucWAcn3hoYJYQjqtTw05rMX7XyRLmwraLams8FbP90Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672463; c=relaxed/simple;
	bh=zo0PaQvv5GZxszScqqbpKXsVnZVd98Zu3pcfugDqtRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=us/BtEXznqyU/CLqk3gi8asJj5LoxxA63VROwxP2p5WLzZiyOT0h1/Qnsz3jFUv0Ecn6X4WL5TTfrW7F3ng1+LOxeof43xslaryX4XQeB56iHoK7Yba2XatDXA8iI1VMUnNhN2H5wnrxUFKwTP9LQ/Vv0L/aOTj6oWdDYwmHTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chgdUmPq; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chgdUmPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672460; x=1821208460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zo0PaQvv5GZxszScqqbpKXsVnZVd98Zu3pcfugDqtRI=;
  b=chgdUmPq2GguP9hWsVT3m3jTad1rg3J6eZMdosOuvLTabP55AyARA/G1
   bL/4FCUIbNW1Bk6pmQ/FnCQ2Z5a3TzOHesLDELMY1nIkg/f+DvtWT8xUS
   tS2Ewk+xzlDNFW0tOXSzrwuVffmiXRKSNdDWnwceUAiz5GzT4itT7vdif
   c7GKTCUbaV7Dex/2y/S0krAiIRuMAP+2IRWjNdZdCVCCrEUAXadCyJecA
   bVia925uAMhtW1Ojj8Vl+KikkqWMEUhkAOCv5cEO/0+41eYP5Cuv2SK6Z
   y6xZe41LvKlWnZekjEY0KlFN6xxJYiOSSSNzaiXcNz0GzLt9A+HQ3C2LP
   A==;
X-CSE-ConnectionGUID: GHrS4Z1eRTO1UmQ3DprxGg==
X-CSE-MsgGUID: iSXtx4OgThyBJHCLvln+Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639920"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:20 -0700
X-CSE-ConnectionGUID: I40QUd+KTOOcSn1zzG2E1A==
X-CSE-MsgGUID: xqef9yJcQ4mGGJ3gYlvd0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271975"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 07/17] i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
Date: Thu, 17 Sep 2026 22:13:46 +0300
Message-ID: <20260917191356.133242-8-adrian.hunter@intel.com>
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

Reorder i3c_hci_disable_ibi() so that DISEC is sent before IBIs are
disabled at the controller.

This matches the sequence used by other I3C controller drivers.  It also
avoids dropping an IBI that races with the disable operation: an IBI
received after DISEC is issued but before the controller disables IBIs
can still be processed normally.  Once DISEC has been sent, the hardware
can be updated to NACK subsequent IBIs and complete the teardown.

No functional change is intended beyond aligning the ordering with other
drivers and handling the race window consistently.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 166d9f70f435..f6a34ce7a295 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -719,13 +719,14 @@ static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	__i3c_hci_disable_ibi(hci, dev);
 	/*
-	 * The DAT entry is now set to NACK and DISEC this target's IBIs, so
+	 * The DAT entry will be set to NACK and DISEC this target's IBIs, so
 	 * the IBI teardown can proceed even if DISEC below fails, so ignore
 	 * errors.
 	 */
 	i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+
+	__i3c_hci_disable_ibi(hci, dev);
 	return 0;
 }
 
-- 
2.53.0

