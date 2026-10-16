Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D9A448B9D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185131; cv=none; b=Cqhm/jJaaWZcOcDNVOKjRrRJXcb0RAWNsZdBuvRnyMcB1F8Wm+DmFz3RWwl0dAF4BqmKZMfDd/qgVJaOTp6JPhp3c+V7fKZgg6s1MEd3BIvjbXWjduomL7TrBYp9brLElSIdWvL3665iO2/4CV3GrWQotWUZG5tqwLy1867RsEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185131; c=relaxed/simple;
	bh=v1LAhb2I0+3CyA4TRLYHmPRAnmRqKBFBaITXlBKMXvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2iuLRtRa3iNKkLVyAVUo43BTWKvGSZHW9iBwO4sLbNx7O7XUEXtcNS55JXXxXOCn7u9lU4IqPkx5GOaGzZSD3G00UA+yaPWmiejy5WIgZweA7kHQIYTPYGYY7XorE18CNB+86J6w+sjhIJ7MK48bb/7LSUsxOBx89bhmjuqe+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=f2CPc+79; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="f2CPc+79"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EC6C16F3;
	Fri, 16 Oct 2026 14:12:05 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B7513F673;
	Fri, 16 Oct 2026 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185128; bh=v1LAhb2I0+3CyA4TRLYHmPRAnmRqKBFBaITXlBKMXvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f2CPc+79kObMka5QjflCmP5zLp/Dr97mFK+PaWOgXTI/BfTKn9YTvt3yMaMYyV1za
	 ziuXLBNtwselu6D1xTK+TpR4Osn2gF93KOTg6Y2cVuE/o++tUSabtA4lbWkR4F030d
	 2dih7R59FpqaMyC+G+peFwjPMif363881cMRDNM4=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:46 +0100
Subject: [PATCH v2 08/11] perf cs-etm: Reset decoder on COLLISION flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-8-383ac26382fa@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=6438;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=v1LAhb2I0+3CyA4TRLYHmPRAnmRqKBFBaITXlBKMXvw=;
 b=cBXrjgRyUeaptbN5lHxtB6Gf0hoWBYLOasi+72DzbPpb2NAzzI28CLV6AM6u5JiKkQYBMWUbt
 +1wV5GhkezaBUaE+LZDFjCcpOK1s2Xwqn7+A0KKzEpXbm6Xf2ptw5aq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Resetting the decoder at every AUX fragment boundary can discard pending
decode state even when the trace stream is continuous.

Store AUX flags when queuing indexed fragments. Preserve decoder state
across their boundaries and request an explicit reset for the next block
when the current fragment reports PERF_AUX_FLAG_COLLISION. Source restarts
with in-band synchronization are handled by the decoder. Keep resetting
between blocks queued without AUX records, where the flags are unavailable.

Keep setting and clearing the queue reset flag in cs_etm__get_trace(),
where the preceding fragment is available. Clear a request after its
nonempty block has been consumed and derive collision resets from that
fragment. Preserve deferred requests through empty buffers.
cs_etm__get_data_block() only performs the requested reset before
processing the fetched block.

Keep flushing retained context-ID thread stacks at every data block
boundary. AUX records do not distinguish buffer maintenance from normal
event disable/re-enable. In-band restart packets synchronize the decoder,
but only the current thread's stack is flushed when processing a
discontinuity. Another thread may have changed its stack while tracing was
disabled, and its first instruction sample after restart can otherwise
contain stale return addresses before branch bookkeeping clears the stack.

Flush those stacks before decoding the new block. This conservatively
limits callchains and branch history to each chunk while preserving decoder
continuity. Improving stack continuity can be handled separately.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/auxtrace.h |  2 ++
 tools/perf/util/cs-etm.c   | 46 +++++++++++++++++++++++++++++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 6947f3f284c029286837e4e1dd9f535a5f0b6334..6ea212802e418ebd6536e3ea5456bab7530eeb26 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -243,6 +243,7 @@ struct auxtrace {
  * @buffer_nr: used to number each buffer
  * @use_size: implementation actually only uses this number of bytes
  * @use_data: implementation actually only uses data starting at this address
+ * @aux_flags: AUX event flags
  */
 struct auxtrace_buffer {
 	struct list_head	list;
@@ -261,6 +262,7 @@ struct auxtrace_buffer {
 	u64			buffer_nr;
 	size_t			use_size;
 	void			*use_data;
+	u64			aux_flags;
 };
 
 /**
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 114b3cd2da495e54e78df8fbd707898312f95079..6f95730fe3b94ae3f534eee505132a2efbc4ff96 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -136,6 +136,9 @@ struct cs_etm_queue {
 	 */
 	struct intlist *own_traceid_list;
 	u32 sink_id;
+
+	/* Reset decoder before processing the fetched data block. */
+	bool reset_decoder;
 };
 
 static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm);
@@ -1436,6 +1439,13 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 	struct auxtrace_buffer *old_buffer = aux_buffer;
 	struct auxtrace_queue *queue;
 
+	/*
+	 * Clear the reset request for the consumed block. Empty buffers have
+	 * no decoded bytes, so preserve requests deferred through them.
+	 */
+	if (etmq->buf_used)
+		etmq->reset_decoder = false;
+
 	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
 
 	aux_buffer = auxtrace_buffer__next(queue, aux_buffer);
@@ -1467,6 +1477,15 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 	etmq->buf_used = 0;
 	etmq->buf_len = aux_buffer->size;
 	etmq->buf = aux_buffer->data;
+
+	/*
+	 * A collision requires a reset after its fragment. Without AUX flags,
+	 * reset between all blocks.
+	 */
+	if (old_buffer && (!etmq->etm->data_queued ||
+			   (old_buffer->aux_flags & PERF_AUX_FLAG_COLLISION)))
+		etmq->reset_decoder = true;
+
 	return 0;
 }
 
@@ -2162,17 +2181,15 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	if (!etmq->buf_len)
 		return 0;
 
-	/*
-	 * We cannot assume consecutive blocks in the data file
-	 * are contiguous, reset the decoder to force re-sync.
-	 */
-	ret = cs_etm_decoder__reset(etmq->decoder);
-	if (ret)
-		return ret;
+	if (etmq->reset_decoder) {
+		ret = cs_etm_decoder__reset(etmq->decoder);
+		if (ret)
+			return ret;
+	}
 
 	/*
-	 * Since the decoder is reset, this causes a global trace
-	 * discontinuity. Flush all thread stacks.
+	 * AUX records do not distinguish buffer maintenance from a source
+	 * restart. Flush all thread stacks before sampling the new block.
 	 */
 	cs_etm__flush_all_stack(etmq);
 
@@ -3154,9 +3171,8 @@ static u64 *cs_etm__create_meta_blk(u64 *buff_in, int *buff_in_offset,
  * file_offset.
  *
  * Normally, whole auxtrace buffers would be added to the queue. But we
- * want to reset the decoder for every PERF_RECORD_AUX event, and the decoder
- * is reset across each buffer, so splitting the buffers up in advance has
- * the same effect.
+ * want to check every PERF_RECORD_AUX event to decide if need to reset
+ * decoder across each buffer, so splitting the buffers up in advance.
  */
 static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_offset, size_t sz,
 				      struct perf_record_aux *aux_event, struct perf_sample *sample)
@@ -3168,6 +3184,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	union perf_event auxtrace_fragment;
 	__u64 aux_offset, aux_size;
 	enum cs_etm_format format;
+	struct auxtrace_buffer *buffer = NULL;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
@@ -3251,10 +3268,13 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
 			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
-						 file_offset, NULL);
+						 file_offset, &buffer);
 		if (err)
 			return err;
 
+		if (buffer)
+			buffer->aux_flags = aux_event->flags;
+
 		format = (aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW) ?
 				UNFORMATTED : FORMATTED;
 		if (etmq->format != UNSET && format != etmq->format) {

-- 
2.34.1

