Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4DC53F6B7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169748; cv=none; b=RYLy3ZVLZFYnFDmkoi/Zfit5/9HvMtdoWXpWNspMvuEszKJQHyH59EBE6dVYqB/vtCR6yyBsvy1axdR9WqFFCkyf9JWzQbcr6sjE4b1DJf6FBKgnWh64dZHtwPcMd3syqcvPc4gJSHsJJwuNsexJBb/fL6Bf5fc+zf/WYuOSTF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169748; c=relaxed/simple;
	bh=rIh/UAykOJyTEPi/bLjye+Bj0nQKIhap4gWn0QP/qa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSQjyC1hCQnKxipntOfbsvRHZU6/8ISZAAwt9vis1fyjxJ9/hzlYvEyATAOqtTjIjl9wcU9pzw/4+DiW+i0EKOq5BpzI7KQ+CXtm2LY32kk34CL90DFE8h7R5F5Q+FwVFeSFCCTMp9v+OJQ3xytPb4JZ9ElV4veiJ3idlRKHBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LIZexuLO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LIZexuLO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B4FC1516;
	Fri, 16 Oct 2026 09:55:43 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55CA33F7B4;
	Fri, 16 Oct 2026 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169746; bh=rIh/UAykOJyTEPi/bLjye+Bj0nQKIhap4gWn0QP/qa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LIZexuLOsFCbR1WWGmqMuoX80Y4SqEfcBhTi2OlXxvcuIVgYie9TX+IeXGSQbPYTk
	 fOOxzOy9+v//OEuCU5TOgeT06vIKonR7jzbll2v+GU6uUPtTSoDS+nTDquYYhs+efr
	 8hSTuFJcX//YHo6aN9zlKeNiL5G8X05qw4C51N0M=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:17 +0100
Subject: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3773;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rIh/UAykOJyTEPi/bLjye+Bj0nQKIhap4gWn0QP/qa8=;
 b=LPnRmMUspIZbhgulTelsB5rdzGZRjyOj6MD2Yi1syh9t9Mtx3R6bUoCBdroJ+Oil6Lzd7PnPt
 cYICEp4R9xEB3EfHAjL3mMJDN8GepliKsBV9xGXv7ePch7opFMHyoj8
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
buffer. For AUX events, this also selects the associated AUX area and
sink configuration. Perf normally establishes this sharing during setup.

Consider the following hypothetical live-redirection sequence, permitted
by the inspected perf-core paths. P is a parent event and C is its
inherited event, with C->parent = P. A and B are mapped AUX destination
buffers owned by separate, disabled cs_etm events in different task
contexts. All three are per-task events restricted to the same CPU, with
compatible output settings. P has no mmap of its own, allowing its output
to be redirected while A and B remain mapped through their owner events.

1. P's output is redirected to A. C inherits from P and begins tracing
   on the selected CPU, so its open AUX transaction and TRBE hardware
   both use A. P can be inactive while C is running because their
   events are scheduled with their respective tasks.
2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
   B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
   inactive P without stopping C. P->rb now selects B, but C's existing
   handle and hardware still use A.
3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
   handler. It saves buf for A, ends that AUX transaction, then calls
   perf_aux_output_begin(handle, C). AUX begin follows C->parent and
   reads P's current rb, rebinding the same handle to B.

This is a hypothetical API sequence, not a reproduced TRBE failure or
an observed buffer switch in normal perf record operation.

Without reloading buf, __arm_trbe_enable() calculates the next buffer
using B through the handle, but its workaround and hardware setup still
receive A. If B has never been enabled, its missing CPU association can
cause the normal-offset calculation to dereference NULL. With a snapshot
buffer, hardware may instead keep using A while perf accounts output to B.

Reload the sink configuration after perf_aux_output_begin() so the buffer
and handle refer to the same AUX transaction. If the buffer is missing or
its CPU association does not match the interrupt's CPU data, truncate the
new transaction and leave TRBE disabled. Truncation requests perf to stop
the event; a subsequent normal restart installs the buffer and its CPU
association through the sink enable path.

Stopping inherited writers during output redirection remains a separate
perf-core fix.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 2328aab0a084a0ac123e950f846f404d120ec2c0..f1f102df6c387f53feaa12b89d3df89f734afcdb 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1161,6 +1161,20 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
 	if (!event_data)
 		return -EINVAL;
 
+	/*
+	 * Reload the buffer after perf_aux_output_begin() so it matches the
+	 * handle. A race with PERF_EVENT_IOC_SET_OUTPUT may select a buffer
+	 * that has not been installed on this CPU and has no valid cpudata.
+	 * If the buffer is missing or its CPU association does not match,
+	 * truncate the trace to stop the event. A subsequent normal restart
+	 * installs the buffer and its CPU association through sink enable.
+	 */
+	buf = etm_perf_sink_config(handle);
+	if (!buf || buf->cpudata != cpudata) {
+		trbe_truncate_event(handle);
+		return -EINVAL;
+	}
+
 	return __arm_trbe_enable(buf, handle);
 }
 

-- 
2.34.1

