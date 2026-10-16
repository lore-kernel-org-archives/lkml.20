Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619E5447239
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185139; cv=none; b=aDxllmnPDe8/blMdw+CnWhAeSTPyzHg3Iw/zK5kHeNPZkUpXCueIkA+S3vBUCSqDWEJFVLC7ePe8Bu+FRi+9F6fLmhrsgWrbdI+yHRVaUQkqVZzhEdvIPJulC27DBTYZsKWKbe4lcihQS6UQmM/EZE7gj5zQEOwNFukJ6S/EcIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185139; c=relaxed/simple;
	bh=odB4IVmHAE0cO3FyTTEtE7ltEbt7Y3v/azgxS4p/Qy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mddQh8x7DipIWA0noo/NiRxda8GZgvHOWf7ZDRi6aACl5CojQjV9/qgddLxKpmkPASyylc74P49yolCsg3v0SGk32y+KuLVTWPt1OC0qG58x0Y5QIMNe8fSDFCpyAS7Ru7Inu7ar4gsf9Ge3EAbXrS2UW0KTirCb5Jlhklp7S9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TTe6IyY3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TTe6IyY3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 239FE1764;
	Fri, 16 Oct 2026 14:12:11 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D673D3F673;
	Fri, 16 Oct 2026 14:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185134; bh=odB4IVmHAE0cO3FyTTEtE7ltEbt7Y3v/azgxS4p/Qy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TTe6IyY3z/gRvdssqiTxmQYMmw8PwpHbPTj78b6YCTkmbATpS+aAgFcNoi7Z6xbwE
	 2j65Je3HKUIP3EdyO6PpIwy6oYYg/JE4zoocgfi78JL9xxLaHlIJgEPcyrD0feQIwu
	 nULRnQ8ZLRdNNZlei/j+BlY3Xidlxc7SR1WJqJjs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:49 +0100
Subject: [PATCH v2 11/11] perf cs-etm: Set watermark for AUX trace
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-11-383ac26382fa@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=1957;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=odB4IVmHAE0cO3FyTTEtE7ltEbt7Y3v/azgxS4p/Qy8=;
 b=y0UuvGWrgW81YUULLpdhMtovKFv4pBBYJmBEzCG1h0joDfu/oWeSNI4i65dsioMv7tdMnYp+2
 D5tjrwRNWhBC8YLmLtU180UlQJhglJ7DibFFXyhbkYEXPZtS/9MXRgc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The kernel defaults to a watermark of half the AUX buffer. With small
buffers, the reader can be notified too late to drain the trace before
the available space is exhausted.

Use a quarter-buffer watermark for normal recording to wake the reader
earlier and leave more space for trace generated while it handles the
notification.

If the computed watermark is at most one page, set it to zero so the
kernel selects its default. TRBE's write-out-of-range workaround requires
PAGE_SIZE + 64 bytes per trace span and disables trigger counts. A
one-page watermark can leave every span too small to enable tracing.
The fallback retains a two-page watermark for a four-page AUX mapping.

Leave snapshot and AUX sampling behavior unchanged.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/arch/arm/util/cs-etm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a6612ea213066258672ba41769e578cb..2b29cd5fde4b8cc18e04d02308635d7b0c13ccf6 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -438,6 +438,21 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		pr_debug2("%s snapshot size: %zu\n", CORESIGHT_ETM_PMU_NAME,
 			  opts->auxtrace_snapshot_size);
 
+	if (!opts->auxtrace_snapshot_mode && !opts->auxtrace_sample_mode) {
+		size_t aw = opts->auxtrace_mmap_pages * (size_t)page_size / 4;
+		u32 aux_watermark = aw > UINT_MAX ? UINT_MAX : aw;
+
+		/*
+		 * TRBE workarounds can require more than one page per trace
+		 * span. If the watermark is too small, let the kernel select
+		 * its default.
+		 */
+		if (aux_watermark <= page_size)
+			aux_watermark = 0;
+
+		cs_etm_evsel->core.attr.aux_watermark = aux_watermark;
+	}
+
 	/*
 	 * To obtain the auxtrace buffer file descriptor, the auxtrace
 	 * event must come first.

-- 
2.34.1

