Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BA83D411A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185125; cv=none; b=h0sAMOELvoei0gtr8pFGIZYLa3/FdQrYovGlvDc5JjcZzzPGogzDNcWAjTSBZK0AKYk040wdqYWchzIwjOTFTmh2DVykkd1QfzKNsK0FK82uPgWAI3dOCxzU3g41KekLPqWKXe5hU+/ZxpTPpdwGSlCHcx0BS4u55UYS/60M/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185125; c=relaxed/simple;
	bh=qu1AgX5nZvAwm7yz08mHTH7BHavVeMMILxgLJeeuNL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/73MooNjc9UoUe8DfUN1RwySBqT2vuOTwVPKLHejzi4UgKgHRUnSAz5mImgjcE7yoMYik/z3ZqJmHpfZdagIY9YcLBlSOx7vhvg5H5wyCUVotBCyUJrrHgcUEy4PlY6fbtrpcTdGRojF6WXCIMf9Z+DPFohis0pXIAfJZy67Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YNtUHuN5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YNtUHuN5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20DBD1516;
	Fri, 16 Oct 2026 14:12:00 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B2B3F673;
	Fri, 16 Oct 2026 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185123; bh=qu1AgX5nZvAwm7yz08mHTH7BHavVeMMILxgLJeeuNL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YNtUHuN5tq+ZyA6yHNz2ZFaC6CGotvd0C8JP9i/xwxRUUyAey4I1LT6LeHgVm0wb4
	 nTEGmSEQrLGwqPqlAAhWOqtirq7Phqrk+QT9C7RZaBTDr0Kfdh399IxyZ7lzKFPNgX
	 6Of8o+42SWo4m9Btu3QWnBwbjtKhuhs0d/vg3kbE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:43 +0100
Subject: [PATCH v2 05/11] coresight: trbe: Leave headroom for
 stop-on-trigger mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-5-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=3111;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qu1AgX5nZvAwm7yz08mHTH7BHavVeMMILxgLJeeuNL4=;
 b=Ami5tfZtfhiQQihX+fyQfImMnAlf05k08qAlMdv8heny++hnRux4kbH1IpDp6rnGQp9zoagBK
 JDYGRFsMpfCCPOrT4RpNZurld8hierWhRR1wL2td/SyeBH/OdfUo1s6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Arm ARM (ARM DDI 0487 M.c), rule R_XRRWP says:

 | If a Trigger Event is generated when collection is not stopped and
 | the trigger mode is Stop on trigger, then all of the following occur:
 | The Trace Buffer Unit initiates a trace unit flush of the trace unit.
 | ...

A Stop-on-trigger event may initiates a trace flush. The TRBE might
therefore continue writing trace data after the trigger event is
generated. If the trigger is programmed exactly at the boundary of the
free space, that flush can overwrite unconsumed trace data.

Reserve 4KiB of headroom when calculating the wrap-protection trigger
count. If the available space is not large enough to provide that
headroom, returns 0 for counter so effectively do not use it.

Subtract the headroom before rounding the count down to the hardware
alignment, retaining the check that the resulting trigger lies beyond
LIMIT. Rounding down preserves at least the requested headroom.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 95bbdbaca81bd59ac97b272216489c2f66393fa7..8187e264ff3c86d445b96c4935a8dbdf5ad9e77c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -171,6 +171,21 @@ struct trbe_drvdata {
 	struct platform_device *pdev;
 };
 
+/*
+ * Arm ARM (ARM DDI 0487 M.B), section D6.5.3 Trigger event, R_XRRWP states:
+ *
+ * "If a Trigger Event is generated when collection is not stopped and the
+ *  trigger mode is Stop on trigger, then all of the following occur:
+ *  - The Trace Buffer Unit initiates a trace unit flush of the trace unit.
+ *  - The TRB_TRIG event is generated."
+ *
+ * The TRBE might therefore continue writing trace data after the trigger event
+ * is generated. When Stop-on-trigger is used to protect unconsumed data after
+ * buffer wrap, reserve 4KiB of headroom in the trigger count so it is safe to
+ * complete flush without overwriting that data.
+ */
+#define TRBE_TRIGGER_STOP_HEADROOM	SZ_4K
+
 /* Compute the buffer next state */
 struct trbe_buf_next {
 	u64 head;
@@ -460,11 +475,15 @@ static u32 trbe_normal_trigger_count(struct perf_output_handle *handle,
 	 *                                      limit
 	 *
 	 *                              |>>>>>>>>
-	 * >>>>>>>>>>>>>>>>>>>>>|
-	 *   ` Trigger counter covers the writable region, rounded down
-	 *     to the hardware alignment.
+	 * >>>>>>>>>>>>>>>>>|---|
+	 *                    ` headroom
+	 *
+	 * Trigger counter covers the writable region, but leave headroom
+	 * to avoid overwrite risk caused by trace unit flush after
+	 * trigger event is generated.
 	 */
-	count = round_down(handle->size, cpudata->trbe_hw_align);
+	count = round_down(handle->size - TRBE_TRIGGER_STOP_HEADROOM,
+			   cpudata->trbe_hw_align);
 	if (count <= limit - head)
 		return 0;
 

-- 
2.34.1

