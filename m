Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165F4343F2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917204; cv=none; b=SsADzGHw8wIRxsme9q70Q13R/9F8pW/hu1Za0GU79mMXA415KIa0DNVOJULdnEvjX+3VaF448Hp9T7D8aiVQzdCVenLvASAmXTDmUfrsx2mHVnGFQRvnjwoY0r/8We2hpuSkVPcAAagb1IHgA9S2fcpldT3ODijB0HWXxflFf0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917204; c=relaxed/simple;
	bh=O1bT9JClnxBxa+NUulEV7MhDhC40eXMuB6Qa0vdmU9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6ZTumENOfVAj2Z3//9jcZx1pfqoLIv19dMAeSpBRMtCKv8A0jx1yA/Ug43yhyN8AOteZd7zHRdXQxgOoBKAZpRc8qRHEikk4kJIDzUYRyb6sSr5k3rMUzzljijR8MhJEmnF2KjqPIUcJHb595fdTsMFX+G/KGUxfpJzmnHDSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8Q04VPJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8Q04VPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917202; x=1821453202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O1bT9JClnxBxa+NUulEV7MhDhC40eXMuB6Qa0vdmU9g=;
  b=l8Q04VPJs9cO3WaCRLJx1z+gb/9NRxcvNJwk9X2xOi/U1JiGzVigKNUR
   VyI1jlteoBXePkuLo18/AN+WUa3sf7eEq9q473YlzdBVwdaXf6Taj9k3d
   Z/qzKEPnel7OGCa1StksXI1597iFsTiRx0px1ME2i+0Znc3E89SIY7dv1
   xGhkuqnVHe279ub2lvcjplQQ1cM400b1EwNxTe97QJyc8fr7oU2nYM8G+
   hfvud0eRzwUCFfQucLDFOiD6xX0BcqpM6hoRqK7lqErArvcq53+WK9qkZ
   HCUaLHF3qY4Gcm4oXFVMRKv3kaV+6vTTqf5hUf08IVoxIwMbtzy0exxNo
   A==;
X-CSE-ConnectionGUID: v1zSsmQ5SWGhNfy0fYfGoA==
X-CSE-MsgGUID: AtTxKC/STzKsRHT4HmsJ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548466"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548466"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:22 -0700
X-CSE-ConnectionGUID: c7sopgEsQBOEuL1vp/bbHg==
X-CSE-MsgGUID: 8nf980mzRP2zA9PgSb69Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352431"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:21 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 11/17] i3c: mipi-i3c-hci: Stop rings gracefully when suspending
Date: Sun, 20 Sep 2026 18:12:41 +0300
Message-ID: <20260920151248.46936-12-adrian.hunter@intel.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

Changes in V2:

	Added comments explaining the choice of the RING_STOP_TIMEOUT_US
	and RING_STOP_SLEEP_US values.


 drivers/i3c/master/mipi-i3c-hci/dma.c | 57 +++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index ec4b469abd33..b8fcea0870ab 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include "hci.h"
 #include "cmd.h"
@@ -1052,19 +1053,67 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 	return handled;
 }
 
+/*
+ * With the bus disabled, a ring should stop within a few microseconds. The
+ * timeout is therefore only expected to expire if the hardware is stuck.
+ * Allow sufficient margin for slow systems, but keep the delay acceptable
+ * during suspend.
+ */
+#define RING_STOP_TIMEOUT_US	(100 * USEC_PER_MSEC)
+/*
+ * The ring is usually already stopped, so polling typically completes on the
+ * first iteration. Use a modest sleep interval to avoid busy-waiting without
+ * adding excessive latency.
+ */
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

