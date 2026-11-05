Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879136;
	b=sn07rddiXwROdEMf7k6p/O9JXZiC0XdYXYrlYVp9u6/y+GuBR/GOAopbdG9DNlhycqx4
	 cxNk29GtqW9FsOcYRiXdPTG1d6rUMTQWIV8QRuxAnkiej7bMOXX/xTmSmuWRjwtrOd4Ly
	 PGMg7ATjMrbWrWEfUy/4uB07efv4Bk2uoX1UgERdZm2PYjDau7PWUa8QalzXAY6eT89X6
	 UnUyQBpjhydxUNrLV1H0tPJkgMfsIkQRIc/FmvGBeQnfoEkciMllUberk3gu7IoCN90Fn
	 9khFNANBMxn2FUfCSZ/+cU2D44gL0rlq9RMzEWLlpdssUE601OHymPo7vvu6IHqAmYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
	b=P3j4zWsCvyOAGYEzGYLQybUXqE9ThCx11IWBpmNPahDXPBkJAC1zF6ho7isYxsU1yg9V
	 7rgu3LTuuYGY29R0YTMCefZCS9SK7g/fdQi43jezQpfui/3eQ9zOtCeQi4BOULHPUi4gY
	 rEUJ3Skoe45jNCwlMyUjUGDsOT2KggxctlsVo0+AL5C3QiHpdSGxkuQyNKGaYoO4mGbDr
	 Gw6p0gJvGyZOlvkFmMvQornvtvKlCSylEgC8V52VkhkenIgNCKRy1oqbmXaycPd68cgFP
	 cR9rvJZsOPu7jngPADGBhxunTsljfyDNRkCEpKBzHxcoWxxwmYgZuYPF6FU9Y07v0+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h9MR7kCI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5737360A6F46
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5737360A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h9MR7kCI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so13737585e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879134; x=1794483934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
        b=h9MR7kCItMgjRuYRH4dI0FbxJgPnXYrpBMCzkR8o4gxzFFAwnxcHVjnAHsy9kds3Ro
         EMRbKSgGRDJTI36GvX/FWf6W+kGGNOm/rqOK1hKCe5UaZOaCX8YiSmDKynYrCE8wZWvP
         oBdJWXUGEvxRhq5+f1WUVRIzz9K1oxSwg1aynBgn7RnqLSwH5cUWAmnZi1Pwv9kX/uCl
         2OL8RXs+cBUQCtUP+Khx4ZVzr7WA3yE9SDZXCRKtZBOLgA6JeGjDf2dY6zxOuZOJRmLL
         XrRKMkQBSamqX850sEP4oV9tHdGl7AR1PQ14NWkezJy2DQdz18KPXKnZ84/GzqnFY2mx
         ZYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879134; x=1794483934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
        b=rrzx/REyXdDluwCAQ1f4wtZln8jfSXd1W8i7KqgIdxs7y63DM+xSoOsH7GfmoATmnk
         OCOdB70LksAbWhHdL/jKwxTJ3sQsutJpdazXNJ2BRW1IQ88kEewpLYJEf9Z6U7Ggcgwx
         KoaFkgH4AbWUntE+UAaNYR4q+UbWlBWAbk32iB8IU/57GG2/pANaZXpd3KWVax1RuvMh
         NV08SkZnFMf5PWKYE1c8CfRwTzEoP3PfITEFnptKQZBG2vaCv7NabfM/ndkWxiOQp3Gz
         8wNdQnuqvbeASpDKXIunSOuJJA+EXSOpFoG/BSj9CrqOdkNSVU0G2ToPu1lh6LxBHU+F
         xITg==
X-Forwarded-Encrypted: i=1; AKwUvBxwnbLS+JM1bXOXGpIkwko9epgAR7qd2PGSG1JrWtC8EWeJVwIs9sWeHb+DrovsXWgTIU0CyzA/usZjMCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zVSuZErKJMGDnU+l3zts5PaE0W6vs8LSHOpCoFxdZx0ZacJ50
	SUwu6K8yHsGS3gb35waoDtOCCY2OYr465ssdoAroScntdzqj2Li7bNJPOdhJCNfAFR8=
X-Gm-Gg: AYBFou1zaQf93FRW7rFrThT0ss3OwRMEqO81gC7tUFybzqpTeWTcsbnWBIWiRqBx3U/
	2C+IEBPcUQ48Za0ROw0iiQEVa4F6HBYdE3aZPqkYxrblUVvPKYMXPz9zNqAuvKxeVsWs8E9/pcM
	m0XfhBxLzojGTTvrtxEaKJFS9rPwieOJ3IM5PbIrOI8Gl7YGsETBUCf/AlIeR2eYP65QJatmTHv
	lGBgSz2v+R7j/OZIsyxF0hq1jr1ZAW/WE8lmth4Nz26fStgcc+eWzv/yNjERTw/aVOGNli3Zx3W
	qg2rA3SjnJziR4/G/dxYxjn4hIgBvVCNla4uTQWkto9vfn0MkrUsiZCDEXH256ITcCSF/Ldmcth
	BAGqUwzq0DTRkVxY1Gju/sjGvO+wMKkKriqy6pnIYqWu3h5pzCn66zyL9LyFAH6BFHDm39awKVp
	a4feOCWt2azzUVbDmnwE2n2L5FF+h62iZiK0CfRHFl31hX+A9CNRAq4m/hWT13zLlPfkbt2cRyw
	b+spaAmVvSnHPC640gmjE2k/vi+FBkH7Ts8YTPXp1OI6GYA7mSe4mKgFilGEq8/OvMBfOOKZuWK
	czTE8sjyL78MOd+W02GXSp66KEljXI3W
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr414154955e9.18.1793879133683;
        Thu, 05 Nov 2026 03:45:33 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:59 +0000
Subject: [PATCH v4 11/19] perf arm-spe: Use generic snapshot search
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-11-7759e0ce2449@linaro.org>
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

The new generic snapshot search gives a similar result as the
reimplemented version of it here. One slight difference is in the
pointer fixup. SPE has:

  *head += mm->len;
  *old = *head - mm->len;

Which gives exactly the same result but written in reverse order to the
generic one:

  *old = *head;
  *head += mm->len;

SPE also had a special fixup cases (if (head >= buffer_size)):

 * head > isn't needed because the SPE driver always wraps them, and
   __auxtrace_mmap__read() handles that anyway.
 * head == buffer_size isn't wrapped by the driver, but it just
   indicates 'full' which doesn't mean wrapped any more or less than any
   other index in the buffer.

Both of these cases are covered by the 512 byte search.

It also didn't have the special case for old > head for when the wrap
heuristic fails but the pointers showed a wrap had happened.

The other feature lost is that this search only looked from head to the
end of the buffer, rather than always at the last 512 bytes. This was
flawed because once head is close to the end, it's likely it could
contain zero padding from actual SPE data and a wrap would be missed.
It's better to err on the side of caution and mark as a wrap, rather
than trying to optimize by limiting the search from head onwards. This
can mistake old data as evidence of a wrap, but for false positives
[head..mm->len] contains zero data. This should be fine, as zero data
are treated as PAD packets and discarded during decoding.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 147 +----------------------------------
 1 file changed, 2 insertions(+), 145 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 1ba803a8d9b4..8d6a2bde2892 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -26,7 +26,6 @@
 #include "../../../util/record.h"
 #include "../../../util/header.h"
 #include "../../../util/arm-spe.h"
-#include <tools/libc_compat.h> // reallocarray
 
 #define ARM_SPE_CPU_MAGIC		0x1010101010101010ULL
 
@@ -37,8 +36,6 @@ struct arm_spe_recording {
 	struct auxtrace_record		itr;
 	struct perf_pmu			*arm_spe_pmu;
 	struct evlist		*evlist;
-	int			wrapped_cnt;
-	bool			*wrapped;
 };
 
 /* Iterate config list to detect if the "freq" parameter is set */
@@ -497,146 +494,6 @@ static int arm_spe_snapshot_finish(struct auxtrace_record *itr)
 	return ret;
 }
 
-static int arm_spe_alloc_wrapped_array(struct arm_spe_recording *ptr, int idx)
-{
-	bool *wrapped;
-	int cnt = ptr->wrapped_cnt, new_cnt, i;
-
-	/*
-	 * No need to allocate, so return early.
-	 */
-	if (idx < cnt)
-		return 0;
-
-	/*
-	 * Make ptr->wrapped as big as idx.
-	 */
-	new_cnt = idx + 1;
-
-	/*
-	 * Free'ed in arm_spe_recording_free().
-	 */
-	wrapped = reallocarray(ptr->wrapped, new_cnt, sizeof(bool));
-	if (!wrapped)
-		return -ENOMEM;
-
-	/*
-	 * init new allocated values.
-	 */
-	for (i = cnt; i < new_cnt; i++)
-		wrapped[i] = false;
-
-	ptr->wrapped_cnt = new_cnt;
-	ptr->wrapped = wrapped;
-
-	return 0;
-}
-
-static bool arm_spe_buffer_has_wrapped(unsigned char *buffer,
-				      size_t buffer_size, u64 head)
-{
-	u64 i, watermark;
-	u64 *buf = (u64 *)buffer;
-	size_t buf_size = buffer_size;
-
-	/*
-	 * Defensively handle the case where head might be continually increasing - if its value is
-	 * equal or greater than the size of the ring buffer, then we can safely determine it has
-	 * wrapped around. Otherwise, continue to detect if head might have wrapped.
-	 */
-	if (head >= buffer_size)
-		return true;
-
-	/*
-	 * We want to look the very last 512 byte (chosen arbitrarily) in the ring buffer.
-	 */
-	watermark = buf_size - 512;
-
-	/*
-	 * The value of head is somewhere within the size of the ring buffer. This can be that there
-	 * hasn't been enough data to fill the ring buffer yet or the trace time was so long that
-	 * head has numerically wrapped around.  To find we need to check if we have data at the
-	 * very end of the ring buffer.  We can reliably do this because mmap'ed pages are zeroed
-	 * out and there is a fresh mapping with every new session.
-	 */
-
-	/*
-	 * head is less than 512 byte from the end of the ring buffer.
-	 */
-	if (head > watermark)
-		watermark = head;
-
-	/*
-	 * Speed things up by using 64 bit transactions (see "u64 *buf" above)
-	 */
-	watermark /= sizeof(u64);
-	buf_size /= sizeof(u64);
-
-	/*
-	 * If we find trace data at the end of the ring buffer, head has been there and has
-	 * numerically wrapped around at least once.
-	 */
-	for (i = watermark; i < buf_size; i++)
-		if (buf[i])
-			return true;
-
-	return false;
-}
-
-static int arm_spe_find_snapshot(struct auxtrace_record *itr, int idx,
-				  struct auxtrace_mmap *mm, unsigned char *data,
-				  u64 *head, u64 *old)
-{
-	int err;
-	bool wrapped;
-	struct arm_spe_recording *ptr =
-			container_of(itr, struct arm_spe_recording, itr);
-
-	/*
-	 * Allocate memory to keep track of wrapping if this is the first
-	 * time we deal with this *mm.
-	 */
-	if (idx >= ptr->wrapped_cnt) {
-		err = arm_spe_alloc_wrapped_array(ptr, idx);
-		if (err)
-			return err;
-	}
-
-	/*
-	 * Check to see if *head has wrapped around.  If it hasn't only the
-	 * amount of data between *head and *old is snapshot'ed to avoid
-	 * bloating the perf.data file with zeros.  But as soon as *head has
-	 * wrapped around the entire size of the AUX ring buffer it taken.
-	 */
-	wrapped = ptr->wrapped[idx];
-	if (!wrapped && arm_spe_buffer_has_wrapped(data, mm->len, *head)) {
-		wrapped = true;
-		ptr->wrapped[idx] = true;
-	}
-
-	pr_debug3("%s: mmap index %d old head %zu new head %zu size %zu\n",
-		  __func__, idx, (size_t)*old, (size_t)*head, mm->len);
-
-	/*
-	 * No wrap has occurred, we can just use *head and *old.
-	 */
-	if (!wrapped)
-		return 0;
-
-	/*
-	 * *head has wrapped around - adjust *head and *old to pickup the
-	 * entire content of the AUX buffer.
-	 */
-	if (*head >= mm->len) {
-		*old = *head - mm->len;
-	} else {
-		*head += mm->len;
-		*old = *head - mm->len;
-	}
-
-	return 0;
-}
-
 static u64 arm_spe_reference(struct auxtrace_record *itr __maybe_unused)
 {
 	struct timespec ts;
@@ -651,7 +508,6 @@ static void arm_spe_recording_free(struct auxtrace_record *itr)
 	struct arm_spe_recording *sper =
 			container_of(itr, struct arm_spe_recording, itr);
 
-	zfree(&sper->wrapped);
 	free(sper);
 }
 
@@ -674,7 +530,8 @@ struct auxtrace_record *arm_spe_recording_init(int *err,
 	sper->arm_spe_pmu = arm_spe_pmu;
 	sper->itr.snapshot_start = arm_spe_snapshot_start;
 	sper->itr.snapshot_finish = arm_spe_snapshot_finish;
-	sper->itr.find_snapshot = arm_spe_find_snapshot;
+	sper->itr.find_snapshot = auxtrace_record__default_find_snapshot;
+	sper->itr.snapshot_search_bytes = 512;
 	sper->itr.parse_snapshot_options = arm_spe_parse_snapshot_options;
 	sper->itr.recording_options = arm_spe_recording_options;
 	sper->itr.info_priv_size = arm_spe_info_priv_size;

-- 
2.43.0

