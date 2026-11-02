Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621749;
	b=PCICk5zrCb8pFJh8nQbvHj3tyc1tMSM+q8ukLp8v2fHSOycAQElqrQVorGPVY28s7OmI
	 ceJ75SWx5tsXuN24qJJD+4SXxY7+E+WMWQUSeeiX5N3IDqxtWob9S59/caeXMgogSwzqv
	 76yp1DTk+Z2ZFpJPVNbFvMtXzrSQ0P4+6m0nGlJfpQ0b9hGB5UPe9bTP+EP+l1DLdt4jm
	 34Xt5wU1mLFIoFx8JFugbAQQCKwLY1A+QA/AMJqhCN4FmrkVRFhpSzQ2b0WDY1oW/pB42
	 bVl4K9fOhwzO1iO5YCNuCT+o39bPZbYgThUForg/u8L+6PTHJ3RhWtPatSve+EYXX4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
	b=30EfkNSKAJyPzpeJeIsBt3LR750cQSslRe+M/wJsA+ZtHEZGqRsHdrmgoBT31Xl0hbZW
	 5ns6j3wIfDCnLuGwckfc4RkJ0Md6kGyZiMep3cABVx8/qtSiIbPEn4UxrWZJbUJugfluD
	 0pIDgl5Ac4d4zgZISXmYNMzm8j6b4a94+sLmcambUO87taQjVxZ4i2FjKFo5o9gqt7nxa
	 sgHP3kJapAxtQ5BI1AiHgrvYnVaEh6eY51jv3xrt67vcbK+o0DOPMVdgj3qQDRkznN6fj
	 ikyDMzg3apYz/NxUOyo948jogq+7NTn4qU/DmCTFe/pqss5Io9lkEPtejTbwe1qdpAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YJN7Iw4Q;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2291B60A2634
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2291B60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YJN7Iw4Q
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so26447445e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621747; x=1794226547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
        b=YJN7Iw4Q0LLmBxRNrJVqSg3KtrkyLiLCTIzVd1vsu6yUmY8LBpkywyUB3JKl5LmCAr
         CjPDJbb7qKFi4BdrX4Ii/f8PHkHDSyv+s7SgccxhHdkUuzNeZxhtpi7Ob+vVmLSZOCov
         43PmRuWevzyAJfnA5UKArt8+i+MHrfKkQgDDZKIJUOvOcdsJYuPNJ/GN5DyxSsbRvRgk
         QMduL+tj+KFmGNG1lGL36wQB6rcrHoDpy0HGsaBjIjr5LnmSaEplo0X0eCQFyRuJ27ao
         U+zUh8uni6tRFJVyeAL1YEs+D9pjTPds/NO5TByW/8QdVeymK3Por7rJFEa+5KCulo6M
         93TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621747; x=1794226547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
        b=vSSw05dL/WMbmdPLnZYX8WntkYQhi2usyWBd+EQnOQNIKhCTTJRsH7nBcX06syn4cr
         GeCr4Xhcsg5BuftnZAcQjZB1Y99U4wtf+GXfjcvJBdP7vyZtyq4uzvMuPiQOoC8oaSj4
         ybr4GNwJ7r+bYfcaYrFx1N2fQY7yN+K9n/JyQvRDZUqL2ljrhwW4Lecs4Q77Eyl7yiam
         ZkbtOdsgNuMbg9t1o+nVTRitM+1PF2b3LM+3RavK82h+SIdLbsZBHRb5hEwyf0R32pPi
         vdOrERA7QFY/WO97l1EtZbqWrLi23DcbiUB/8gbamIGz3VvruJk8uCCnUB+3SzIIjekX
         Wi/g==
X-Forwarded-Encrypted: i=1; AKwUvBznLiyMWCOI93MvMsyBy2b5+bJuJno8XaMm8NqiYeWbMnzapFfGtUUmPT3D4C0unKpB3MYnieWk/ZOD1/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPkX5x7fN7rVJGkClbjx35J/Wba91st6U+JTP1BFoZk7lGTIcM
	C+sJKvZK+uG4UIG6qFHz8121KCd0Hl3R/x+Yibw3ISee6N6z6gW3F6WYthpAv5N2qUU=
X-Gm-Gg: AYBFou3mh3pwIB3uhtF2yXDp1omP9YwaX0E3UJq1Mu4nYnLbnhVDErf4moDjPODdNAN
	xtz2WomwvauMQar9mqDW6LV1gySyuguiMihwgTsDtq02ICj3xBjyuAmNLE+8SGlRznoZbiHk9hv
	zy0zIK8NU++tOHDSwnRkoe3OpDLsnry+KBhOtUnqT1V8ma2HIAVz6Z52IqKZsND/TtNnRJXC7qX
	gJUCXJg+16c8vnfjks3dae+KcyQ/mcDIOC6sAE9ns2hfs+wR3niDOz82xXMviJedze7KkZiMQqE
	IdKtqT2hJ7zwTSt8GHe7qdiBIhfngjTsBIff5ZsL3hj9RIi5zwKq6OIAoSfXLdy+Ng2Xffbn30o
	RiFZO5+ExJ50pm5FNySEB5BuBSwEzr0FbRRh2C+uXfl+fhTcWAJ/K37uPX3Txk5pBvbVkAsV/PW
	YIstdcKqZAxgdCeuDEKvsDXETjRd62vPcXxhfsgXyIwEFVxTYaNBTmH0/LICYOWK4b8qUHB+xUX
	xPrfhtkOI7e46muPcYE7ANthc30NCSCJtXiqPsx62HcAiYsmq9qgmyNTXbo3QaHapgZsn1zMpwL
	7tipvODpJq0s2IvMY22pqP1qlosuS92U
X-Received: by 2002:a05:600c:1990:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ac1923581cmr215808995e9.32.1793621747540;
        Mon, 02 Nov 2026 04:15:47 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:18 +0000
Subject: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 509ec014b276..f19aa4f787fa 100644
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

