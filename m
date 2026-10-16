Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D167954A7D6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169756; cv=none; b=PpOX0/4YIXpVzxSOn+NVRpzs6C3sVrxxcmGj/O1vPM9SlqLf8cRdJVbHBdK3P/okXFZ77n6l+8j8eu8m89w3Sd9fHl5Z1NAMgXSGdyEJ2urz6bfLW5OZ6wBOEkfs7W7WHfHXKPfFo7AGAhgi0o8PucPqUpCIZEkgwMzDkev8vmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169756; c=relaxed/simple;
	bh=heLyCzP1OgFt+fIxgZTcGvWkmEm4xEc14PmqM7fQv9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfxKBcpQv49R8Fjh8QPFubzIxQ4S8gBX5x2WffWwwtBgK/HJzsn8bNyErQPd8gq5ObXW5VxzKUouXGImwiKQwJFhKVzFFz1zPD/hfWSZwEzAvCEs+jiPcTpyiyDjJ7aTlaUCP8c9Jk71EqJR7/Ar1xIymq/X6kNmfJKZOG/Lr2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MZNK9mBU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MZNK9mBU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED5EF175D;
	Fri, 16 Oct 2026 09:55:50 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9B243F7B4;
	Fri, 16 Oct 2026 09:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169754; bh=heLyCzP1OgFt+fIxgZTcGvWkmEm4xEc14PmqM7fQv9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MZNK9mBUe9kCsPgtWkV1BZFie4DV9HzyIrE3N0fF7ZU+87JlD4oqMUWBNTOs/4r+y
	 llHMR3GFNAKSqtQZVcq7usYmiEFxfryLlLSZ3eU1kpr8AGIxTPJwz7+4B49g4cxRBD
	 R5tn41tTSj9PtO+3uDnEXu2140pds6KVgYklUBHI=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:21 +0100
Subject: [PATCH v2 23/23] coresight: trbe: Report trace gaps with PARTIAL
 instead of COLLISION
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-23-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3130;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=heLyCzP1OgFt+fIxgZTcGvWkmEm4xEc14PmqM7fQv9o=;
 b=dbGqZUyaDLNBTHx4jK+djoBtF4nEgp1sIJbFz3bMeMLfoLtgMew6Ecf1iItF83agWnFh26J3p
 P9eIoNmg232BTNmWbG314KQ8tVGm9DegVTDh+U46AqHws4KkMdYvXUL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

When a fill-mode wrap stops TRBE, the trace source can continue running
until software handles the stop. Trace generated during this interval
may be lost.

The overflow path now stops and restarts the trace source around buffer
reprogramming. This emits ASYNC packets so the decoder can synchronize
with the next trace segment. Use PERF_AUX_FLAG_PARTIAL to report the
possible gap instead of PERF_AUX_FLAG_COLLISION.

Set PARTIAL in both the overflow handler and the buffer update callback.
This also preserves the gap indication when event shutdown handles a
pending wrap, even if no further trace segment follows. Limit the flag
to stopped buffers.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 29 +++++++---------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 6bc82d5b55539795059da37039d2929b4ea504e3..29a1882b1f3c2eb7166f71eeef37badece67039c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -285,25 +285,6 @@ static void trbe_reset_local(struct trbe_cpudata *cpudata)
 	write_sysreg_s(0, SYS_TRBSR_EL1);
 }
 
-static void trbe_report_wrap_event(struct perf_output_handle *handle)
-{
-	/*
-	 * Mark the buffer to indicate that there was a WRAP event by
-	 * setting the COLLISION flag. This indicates to the user that
-	 * the TRBE trace collection was stopped without stopping the
-	 * ETE and thus there might be some amount of trace that was
-	 * lost between the time the WRAP was detected and the IRQ
-	 * was consumed by the CPU.
-	 *
-	 * Setting the TRUNCATED flag would move the event to STOPPED
-	 * state unnecessarily, even when there is space left in the
-	 * ring buffer. Using the COLLISION flag doesn't have this side
-	 * effect. We only set TRUNCATED flag when there is no space
-	 * left in the ring buffer.
-	 */
-	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
-}
-
 static void trbe_truncate_event(struct perf_output_handle *handle)
 {
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
@@ -917,10 +898,12 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 		size = 0;
 		goto done;
-	} else if (act == TRBE_FAULT_ACT_WRAP) {
-		trbe_report_wrap_event(handle);
 	}
 
+	/* Trace may have been lost before the source was stopped. */
+	if (act == TRBE_FAULT_ACT_WRAP && !is_trbe_running(status))
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
+
 	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 
 done:
@@ -1246,7 +1229,9 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
 	if (buf->snapshot)
 		handle->head += size;
 
-	trbe_report_wrap_event(handle);
+	if (is_buffer_stopped)
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
+
 	perf_aux_output_end(handle, size);
 	event_data = perf_aux_output_begin(handle, event);
 	/*

-- 
2.34.1

