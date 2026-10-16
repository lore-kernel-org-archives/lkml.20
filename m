Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AD15349BD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169745; cv=none; b=J8SZPNHhaYWD0WRsGVDnWpL2qN9+zwclEcGKAiNs8w54LRO/DODTxEze2kPtLb4ZrWph5BEAqPX8NUuRictEi7eFYgWNNxuWW1+XF08MaP/uOXtou4+Z0xrbZv4B195Ji1WfZPvzwdBgrb6lRmzOqmsE9+Zt9sFOR+ORxzMGICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169745; c=relaxed/simple;
	bh=xWOfM2JxhW8k1I5NjNuuL5MN3cqFbmprf5JA+C66BDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rc3tXGvxuC01P5TaruYKA/yx/5FmtevNjf329gfhb+E56XYwvQyvufTdthlhizug0cdVAr0FPsz3N+H55J5X4jv75sCsmY9zfGDBCg33QCFqQiToEHix3k0+9Sm2fAuPrgyXXHwanwv6NcCAHNweMloN565hD4SDxOfWBY79WMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SD6yXz3L; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SD6yXz3L"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFDB81691;
	Fri, 16 Oct 2026 09:55:39 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5ED33F7B4;
	Fri, 16 Oct 2026 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169743; bh=xWOfM2JxhW8k1I5NjNuuL5MN3cqFbmprf5JA+C66BDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SD6yXz3LQKh1IqjgArlPGsyU7HrPdqNZvoKSSCzvoZXXbbsD/V64/UlcMI9mAYdJb
	 Skusi7C3BFawsDGlESvGdeVXq3kWy6EZ4Kl6Ez5aRChE3AukXNHV1eO+kgCbIXI0ea
	 5j9bmMMSx824ZTHy4IpOY9SjAzbRzoNzV3TrkVfA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:15 +0100
Subject: [PATCH v2 17/23] coresight: trbe: Calculate trace size across
 buffer wrap
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-17-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=4357;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xWOfM2JxhW8k1I5NjNuuL5MN3cqFbmprf5JA+C66BDc=;
 b=HC6011WXYVwcJ+m/L3PIyxQJXH9yObGUggmTEsnYVgyPvAT5tPCfeAB9mlY4tpC9PnDvtce/L
 RmkbE+3ztwdDaqfw9c6mYrGlYwSaaULwROyEtf6b5YtE/YQI4Klu/Cj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

trbe_get_trace_size() assumes that the TRBE write pointer is always ahead
of the perf AUX head. That is not true after a WRAP event, where the write
pointer can move back to the start of the programmed TRBE span.

Calculate the size in two parts for WRAP: the bytes from the current AUX
head to TRBLIMITR_EL1, plus any bytes from TRBBASER_EL1 to the current
TRBPTR_EL1. Keep the non-WRAP path strict and reject an unexpected write
pointer below the AUX head.

For CPUs affected by the overwrite-fill-mode or write-out-of-range errata,
continue to ignore TRBPTR_EL1 on WRAP and account data only up to
TRBLIMITR_EL1, since bytes beyond the programmed limit are uncertain.

Apply this fallback before validating the write pointer so a WRAP report
with a pointer outside the programmed range still publishes the trace
from the AUX head to the programmed limit.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 62 +++++++++++++++++-----------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 661f4a78e67c30652de8c834e4773819fa67b5ac..9a469c8009ce8a8a8b804c2b63a68e741f1dceaa 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -730,43 +730,55 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 					 struct trbe_buf *buf, bool wrap)
 {
-	u64 write;
-	u64 start_off, end_off;
-	u64 size;
 	u64 overwrite_skip = TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES;
+	u64 base = buf->trbe_base;
+	u64 start_off = PERF_IDX2OFF(handle->head, buf);
+	u64 write = get_trbe_write_pointer();
+	u64 limit = get_trbe_limit_pointer();
+	u64 limit_off, write_off, size;
 
 	/*
-	 * If the TRBE has wrapped around the write pointer has
-	 * wrapped and should be treated as limit.
-	 *
 	 * When the TRBE is affected by TRBE_WORKAROUND_WRITE_OUT_OF_RANGE,
-	 * it may write upto 64bytes beyond the "LIMIT". The driver already
+	 * it may write up to 64bytes beyond the "LIMIT". The driver already
 	 * keeps a valid page next to the LIMIT and we could potentially
 	 * consume the trace data that may have been collected there. But we
 	 * cannot be really sure it is available, and the TRBPTR may not
-	 * indicate the same. Also, affected cores are also affected by another
-	 * erratum which forces the PAGE_SIZE alignment on the TRBPTR, and thus
-	 * could potentially pad an entire PAGE_SIZE - 64bytes, to get those
-	 * 64bytes. Thus we ignore the potential triggering of the erratum
-	 * on WRAP and limit the data to LIMIT.
+	 * indicate the same.
+	 *
+	 * Also, affected cores are also affected by another erratum
+	 * TRBE_WORKAROUND_OVERWRITE_FILL_MODE, which forces the PAGE_SIZE
+	 * alignment on the TRBPTR, and thus could potentially pad an entire
+	 * PAGE_SIZE - 64bytes, to get those 64bytes. Thus we ignore the
+	 * potential effects of the erratum on WRAP and limit the data to
+	 * LIMIT.
 	 */
-	if (wrap)
-		write = get_trbe_limit_pointer();
-	else
-		write = get_trbe_write_pointer();
+	if (wrap &&
+	    (trbe_may_overwrite_in_fill_mode(buf->cpudata) ||
+	     trbe_may_write_out_of_range(buf->cpudata)))
+		write = limit;
 
-	/*
-	 * TRBE may use a different base address than the base
-	 * of the ring buffer. Thus use the beginning of the ring
-	 * buffer to compute the offsets.
-	 */
-	end_off = write - buf->trbe_base;
-	start_off = PERF_IDX2OFF(handle->head, buf);
+	/* Should never happen ... */
+	if (WARN_ON_ONCE(write < base || write > limit))
+		return 0;
 
-	if (WARN_ON_ONCE(end_off < start_off))
+	limit_off = limit - base;
+	write_off = write - base;
+
+	if (WARN_ON_ONCE(start_off >= limit_off))
 		return 0;
 
-	size = end_off - start_off;
+	if (!wrap) {
+		if (WARN_ON_ONCE(write_off < start_off))
+			return 0;
+
+		size = write_off - start_off;
+	} else {
+		size = limit_off - start_off;
+
+		if (write != limit)
+			size += write_off;
+	}
+
 	/*
 	 * If the TRBE is affected by the following erratum, we must fill
 	 * the space we skipped with IGNORE packets. And we are always

-- 
2.34.1

