Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621759;
	b=HL/c5omWM8N3MYtnz6uGN00a41JpgCvN48QZI8/moOEjobaPb2bWMAZhoekkG3Neqqtr
	 R599yb3n6f9BB1/M4a3oo6pcad+zVjh3N4XqSBjFnTypLNgCq0bLDA8aWtA/xKOBucRSx
	 ZWTk6hQ/ClTSieD5qyPsqmopAV7InfaVK9LfOQvRbGa06RNOdG9xPRhu7uY1nzp+SV7oe
	 dQf/J6nlNVVVzK71uP+4i4gqgSmx9H+23MxiSPBG1O+Vu2M1FzfC9J2VKMt4D7+lXzwhG
	 FVvEO69vE1bWF/lJaHS7+D5TPfWjZFOw+4IypMBxJVJzanW5ssAnlMYm/OLmFcQ58iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LP2+jNQLCb5xh+brHIuOLBJSHrucCoRef9UR8kyeTQk=;
	b=YOgOSv6xUJQyotCzQSckwVr5cFD7EvVVV22F1JL/OLeO/QNr/NPk+Vx5Ihr4HKXQtMZT
	 gjvMJUwYFaOSpEK+UhnPaIhSv6MYe0dcUYxAfMuBQaPFkJfh++8FsN6gndys3a1E3/Cdx
	 NmRqRHRZNjBXFAhCAZxojIXMMTbeFv6xxvPTuKAFzQbhlvrDF/j60vbD7S1Fbt/YLyA+c
	 tbZVt9mmkwrTWp6UtzjP4j8anaolyyShzpYLp1bz+JKBfjypCI5vm+agLajtT73dbqve/
	 MB8RyjL5F6m00zJsz+ZAEGEau8O7eBX9mtfMWWrWQHjVQEB99cnEnndJToTmUDxjVoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pObaiXu4;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1A960A2612
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1A960A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pObaiXu4
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso25711795e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621756; x=1794226556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LP2+jNQLCb5xh+brHIuOLBJSHrucCoRef9UR8kyeTQk=;
        b=pObaiXu4eM4TdPhtBBXoLwWTqCVaNnPs75NIlmlzvZ23LiMAF8/GEbExqOC4ClWAgz
         e9tJ3z4z+504U8lfrydzNqW9opG4FrqrIEJjwCFmuS3vhMLj9myM3E8L9YyVRL3YpQGY
         iUiTaSC3oiBoqJUmYu77lEincIvSKEbiC5Bzh6lDiaN9l6qK+MsVyLVbIMJc6Dg1A41u
         ZCcUFvG3E/nbd24qWEzj6yRfOZs8LfLKuCIq1ulHNb+DTy0XnIJ4YkqxP5XDhi9iBvF4
         Dxl7Z2yG3Ajq8mzfI6XiFq0EYVKOnyAZfh27M0REvn9ePqXFs0Z+kLkyZOc8D58As1oW
         wI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621756; x=1794226556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP2+jNQLCb5xh+brHIuOLBJSHrucCoRef9UR8kyeTQk=;
        b=Yk3llRVoAfpUQwwuzysxt8W9u0IvxL5kRoiN8b1VktdVBr0q3rxoPMaNomnBO0021D
         fHjrzEAhQpQjSoF5kt0vhV0wH/2fgmz3ZQOdplgto/rBjshxZzuwVNyN6znMp6599em5
         1ZX9CzN4NiOrxwJK9pCRFpJ99jKa0f0CxdZOeUQCtj643TezOyJPTlT8V9SHXbsLapW8
         GmTCl8MOMbuy/QkeHcj1xG9iXj2HuV8gHjfkEO8Z2UWmbDDVBvYbIiVBS5M0UkM7KpF4
         O/oV2ML7roCotWPadUqBdfI4O6SqynJPALWlpKzYIWV/9livyip5aAGDJE2PV0Skz44B
         mcqA==
X-Forwarded-Encrypted: i=1; AKwUvBzzOMKNmefBLvMjj+VjpL89AnF2ojIx2Atg0KNCiZb/5MSZ8xCZYl8Xx8sasWadMIl2PtPfh221sPtkcCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RZYzqAQ5bbXGa2Y9m0d4vvAvV1oZK1+Bu2M3uIKk36zdW7pTU
	7FQP5d5u8ObiPHXKSiQcEC7n1pilSeV+AIzQE6EEZRB9mCfZ0Nv4HZr3JBWUOGEnM/k=
X-Gm-Gg: AYBFou3zaXVExe4eke1k57Yy6poNsYbdRwtXb5Ax4KyAowsJUwpyVnGFuKlMEBgJuRA
	f7GObYX3OwKluqwE4VUYB4yQmc1W3R0n57QipZF8RW1dful1CwDqYYHiMJDGaANpwfcRYW7PDMa
	VPKPO86pqnRCVwvlsWPjBZIHT/C1TxpkSOXU7Y3fe1RYENfgEpWOtiFagY1K2f4guIouxVo6MuD
	juKTIyV8+ytiM6dSMM9Lbb3TcmmteNzcYcmWeGiLytUJOqF4tVkkvPLeEKfl29bNVmFdlhhb+Ec
	yLMKBQ9WDcQpsPI1uNziZLiUNv5YN6qSxHG+rP33gXJn/kd81Fhbc+aYdlHZ+5svuAG9yyD6bt4
	nLcwQfNr3BfPCYSiYWYiObf8n/qH+1JVk94w70zjPAn+AbP6hJIX5Pp4ZHUNNCbMMU9XbVf/Kv9
	bYc28a2ryyfXkwIkhb1CnVYxmSovkB5752Xw6RyWDzQcFsJs6yCwliHmzUuLxaD6ma3Vjz0wsUU
	y+rKnQVpPOeldqOQMJKxX1lA9e8sWQqz7UkVtjeWndEy+GuLVbVmQQQO8WnXzJmKE9DwihWOtD9
	7nxe08I4DGAbt5s1w+IvrxFWt6OfEcOh1YH/tVw6aAfonrfoFwVljA==
X-Received: by 2002:a05:600c:c48e:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ac16bc4829mr232542735e9.10.1793621756359;
        Mon, 02 Nov 2026 04:15:56 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:24 +0000
Subject: [PATCH v3 10/18] perf auxtrace: Turn Intel BTS snapshot search
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-10-dbcb0c281b9b@linaro.org>
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

