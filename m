Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75251397E9A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648375; cv=none; b=R9bDUnmqfRtdBQqqi88q2138UVAeFxEi3McxYwybnaIeXhTUHJ3Go6Auxos3A08Mjno8jA+Hm7kHwMsPjvq6YU/nmbrhFs7zoaKu1+zw9ptoQ92Rz9sObkuk5WRqNY/0CCeg1sHG94hmK8HrHUEmQf5B9AUHLEnpnWkbRGJYPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648375; c=relaxed/simple;
	bh=pBofXCSoz0580TqDIs2SzhFYvGcGoy2SIBU+GBQI2pk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R6OajAmBEhZfbL33AhW8C6PcmrOY2il3UZHbQUnXbk8I4vmgVg47Vbinw6S/IlTnnCgGvyWTiLWZNBEKFD66PQEPIs4B46LfWQCm7lEAq4KGGxdrqvB70cMs6n+UNRCdH4Lq4CUlNrwSjGCctx1Qa3lQ9hqFl+60mFiqRAlmeII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vkCn1ApX; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vkCn1ApX"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438492fb40so155175c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790648372; x=1791253172; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCPDaS9SCDFLDd2tP5GGB5abgauys+2bQBUXQL5BFjI=;
        b=vkCn1ApXPhjybUbE3kSn1cCfuHk85IzDxWMKuNFgOOOnkapHCT4PQkGIvUmyA0VeVL
         0sv6gEDL9iqYv2r534Iv1ll8pz4p91UpHfiXG38QD8c5Ho2VMnDnWgwLaEuD9mZgz/1G
         eWHsi8qyqYBZpR/FKu+89ypjlD9jZ7yC8aDiysumIgnWxoHojMtBGL8nJU1dOBrC7j1X
         cngf9EAAjY/XrFVsTAGhZsp+EzDEbZbNcdaXuXP9J3Jaw/j6HqTum7HG12bxR5yfjtXG
         hBtP3ROsZPl4TQRFS5Ve/atbr1DY3Fh3MhVCZSCuiwJFvP+rIPAbIblvtTrXPYHxVnQA
         PzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648372; x=1791253172;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCPDaS9SCDFLDd2tP5GGB5abgauys+2bQBUXQL5BFjI=;
        b=n1zwDtkIdSP2VsmiNnzFJpZET3MAxK3ziNCJtc7ik5pthaC7KZZK+6ANudqTaEEXLX
         IK3/poMNrdMyXUBqWxb4Ae4u4s8HDM/Ku3xJIB1efZdKWvxGLYs6ZpdLBsWj1sMV9TNZ
         98CH4aEAijBjWkVs61NokN5V1gLXI6ULmoyI9t7za8oq1Uo/uJAWt1IKDZwwTix7drFG
         FtM0s/QdhYJim+4XN0vyDuzUsxFtwynGRNWirIT0SPc8M363wdKI5zO3wi5PiHAI79iB
         M9hVz3GGxwyeWVAe139N14++X1BEhuTUegdxEfExeh5mjAfTneoNwKhuYmRo1SxFtWct
         eqmA==
X-Forwarded-Encrypted: i=1; AKwUvByDEWiVZeByGk4QOtnExvOtqTAkBYOX+UHgR5IcRp7B0E3VQ7lF8/eeUXYCuDx+5gtIpIdUTyFzeu1V4TU=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ4M9pr99jr9e0rCO6UGE9K0RwwQMrnsoxAG9FGkFz7TQoTH2B
	1MvUqW4dog2+GViyG6qEvSU/RjaefdTHuhaDi5cq5eenc1W2vldjp9mn/jnInKDQgIiFJEglMVU
	5vm42/rQcCg==
X-Received: from dlbut3.prod.google.com ([2002:a05:7022:7e03:b0:146:33a4:4ffa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2301:b0:143:26ea:371c
 with SMTP id a92af1059eb24-146cfcd816amr12229622c88.28.1790648371557; Mon, 28
 Sep 2026 19:19:31 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:19:05 -0700
In-Reply-To: <20260929021913.56010-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929021913.56010-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929021913.56010-2-irogers@google.com>
Subject: [PATCH v1 1/9] perf evsel: Clamp sample_id size for ksymbol, bpf, and
 text_poke events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On kernels without the fix ("perf/core: Restore header fields in
sideband output callbacks") to restore event_id.header.size in
perf_event_ksymbol_output(), perf_event_bpf_output(), and
perf_event_text_poke_output(), concurrent perf sessions cause those
sideband records to be emitted with header.size inflated by multiple
id_header_size increments while the single id_sample is written
immediately after the event payload. Indexing backwards from
event->header.size reads uninitialized ring-buffer bytes at the end of
the record, causing evlist__event2evsel() to fail with -EFAULT.

Add evsel__event_size() to clamp the effective size used to locate the
trailing id_sample for PERF_RECORD_KSYMBOL, PERF_RECORD_BPF_EVENT, and
PERF_RECORD_TEXT_POKE to payload + id_hdr_size while leaving
event->header.size intact for advancing the ring-buffer/file stream.

Fixes: 9aa0bfa370b2 ("perf tools: Handle PERF_RECORD_KSYMBOL")
Fixes: 45178a928a4b ("perf tools: Handle PERF_RECORD_BPF_EVENT")
Fixes: 246eba8e9041 ("perf tools: Add support for PERF_RECORD_TEXT_POKE")
Link: https://lore.kernel.org/r/20260929014206.4175245-1-irogers@google.com
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evlist.c |  6 ++--
 tools/perf/util/evsel.c  | 59 +++++++++++++++++++++++++++++++++++++++-
 tools/perf/util/evsel.h  |  1 +
 3 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index 9392d912d254..c2402e4791b6 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -973,13 +973,15 @@ static int evlist__event2id(struct evlist *evlist, union perf_event *event, u64
 	const __u64 *array = event->sample.array;
 	ssize_t n;
 
-	n = (event->header.size - sizeof(event->header)) >> 3;
-
 	if (event->header.type == PERF_RECORD_SAMPLE) {
+		n = (event->header.size - sizeof(event->header)) >> 3;
 		if (evlist__id_pos(evlist) >= n)
 			return -1;
 		*id = array[evlist__id_pos(evlist)];
 	} else {
+		u16 size = evsel__event_size(evlist__first(evlist), event);
+
+		n = (size - sizeof(event->header)) >> 3;
 		if (evlist__is_pos(evlist) > n)
 			return -1;
 		n -= evlist__is_pos(evlist);
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 3367242c5764..70da6be798cc 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3216,7 +3216,7 @@ static int perf_evsel__parse_id_sample(const union perf_event *event,
 	const __u64 *array = event->sample.array;
 	bool swapped = evsel->needs_swap;
 	union u64_swap u;
-	int i = ((event->header.size - sizeof(event->header)) / sizeof(u64)) - 1;
+	int i = ((evsel__event_size(evsel, event) - sizeof(event->header)) / sizeof(u64)) - 1;
 
 	if (type & PERF_SAMPLE_IDENTIFIER) {
 		if (i < 0)
@@ -3966,6 +3966,63 @@ u16 evsel__id_hdr_size(const struct evsel *evsel)
 	return size;
 }
 
+/*
+ * Prior to kernel fix, perf_event_ksymbol_output(), perf_event_bpf_output(),
+ * and perf_event_text_poke_output() in kernel/events/core.c did not save and
+ * restore event_id.header.size across perf_iterate_sb() iterations. When
+ * multiple perf_events had attr.ksymbol, attr.bpf_event, or attr.text_poke
+ * enabled, header.size was incremented by id_header_size for each matching
+ * event while only a single id_sample was written immediately after the event
+ * payload. Clamp the effective size used to locate the trailing id_sample to
+ * payload + id_hdr_size so events recorded on unpatched kernels can be parsed
+ * without reading uninitialized ring-buffer bytes.
+ */
+u16 evsel__event_size(const struct evsel *evsel, const union perf_event *event)
+{
+	u16 size = event->header.size;
+	u16 id_hdr_size;
+	size_t payload;
+
+	if (!evsel->core.attr.sample_id_all)
+		return size;
+
+	switch (event->header.type) {
+	case PERF_RECORD_KSYMBOL: {
+		const char *name = event->ksymbol.name;
+		size_t fixed = offsetof(struct perf_record_ksymbol, name);
+		size_t max_len, len;
+
+		if (size <= fixed)
+			return size;
+		max_len = size - fixed;
+		len = strnlen(name, max_len);
+		if (len == max_len)
+			return size;
+		payload = fixed + PERF_ALIGN(len + 1, sizeof(u64));
+		break;
+	}
+	case PERF_RECORD_BPF_EVENT:
+		payload = sizeof(struct perf_record_bpf_event);
+		break;
+	case PERF_RECORD_TEXT_POKE: {
+		size_t fixed = offsetof(struct perf_record_text_poke_event, bytes);
+
+		if (size < fixed)
+			return size;
+		payload = fixed + PERF_ALIGN((size_t)event->text_poke.old_len +
+					     event->text_poke.new_len, sizeof(u64));
+		break;
+	}
+	default:
+		return size;
+	}
+
+	id_hdr_size = evsel__id_hdr_size(evsel);
+	if (payload + id_hdr_size < size)
+		return payload + id_hdr_size;
+	return size;
+}
+
 #ifdef HAVE_LIBTRACEEVENT
 struct tep_format_field *evsel__field(struct evsel *evsel, const char *name)
 {
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 5c5799cee601..174f3414fd3c 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -469,6 +469,7 @@ int evsel__parse_sample_timestamp(struct evsel *evsel, union perf_event *event,
 				  u64 *timestamp);
 
 u16 evsel__id_hdr_size(const struct evsel *evsel);
+u16 evsel__event_size(const struct evsel *evsel, const union perf_event *event);
 
 static inline struct evsel *evsel__next(struct evsel *evsel)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

