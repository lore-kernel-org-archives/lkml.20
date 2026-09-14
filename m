Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AF3449980
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385436; cv=none; b=mT6ZOsGYIsk4dzmzN170s9xwd+l1wZZdZRoUswh0MXIM51Ek/X8UJs+r40VxDU1yHKAXw3GmgEtqmxzNqnRmAH0FTpaFqE4WfaBcxSBYHksmyvIy3eGqiJ9XJUZv+TQY/Cbu6cSwfsqeGKEYvw+bFp8Kl1IqpaC+k/HjzC901iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385436; c=relaxed/simple;
	bh=wvih2fjNqV6T+z7xL15VLQh5+nOgfHKqChQdqx/FnSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/vac4QmY3uZ5BDn7xYEzyQ4rzvRAX9+tDLeegr88RwjQZucmo5rDDoX1NwFgESpeE1DQyUjdOuqozZvl8NnJq3BNI1wbHMEnaf/biGN04PwmD2CqTCNPpJIKv0pdhsAIfhMT6Rij2+sttOhWNoN7EW9/LePSAr8hwnCrmRvddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsJiGF1P; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsJiGF1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385434; x=1820921434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wvih2fjNqV6T+z7xL15VLQh5+nOgfHKqChQdqx/FnSg=;
  b=FsJiGF1PvdskgHtIdkL9M7vYbNm0J4DPwGLBz1/eTsZzFndqyrwctL53
   rZW5Rr1QED4h+/4jJo4ceftkr4ara2C8uwdSLkzFT8t/stHJLssHEprTe
   lZcYadqO/USHolkiNgOh0nqhXbLqw44KDohOqliHY0aanfm36cxIzr3G1
   t2EsLBXWq8SSaa7qHaDryZD9PDLPEuMadOmdd5idHSkdyyP/7ogOGT9yW
   irbkaco8PUkbuRJyWIt/uEdVsbsopZFI9jgn7Do8gVkgOH/uSEOY6hY4h
   UbeQgR1SM1s1gzIwYyCEDO9HtSAVAAXGZBrhJdI/tTDcco0K/kLNtW6Oh
   Q==;
X-CSE-ConnectionGUID: LHNLAkaYTIKwPyiKhBDBcA==
X-CSE-MsgGUID: +wa4noFaRqGjn6ZPQ2VWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864463"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:34 -0700
X-CSE-ConnectionGUID: IZeT2KHLRxiHY8rjcNlcoQ==
X-CSE-MsgGUID: nPeXe09+QbKHfbmt8D5S7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133127"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:33 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/17] i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
Date: Mon, 14 Sep 2026 14:29:55 +0300
Message-ID: <20260914113003.183150-10-adrian.hunter@intel.com>
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

