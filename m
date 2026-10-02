Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5548AE36
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939731; cv=none; b=oXQ0+145xh8vzbO66Xt+/BuvAE8IlU4yP2FPA129I8HB/UJMiMb2nPep3elvJ95JYIcKze081fPLTar4OqZ9csUHegePb2JR6Vm4/mHyU1pA2nCLHPAA1Z/E+AAOiY0wCmvSkcuwys5jCL/RDo1C8aBbTcX4ppEfenBosa47FQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939731; c=relaxed/simple;
	bh=xka5UItDIrEJnIvKmqLwmmfEobjfMvpvaTiygYgaFd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlpv5mbHCrzRgQCdVLDPauhaGDQsh/8IP6PpHEP3W9nFFYcdhF2R2VJol16b1C7wgxo7V41B2T2J9MucweWfBDFrkQ5qhmjisfKThEe7BqsdTytJ1zbH18chmCuiXSO29JezcvrV+fGKXl+hgl/V+KpSBefMn67ibasY+5l6SVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7BX39kP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7BX39kP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso42415315e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939728; x=1791544528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=G7BX39kPw1LMFjxkbIJlHkHTbNW/HGPZN27qRa+vOdIvaYNqwukwOZCaAAsUm+tEcx
         oLVw+kzodjCnPWgb80San7BCf4YbNZR+6qAEeAseRr7fQ+aGPZF1S1BqzZKX39INM/1r
         z+2FRwhNKscZ9Rcyc1SmlZq5BGrbnfC1Ak84Mb87kYKBcYwo9vaHpi0MBPHkzp0oPSOo
         cKkL/lCClAkMtD9xPVv4G8Hlot2JQgsF+Sm1x7rjlFRWh43b9/MIFJRPZL4bQxUa8Yhd
         sPTAZBGrfxECegoTiqia7m7s5qKCJxAPXIJHzrnCv9MCd578xnmHHW79PHN8swRk8vLw
         qH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939728; x=1791544528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=fuCq+ZEyigqYz5ry0kDDCeSKtJbHiVptwJ5AyBt+4kwKQ1y7O7HXZ5QlFPAFeygu9f
         npZwD6Y5FFOO1uTWZmegFkgJ0UlX7ogLEyXoLiGSs7ziCl3ESyizvpzflLkLESgMvGkj
         xqxO1Uk4U709rJvcgHGZU0V845kHhhTB2tXoqKAxYsC5S5Mk/tnlzI2Qhvg6V/k2g4TY
         orVAXm7NBQaelKfZDXdiL03QAIEZ6b2XlLw/KwytIelAYhPx8+oGtJmFlWGun2xUzVnf
         iUemcykV4Lr2ZJ49G0dsKjK+TX+7AnEIaNOwPWFRw7fi5huN256BTA2cWSKjCYWQ8woG
         /ptA==
X-Forwarded-Encrypted: i=1; AKwUvBxY5C7Hxyw1IKLSag2u7UvSrpdbBGEBM9zhb2/qwJG/NGAk84ec215ThGQ/nQIo7FPfAi7GNz7Rw8GIYuA=@vger.kernel.org
X-Gm-Message-State: AFuF++lqy7IXfyFm5km+J1uYw5DyAZ7iwv48QGR8fxg8o46REMz7vrmY
	Nk1QKxjWaIz4dcTAI355MU8b0YCCQ2ptJZ61lVDot5OT+AFIWErahXK+mQWPRN9lmmM=
X-Gm-Gg: AYBFou3kLXgmlNy+NlCV2yv7vDD4c1Al/7mWo2GM6qcZX8w6MUpVUOqTd1me6frFTbm
	XAeHIZc1MRaHZggsxW3Pvo6OXKH5ndGN5b0xXNZ4Q9V6PdpleVNln7ueHwg6x93lmAXH+ecsakZ
	6Lo9LTik2pof/+VgpKhqOuWdxmS9G+J+8VWwEqBSnDc+lRZ8QZEhbbIphwt2LJW5lfSl3zEjppi
	Fc4vuXtuS0K/6ebNwR0ZfCRUy5SaMdv/PQPdXuZ7WlJkqaHwzSYRgUiL0vUTgCv2F5ez6WOYfmt
	gfjbUV9sio+W6YFaow2DEsTvBkK80KP8OMwXbA91NYHbBelQY6DCD4n2t0UJg7NwhJ4dRQjPOa1
	XpB4Mt9Y0qGQJRA+qWZWf8zPv7rE1DOQSbKWCKCFeS8JJ9Y6+5jqxjLkObB0ycTfTjd6o4d4KHk
	OSqQ9wGSTrCeYYkBpNxisr02ByIzNMk0eARm3IdNlsxNrxCfH1FfVJTWyUwnwxWW0YdtLeA2sJt
	JsxrFUaUhjV
X-Received: by 2002:a05:600c:4f04:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a027564c91mr48663925e9.18.1790939727443;
        Fri, 02 Oct 2026 04:15:27 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm4752986f8f.43.2026.10.02.04.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:15:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:15:11 +0100
Subject: [PATCH v3 1/4] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v3-1-1d8b6ef339c8@linaro.org>
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

In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
fallback, formatted queues will write their HW_IDs to unformatted
queues. This will result in an assert because of multiple decoders on an
unformatted queue.

Fix it by not inserting trace ID nodes on other unformatted queues. This
isn't an issue for v0.1 HW_IDs because they aren't global so will only
add to their own queue.

Fixes: 19c3e4db38c5 ("perf: cs-etm: Create decoders based on the trace ID mappings")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 2d1ab34f7b6b..fda6b6c02e26 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -309,27 +309,27 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 {
 	struct cs_etm_queue *etmq;
 
-	/*
-	 * If the queue is unformatted then only save one mapping in the
-	 * queue associated with that CPU so only one decoder is made.
-	 */
 	etmq = cs_etm__get_queue(etm, cpu_metadata[CS_ETM_CPU]);
 	if (!etmq)
 		return -EINVAL;
 
+	/*
+	 * If the queue is unformatted then only save one mapping in the
+	 * queue associated with that CPU so only one decoder is made.
+	 */
 	if (etmq->format == UNFORMATTED)
 		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
 						    cpu_metadata);
 
 	/*
 	 * Otherwise, version 0 trace IDs are global so save them into every
-	 * queue.
+	 * formatted queue.
 	 */
 	for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
 		int ret;
 
 		etmq = etm->queues.queue_array[i].priv;
-		if (!etmq)
+		if (!etmq || etmq->format == UNFORMATTED)
 			continue;
 
 		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,

-- 
2.43.0

