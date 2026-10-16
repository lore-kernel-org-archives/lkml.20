Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D54453CA9A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169733; cv=none; b=Tx45vLCQP/rsvri8ux/yOo+EYsZ9vZT9OTmYoq7bVVpt/HZh1ULHhPYVuTZcL5tnSbhFlMQGt+187/S7uORv5tm+W2Li4ONJWCsLw6PM4IdSQl33J7UauEISPRcCR278FGIxzBINvv/nxEagB0NXrQeKBIwZHoaxmD4iADmPUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169733; c=relaxed/simple;
	bh=8p7DoDoVQ9JeNmV8R2sDKkxWf/X/r7C7kriTV3IjJT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeHamKxxvhphabrGuklXbkJHxyAtxR3/D9fi9+giLnHCZjAqCTv/zthdGhxwmvswFieW8vd5zZjJLpMKpRUjiZ+k9OgxBKa7SKiBjVvXl2GCJ7YCNPKkTgoreTpz/K2N8c+/fO71Sb80k/bGdUsNbo4lF9yWPBsezcg2upyI828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QO+0MXYY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QO+0MXYY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AE6C175A;
	Fri, 16 Oct 2026 09:55:27 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7F813F7B4;
	Fri, 16 Oct 2026 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169730; bh=8p7DoDoVQ9JeNmV8R2sDKkxWf/X/r7C7kriTV3IjJT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QO+0MXYYGArcPwsn6ilRXGRAVlrm5rztpCnUVMT9V+XcoF1jAPWNfFy3c+qeH2gfg
	 ZUy0rwp9qVemJliSBJ5xgPyRxPJzqk8UBvWILqfSRBixEFVA0OTvT5r8g8E3QmCGxP
	 eEl+jSmQ1tinjtATaltzhiWqD0uqL1GtxSQeI1Yg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:08 +0100
Subject: [PATCH v2 10/23] coresight: trbe: Drop redundant disables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2682;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=8p7DoDoVQ9JeNmV8R2sDKkxWf/X/r7C7kriTV3IjJT8=;
 b=G6P4UKywD6/gIhUFZ1/Cz9+0RhFAefqFfyFpXUdPpvQh8CZM5Kd1GXNF7/c7nzOTMzwk/Qfwt
 L30vPar3nw2C1Q/9H8ahD9MZb9ZzdMjutACGZj7/ytBDV1MwKkoweVu
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The IRQ handler has a common point that disables TRBE before dispatching
the fault action. Once execution reaches the overflow handling or
truncate path, the trace buffer has already been stopped.

The __arm_trbe_enable() error path does not need a disable there either,
as TRBE is already in disabled state.

Remove TRBE disable from the truncate helper and from the overflow
failure path. The truncate helper only needs to mark and end the AUX
output, so rename it to trbe_truncate_event() to reflect its remaining
purpose.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index dd9c9330bb0c739795f300dafc6ce34e72fbf280..4a041bbc6e970d72a7d735e15f7221037cb091d6 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -301,18 +301,10 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
 }
 
-static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
+static void trbe_truncate_event(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
-	/*
-	 * We cannot proceed with the buffer collection and we
-	 * do not have any data for the current session. The
-	 * etm_perf driver expects to close out the aux_buffer
-	 * at event_stop(). So disable the TRBE here and leave
-	 * the update_buffer() to return a 0 size.
-	 */
-	trbe_drain_and_disable_local(buf->cpudata);
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 	perf_aux_output_end(handle, 0);
 	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
@@ -1024,7 +1016,7 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 	trbe_enable_hw(buf);
 	return 0;
 err:
-	trbe_stop_and_truncate_event(handle);
+	trbe_truncate_event(handle);
 	return ret;
 }
 
@@ -1117,7 +1109,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 		 * is able to detect this with a disconnected handle
 		 * (handle->event = NULL).
 		 */
-		trbe_drain_and_disable_local(buf->cpudata);
 		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
 		return -EINVAL;
 	}
@@ -1208,7 +1199,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 		trbe_handle_spurious(handle);
 		break;
 	case TRBE_FAULT_ACT_FATAL:
-		trbe_stop_and_truncate_event(handle);
+		trbe_truncate_event(handle);
 		truncated = true;
 		break;
 	}

-- 
2.34.1

