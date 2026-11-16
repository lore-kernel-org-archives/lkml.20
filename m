Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815125;
	b=vb+8+1+49woeidg3Jwg+3ZdLTHIt1BHk1PZyO8kV2Cu+8w40N7mWy29DroI+5SOgmrH6
	 pK9GnHJ4HlcVHIBGz3Mmu/rvKGXpS7C+IGsXWI/FHTHWkaKHPJzlqHcPvvPMSYjBldnIb
	 IYHocHn6pJlLB4h2uu4JxAoih893CCkXtdy/72KbUOJg1vHhf/Gc6hj+pBpXSaeGwUBI2
	 9cOws5gZzV/7QYM36CbQKAdgKeXDqnUknIehLkAokTUS2Tzfn0nlAQN6Sj4UEiNBaRKQ0
	 78xiN2XCi5gN++T+nPuMwQsKfvF6hmCiaOv0yAN1MG7t3/3rc/jtGjgn2SYCS7nEe2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ELM+ldKFg07MdAwKjJM6ffNXJeeGbV9sau9472qQZwk=;
	b=cKyBDyPq3NHOddxgQoY+Rwh1dgGbqwotV2jNBUxXUxJJu8HdEHJ7ii4zhzihJal39oTE
	 CVIshJwAodkLNpfB+dHqMN/SquIYplZFPq98hqPWR61/VDyWhxJu5VBnhX0TZDbDy4lEU
	 PriKu3RX2SVn8N74F6nhRzMFbkbcXHlFiTX9CRASETd4eI5O1UNbxoumfwvOgV56HyTM9
	 duGLNiOAwESEMjt9EHDSSVLpOZiHmKuWfMCp4Q3Qut6Z7QrDUxx55M6UhNxgfkjQjnYrc
	 a/pOESMgkpv6dvBYH6RUXwS3QOfkFQVUR773xyG7t8PXZX/CLJ6Fuqa2VpEvjnlrXQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e19h0CQA;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EAC606A883
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EAC606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e19h0CQA
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so20254c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794815124; x=1795419924; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELM+ldKFg07MdAwKjJM6ffNXJeeGbV9sau9472qQZwk=;
        b=e19h0CQAFKmnMVHL7ZHFhC7ienGqeEUU9iIKhUBJOLk1mVCF2roKqy+0iLLzvZvRwf
         /2N7ih8sthLJbLikP1gDxdqIAvd1IcKJ/Kzb44ADff9xeio1VjIp+Pi7Ccf21ibovm7X
         T5kOeqdiRZcQ5Iz6xMoPf0AKlLEMSW30xxZyEmDWi+J5mnpj1hN+P0UbSsakyP8dLwnJ
         572FtGiaxgQb4fM81N38uYCEm7XdMkGqMITp8bzmXuiLfH4xQiVP4qbuimIO96zkJa/Y
         6aDY1/edXHUBDaC/3YOEpBvK0O1gcjKDTai+ySIchJAPqtJRoot7HAN3cXdC5+i5vJQp
         biKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815124; x=1795419924;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELM+ldKFg07MdAwKjJM6ffNXJeeGbV9sau9472qQZwk=;
        b=tN+zAaxxk1pYObhCXHIVkLuVdwGsRLpEGMbhNjeonANY2YeeCrBzjp7p8a7oJe3iL1
         mkdhec46rKz9rE2D1jVkDQa/C64ZpwY3uwBllG/VzJt9ZeAmKi+ihdV8PWPTkqkBga2Z
         jQIncTPKxlT7SzjHy5/GqZT9sALfY5BD3FLdFyoNHFkhrVZktF46cAI5lPbSgLX7B6Qr
         dgFNcIiLFqWv9yT4wCld7xNABT4A6CeRKPHCxBJ7kEclUZOEnjFVYUNnBFWvTQI/FSAp
         YorXI6anYnCr11GBSqnGk2tH1XXVXE3ENOA8bmpiBlibUwqoKHl5nKD4dJ4WI72LiIBd
         wZlQ==
X-Forwarded-Encrypted: i=1; AL+hErHsD0BnDIS3eOMif7Whwn/PCsNnG0znxd+UTlsnKWHWwsEr72mzjHr6oImUoGH8pvOfzzDnjpZfzN43gtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OCZ7/KqBHiCX9wr/U/rD1QI29QEEZwUvV0t5/srZqARzuuSqM
	LKjgX3Nq8YzOiTGSLgmdAA3zKNzb35y5fz9ojiWNDcE2W6MeY0uIchEEpTNPbmHMcBao4BId4ha
	/DrFLMbCl0A==
X-Received: from dlbvv19.prod.google.com ([2002:a05:7022:5f13:b0:143:7311:4b88])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4508:10b0:1b3:ac23:611f
 with SMTP id a92af1059eb24-1b50311d310mr9543019c88.28.1794815123285; Sun, 15
 Nov 2026 23:45:23 -0800 (PST)
Date: Sun, 15 Nov 2026 23:44:03 -0800
In-Reply-To: <20261116074414.3174737-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116074414.3174737-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116074414.3174737-9-irogers@google.com>
Subject: [PATCH v3 08/19] perf session: Avoid double byte-swapping re-parsed
 deferred samples
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When perf_session__deliver_event() processes a cross-endian sample,
__evsel__parse_sample() is invoked with needs_swap=true and byte-swaps
payload regions such as PERF_SAMPLE_RAW, PERF_SAMPLE_BRANCH_STACK, and
PERF_SAMPLE_AUX in-place in the event buffer.

If the sample has a deferred callchain and merge_deferred_callchains is
enabled, machines__deliver_event() copies that already-parsed event into
de->event. Later, evlist__deliver_deferred_callchain() (potentially on
multiple iterations before finding a matching tid) and
session__flush_deferred_samples() re-parse de->event via
evlist__parse_sample(), which runs __evsel__parse_sample() again with
evsel->needs_swap still true, double-swapping in-place fields. Meanwhile,
pyrf_event__copy() re-parses copied events with needs_swap=false, which
misses PERF_SAMPLE_TID, PERF_SAMPLE_CPU, and PERF_SAMPLE_RAW's size word
because they were only unswapped into local variables.

Finish unswapping PERF_SAMPLE_TID, PERF_SAMPLE_CPU, and PERF_SAMPLE_RAW's
size prefix in-place during the initial cross-endian parse so the entire
sample buffer is in host layout afterwards, filter deferred samples by
stored tid before re-parsing, and re-parse de->event via
evlist__parse_sample_unswapped().

Fixes: 9b4525fd089d ("perf tools: Merge deferred user callchains")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evlist.c  | 38 +++++++++++++++++++++++++++++---------
 tools/perf/util/evlist.h  |  2 ++
 tools/perf/util/evsel.c   | 10 +++++++++-
 tools/perf/util/session.c | 14 +++++++-------
 4 files changed, 47 insertions(+), 17 deletions(-)

diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index c2402e4791b6..ec665828d4e3 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -1935,17 +1935,12 @@ void evlist__cancel_workload(struct evlist *evlist)
 	}
 }
 
-int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct perf_sample *sample)
+static int __evlist__parse_sample(struct evlist *evlist, struct evsel *evsel,
+				  union perf_event *event,
+				  struct perf_sample *sample, bool needs_swap)
 {
-	struct evsel *evsel = evlist__event2evsel(evlist, event);
-	int ret;
+	int ret = __evsel__parse_sample(evsel, event, sample, needs_swap);
 
-	if (!evsel) {
-		/* Ensure the sample is okay for perf_sample__exit. */
-		perf_sample__init(sample, /*all=*/false);
-		return -EFAULT;
-	}
-	ret = evsel__parse_sample(evsel, event, sample);
 	if (ret)
 		return ret;
 	if (perf_guest && sample->id) {
@@ -1959,6 +1954,31 @@ int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct
 	return 0;
 }
 
+int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct perf_sample *sample)
+{
+	struct evsel *evsel = evlist__event2evsel(evlist, event);
+
+	if (!evsel) {
+		/* Ensure the sample is okay for perf_sample__exit. */
+		perf_sample__init(sample, /*all=*/false);
+		return -EFAULT;
+	}
+	return __evlist__parse_sample(evlist, evsel, event, sample, evsel->needs_swap);
+}
+
+int evlist__parse_sample_unswapped(struct evlist *evlist, union perf_event *event,
+				   struct perf_sample *sample)
+{
+	struct evsel *evsel = evlist__event2evsel(evlist, event);
+
+	if (!evsel) {
+		/* Ensure the sample is okay for perf_sample__exit. */
+		perf_sample__init(sample, /*all=*/false);
+		return -EFAULT;
+	}
+	return __evlist__parse_sample(evlist, evsel, event, sample, /*needs_swap=*/false);
+}
+
 int evlist__parse_sample_timestamp(struct evlist *evlist, union perf_event *event, u64 *timestamp)
 {
 	struct evsel *evsel = evlist__event2evsel(evlist, event);
diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index 0f380421e03d..e42d590d4732 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -450,6 +450,8 @@ bool evlist__sample_id_all(struct evlist *evlist);
 u16 evlist__id_hdr_size(struct evlist *evlist);
 
 int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct perf_sample *sample);
+int evlist__parse_sample_unswapped(struct evlist *evlist, union perf_event *event,
+				   struct perf_sample *sample);
 int evlist__parse_sample_timestamp(struct evlist *evlist, union perf_event *event, u64 *timestamp);
 
 bool evlist__valid_sample_type(struct evlist *evlist);
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 737a8680aaae..322582bb4f40 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3520,6 +3520,7 @@ int __evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 			u.val64 = bswap_64(u.val64);
 			u.val32[0] = bswap_32(u.val32[0]);
 			u.val32[1] = bswap_32(u.val32[1]);
+			*(__u64 *)array = u.val64;
 		}
 
 		data->pid = u.val32[0];
@@ -3554,6 +3555,8 @@ int __evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 			/* undo swap of u64, then swap on individual u32s */
 			u.val64 = bswap_64(u.val64);
 			u.val32[0] = bswap_32(u.val32[0]);
+			u.val32[1] = bswap_32(u.val32[1]);
+			*(__u64 *)array = u.val64;
 		}
 
 		data->cpu = u.val32[0];
@@ -3665,7 +3668,12 @@ int __evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 			/* mem_bswap_64() accesses complete 64-bit words. */
 			sz = roundup((u64)data->raw_size, sizeof(u64));
 			OVERFLOW_CHECK(raw, sz, max_size);
-			mem_bswap_64((void *)raw, data->raw_size);
+			if (data->raw_size) {
+				mem_bswap_64((void *)raw, data->raw_size);
+				*(u32 *)raw = data->raw_size;
+			} else {
+				*(__u64 *)raw = u.val64;
+			}
 		}
 		data->raw_data = (void *)array;
 		array = (void *)array + data->raw_size;
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index a58b4fe44b62..ec1ea510ae61 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -1933,6 +1933,7 @@ struct deferred_event {
 	struct list_head list;
 	union perf_event *event;
 	u64 file_offset;
+	u32 tid;
 };
 
 /*
@@ -1964,8 +1965,11 @@ static int evlist__deliver_deferred_callchain(struct evlist *evlist,
 		struct perf_sample orig_sample;
 		struct evsel *new_evsel;
 
+		if (sample->tid != de->tid)
+			continue;
+
 		perf_sample__init(&orig_sample, /*all=*/false);
-		ret = evlist__parse_sample(evlist, de->event, &orig_sample);
+		ret = evlist__parse_sample_unswapped(evlist, de->event, &orig_sample);
 		if (ret < 0) {
 			pr_err("failed to parse original sample\n");
 			perf_sample__exit(&orig_sample);
@@ -1973,11 +1977,6 @@ static int evlist__deliver_deferred_callchain(struct evlist *evlist,
 		}
 		orig_sample.file_offset = de->file_offset;
 
-		if (sample->tid != orig_sample.tid) {
-			perf_sample__exit(&orig_sample);
-			continue;
-		}
-
 		if (event->callchain_deferred.cookie == orig_sample.deferred_cookie)
 			sample__merge_deferred_callchain(&orig_sample, sample);
 		else
@@ -2027,7 +2026,7 @@ static int session__flush_deferred_samples(struct perf_session *session,
 		}
 
 		perf_sample__init(&sample, /*all=*/false);
-		ret = evlist__parse_sample(evlist, de->event, &sample);
+		ret = evlist__parse_sample_unswapped(evlist, de->event, &sample);
 		if (ret < 0) {
 			pr_err("failed to parse original sample\n");
 			perf_sample__exit(&sample);
@@ -2120,6 +2119,7 @@ static int machines__deliver_event(struct machines *machines,
 			}
 			memcpy(de->event, event, sz);
 			de->file_offset = sample->file_offset;
+			de->tid = sample->tid;
 			list_add_tail(&de->list, evlist__deferred_samples(evlist));
 			return 0;
 		}
-- 
2.56.1.703.gf848ed807c-goog

