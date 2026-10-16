Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9819447220
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185137; cv=none; b=luvlPjz8r8ol9evStEYPMWWrdQiW2yzHuEGDvbcLZMv8b/YHNG4hd1KHg6X5e6HgewdA0ASPBYYyJlMWo1on/dF/1LhjZZbUCRDzvXcwG8o4zLQmsZKQIKPiN8NFPflOqAw/2t9OoCdD3qpltY0U/GfuZIRpa4AdXlrwlbtdrb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185137; c=relaxed/simple;
	bh=HMkE+TtGqBzGnfvZsjubcUGlEE/uoi7haxt9mMi8TJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGkWkKiCC+XAUkEIRMRIKnSVjgCCQIK2eCSl+6JD/38CJy7H1ww4sxTbml1iITlPDc0lGEbvG6EZgG9TGQJpzIjnnQf1uaHP7lXagCsuTElJOPFWRiPOsJ5PwVWtX/9U0NK+IGrqsvdWLZSOjeZwc0dLKvZzI7MmUJrQty0KTXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SiZwJbMj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SiZwJbMj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48FC014BF;
	Fri, 16 Oct 2026 14:12:09 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7813F673;
	Fri, 16 Oct 2026 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185132; bh=HMkE+TtGqBzGnfvZsjubcUGlEE/uoi7haxt9mMi8TJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SiZwJbMjJAnms3+CzvR0oJtnms0AmA97PKKiXUIzuQ7ZG7i8eH7GAXGx0wsBy2Sm+
	 n7WeQ5K+hPmUMBFdRKhOVBzwqAUz5gFkUNznk1mj5iz6vWt8pUgnQ6v8F56HbMXpYg
	 zUk27BHfPQ2SA/WI8Vm+EYtIgrUlmhBQoqngH0Y8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:48 +0100
Subject: [PATCH v2 10/11] perf cs-etm: Reset decoder on AUX offset
 discontinuity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-10-383ac26382fa@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=2836;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HMkE+TtGqBzGnfvZsjubcUGlEE/uoi7haxt9mMi8TJk=;
 b=hILxfLNr0Pt2uojkobUyJf/29/nJfq1kgCY/ds6pHImc4IujSbHaVqnOEl73bsvJxKrnBkGbq
 C0sO8xO22thC9KFkguC5k0UhYHkivVOfu5sD4xtezncnYvNRkZO89Iz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Indexed AUX fragments do not necessarily form a contiguous trace stream.
Snapshot reads can retain only the end of the AUX buffer and advance past
the omitted prefix. AUX metadata records can also be lost when the normal
perf ring buffer is full, leaving the corresponding trace unqueued. Neither
case guarantees that the next queued fragment carries a collision flag or
retains the source's restart synchronization packets.

Track the expected next logical AUX offset for each decoder queue in
cs_etm__get_trace(). Request a decoder reset before processing a fragment
whose offset differs from the expected end. This prevents decoding bytes
after a gap using stale packet and execution state. The comparison also
covers overlapping fragments and backward offsets.

Perf can internally split large buffers into consecutive pieces while
retaining the original AUX offset. Preserve continuity across those pieces
and accumulate their sizes when tracking the expected end. Keep the decoder
byte index separate from the logical AUX offset. Track initialization
separately, as zero is a valid expected offset after the counter wraps.

Zero-length fragments still carry logical offsets. Check them for gaps
and retain any reset request until nonempty data is decoded.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 8f04d7ceddd9d1f7ff22af234b19400efe27ba2b..37ae7ff5149433ed27cb3c9b880e8422d742a74d 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -123,6 +123,9 @@ struct cs_etm_queue {
 	u8 pending_timestamp_chan_id;
 	enum cs_etm_format format;
 	u64 offset;
+	/* Expected logical AUX offset after the last fetched buffer. */
+	u64 next_aux_offset;
+	bool have_aux_offset;
 	const unsigned char *buf;
 	size_t buf_len, buf_used;
 	/* Conversion between traceID and index in traceid_queues array */
@@ -1496,6 +1499,21 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 	     old_buffer->cpu.cpu != aux_buffer->cpu.cpu))
 		etmq->reset_decoder = true;
 
+	/*
+	 * Snapshot clipping or missing AUX records can leave a gap between
+	 * fragments. Check logical AUX offsets, as etmq->offset only counts
+	 * bytes submitted to the decoder. Internally split buffers retain
+	 * the original offset and mark subsequent pieces as consecutive.
+	 */
+	if (etmq->have_aux_offset && !aux_buffer->consecutive &&
+	    aux_buffer->offset != etmq->next_aux_offset)
+		etmq->reset_decoder = true;
+
+	if (!etmq->have_aux_offset || !aux_buffer->consecutive)
+		etmq->next_aux_offset = aux_buffer->offset;
+	etmq->next_aux_offset += aux_buffer->size;
+	etmq->have_aux_offset = true;
+
 	return 0;
 }
 

-- 
2.34.1

