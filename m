Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B23B05A2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917202; cv=none; b=YRQCKL3korHn2UTvYT+4H3nRbGHqvdeODoFyf85emyzX/kn4NCsPZnG8aNVfCa8amrmFel19c1oiBIQZXQDyGey8FWzls9V8tsElV201jRAjjQJ25CKxQrdjrZgZmJWxyF048lKQ8B1Hzb3Ym4vI8wWZ5cRUyb8gFKNkiLidKLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917202; c=relaxed/simple;
	bh=xWAxiJsB2S9cTR761zPnD4UjD8OmMtzIcBR5k2bwwc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SC034BO+GwhUI047tqR7EJ2pD0wkvdk97XRHuWSuS3Mw9aJxFLMm+lgGgGYqxCC/+WYBTmcWnmYjDAc7Gis97oS//OM0XV/q0bxthX7rAUFq/gSW9vTXxvGhtuiIO7X9FBpFuH5XjdotSOntHYFXgGsdVzZqHG8sEL1R5vvS8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNTrsGtO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNTrsGtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917200; x=1821453200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xWAxiJsB2S9cTR761zPnD4UjD8OmMtzIcBR5k2bwwc8=;
  b=ZNTrsGtOgp291/7CYWYnUUtBgBpz2aiqD76JdTNNwqUmB4P3755bmO7b
   Lq5xrBMdeFgFqhh6xqAF4Nrj5G8Y7MHWkIn0gHjf1aQuSnZaUqUAUM0bb
   7NJqBOXLnidxoXTlYiBJlh2uilpduefBUgXajcjLlL78xh7Tya6qNKTFs
   YEHVyuS5Gb76glF9dot6Ie3uEGvDMFwRJr5pFw9Jfc85Ye6E5A00PHTZk
   ZKHdktsuwWDP5X0SboggnrENYBGy/GszC9n1W6QsdmwjS90Fw3teYFDgq
   qNBHtAhKdTOCrPgAsOAF5zDLPsY3m0HMlhM1t4p41bjBsoHPDlJWcC9OI
   w==;
X-CSE-ConnectionGUID: uBCvehNEQcuao5nds2yjlg==
X-CSE-MsgGUID: PENHQmLXT16LwF/wFjOPxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548458"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548458"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:20 -0700
X-CSE-ConnectionGUID: dSGlgXnuSxGkTTJMgPtn1g==
X-CSE-MsgGUID: Io3skMBtQzCX7P2V1R5xiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352425"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:19 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 10/17] i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
Date: Sun, 20 Sep 2026 18:12:40 +0300
Message-ID: <20260920151248.46936-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
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


Changes in V3:

	None

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

