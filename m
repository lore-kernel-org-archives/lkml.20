Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879126;
	b=0IL3j0bn5ammlf3sNIBhl4reWJs5YN1v4UWxlMGct1FDLAwnaAN7TOIkE98V9mp8P4AQ
	 TcUw1n3NaN8NzFJLZSDxbqxSMk/iW3KAZIXquT9QwIbJzlzroTI8x8gFIHKFwtIEw2GGg
	 ipfd+EijZjrWdXBBd4tftANg68JnznVd1E9W9kUfi1wbtuqi/YOQHpF7EiT0/QLXJOVCF
	 ouQCOs/1KqPouHTTuti28V9TkuGPWqWCBmM7Vg9QDB3aqTQQX8t3vNwgZ5VWqdiX/NvIt
	 2n201rHVNfgOYwmBW52sWpeqXhlVc6TUDtx6SNQHQLHcr5R7KpX1lFa763leGCSXjWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
	b=UaywNdfkEaWBJhgi3FFOcTgjR5iD3u7tTKJJdJjfk1rJwkj72tpWjIoF/0FcVOhTqQ3l
	 Z0gR4wQO83NWSsZtrnzNxvpsm10MVyuCWBoF/QU18SdZG80ZFy5DKUtXUZr5MY8/LHU91
	 rQe5fUy6svdZvObeyD2jCZG4qeMcz4IX6b2VelnQAYe7LbjIQox/sd20ReWIU3bcj2mrv
	 F+pxyCjJj9R2aOLW7q+6LhcHlMYooImNZ8WKKbhc3xXlj4+0vNM+aztT+Qe7s3m9lFrK/
	 Tg7kSbuXi3YCo2hOqXWPhlPZXXNYdBpjp8Rl2suOqs9BIAqfLzbEdZkl7ZVVPPujC9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gJwHVSFi;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C9260A2612
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C9260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gJwHVSFi
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4923176309dso21834f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879124; x=1794483924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
        b=gJwHVSFiXARZWgQjVK1PPIL6vPBMS2i1wPbOV+zqI9mACph1+7aM9GK3EDwBJ24wYw
         wTQYetRpiRptJE+REiIsdJYDDnv8x4yNETJxmCM8iKduVQi0Y96I7J0Sb3rhMEMn/olj
         Uzt44eQWS6SQdokSKtOEtU31jevi4xpN+qp6WZ12TrZc1dIHJTtEIFTL1eu+/zP2VEhL
         yfNxNWXqIfS7btzT2nL/kX2+jAl0EUsQNcitOPHlCeaMhQpQ6H/MYgVHGoFYsKhCBP/e
         ZMsEQWMSMT8PoVcoDvXJ5Dw7anFYnn/3lX9ggX4/zeZqbo9sv9mn+80xwNgN9hQCBEUw
         RmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879124; x=1794483924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
        b=yWSLYegdHjKugM9b1EOKek5kaBV6JOX8USFxz1cL0GO78Z/4FqyvzOsXFpWr6c05dt
         Zl3ozRcwAA/OHY8pRTxp66gckfA8lXTNTmsEDISBPdvFvtvO0fpUDiQLzI/NBQFj2UzS
         oRdaHydC9jtgmo0o03VVekjrbHboxPvN5aH6RRgkH0i35a4h7zwiJnJ2u7AX3iGJDen2
         XAVstGhxBTSWEWTK3jymcyr1EHfD2feCJZ0ymtqKvl2DnmfnzzqHOHhQqofd+BoUhjlH
         VNDX1x2+rgSJ1CcpHH/GF+oRBewHyA35ZMYgPTDIra6bBl77sfKs9VQiR0x4mtc2/+m1
         3uXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLftsWMLQ7hGGnpGsOUyO/hjSmDDt2YVqbTsjoC1byHOUeVijstkfCHHT/fsmStm9KS213kjuP8vRomSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5xm6TiYIKFtmsO4TPM7R5Od/IqL28NHnfUbeW4xRWai5Idlfz
	iNS7S+ucnVUB7ZnEUzwPBLul1gQxOsK4WcAI9PMX7HhT44nRVhHa54Gkn+T1ca6skeo=
X-Gm-Gg: AYBFou19lOiLbuGfaqxELEpC+IRfFdMGDcboyDZKPCaZ3yjKkmx8LmHzrMeYNBZIJ0f
	6ZFfreVB90ih1KDkGXtnmz0VcaSyEO/sXJf2NcZFR+RtCxgIMIIIj0t+yb/M1Y7lIooAKobMf0K
	Iu2lp79+B2mrNAPy9GZsaQeEfLvQyU4bMnLWmpQ+Qkbar+GVmZzmSOlr4OkpyN++FdkEzow0gWR
	N2Ej15GatnQlXjE6tEDpKcEUs9bkpbaTKmgVqY8Vq/zuoQ2v45Z5caYcVs8gyk9jQYBeigQmZ47
	VF8fTrmycdCe12qganpbt16jze80WTDLmCvb6CQ3ksYZqHlhnLCf2sk6iBsW8fgOl40DgVebM4j
	a9XP0wOqq8dKWgraT5xZoTrukiGlWi2Os8WERSVCrtHjo4RCzbdxuOLzSo177zdJpJ6zX/6ELSS
	yx8iJbN+QO67Than5RbBN2Qle8ysTrt1no+8SA6jk/Nw3OBDzQDPFBxZIvNammew/RtqkHOE2DG
	yRkulRWmdBft1bkk/Y6dO3YD5oJ8/IDdGzYKc3i+q+cI9TIsJDRglSmOhtltQ8ar6b+9WoS4jIL
	RNUoyj3DJnZcCmMZOXePN5ossqrtG7LF
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr378217845e9.29.1793879124465;
        Thu, 05 Nov 2026 03:45:24 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:52 +0000
Subject: [PATCH v4 04/19] perf cs-etm: Use per-CPU queues for per-thread
 mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-4-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

This makes it easier to support multiple threads without creating a
decode tree for every CPU for every thread. It also fixes the CPU field
of synthesised samples being incorrect when the CPU can't be retrieved
using the trace ID in unformatted mode.

It also simplifies by removing a special case in the decode path for
per-thread mode. Per-thread mode is now decoded in exactly the same way
as per-CPU (apart from pre-initialising the context).

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5abdd726c6d2..966261429da6 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -296,9 +296,6 @@ static int cs_etm__map_trace_id(struct cs_etm_queue *etmq, u8 trace_chan_id,
 
 static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
 {
-	if (etm->per_thread_decoding)
-		return etm->queues.queue_array[0].priv;
-
 	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
 		return NULL;
 
@@ -436,11 +433,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
 			return -EINVAL;
 		}
 
-		if (etm->per_thread_decoding)
-			cpu_data = etm->metadata[0];
-		else
-			cpu_data = get_cpu_data(etm, queue->cpu);
-
+		cpu_data = get_cpu_data(etm, queue->cpu);
 		if (!cpu_data) {
 			pr_err("CS_ETM: Unformatted queue missing CPU metadata\n");
 			return -EINVAL;
@@ -1301,7 +1294,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 	queue->priv = etmq;
 	etmq->etm = etm;
 	etmq->queue_nr = queue_nr;
-	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
+	queue->cpu = queue_nr;
 	etmq->offset = 0;
 	etmq->sink_id = SINK_UNSET;
 
@@ -2187,6 +2180,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
  */
 static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 {
+	struct cs_etm_auxtrace *etm = etmq->etm;
 	int ret;
 
 	/* The current block is not finished */
@@ -2215,6 +2209,29 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	 */
 	cs_etm__flush_all_stack(etmq);
 
+	/*
+	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
+	 * different threads. When the TID from the AUX record on a CPU changes,
+	 * re-initialize the thread using the AUX record/buffer fragment TID so
+	 * we can start decoding even if the context ID packet was cropped or
+	 * they're disabled.
+	 */
+	if (etm->per_thread_decoding) {
+		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
+							CS_ETM_PER_THREAD_TRACEID);
+
+		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
+			thread__zput(tidq->frontend_thread);
+			thread__zput(tidq->decode_thread);
+			tidq->frontend_thread = machine__findnew_thread(
+				&etm->session->machines.host, -1,
+				etmq->buffer->tid);
+			tidq->decode_thread = machine__findnew_thread(
+				&etm->session->machines.host, -1,
+				etmq->buffer->tid);
+		}
+	}
+
 	return 1;
 }
 
@@ -3288,7 +3305,9 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
-		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
+		/* Old per-thread files have no CPU (before v6.4) */
+		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
+		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
 
 		if (!etmq)
 			return -EINVAL;
@@ -3301,6 +3320,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		auxtrace_fragment.auxtrace.size = aux_size;
 		auxtrace_fragment.auxtrace.offset = aux_offset;
 		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
+		auxtrace_fragment.auxtrace.cpu = etmq->queue_nr;
 		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64

-- 
2.43.0

