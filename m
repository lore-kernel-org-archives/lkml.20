Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29C3449B1C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385438; cv=none; b=FMlpwIzV1mfS6toG4ZbysnOItwhM7ZpH2nm3t2rhuF47F85ZC1dd6g+xhHDIm5fW13mMPlc/hLfAuj1SF8SsTKHau6SPoBvpAr6Vf62EIGRWd9Z45kNLpS5n8IV7fcqJw4wtnPCDXh/xYdZOxmd7T66att3B/CFzOkoMiIEOlO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385438; c=relaxed/simple;
	bh=7PFCDBL1XCn5xWL3dGQDx2EHjE+3ttPehJpb2mg7c5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuFpChx0qYLnQmKWNf/+ysfLa97Ihbo2L52iCkCAQtST7TX8YryauOkS0RCjU0uz9l7/6gVa8Lo3cxVH2zWKETM2JQURiXGN83aLL9a9Zbo1v6jodx2wMpitc5Km9Kuslx24BazHcRaQ60xb0okCkQfNiVjLFfHD2OleYvtFLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFVgSjj2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFVgSjj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385436; x=1820921436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7PFCDBL1XCn5xWL3dGQDx2EHjE+3ttPehJpb2mg7c5U=;
  b=IFVgSjj2wMlOVgma+1RP6PNwcBpoL4eRgamIOwebD2kGZx2yjFDmVQmP
   Fzmko/VwfPai6wiTEHjNCaH/h0DtXC599xCP5Ez+kyYXWZuU5dynL8soR
   jIIIpGVwPp7Rt8yGuJWcjgyP+4vdpjmZo0rbH7DvCaGXU7tbhIyHoGF6E
   WqFDmFkuzAS2vcfQ5quVQb84dJC2Zhsn2duNv+eaf55mK4u+Zwg4B9BtP
   DC6S4sON/Dls75kL9ylPrm3eLpzz9618FAMt/aOm1JkSnvTNldA3Fr25j
   QnBqMf4grxjfaa4tD7yR3WNcxTso1uLCR8hNN62dmtsR7SDRoD21rmJPK
   w==;
X-CSE-ConnectionGUID: nA6mVIdLTHiNnTYfhb4BSQ==
X-CSE-MsgGUID: fdgoCe6zTqKst1St/6pccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864470"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:36 -0700
X-CSE-ConnectionGUID: BXjy2mclSPudj4jP4c+Nig==
X-CSE-MsgGUID: VOtHFmdqScmOysEwpiToVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133133"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:35 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/17] i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
Date: Mon, 14 Sep 2026 14:29:56 +0300
Message-ID: <20260914113003.183150-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
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
---
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

