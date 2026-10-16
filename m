Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27A45476D1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169755; cv=none; b=nzEtI4npav+QkTJ96bPmBS8SnVYDXF0K4ZcjvdVy2rk235F9plcxwK6H+/Qg4H6lUezZy/HLzwWILFHnThmGJEBp7P9DVfiGUu80YQepOuK7dRT8s0lGk7o88ONxfrpczv9cXLHS1Tcff4QA7LG93r385HBRlNhJMJDg6wrD6oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169755; c=relaxed/simple;
	bh=BvLu6cpm6zpybvEvvULEk+E4+hqOj0523fLkGhrmUY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYlAOs9r0pW2QL5W1rKcb0dEPpGnvjJyzAaRvxx36MDAMjw+9Tq7l6Nyw8o7SWOugFwkzXJv49Kc7f+Pq8mjCDPT7lOj4f96/Zxupw9HyLQoQE42IgJ74VMCxd8gmr0RAeGnPXSofL0Pp5KHXBUoAZjI2Mc+POimT0t89AhdAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nxUWApFd; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nxUWApFd"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26F94175A;
	Fri, 16 Oct 2026 09:55:49 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1B783F7B4;
	Fri, 16 Oct 2026 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169752; bh=BvLu6cpm6zpybvEvvULEk+E4+hqOj0523fLkGhrmUY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nxUWApFdIF5go77go/gkUIQHLh4gWSAbExADi3FKHUv7lHOwGeEhjfHRjUC5Sf2Er
	 ER0OUY6Sp7ytIRoHtuFa9nMnA6Sn+EnOCcRzLJb5hbXNTK7G+MVfTCNviXRcT11Q1n
	 vXMArzs0sKQdr3+kfxG04CeIl3qAZHww2Nbe08JA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:20 +0100
Subject: [PATCH v2 22/23] coresight: trbe: Restart trace source for stopped
 buffers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-22-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=5429;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BvLu6cpm6zpybvEvvULEk+E4+hqOj0523fLkGhrmUY8=;
 b=OP/ONtQmKrOtKCR6nHRXZ/27H//JIwhmkJ+eFab6S1eyGwtVsbnd71xN9jWIpBHFJchZLlq9T
 Yofrkqaw+H8CfglI7U5uP+DT6h2HNAujQgniblJTN5BbXU1rBZxKrFn
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

When TRBSR reports a stopped buffer, the IRQ handler closes the current
AUX buffer and programs TRBE for the next run. This creates a trace
discontinuity. User tool has to reset the decoder when moving to the
next AUX data block, which can reduce decoded trace coverage.

Stop and restart the trace source around TRBE reprogramming for stopped
buffers. This emits ASYNC packets, allowing the decoder to recognize
discontinuity without a full reset.

This duplicates part of the trace source enable/disable code in the
ETMv4 driver. Reusing that code would require splitting the ETMv4
callbacks into finer-grained helpers that TRBE can call, which would
make the change much larger. Keep the TRBE change self-contained for
now.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 121 +++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 36f143a15e680b28aa6ca6a43ad7d3ee134693be..6bc82d5b55539795059da37039d2929b4ea504e3 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -17,9 +17,11 @@
 
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <linux/iopoll.h>
 #include <linux/kvm_host.h>
 #include <linux/vmalloc.h>
 
+#include "coresight-etm4x.h"
 #include "coresight-self-hosted-trace.h"
 #include "coresight-trbe.h"
 
@@ -1132,14 +1134,106 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
 	set_trbe_enabled(cpudata, trblimitr);
 }
 
+static u64 read_sys_trcstatr(void)
+{
+	/* Context synchronization for each polling */
+	isb();
+	return read_sysreg_s(SYS_TRCSTATR);
+}
+
+static int arm_trbe_start_tracer(u64 trcprgctlr)
+{
+	u64 val;
+
+	/* A pending IRQ after AUX pause? */
+	if (!(trcprgctlr & BIT(0)))
+		return 0;
+
+	/* Restore the saved tracer state */
+	write_sysreg_s(trcprgctlr, SYS_TRCPRGCTLR);
+
+	/*
+	 * Context synchronization between writing to the TRCPRGCTLR and
+	 * reading the TRCSTATR.
+	 */
+	isb();
+
+	/* Wait for TRCSTATR.IDLE to go down to 0 */
+	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
+				     !(val & BIT(TRCSTATR_IDLE_BIT)),
+				     1,		/* delay_us */
+				     TIMEOUT_US, /* timeout_us */
+				     false)) {	/* delay_before_read */
+		pr_err("TRBE: timeout for TRCSTATR IDLE\n");
+		return -ETIME;
+	}
+
+	/* Context synchronization after programming the tracer */
+	isb();
+
+	return 0;
+}
+
+static int arm_trbe_stop_tracer(u64 *trcprgctlr)
+{
+	u64 val;
+
+	/* Disable tracer and save trcprgctlr */
+	*trcprgctlr = read_sysreg_s(SYS_TRCPRGCTLR);
+
+	/* No need to stop tracer again */
+	if (!(*trcprgctlr & BIT(0)))
+		return 0;
+
+	write_sysreg_s(*trcprgctlr & ~BIT(0), SYS_TRCPRGCTLR);
+
+	/*
+	 * Context synchronization between writing to the TRCPRGCTLR and
+	 * reading the TRCSTATR.
+	 */
+	isb();
+
+	/*
+	 * PMSTABLE alone does not permit re-enabling the tracer.
+	 * Wait for TRCSTATR.IDLE to go to 1.
+	 */
+	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
+				     val & BIT(TRCSTATR_IDLE_BIT),
+				     1,
+				     TIMEOUT_US,
+				     false)) {
+		pr_err("TRBE: timeout for TRCSTATR IDLE=1\n");
+		return -ETIME;
+	}
+
+	/* Context synchronization after programming the tracer */
+	isb();
+
+	return 0;
+}
+
 static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
-				enum trbe_fault_action act)
+				enum trbe_fault_action act,
+				bool is_buffer_stopped)
 {
 	struct perf_output_handle *handle = cpudata->handle;
 	struct perf_event *event = handle->event;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	unsigned long size;
 	struct etm_event_data *event_data;
+	u64 trcprgctlr = 0;
+	int ret = 0;
+
+	/*
+	 * Since the trace buffer has stopped, disable and re-enable the
+	 * tracer to generate ASYNC packets. This allows the decoder to
+	 * recognize the discontinuity in the trace stream.
+	 */
+	if (is_buffer_stopped) {
+		ret = arm_trbe_stop_tracer(&trcprgctlr);
+		if (ret)
+			goto truncate_event;
+	}
 
 	/*
 	 * Clear the status. No context synchronization is required here,
@@ -1172,11 +1266,27 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
 	 */
 	buf = etm_perf_sink_config(handle);
 	if (!buf || buf->cpudata != cpudata) {
-		trbe_truncate_event(handle);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto truncate_event;
+	}
+
+	ret = __arm_trbe_enable(buf, handle);
+	if (ret)
+		return ret;
+
+	if (is_buffer_stopped) {
+		ret = arm_trbe_start_tracer(trcprgctlr);
+		if (ret) {
+			trbe_drain_and_disable_local(cpudata);
+			goto truncate_event;
+		}
 	}
 
-	return __arm_trbe_enable(buf, handle);
+	return 0;
+
+truncate_event:
+	trbe_truncate_event(handle);
+	return ret;
 }
 
 static bool is_perf_trbe(struct perf_output_handle *handle)
@@ -1267,7 +1377,8 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:
-		truncated = !!trbe_handle_overflow(cpudata, act);
+		truncated = !!trbe_handle_overflow(cpudata, act,
+						   !is_trbe_running(status));
 		break;
 	case TRBE_FAULT_ACT_SPURIOUS:
 		trbe_handle_spurious(cpudata);

-- 
2.34.1

