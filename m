Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F54E5338
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672468; cv=none; b=OenaCTP9iZFPGHa/3ZS2VTQH31RsfVINU/F34NoMFxvYj1Jpf+sBWcD/NlHTMYGldOSg8GqNdJ/uOO3DA3lbZsnIurMxeCmO75qYr7J/QDZU3a6P2t/agQ230DRm+jmc52TV6/fa8s91OC7nKBITryTllQ5ZJK66HYVepOI6WnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672468; c=relaxed/simple;
	bh=ndUTy+p4P/3v17/WTTG+6wSK8dPeO8hrUFYYv8YPkbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqKA47vIKoKT9L9FgQp3Z2oQeceYfQMNv9ZBEb+cSoOH3FYYRbVJCzWHMc2gSLjxgDnjd90qSEZ+FO8WHCUZTTOpGFL4Y1Vpomf+VhXlOtPEJ1Uwa/Vi7/gG3jai5qWtynu/lYPD2fpo4yLQykHs9NjI7+lzN7F+0hsvLU+shuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Din+gaT2; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Din+gaT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672466; x=1821208466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ndUTy+p4P/3v17/WTTG+6wSK8dPeO8hrUFYYv8YPkbE=;
  b=Din+gaT2vG6V3EyJRp+4hgPOCRkWokhj2zvnwJ5TIytMSZIeAGNxWpLx
   jSkEboOovQ/uP+tDrdE2p1rXNwAUJsCmj1DCP6EbhVtRdeP+T5IR5nAMM
   Czk/2exhhJ6R8bqkKTqIEzZnVUe7qTFpkQGz1GyeWj0a/PFkd8FUVlaFC
   MoxCi0t07TE6eaBW65XliyRjJ9ebMHCQv9Zlm7M7tnjahHsqOwN2BTlYX
   lJvjYZGYPR6USpBXvkx0cv26NhMqiXJEfQuKQZtX3Y/WbrAmRiyAlube8
   1X3tgcAkBiLHEKf+TdUB5Tpy//NlaEXxcqCxI8ArzGdgxRS8mt829AqkX
   Q==;
X-CSE-ConnectionGUID: JNmCu0wBQZ2CjXpAheew8w==
X-CSE-MsgGUID: d5saxTWbRX22g4XMz10lRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639939"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:26 -0700
X-CSE-ConnectionGUID: XHJNnCG6SSycz2wksgzDnQ==
X-CSE-MsgGUID: X7qKkmUlQoKji7vrOeSlfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271988"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:24 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/17] i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
Date: Thu, 17 Sep 2026 22:13:49 +0300
Message-ID: <20260917191356.133242-11-adrian.hunter@intel.com>
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

Relocate hci_dma_suspend() and hci_dma_resume() closer to the DMA IO
operations table in preparation for upcoming changes.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index a798b0648922..ec4b469abd33 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -273,29 +273,6 @@ static void hci_dma_init_rings(struct i3c_hci *hci)
 		hci_dma_init_rh(hci, &rings->headers[i], i);
 }
 
-static void hci_dma_suspend(struct i3c_hci *hci)
-{
-	struct hci_rings_data *rings = hci->io_data;
-	int n = rings ? rings->total : 0;
-
-	for (int i = 0; i < n; i++) {
-		struct hci_rh_data *rh = &rings->headers[i];
-
-		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
-		rh_reg_write(RING_CONTROL, 0);
-	}
-
-	i3c_hci_sync_irq_inactive(hci);
-}
-
-static void hci_dma_resume(struct i3c_hci *hci)
-{
-	struct hci_rings_data *rings = hci->io_data;
-
-	if (rings)
-		hci_dma_init_rings(hci);
-}
-
 static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
@@ -1075,6 +1052,29 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 	return handled;
 }
 
+static void hci_dma_suspend(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	int n = rings ? rings->total : 0;
+
+	for (int i = 0; i < n; i++) {
+		struct hci_rh_data *rh = &rings->headers[i];
+
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+		rh_reg_write(RING_CONTROL, 0);
+	}
+
+	i3c_hci_sync_irq_inactive(hci);
+}
+
+static void hci_dma_resume(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+
+	if (rings)
+		hci_dma_init_rings(hci);
+}
+
 const struct hci_io_ops mipi_i3c_hci_dma = {
 	.init			= hci_dma_init,
 	.cleanup		= hci_dma_cleanup,
-- 
2.53.0

