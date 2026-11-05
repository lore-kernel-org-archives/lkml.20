Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879134;
	b=QvJDldz0s8b/b3JBJG3A9FmiyVHeEEiV9axVrk4Wpq4bvpNZafPXa9mvcU5UOtX4U3dd
	 LXwXPgbSkwEE0jS9pJU+UWgWUxn2/13jHR/PXvXlWjqE22QBsQu7CmKYIQeTf1lD8xDSW
	 skoxS/Xf5JHWfw+znrijHS85yVjCSbSVZwPcNOi2go8WTqNbBWjCgnNLPf41xrTjnXQzj
	 IA1kP/skSzIZpNWtanTvuwqpXLGw9Kzpli0sB+U6WNHFWNqkuwzd1NRebEKVOl6QC/def
	 I/jaCWekKbM8bULBxjXGukFSYREKX01QiB4WR+N1EcYyPpEeHMjlGR7qFTxwkoxcKxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yfmk/Af4o8kw1wSVbJcsSvQgeLxtc2ppX2xJjTy487g=;
	b=JnPXHYp5UamCgAUVl5uylgzAmxEnrn4SMhkDVa2MwoY0S8hN6e7DskCOqKc4bgd+6oij
	 uVqRCzXchEHHetgZqj22jUBCOqAdK0T1fWAmpYQ66bgufDuNd/9PRHgbIiL+3SI9nVke5
	 EvxkKZPq03CjYTQyqAt8j6zww++bGgrtPjKTxpaeZdto6ss3DG095J4+3SBCq5WwsJtMK
	 ttxN478T7gjsgUG9d/GMuClp9f0iDBYngESGs3wRpiaDrYRMSOMUlmAQsLMkMi2lSiS8w
	 QgQxKJgAksZzsY6hzKc/4a+T4ejbLsuAh1BmncWSOVxuqdP/sX/Zz736FFnCOfL6A7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OHt7lxGI;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D560A5BCA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38D560A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OHt7lxGI
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so14999585e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879132; x=1794483932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfmk/Af4o8kw1wSVbJcsSvQgeLxtc2ppX2xJjTy487g=;
        b=OHt7lxGI0moE9FJzxaAh0T3Fc5cVp3HnADjj2rw49vZ4NmiW9/ocFm0u2mmv01KNbB
         Yxl5CNYf3qYJrKm4qkGPU7fjigzqjkbKZLECKV2hWNd3lmmBo2L5yRyDhKC8Xz9ln0u5
         YESvExCDYWe6JsjmUAOdiDItN5bIubzYkF0Fe0SQKOXpNjbCUmIa/Sy0WgsLUu7SQcVZ
         7SG5LRJATRJIfIRnk6O0X4ZWr9fOWvi8NAnRJFGAW3+GUghBnzClubzxAY7AMApBGOnP
         +3HxQfEYs/IcQhQOGysjHqwsBc8S14hRx7dcht5W9Z/5trUQfsylkDBlJQmA22ObYIpO
         qZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879132; x=1794483932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfmk/Af4o8kw1wSVbJcsSvQgeLxtc2ppX2xJjTy487g=;
        b=FDXA6KoywWdPedbTJUgxuAydmOLpcT8m1MZk7lAEI0UUkLh9SHWTK7i/GZvUDwrLAT
         ATCTCk6p9pizLC7/DQJSPpbRF6nbaFPofZw1I0araTpjO+3gQ/XRRQCo1ES7SM5dJGgC
         Okr5vaJB/S6Bl1C2BqiDuWXa2RppE2qfwiBv81qm2E4lWbAVOgyaODClG0kI6XhUzofU
         BoeI7SSAKrjXczgtxJg/TP+ROvsq9aHRGYnzjbNoo6MECxg12gmSbjwvkyUzbOKyeV3W
         kw3xUJQ9I/+nxSGE/6pYrQfcB5sqLuRAmhgrWt2iWTKUNJTUJpOu9BhafCyKPzLwUfw8
         k9xg==
X-Forwarded-Encrypted: i=1; AKwUvBwtAsIrbWV4zpWYAqR/KX3ONFzwlvxK/xFinX8tcOfv2c/aF0rlYr9uDIL24u2udOnHg+roaUff2jRFuG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z92ByvDhA14qAYxmzFBqbRN5jSubLhC+lHh9/mPItiNKGOZU6yZ
	OhTZ9Jb+JhRda/seBD9jG505kVuaLZ3RPqNhlJDtpaTZbuCYQtj3wbjO19MA7hnWVaQ=
X-Gm-Gg: AYBFou2perePwOlZvmyGKpfLtDNPf6YjBHnNx7nLqgjxN2afKNNRPE+fUbtrchR7uKT
	QvusAYFwO8SabKk3HaJefH+ZyX6f7krWjuvnPW+T5DCu16Uwp3Yh7QhKfshkRf+xsQ8jqJXWG/k
	qhCU3eAFMaMIYESdg3jgeAuR8HcTQi9zCJ35qwDfzKv1QSEDfzESWcFlM6+HPsi4HowZ6pTV1zH
	DmWJgUZuxArKhxgDyhw+rrLlDZpV9Dbl1ZYJOHvRF4qajwM9GRFi5fMvBlKavjdhmR60vLIY52n
	OalRiQ8yyyKI09MCNl3PoKYOvUmbnGxi68OCeXsGoQth1I0gJqi+KznVxuvnWFGGsuhPDwhyg4v
	ajzc7m0VBcHTRNdrJrxOhrgDdP4kK6/eo6UrDxqssTGLMa9Zuii8Qf5gBdiquS0NA/N9DUqsWkF
	o/3mpPDk2JAgH0Njc4EriG7kYRwDEQTR/2CPaoIJRRQ8PGY0G0e5oLyk1qDTHf76nuRLDtkSwtI
	vPgtOPknn/BmPE68RTbTNYR92TFl5SlDmZyXXlXWFUJwnK+ornRuIi6Am4a5ORjjFox5kqI89L9
	aEbu5VTwOqJ3P9IN+OWBC6I0cv0Kq2bhUw==
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr421569425e9.18.1793879132339;
        Thu, 05 Nov 2026 03:45:32 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:31 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:58 +0000
Subject: [PATCH v4 10/19] perf auxtrace: Turn Intel BTS snapshot search
 into a generic one
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-10-7759e0ce2449@linaro.org>
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

Currently each auxtrace user has to implement both the snapshot search
and the logic to fixup the 'head' and 'old' values after finding a wrap.
IntelPT and BTS have the same fixup logic but different wrap searches.
BTS and Arm SPE have the same search but SPE modifies head differently
(although it probably shouldn’t), and Arm Coresight doesn't have a
search at all, but later it will want the same search and fixup logic.

Add auxtrace_record__default_find_snapshot() as a generic
find_snapshot() implementation that tracers can use without
reimplementing it. It's based on intel_bts_find_snapshot() and the
search includes the caching from it. Split the pointer fixup into
auxtrace_record__snapshot_fixup() so that tracers with their own search,
like Intel PT, can still share it.

No functional changes intended apart from changing the pr_debug3()s
to print hex to match __auxtrace_mmap__read() and no longer leaking
snapshot_refs when expanding the array length.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-bts.c | 115 +--------------------------------
 tools/perf/util/auxtrace.c           | 122 ++++++++++++++++++++++++++++++++++-
 tools/perf/util/auxtrace.h           |  14 ++++
 3 files changed, 137 insertions(+), 114 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-bts.c b/tools/perf/arch/x86/util/intel-bts.c
index d44d568a6d21..2f810ff62a03 100644
--- a/tools/perf/arch/x86/util/intel-bts.c
+++ b/tools/perf/arch/x86/util/intel-bts.c
@@ -34,20 +34,12 @@
 #define KiB_MASK(x) (KiB(x) - 1)
 #define MiB_MASK(x) (MiB(x) - 1)
 
-struct intel_bts_snapshot_ref {
-	void	*ref_buf;
-	size_t	ref_offset;
-	bool	wrapped;
-};
-
 struct intel_bts_recording {
 	struct auxtrace_record		itr;
 	struct perf_pmu			*intel_bts_pmu;
 	struct evlist		*evlist;
 	bool				snapshot_mode;
 	size_t				snapshot_size;
-	int				snapshot_ref_cnt;
-	struct intel_bts_snapshot_ref	*snapshot_refs;
 };
 
 struct branch {
@@ -280,46 +272,11 @@ static u64 intel_bts_reference(struct auxtrace_record *itr __maybe_unused)
 	return rdtsc();
 }
 
-static int intel_bts_alloc_snapshot_refs(struct intel_bts_recording *btsr,
-					 int idx)
-{
-	const size_t sz = sizeof(struct intel_bts_snapshot_ref);
-	int cnt = btsr->snapshot_ref_cnt, new_cnt = cnt * 2;
-	struct intel_bts_snapshot_ref *refs;
-
-	if (!new_cnt)
-		new_cnt = 16;
-
-	while (new_cnt <= idx)
-		new_cnt *= 2;
-
-	refs = calloc(new_cnt, sz);
-	if (!refs)
-		return -ENOMEM;
-
-	memcpy(refs, btsr->snapshot_refs, cnt * sz);
-
-	btsr->snapshot_refs = refs;
-	btsr->snapshot_ref_cnt = new_cnt;
-
-	return 0;
-}
-
-static void intel_bts_free_snapshot_refs(struct intel_bts_recording *btsr)
-{
-	int i;
-
-	for (i = 0; i < btsr->snapshot_ref_cnt; i++)
-		zfree(&btsr->snapshot_refs[i].ref_buf);
-	zfree(&btsr->snapshot_refs);
-}
-
 static void intel_bts_recording_free(struct auxtrace_record *itr)
 {
 	struct intel_bts_recording *btsr =
 			container_of(itr, struct intel_bts_recording, itr);
 
-	intel_bts_free_snapshot_refs(btsr);
 	free(btsr);
 }
 
@@ -349,75 +306,6 @@ static int intel_bts_snapshot_finish(struct auxtrace_record *itr)
 	return -EINVAL;
 }
 
-static bool intel_bts_first_wrap(u64 *data, size_t buf_size)
-{
-	int i, a, b;
-
-	b = buf_size >> 3;
-	a = b - 512;
-	if (a < 0)
-		a = 0;
-
-	for (i = a; i < b; i++) {
-		if (data[i])
-			return true;
-	}
-
-	return false;
-}
-
-static int intel_bts_find_snapshot(struct auxtrace_record *itr, int idx,
-				   struct auxtrace_mmap *mm, unsigned char *data,
-				   u64 *head, u64 *old)
-{
-	struct intel_bts_recording *btsr =
-			container_of(itr, struct intel_bts_recording, itr);
-	bool wrapped;
-	int err;
-
-	pr_debug3("%s: mmap index %d old head %zu new head %zu\n",
-		  __func__, idx, (size_t)*old, (size_t)*head);
-
-	if (idx >= btsr->snapshot_ref_cnt) {
-		err = intel_bts_alloc_snapshot_refs(btsr, idx);
-		if (err)
-			goto out_err;
-	}
-
-	wrapped = btsr->snapshot_refs[idx].wrapped;
-	if (!wrapped && intel_bts_first_wrap((u64 *)data, mm->len)) {
-		btsr->snapshot_refs[idx].wrapped = true;
-		wrapped = true;
-	}
-
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
-
-	return 0;
-
-out_err:
-	pr_err("%s: failed, error %d\n", __func__, err);
-	return err;
-}
-
 struct auxtrace_record *intel_bts_recording_init(int *err)
 {
 	struct perf_pmu *intel_bts_pmu = perf_pmus__find(INTEL_BTS_PMU_NAME);
@@ -444,7 +332,8 @@ struct auxtrace_record *intel_bts_recording_init(int *err)
 	btsr->itr.free = intel_bts_recording_free;
 	btsr->itr.snapshot_start = intel_bts_snapshot_start;
 	btsr->itr.snapshot_finish = intel_bts_snapshot_finish;
-	btsr->itr.find_snapshot = intel_bts_find_snapshot;
+	btsr->itr.find_snapshot = auxtrace_record__default_find_snapshot;
+	btsr->itr.snapshot_search_bytes = 4096;
 	btsr->itr.parse_snapshot_options = intel_bts_parse_snapshot_options;
 	btsr->itr.reference = intel_bts_reference;
 	btsr->itr.read_finish = auxtrace_record__read_finish;
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8bb491d389a2..c613efd83223 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/perf_event.h>
 #include <linux/types.h>
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/log2.h>
 #include <linux/string.h>
@@ -603,8 +604,10 @@ int auxtrace_record__info_fill(struct auxtrace_record *itr,
 
 void auxtrace_record__free(struct auxtrace_record *itr)
 {
-	if (itr)
+	if (itr) {
+		zfree(&itr->snapshot_wrapped);
 		itr->free(itr);
+	}
 }
 
 int auxtrace_record__snapshot_start(struct auxtrace_record *itr)
@@ -630,6 +633,123 @@ int auxtrace_record__find_snapshot(struct auxtrace_record *itr, int idx,
 	return 0;
 }
 
+static int auxtrace_alloc_wrap_bitmap(struct auxtrace_record *itr, int idx)
+{
+	int len = itr->snapshot_wrapped_len;
+	unsigned long *new_bitmap;
+	int new_len = len * 2;
+
+	if (!new_len)
+		new_len = BITS_PER_LONG;
+
+	while (new_len <= idx)
+		new_len *= 2;
+
+	new_bitmap = realloc(itr->snapshot_wrapped, bitmap_size(new_len));
+	if (!new_bitmap)
+		return -ENOMEM;
+
+	itr->snapshot_wrapped = new_bitmap;
+	bitmap_clear(itr->snapshot_wrapped, len, new_len - len);
+	itr->snapshot_wrapped_len = new_len;
+
+	return 0;
+}
+
+/*
+ * Returns 1 if non zero data exists within
+ * auxtrace_record::snapshot_search_bytes of the end of the buffer. The result
+ * is cached for each buffer idx so the search is not repeated.
+ *
+ * Writes at the end mean a high chance that trace would have continued past
+ * this search area and wrapped to the beginning. It's not a perfect heuristic,
+ * but it's only to avoid saving mostly empty buffers into the file. A false
+ * positive results in saving up to snapshot_search_bytes zeros before the
+ * actual data, which a decoder should be able to skip over.
+ */
+static int auxtrace_snapshot_has_wrapped(struct auxtrace_record *itr, int idx,
+					 unsigned char *data, size_t buf_size)
+{
+	u64 *wide_data = (u64 *)data;
+	s64 i, a, b;
+
+	if (idx >= itr->snapshot_wrapped_len) {
+		int err = auxtrace_alloc_wrap_bitmap(itr, idx);
+
+		if (err)
+			return err;
+	}
+
+	if (test_bit(idx, itr->snapshot_wrapped))
+		return 1;
+
+	b = buf_size / sizeof(u64);
+	a = b - (itr->snapshot_search_bytes / sizeof(u64));
+	if (a < 0)
+		a = 0;
+
+	for (i = a; i < b; i++) {
+		if (wide_data[i]) {
+			__set_bit(idx, itr->snapshot_wrapped);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * In full trace mode 'head' continually increases.  However in snapshot mode
+ * 'head' is an offset within the buffer.  Here 'old' and 'head' are adjusted to
+ * match the full trace case which expects that 'old' is always less than
+ * 'head'. 'wrapped' is the result of the auxtrace_record::find_snapshot()
+ * implementation's search.
+ */
+void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
+				     u64 *head, u64 *old)
+{
+	if (wrapped) {
+		*old = *head;
+		*head += mm->len;
+	} else {
+		if (mm->mask)
+			*old &= mm->mask;
+		else
+			*old %= mm->len;
+		if (*old > *head)
+			*head += mm->len;
+	}
+
+	pr_debug3("%s: wrap-around %sdetected, adjusted old head 0x%"PRIx64" adjusted new head 0x%"PRIx64"\n",
+		  __func__, wrapped ? "" : "not ", *old, *head);
+}
+
+/*
+ * Generic auxtrace_record::find_snapshot() implementation. Searches the last
+ * auxtrace_record::snapshot_search_bytes of the buffer for data to determine
+ * whether it has wrapped, then fixes up 'head' and 'old' accordingly.
+ */
+int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
+					   struct auxtrace_mmap *mm,
+					   unsigned char *data, u64 *head,
+					   u64 *old)
+{
+	int wrapped;
+
+	pr_debug3("%s: mmap index %d old head 0x%"PRIx64" new head 0x%"PRIx64"\n",
+		  __func__, idx, *old, *head);
+
+	wrapped = auxtrace_snapshot_has_wrapped(itr, idx, data, mm->len);
+	if (wrapped < 0) {
+		pr_err("%s: failed, error %d\n", __func__, wrapped);
+		return wrapped;
+	}
+
+	auxtrace_record__snapshot_fixup(mm, wrapped, head, old);
+
+	return 0;
+}
+
 int auxtrace_record__options(struct auxtrace_record *itr,
 			     struct evlist *evlist,
 			     struct record_opts *opts)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index c29a8444f08e..9d86f8366ad7 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -388,6 +388,11 @@ struct auxtrace_mmap_params {
  * @default_aux_sample_size: default sample size for --aux sample option
  * @pmu: associated pmu
  * @evlist: selected events list
+ * @snapshot_wrapped_len: number of bits in @snapshot_wrapped
+ * @snapshot_wrapped: bitmap indicating if each aux buffer has wrapped
+ * @snapshot_search_bytes: number of bytes at the end of the buffer that
+ *			   auxtrace_record__default_find_snapshot() searches
+ *			   for data to determine if a wrap has occurred
  */
 struct auxtrace_record {
 	int (*recording_options)(struct auxtrace_record *itr,
@@ -413,6 +418,9 @@ struct auxtrace_record {
 	unsigned int alignment;
 	unsigned int default_aux_sample_size;
 	struct evlist *evlist;
+	int snapshot_wrapped_len;
+	unsigned long *snapshot_wrapped;
+	int snapshot_search_bytes;
 };
 
 /**
@@ -595,6 +603,12 @@ int auxtrace_record__snapshot_finish(struct auxtrace_record *itr, bool on_exit);
 int auxtrace_record__find_snapshot(struct auxtrace_record *itr, int idx,
 				   struct auxtrace_mmap *mm,
 				   unsigned char *data, u64 *head, u64 *old);
+int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
+					   struct auxtrace_mmap *mm,
+					   unsigned char *data, u64 *head,
+					   u64 *old);
+void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
+				     u64 *head, u64 *old);
 u64 auxtrace_record__reference(struct auxtrace_record *itr);
 int auxtrace_record__read_finish(struct auxtrace_record *itr, int idx);
 

-- 
2.43.0

