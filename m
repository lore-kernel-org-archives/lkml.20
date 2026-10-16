Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4970C40F73F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185120; cv=none; b=saJhVOpJoKnlgfqKLCvNoiYYuzJvLK+ebkOapHrBzm9g7ik2ndLwAiDe0c9ZQ4XzCJ9XiYBK8+YsEW3LELu3iSnKXvGfvmAowFR9H3QbOwbR2XD/PNM9TrD36gmuTsX4XRBy5GGoZmpIK+L4yAehK2Ke+Tk59obci6QwH6QlHyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185120; c=relaxed/simple;
	bh=3eeTClUfocUZWHT/67yaJ2MlrOnRG0Wjv8VqvYPEKQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3wFhjF3wJEtrlwXtmLBloWiyoheWEg+xqH/F592p4YtAB+gTHtGrPc71T3QbnStknCtQwkZUZ63zvIMZekzmo5avck9/ENHewe1aknvTuynQ08oaQp7wErC/AaANRkUgA3P64lByN4tS/fCFQPNFKR+kdz6jbMRJIZD81PEQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=j1wasMrj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="j1wasMrj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF5614BF;
	Fri, 16 Oct 2026 14:11:54 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D7323F673;
	Fri, 16 Oct 2026 14:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185117; bh=3eeTClUfocUZWHT/67yaJ2MlrOnRG0Wjv8VqvYPEKQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j1wasMrjmpXuViu89ewWFNCnrvUOGTLWtNpzPjeEECvR2uZtgNlZMMWLq3vgYXMLG
	 DphB/vsUyamx2xtMeT6rNAWuXMmq4J4Bo0As+IUph6ZR7rhnq8MJRlanQd1rbK41CL
	 K1+qlQRUxXU7KpsMkligbxMUWZ5uRVwTZuUxWzfE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:40 +0100
Subject: [PATCH v2 02/11] coresight: trbe: Refactor next buffer computation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-2-383ac26382fa@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=4015;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3eeTClUfocUZWHT/67yaJ2MlrOnRG0Wjv8VqvYPEKQs=;
 b=qJma/s4qsSVeQF1tTghsgxCQmV0xbfgJ2ZeeeGQA0vmvpyDILmDOdpkSZKtC18/djfnZD3+AM
 EYEve7xDRzmC3OnyFJ4QapACNrAt1d3DJcdAO3giB3e4ZclP5rsRyYt
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

compute_trbe_buffer_limit() only returned the next TRBE limit pointer,
leaving __arm_trbe_enable() to derive the remaining buffer state and
detect the -ENOSPC case.

Replace it with trbe_compute_next(), which computes the next TRBE buffer
state as one operation. Let the snapshot and normal paths set
buf->trbe_limit directly and return 0 or an errno, then update
trbe_write and trbe_hw_base after a successful limit calculation. The
normal path now reports -ENOSPC directly when no writable area is
available.

This refactoring is for future extensions, such as calculating
additional values (e.g., the trigger count). No functional changes are
intended.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 44 +++++++++++++++++-----------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index ada4794c51f3eb9142cd62f4209affe308142d1b..09ed9bcf4a70479169094697dcc3d445629cfaae 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -349,7 +349,7 @@ static void trbe_pad_buf(struct perf_output_handle *handle, int len)
 		perf_aux_output_skip(handle, len);
 }
 
-static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
+static int trbe_snapshot_offset(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
@@ -358,7 +358,8 @@ static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
 	 * the decoder to reset in case of an overflow or corruption.
 	 * So we can use the entire buffer for the snapshot mode.
 	 */
-	return buf->nr_pages * PAGE_SIZE;
+	buf->trbe_limit = buf->trbe_base + buf->nr_pages * PAGE_SIZE;
+	return 0;
 }
 
 static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
@@ -527,7 +528,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	return 0;
 }
 
-static unsigned long trbe_normal_offset(struct perf_output_handle *handle)
+static int trbe_normal_offset(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	u64 limit = __trbe_normal_offset(handle);
@@ -546,19 +547,34 @@ static unsigned long trbe_normal_offset(struct perf_output_handle *handle)
 		limit = __trbe_normal_offset(handle);
 		head = PERF_IDX2OFF(handle->head, buf);
 	}
-	return limit;
+
+	if (!limit)
+		return -ENOSPC;
+
+	buf->trbe_limit = buf->trbe_base + limit;
+	return 0;
 }
 
-static unsigned long compute_trbe_buffer_limit(struct perf_output_handle *handle)
+static int trbe_compute_next(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	unsigned long offset;
+	int ret;
+
+	perf_aux_output_flag(handle, PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
 
 	if (buf->snapshot)
-		offset = trbe_snapshot_offset(handle);
+		ret = trbe_snapshot_offset(handle);
 	else
-		offset = trbe_normal_offset(handle);
-	return buf->trbe_base + offset;
+		ret = trbe_normal_offset(handle);
+
+	if (ret)
+		return ret;
+
+	buf->trbe_write = buf->trbe_base + PERF_IDX2OFF(handle->head, buf);
+
+	/* Set the base of the TRBE to the buffer base */
+	buf->trbe_hw_base = buf->trbe_base;
+	return 0;
 }
 
 static void clr_trbe_status(void)
@@ -1022,15 +1038,9 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 {
 	int ret = 0;
 
-	perf_aux_output_flag(handle, PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
-	buf->trbe_limit = compute_trbe_buffer_limit(handle);
-	buf->trbe_write = buf->trbe_base + PERF_IDX2OFF(handle->head, buf);
-	if (buf->trbe_limit == buf->trbe_base) {
-		ret = -ENOSPC;
+	ret = trbe_compute_next(handle);
+	if (ret)
 		goto err;
-	}
-	/* Set the base of the TRBE to the buffer base */
-	buf->trbe_hw_base = buf->trbe_base;
 
 	ret = trbe_apply_work_around_before_enable(buf);
 	if (ret)

-- 
2.34.1

