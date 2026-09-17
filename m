Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7184E4C26
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672466; cv=none; b=FqoYWwHc4wq/3EPrZxVpe00YbQQJtLp17/YQe3vurcK/Tcnr0QQRDUAsIs7v+pT+oEKsrP2RQlDOpPb+27qaErTl6RVZHi3//Cd+o67uq5XkGf0INFhyCSdFw5ZmxFrOAHdQHVeKflGZHxf2R6pORPmbQj/DfHODSkVm8QZ8Wtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672466; c=relaxed/simple;
	bh=NJfhRSVxnF/bJ1RKlf/GniaeiWdPCGF/AvPKMBkUNtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kboutTXf8Qk/ZzQGkH7p8xRsAcy/jIlAXo6lnpXXFn5JMk0DIvzqUyqJDEkpHcafNpdtpyzjkIG/pqQS/tUx9hwPsfQUe0vsLvLQvUWR1InsorHIqZ8sXLVkV/473RCEuptB+ovy2G0JeGtwe/kk/W7K1pN8xkFw37VzDM+t8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+IozTIL; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+IozTIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672465; x=1821208465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NJfhRSVxnF/bJ1RKlf/GniaeiWdPCGF/AvPKMBkUNtc=;
  b=H+IozTILdV8KgWcJ1Xk6VZGNgzSYbqgdLr3G79TpwbNhaI/hSDT6C7ZH
   KDAy4omI4YZjemQN/2PdkWx21Gf9OCeAxY7+tVIKTrs1PQsFKs+GAPPDb
   Pa9nAcobMsWaDzoXIn6ufSmezV6SCmgj51K8XZBDau/kxfBxuIglBDivP
   8lkiFgrH06HgwEcleaz2/wVfaJWP0aSbGRSxyoGXyKQLVeRmhv0bZ3DFq
   X5XWhwPahCIrO8MLgH75GKNde8MEPqeLaurVqUA/IBnPbazzYilWJWyFa
   AJZrpwV1YtTg5eBTYB/yYz1OXMwSKlNAhVifEVrwEfNCYLnGBN4G+PU9g
   A==;
X-CSE-ConnectionGUID: kqwU4YFMSxKS/v6dbVy7/g==
X-CSE-MsgGUID: j0z91eJLTnihXa7p1bLezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639932"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639932"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:24 -0700
X-CSE-ConnectionGUID: FepJlruGQiyau2TQOQum3A==
X-CSE-MsgGUID: rJewsIzSQEuHZ7lY3Lw6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271985"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:22 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 09/17] i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
Date: Thu, 17 Sep 2026 22:13:48 +0300
Message-ID: <20260917191356.133242-10-adrian.hunter@intel.com>
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

INTR_IBI_READY indicates that one or more IBI Status Descriptors are
present in the IBI ring.  After clearing interrupt status, the interrupt
handler processes only a single IBI even though additional IBIs may
already be queued.

The controller does not reassert INTR_IBI_READY solely because entries
remain in the ring after interrupt status has been cleared.  Consequently,
the remaining IBIs are not processed until some later interrupt occurs,
and can accumulate if IBIs arrive more often than the interrupt handler
runs.

Process all IBIs that are pending when the handler runs: capture the IBI
enqueue pointer up front and continue until the dequeue pointer reaches
that position.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/dma.c | 39 +++++++++++++++++----------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 5b195978f376..a798b0648922 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -868,25 +868,24 @@ static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
 	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
 }
 
-static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
+static bool hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh,
+				u32 *op1_val, unsigned int enq_ptr)
 {
 	struct hci_rings_data *rings = hci->io_data;
 	struct i3c_dev_desc *dev;
 	struct i3c_hci_dev_data *dev_data;
 	struct hci_dma_dev_ibi_data *dev_ibi;
 	struct i3c_ibi_slot *slot;
-	u32 op1_val, op2_val, ibi_status_error;
-	unsigned int ptr, enq_ptr, deq_ptr;
+	u32 ibi_status_error;
+	unsigned int ptr, deq_ptr;
 	unsigned int ibi_size, ibi_chunks, ibi_data_offset, first_part;
 	int ibi_addr, last_ptr;
 	void *ring_ibi_data;
 	dma_addr_t ring_ibi_data_dma;
 
-	op1_val = rh_reg_read(RING_OPERATION1);
-	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, op1_val);
-
-	op2_val = rh_reg_read(RING_OPERATION2);
-	enq_ptr = FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
+	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, *op1_val);
+	if (deq_ptr == enq_ptr)
+		return false;
 
 	ibi_status_error = 0;
 	ibi_addr = -1;
@@ -936,7 +935,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 		dev_dbg(&hci->master.dev,
 			"no LAST_STATUS available (e=%d d=%d)",
 			enq_ptr, deq_ptr);
-		return;
+		return false;
 	}
 	deq_ptr = last_ptr + 1;
 	deq_ptr %= rh->ibi_status_entries;
@@ -1015,10 +1014,9 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 	i3c_master_queue_ibi(dev, slot);
 
 done:
-	op1_val = rh_reg_read(RING_OPERATION1);
-	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
-	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
-	rh_reg_write(RING_OPERATION1, op1_val);
+	*op1_val &= ~RING_OP1_IBI_DEQ_PTR;
+	*op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
+	rh_reg_write(RING_OPERATION1, *op1_val);
 
 	/* update the chunk pointer */
 	rh->ibi_chunk_ptr += ibi_chunks;
@@ -1026,6 +1024,19 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 
 	/* and tell the hardware about freed chunks */
 	rh_reg_write(CHUNK_CONTROL, rh_reg_read(CHUNK_CONTROL) + ibi_chunks);
+
+	return true;
+}
+
+static void hci_dma_drain_ibi_ring(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	u32 op1_val = rh_reg_read(RING_OPERATION1);
+	u32 op2_val = rh_reg_read(RING_OPERATION2);
+	unsigned int enq_ptr = FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
+
+	/* Loop is bounded by enq_ptr. Further IBIs will re-assert INTR_IBI_READY */
+	while (hci_dma_process_ibi(hci, rh, &op1_val, enq_ptr))
+		;
 }
 
 static bool hci_dma_irq_handler(struct i3c_hci *hci)
@@ -1047,7 +1058,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 		rh_reg_write(INTR_STATUS, status);
 
 		if (status & INTR_IBI_READY)
-			hci_dma_process_ibi(hci, rh);
+			hci_dma_drain_ibi_ring(hci, rh);
 		if (status & (INTR_TRANSFER_COMPLETION | INTR_TRANSFER_ERR))
 			hci_dma_xfer_done(hci, rh);
 		if (status & INTR_RING_OP)
-- 
2.53.0

