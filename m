Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3D55372C5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169723; cv=none; b=Zx2N3wDUyJleRkHv68VOgXB74H5f89FzfCIZqjYocrWtjknLC4oxoT43IQTD73lfkV3/xE4SZwhfAI7fTnKoz9gMX4fEG0t6OGsQSvoo0j3Cs3SvizGqXRRj4SJLVKwE9SaFyhEeYezaKcj3hjPrTjolvKnzDPqIMndAmBN57rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169723; c=relaxed/simple;
	bh=SyBzZt3O86TDMtF4xYx6AN6rseQVmhgogVimkx0ESIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbbgApw+cmw7pgFdWuYRQXt8u0gGvMG7plJh8y+N4Mrjrhujx0RkFKvn7Zotu2Hk4MvVpDlIIDgxUPHQjgZ6+3w2OxX9BElwJknW+I/FSTWYCoH8v8c4vrpMm6YRip8pBCQRFcxVkczoMe3XSiMqufRaZZUXo+fDFN3z1i+Y8Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m9gQkpsX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m9gQkpsX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E1C1691;
	Fri, 16 Oct 2026 09:55:17 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B4123F7B4;
	Fri, 16 Oct 2026 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169721; bh=SyBzZt3O86TDMtF4xYx6AN6rseQVmhgogVimkx0ESIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m9gQkpsXroOS0sXK3iysBq2z0TYkbhTJd9S4bVPJe58BZg2zms0wk13rvpDyj9lJg
	 3TYzD5xOAUDdGNgnXg3AzZ4ifRGKQcKCBwmu+GkmaJmpBOoyrDOMO/cS12vdnyfKrp
	 AsqtVkjDcAuYAQgb9tQ3jiRcE7PMoBwULQmMjNOc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:03 +0100
Subject: [PATCH v2 05/23] coresight: trbe: Validate perf handle before
 using sink data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2057;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SyBzZt3O86TDMtF4xYx6AN6rseQVmhgogVimkx0ESIA=;
 b=wxpu3pNbgVscwghOB0sXLosLqB3LMQPEfRUR07xlblcAQiyG5113/P5gYkQgZddIQnUxseLvI
 owkaZHbWhJFBOK69a5tFRS6erxFCRPiyoXTOVzUtzMzl87BqUnkMGhy
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The TRBE IRQ handler calls etm_perf_sink_config(handle) before
validating the per-CPU perf handle and its AUX transaction. This may
dereference a NULL handle after disabling TRBE or access stale sink
data after perf_aux_output_end().

Validate the handle and AUX transaction before accessing the sink
configuration. Move the local buffer lookup closer to its use.
Remove the warning for a NULL handle, which is expected after
disabling TRBE.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 91fbdbad3676ffae399df0b4d4ddcd603a40e86c..a7c1037a048f5236598f8f3a7cc4f47bff9d329c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1150,12 +1150,18 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 {
 	struct perf_output_handle **handle_ptr = dev;
 	struct perf_output_handle *handle = *handle_ptr;
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf;
 	enum trbe_fault_action act;
 	u64 status;
 	bool truncated = false;
 	u64 trfcr;
 
+	if (!handle || !perf_get_aux(handle))
+		return IRQ_NONE;
+
+	if (!is_perf_trbe(handle))
+		return IRQ_NONE;
+
 	/* Reads to TRBSR_EL1 is fine when TRBE is active */
 	status = read_sysreg_s(SYS_TRBSR_EL1);
 	/*
@@ -1171,16 +1177,11 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	 * Ensure the trace is visible to the CPUs and
 	 * any external aborts have been resolved.
 	 */
+	buf = etm_perf_sink_config(handle);
 	trbe_drain_and_disable_local(buf->cpudata);
 	clr_trbe_irq();
 	isb();
 
-	if (WARN_ON_ONCE(!handle) || !perf_get_aux(handle))
-		return IRQ_NONE;
-
-	if (!is_perf_trbe(handle))
-		return IRQ_NONE;
-
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:

-- 
2.34.1

