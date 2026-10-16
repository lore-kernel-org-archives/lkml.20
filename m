Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039604FDA68
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169720; cv=none; b=bieTHjIWqPz0OkmI4dqFVwQzQnJIGc5IpF929HLy1Ye4WLkRXOm0LoC4KQ/bWyUu4Aew7ZhDToXFw6ez7w5qOywNer1J+izQ77fDIVlsKiwvRo8UjOX89B6NvP/BSyuucb9EwNKWGEOtCxSLbUx3zm+bkmuG6dcYQBYD9W8xeHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169720; c=relaxed/simple;
	bh=FAfYRNcwGOqb2dGzqQkyQAmanFpEh4raI/GRcP6unT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kP0w6r4NWLsK0w0lQ+YxkUbxelDTYynCkaVTOjI0DI6eeeKNMPzPzORKVlEuQ1rHVQ70Up6ADWYXqvzGMNZbc4XpUOxOsP49G9M/PbKSSSwiWbnZJvVBKdK2P4zGnM4AnLnvXPVSx6x5U5EDR0YA6G8mnmj7SVMEvqnrBkJ4n+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ilngyQju; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ilngyQju"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ECD01516;
	Fri, 16 Oct 2026 09:55:14 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC1C63F7B4;
	Fri, 16 Oct 2026 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169717; bh=FAfYRNcwGOqb2dGzqQkyQAmanFpEh4raI/GRcP6unT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilngyQjumPlaCZ1rTAb2T3ylkuG6vRvmCdbMFW8kSZqCZtYoXcrhFXzKJKVs441ot
	 izYphg7YfV8VMRPLRjboUBAPCz65evy0sbU0UBWAvQjSuf0k1s5AK+AyfsJX/IA2Dc
	 aIGVxHjtjvt2urYIkWtz58Gxk+jgWqRtzLZnmkXs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:01 +0100
Subject: [PATCH v2 03/23] coresight: trbe: Use helpers for checking errata
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2030;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=FAfYRNcwGOqb2dGzqQkyQAmanFpEh4raI/GRcP6unT8=;
 b=iCDPV0eGNJBH9AAF9ztR1T3QIVAmyPD27hmA4MsF6tAxbVp+RE7r/2sHzk6KBPt5cN0VfZNUF
 huffIKcRxBcA+mETsTzmtyOTddpQG3j6CkJJkzL5b07S0ZequYw+AFh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Use the existing helpers for checking errata instead of open coded
equivalent.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 02d12445763a86d58c79bdf5143f761827456bc3..8ec0b4c4987f25d10ee0b2f80c27e10f76357387 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -738,7 +738,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 * the space we skipped with IGNORE packets. And we are always
 	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
+	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
 	    !WARN_ON(size < overwrite_skip))
 		__trbe_pad_buf(buf, start_off, overwrite_skip);
 
@@ -961,7 +961,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
 	 *  - At trace collection:
 	 *     - Pad the 256bytes skipped above again with IGNORE packets.
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
+	if (trbe_may_overwrite_in_fill_mode(buf->cpudata)) {
 		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
 			return -EINVAL;
 		buf->trbe_hw_base = buf->trbe_write;
@@ -985,7 +985,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
 	 *     - Adjust the TRBLIMITR.LIMIT to leave the extra PAGE outside
 	 *       the TRBE's range (i.e [TRBBASER, TRBLIMITR.LIMI] ).
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE)) {
+	if (trbe_may_write_out_of_range(buf->cpudata)) {
 		s64 space = buf->trbe_limit - buf->trbe_write;
 		/*
 		 * We must have more than a PAGE_SIZE worth space in the proposed

-- 
2.34.1

