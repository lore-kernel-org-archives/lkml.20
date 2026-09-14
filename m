Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E5444A40E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385441; cv=none; b=N/4FcpwZ7hMuUfYGCcPBa8Rk66Ezjxcnnd7q1U8NMpwD0cgyGo3xigxj4xHW7LQb4t6SPpm7rJFrdmr+SXdKTjldvAmGnSTdktc3rGwqdf2FGke4f4/1lsLRqfp3eHoBzOKlEdUzAi93FNk0Xc0UojKH4/QKru/tE29vtKASIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385441; c=relaxed/simple;
	bh=r+ZTRq04/da2FulXzBrZfzIpHT5wTApRP4uUwcGR/08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJD03GpVzh+jHFgUs1ZXUjKAmbwj6Hr5BgKcscJmruXPsE+ZvUDMN+cJ8OJ/6DFGwjHtA2EgRS8pvngUnHENOX5Vo1RtOexSWHBuz07Y9plPz+Lec/ECt1j+Sc/Sl+xEgewt4wubzUZYglorCNuCxT1S5tdKkFhZW515uzzt/d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOsHmlV1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOsHmlV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385439; x=1820921439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r+ZTRq04/da2FulXzBrZfzIpHT5wTApRP4uUwcGR/08=;
  b=aOsHmlV1UADnK1SOZLSFJXi+/odUKuHUw+9K84ZRDMdNYNVulZ0B5ay1
   ZU17chrT4X8/iv6WTATrDIO9vATXnfAqq8Zefmp0FhqlhFwyZhWqtlxMH
   isf0fe13J423XBjOfQY4ut4sJqEyjuZmGfeJQz2eMgL1oyikPSuEJjBai
   CTtsnUY5I2RmL28+biWT2HoWfF9uDnUXEa67nFeGoZ5Yv6q8Mfdqt8X4z
   A+ZGbU4Jvuk3gkkxHn3nF7ikoQIABsAtJuBCKuqbZXif+YaLt0khPETUP
   Og8RQJr4KJh9HU19fZPaGFRyjrHJfWV2/ZKl2UJ+cqPz4bIiLxht+6lf7
   Q==;
X-CSE-ConnectionGUID: YZKW4hVIS5+pM4m+xPri7A==
X-CSE-MsgGUID: mRq9pz1uTRqTwOOZY0TTSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864478"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864478"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:38 -0700
X-CSE-ConnectionGUID: 914HaxqjRyCOAFelUSi99A==
X-CSE-MsgGUID: dh+jcHmXTDa9c/FBiJYYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133138"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:37 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/17] i3c: mipi-i3c-hci: Stop rings gracefully when suspending
Date: Mon, 14 Sep 2026 14:29:57 +0300
Message-ID: <20260914113003.183150-12-adrian.hunter@intel.com>
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

hci_dma_suspend() tore the rings down with a single write of zero to
RH_RING_CONTROL, clearing the RS and ENABLE fields together and without
waiting for the ring to stop.  I3C HCI v1.1 section 6.1.2 separates those
steps: clear RS for all running Ring Bundles, and only then clear ENABLE
for all enabled Ring Bundles.

The ring registers were also written outside hci->lock, while the
interrupt handler, which takes that lock, could still be running on
another CPU.  i3c_hci_sync_irq_inactive() was called only afterwards.

Finally, an IBI can still be sitting in the IBI Status Ring when suspend
runs.  Clearing HC_CONTROL.BUS_ENABLE is deferred: per the description of
that field, if a disable request occurs while receiving an IBI, the
actual disabling does not occur until reception of the IBI is complete.

Instead, clear RS under hci->lock, wait for RING_STATUS_RUNNING to clear,
and make the interrupt handler inactive.  Only then disable the ring
interrupt signals, drain anything left in the IBI ring, and clear ENABLE.

Fixes: 816958720443 ("i3c: mipi-i3c-hci: Add DMA suspend and resume support")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 46 ++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index ec4b469abd33..9c163ee4d215 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include "hci.h"
 #include "cmd.h"
@@ -1052,19 +1053,56 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 	return handled;
 }
 
+#define RING_STOP_TIMEOUT_US	(100 * USEC_PER_MSEC)
+#define RING_STOP_SLEEP_US	100
+
 static void hci_dma_suspend(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings = hci->io_data;
 	int n = rings ? rings->total : 0;
+	struct hci_rh_data *rh;
+	u32 regval;
 
-	for (int i = 0; i < n; i++) {
-		struct hci_rh_data *rh = &rings->headers[i];
+	/* Gracefully stop the rings */
+	scoped_guard(spinlock_irqsave, &hci->lock) {
+		for (int i = 0; i < n; i++) {
+			rh = &rings->headers[i];
+			regval = rh_reg_read(RING_CONTROL);
+			if (regval & RING_CTRL_RUN_STOP)
+				rh_reg_write(RING_CONTROL, regval & ~RING_CTRL_RUN_STOP);
+		}
+	}
 
-		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
-		rh_reg_write(RING_CONTROL, 0);
+	/* Wait for actual stop */
+	for (int i = 0; i < n; i++) {
+		rh = &rings->headers[i];
+		if (readx_poll_timeout(readl, rh->regs + RH_RING_STATUS, regval,
+				       !(regval & RING_STATUS_RUNNING),
+				       RING_STOP_SLEEP_US, RING_STOP_TIMEOUT_US))
+			dev_err(&hci->master.dev, "%s: Ring did not stop, status %#x\n",
+				__func__, regval);
 	}
 
+	/*
+	 * With the rings stopped, no more IBIs can be received. Flush and make
+	 * the interrupt handler inactive.
+	 */
 	i3c_hci_sync_irq_inactive(hci);
+
+	/* Disable interrupt signals and disable the rings */
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		for (int i = 0; i < n; i++) {
+			rh = &rings->headers[i];
+			rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+			/*
+			 * Be absolutely certain there is no unprocessed IBI.
+			 * hci_dma_drain_ibi_ring() will do nothing if there is
+			 * none.
+			 */
+			if (i < IBI_RINGS)
+				hci_dma_drain_ibi_ring(hci, rh);
+			rh_reg_write(RING_CONTROL, 0);
+		}
 }
 
 static void hci_dma_resume(struct i3c_hci *hci)
-- 
2.53.0

