Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C21748CD7A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939735; cv=none; b=EJ7QbcA2R9fQmQ58l5jKK7pEf+gJrrMguNrzXZR92Mpei/iUyCE0q9xKb1w7UCw6crlHBMAycrb9JEQE4UdIYdeI28xor4gSHjg0k4GNfCnxOc9Fks0z1QhRoXNJ89AbwX6MxMwJZRnrJpwlEUQ/X3imRtypT69ULooSoVCPRKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939735; c=relaxed/simple;
	bh=Ps3ytIIG8ZOcNH1G2Bg4Z/2oCYejzFGQneZMKGToxd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBd/qAc3DRrY19BHtGJyuteSs/A1l4p5f+ji9LQaXUd+9z5Kd14x0tkeZ2aS5cFxQtDq2RMdVAMAi7as/lbBCLpDMnKnN/G4Ho0c84Vk1F+vc8J2/IcCACk1E5nO2Gq7v1PHt0oABUuka8furtnhcjtAA409lM6NRcotuG0vzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZ3GCQrL; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZ3GCQrL"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-48b0622cc90so1241308f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939731; x=1791544531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEX84yZ8M+61/ijnKCtVAw4jIEHCAZ6K9y5ENa8GGEM=;
        b=AZ3GCQrLrAaAOTNu+YlA8IKW72zNye/5z9VrtLYtI4hshSn0/nOiO/BJuB60EYOkaP
         Liy6/bQF/R6nabKuGVEeXV4ukNfqBMT09NBMyoX5eC1f7+BPplj4+QXZRNrjQb1Tcwgf
         ggqb3udgKJeDsLyTrHhNyYEo1fMVS5r8Y0eKHsOB+Lg2+LE5Ehp7vgqXwX8W5d2YVAnE
         qUWtZ7aapYhM2IgNm7wkJjYjfd++qSmREjESzreTFv5+Nrbesf38fHJfyI6yvvszsUAU
         fXRyAQUhiDzaDqUL6yDtFx38UyKooC95VThFnvEUKM16y2/n+7RUWtLZZAgYG8c3RF87
         qI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939731; x=1791544531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEX84yZ8M+61/ijnKCtVAw4jIEHCAZ6K9y5ENa8GGEM=;
        b=t9h2ZTj4Nz/9b/4rmiaVARdhCYref73Rslbn1UZnRV56iYxQtgoHHX0UrefBwbMXtu
         PJWNKxWeXPfgbk3WIeR/htej/Shp5hKAmTuJhPoD2eILhzRk9NrSY8ES8NB16d1YthU1
         hyfnNtcCwzuUiY0IHqtwTaBB3CS8CSmG/EoxnK7670I7d+qJp77p5tVAf+yC4CJHlt4w
         +LX3z1vbZzCo4yYJFtkCjMMlgjDnxpHH+jC6TeXzdqgTXLflH9jlwAZFNsONSWpVuQc8
         ZsmH9Fd8/Onvqex4os24Rvl47hkoMDrAexRvqm1iAQ6Rg6X1raiYHLljUOn8PQAce4yp
         dXgg==
X-Forwarded-Encrypted: i=1; AKwUvBxwD1l+PWMKWWcwzOMgxzGRTScas9z9REp5r8CP5+Rwb76/Zcn71eLB9TUd2ZfOkbKLaHu2VT857nMMUcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/48y0O5IQ7PXVmkcNqYlBsNMESEfR0lHvykFC0DBYBpwbUfpa
	VN2BehPTMdEQ3764M/cMXyFfCWgKtL+PLC0WlS5gf89J2aqQZa+55dK2akvP1IeMr1Q=
X-Gm-Gg: AYBFou2xKFgRzOfGheTZKZkDe7FeNNFWkH864lVn9gre8VGzdFUP4S/eU1+wiUeP7iV
	Y1w2J9F0cJ6cQMGMG4fMvgKLmwhXBVuqQgSYNPibec5sKeACk+wLV4LJMYUiOghYZacu9uQoTY0
	e32pqlVVxl8fB74r46uPp4zmtehg4+H+OCroIYcdJe0JykLF3anEDe2FY6aeNMwKZKfkFlkHBbe
	4IqEnqMCJrvs2lPEfXFZG2q8egHAdK/HvHBdnE5+TXTK4cBts8MO8cBHxSzaBjYrGBiPS8fAxHg
	NvTVSaeB0tSTKbyH9b+HcroM5eesfYJkEt3zpewPTk3IZm1lhf00N7aWr3uJpsBLpDrSXPNtP3j
	PElUc0QsBI588BjBDGpuGkuaXTozmiaGvUNd3iErl5jMwl3LRfFV6+9RA4B7HmAWjmorwHseeG1
	UsIKQ2XoP8pBKUiq/7wLLIHBFzU7u+M6uCG6BqBF2DaJEAyajEr6DjPdKpgvfI6FO/mjaCkkGJu
	g==
X-Received: by 2002:adf:e74d:0:b0:48b:375:65e0 with SMTP id ffacd0b85a97d-48b127519ddmr3271464f8f.54.1790939730661;
        Fri, 02 Oct 2026 04:15:30 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm4752986f8f.43.2026.10.02.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:15:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:15:13 +0100
Subject: [PATCH v3 3/4] perf cs-etm: Synthesize missing HW_ID mappings for
 raw trace
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v3-3-1d8b6ef339c8@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

From: Leo Yan <leo.yan@arm.com>

The CoreSight driver emits PERF_RECORD_AUX_OUTPUT_HW_ID via
perf_report_aux_output_id(). If the perf ring buffer is full,
perf_report_aux_output_id() can fail to emit the record and return
silently.

When at least one HW_ID record is present in the file, perf skips the
legacy metadata-only trace ID mapping path. Therefore any raw AUX queue
whose HW_ID record was dropped can be left with an empty traceid_list,
and cs_etm__create_queue_decoders() will not create a decoder for that
queue.

Fix it by ignoring all HW_IDs for unformatted queues and always create
one decoder per queue unconditionally. Trace ID is unused so we can hard
code it to 1 (0 is a special value used in
'pending_timestamp_chan_id' to indicate not pending). We also need put
the same trace ID in the CPU metadata because the relationship between
CPU metadata and traceid_list is bidirectional. Moving
cs_etm__metadata_set_trace_id() into the mapping function solves this
and simplifies existing code. cs_etm__insert_trace_id_node() now does
two things, so rename it to a more generic cs_etm__map_trace_id().

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 85 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 78ae8443ac96..c0152549e3e2 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -243,8 +243,12 @@ enum cs_etm_pid_fmt cs_etm__get_pid_fmt(struct cs_etm_queue *etmq)
 	return etmq->etm->pid_fmt;
 }
 
-static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
-					u8 trace_chan_id, u64 *cpu_metadata)
+/*
+ * Add a traceid_list entry that maps a trace ID to a CPU metadata for this etmq
+ * and update the trace ID in the cpu_metadata.
+ */
+static int cs_etm__map_trace_id(struct cs_etm_queue *etmq, u8 trace_chan_id,
+				u64 *cpu_metadata)
 {
 	/* Get an RB node for this CPU */
 	struct int_node *inode = intlist__findnew(etmq->traceid_list, trace_chan_id);
@@ -289,8 +293,7 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
 
 	/* Not one we've seen before, associate the traceID with the metadata pointer */
 	inode->priv = cpu_metadata;
-
-	return 0;
+	return cs_etm__metadata_set_trace_id(trace_chan_id, cpu_metadata);
 }
 
 static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
@@ -314,12 +317,11 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 		return -EINVAL;
 
 	/*
-	 * If the queue is unformatted then only save one mapping in the
-	 * queue associated with that CPU so only one decoder is made.
+	 * Ignore HW_IDs for unformatted, a decoder will be made
+	 * unconditionally later.
 	 */
 	if (etmq->format == UNFORMATTED)
-		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
-						    cpu_metadata);
+		return 0;
 
 	/*
 	 * Otherwise, version 0 trace IDs are global so save them into every
@@ -332,8 +334,7 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 		if (!etmq || etmq->format == UNFORMATTED)
 			continue;
 
-		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,
-						   cpu_metadata);
+		ret = cs_etm__map_trace_id(etmq, trace_chan_id, cpu_metadata);
 		if (ret)
 			return ret;
 	}
@@ -344,7 +345,6 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 static int cs_etm__process_trace_id_v0(struct cs_etm_auxtrace *etm, int cpu,
 				       u64 hw_id)
 {
-	int err;
 	u64 *cpu_data;
 	u8 trace_chan_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
 
@@ -352,22 +352,13 @@ static int cs_etm__process_trace_id_v0(struct cs_etm_auxtrace *etm, int cpu,
 	if (cpu_data == NULL)
 		return -EINVAL;
 
-	err = cs_etm__map_trace_id_v0(etm, trace_chan_id, cpu_data);
-	if (err)
-		return err;
-
-	/*
-	 * if we are picking up the association from the packet, need to plug
-	 * the correct trace ID into the metadata for setting up decoders later.
-	 */
-	return cs_etm__metadata_set_trace_id(trace_chan_id, cpu_data);
+	return cs_etm__map_trace_id_v0(etm, trace_chan_id, cpu_data);
 }
 
 static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
 					 u64 hw_id)
 {
 	struct cs_etm_queue *etmq = cs_etm__get_queue(etm, cpu);
-	int ret;
 	u64 *cpu_data;
 	u32 sink_id = FIELD_GET(CS_AUX_HW_ID_SINK_ID_MASK, hw_id);
 	u8 trace_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
@@ -375,6 +366,13 @@ static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
 	if (!etmq)
 		return -EINVAL;
 
+	/*
+	 * Ignore HW_IDs for unformatted, a decoder will be made
+	 * unconditionally later.
+	 */
+	if (etmq->format == UNFORMATTED)
+		return 0;
+
 	/*
 	 * Check sink id hasn't changed in per-cpu mode. In per-thread mode,
 	 * let it pass for now until an actual overlapping trace ID is hit. In
@@ -419,13 +417,41 @@ static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
 	if (!cpu_data)
 		return -EINVAL;
 
-	ret = cs_etm__insert_trace_id_node(etmq, trace_id, cpu_data);
-	if (ret)
-		return ret;
+	return cs_etm__map_trace_id(etmq, trace_id, cpu_data);
+}
 
-	ret = cs_etm__metadata_set_trace_id(trace_id, cpu_data);
-	if (ret)
-		return ret;
+static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
+{
+	struct auxtrace_queues *queues = &etm->queues;
+
+	for (unsigned int i = 0; i < queues->nr_queues; i++) {
+		struct auxtrace_queue *queue = &queues->queue_array[i];
+		struct cs_etm_queue *etmq = queue->priv;
+		u64 *cpu_data;
+		int ret;
+
+		if (list_empty(&queue->head) || !etmq || etmq->format != UNFORMATTED)
+			continue;
+
+		if (!intlist__empty(etmq->traceid_list)) {
+			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
+			return -EINVAL;
+		}
+
+		if (etm->per_thread_decoding)
+			cpu_data = etm->metadata[0];
+		else
+			cpu_data = get_cpu_data(etm, queue->cpu);
+
+		if (!cpu_data) {
+			pr_err("CS_ETM: Unformatted queue missing CPU metadata\n");
+			return -EINVAL;
+		}
+
+		ret = cs_etm__map_trace_id(etmq, 1, cpu_data);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -3757,6 +3783,11 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 			goto err_free_queues;
 	}
 
+	/* Create IDs for TRBE sinks so that a decoder is made for each one. */
+	err = cs_etm__map_unformatted_trace_ids(etm);
+	if (err)
+		goto err_free_queues;
+
 	err = cs_etm__create_decoders(etm);
 	if (err)
 		goto err_free_queues;

-- 
2.43.0

