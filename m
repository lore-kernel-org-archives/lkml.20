Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B133488742
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939068; cv=none; b=sNFmZbtHZPEO/kmglz9TR1cu/yJ7sVrB/bSfMYugwZD6ThjK8rOOAL0dhLpV3hJ+N0vGlNbCxl4d35TMhUIOOnFqK1xZoTATsab7Ot9i0wXZAIlvxCiSV1yZiXlY/i6sBjPNHQhgux60HFM5It+XFetCy0f1AlULutK28Oqs8P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939068; c=relaxed/simple;
	bh=Mt5RUIIqhNU/l5hHtkeYWBdiR+GT7HiHLBustqGOlCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KM2ufzGcpX4sYFCmlvol83z13Rn08AWDwqgcl4wJpbpJp+N3uxJbfvnNr82Cl33EbOtgulHR04zGp6SfeO0qZCeF8ZkEKiFtzb+zWCI6Rl57MCv5Cpl2wJzSYn0G8dBNg9V8NxSRYruRi4Bxtg1EpXaXmM80mbOTX5ZYb0Fe9bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yf4Lo02j; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yf4Lo02j"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so40297835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939062; x=1791543862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=;
        b=Yf4Lo02jlaW4bW+xhCC7XUZTSnHtjthuoqA+FSSk/OREbfxP7PEd0kotrMzaJ2xJea
         im5bmtdljUrxvkfvQm/ZZGahVXWX3DTsptNvcVmPDfJP/waa5Eyb7YBnfCmci/OWsSQq
         ohnu7aZZ4afHAMT3jBBih5wH6sT5P8UnwxSHakgqg8OHzJ/gN9onlI77rQx7xOB9avbr
         0YhsgYF7SAxEz8iFP0xFGnyKDyT4JAxuJN6ZIm6zUe/LFRT2Lymg5101533mmzhMlg+P
         tyukhJRbI3RyaHRKYIfiFxL1BBNINcpmeOMwee4K9alKVWseEU/TA1llsZv2/rODhX8v
         UAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939062; x=1791543862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=;
        b=F81lufm6NhaGOHkLARovAWJVkQj2eQkiR8wmq6ENCDrsXQsP3wbceYzFWTNhX1tHNJ
         P7t03xmsEnStz0BVDQ3zXy0btywzGM/llChNe0dR3y+mEWySiVVyb9l7ioZ55OTodWcM
         A9bPhRtSmQjwKTt3OCWhWyML6TvJdRiX3CD3oWlY+zB0kFqPRn3gyIQN8gZidWl99v2i
         fPofaK6t+FYS5xBYLaGS2QcMvKhe7v+hiYwUPknabFYtieNZFcCfnzHFQ6xm3JLELzbZ
         9iO/ERUDszLR/jisSigFEvNwLtKH1DLl8rS4ZREPotlExKvnwPjUQ7la8GHGIYr3uAy3
         v3aA==
X-Forwarded-Encrypted: i=1; AKwUvBxD/Aze4eBpDocaHI1Uih4C2oN5YOELmQ4dCd3mCs4Tud1Uz317bJJej6ohGHeTmoZO0wHMuP2yxFSAbis=@vger.kernel.org
X-Gm-Message-State: AFuF++m3uxMyggh4bkcIk1nmRGlTd8pfT+h03gqlkJVTm+mMjqesRPQ6
	KrhbNEtCUDkm8e3s1qdVWaKcfV3mQlsmlPy16prQy0HMjscJoaUxkYG63RnbqWAtuCU=
X-Gm-Gg: AYBFou3zM3Sx2dCP4UGXoaXt7Gcp820mM9l+x1zCm1Zx5JFKzOf/6PX/2jgjJtgfkRT
	bABq0wjvFYfYdB4nPVlxiev3dCcLu1iyzt1N+Qy1JT2AXxXoPuB2Z+F0KmG74NLVYxMdN3B0kwq
	+0VEt4jwX6yACXMI4rj/zEBdCRVsKFjMH9SyZMeKLy74Pi3DRiAEe2MYd/dqI/6JDJkygic0LIB
	iyGdZ+pXEHx33tkOISRSaaR3xZqs8ZMQDAlUobS+aUDyL2kGKCIYgAgAPIP1HlcisbmOtPXWSTB
	0gqMrvqa3Ll1qP53i5619yJmK97hN1q/90NIltg+5jH7FgGcA+J9Qm3LfdRA13tDItqmnmstivN
	w3sxmmzn+IGCFrA16GX8voL4JyXiiDDlYm4A0xL9hjic6WzK4nN1WIPuPR0+bh78fnmuewgNjwA
	YcE3c0Fcn/lgzJOQLtQrYjaccyjVkYUKQ7ofZ4TtRbBqgkleeQEOq002bl/RNckl/1CgG8UZXXO
	w==
X-Received: by 2002:a05:600c:19d0:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a02756f0c3mr40380705e9.5.1790939062211;
        Fri, 02 Oct 2026 04:04:22 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75669465e9.9.2026.10.02.04.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:04:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:03:54 +0100
Subject: [PATCH v2 2/4] perf cs-etm: Free partially created queues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v2-2-7a194aa61173@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
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

cs_etm__create_decoders() can fail half way through and the
err_free_queues label won't free them. Call the full queue free function
here instead. If no decoders were created it's a nop.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 12 ++++++------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  2 +-
 tools/perf/util/cs-etm.c                        | 25 ++++++++++++++++---------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 26940f1f1b0b..b56cf57a68c8 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -741,7 +741,7 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	return decoder;
 
 err_free_decoder:
-	cs_etm_decoder__free(decoder);
+	cs_etm_decoder__zfree(&decoder);
 	return NULL;
 }
 
@@ -793,14 +793,14 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	return ret;
 }
 
-void cs_etm_decoder__free(struct cs_etm_decoder *decoder)
+void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder)
 {
-	if (!decoder)
+	if (!(*decoder))
 		return;
 
-	ocsd_destroy_dcd_tree(decoder->dcd_tree);
-	decoder->dcd_tree = NULL;
-	free(decoder);
+	ocsd_destroy_dcd_tree((*decoder)->dcd_tree);
+	(*decoder)->dcd_tree = NULL;
+	zfree(decoder);
 }
 
 const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder)
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 12c782fa6db2..2a8214f17958 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -96,7 +96,7 @@ cs_etm_decoder__new(int num_cpu,
 		    struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[]);
 
-void cs_etm_decoder__free(struct cs_etm_decoder *decoder);
+void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder);
 
 int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 				      u64 start, u64 end,
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index fda6b6c02e26..78ae8443ac96 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1002,7 +1002,7 @@ static void cs_etm__free_queue(void *priv)
 	if (!etmq)
 		return;
 
-	cs_etm_decoder__free(etmq->decoder);
+	cs_etm_decoder__zfree(&etmq->decoder);
 	cs_etm__free_traceid_queues(etmq);
 
 	if (etmq->own_traceid_list) {
@@ -1017,13 +1017,10 @@ static void cs_etm__free_queue(void *priv)
 	free(etmq);
 }
 
-static void cs_etm__free_events(struct perf_session *session)
+static void cs_etm__free_queues(struct cs_etm_auxtrace *etm)
 {
 	unsigned int i;
-	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
-						   struct cs_etm_auxtrace,
-						   auxtrace);
-	struct auxtrace_queues *queues = &aux->queues;
+	struct auxtrace_queues *queues = &etm->queues;
 
 	for (i = 0; i < queues->nr_queues; i++) {
 		cs_etm__free_queue(queues->queue_array[i].priv);
@@ -1033,13 +1030,23 @@ static void cs_etm__free_events(struct perf_session *session)
 	auxtrace_queues__free(queues);
 }
 
+static void cs_etm__free_events(struct perf_session *session)
+{
+	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
+
+	cs_etm__free_queues(aux);
+}
+
 static void cs_etm__free(struct perf_session *session)
 {
 	int i;
 	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	cs_etm__free_events(session);
+
+	cs_etm__free_queues(aux);
 	session->auxtrace = NULL;
 
 	for (i = 0; i < aux->num_cpu; i++)
@@ -3476,7 +3483,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 	return 0;
 
 out_free_decoder:
-	cs_etm_decoder__free(etmq->decoder);
+	cs_etm_decoder__zfree(&etmq->decoder);
 out_free:
 	zfree(&t_params);
 	return -EINVAL;
@@ -3758,7 +3765,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	return 0;
 
 err_free_queues:
-	auxtrace_queues__free(&etm->queues);
+	cs_etm__free_queues(etm);
 	session->auxtrace = NULL;
 err_free_etm:
 	zfree(&etm);

-- 
2.43.0

