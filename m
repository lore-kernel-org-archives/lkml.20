Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621764;
	b=NNCpS8br8PfGUOUoksP0J+qbIUtLlIJHBNEfW/L2enKPcoNO8SgD/NMiYH18+TXSXPja
	 KDxy7g/YGmLZ5uQ5MyZdtLo7MFjZHe64FGbCiyctCUNCVgXhg3OmE6cOgrDLCm61p/Rwg
	 GlOPIxqFvQwnJ9a6N5kM0HwJlAUNUQ0Nrm/LtUF3YZFgi1I0ApW7rkr5zrDfeiHzVC1Wp
	 Wh9RPFgmvOOcx5rqSV8hZfSrmZvjyCzDZGDJGiFAGMFIihy0Gl4w6XUksaYLw6oaf6tIP
	 MYUDms9o99QL9nEMLYw09rkgbSy+/UTSyI3DugY01YJ9b3O1fJ4ObbDiiWlrcKzTN9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+5OEi4AFHAPS6IUP4LkrtQ2C4AGOARjvYXHgM+3nAC0=;
	b=1o9PVnZNvo69TII+x5ZzMlqE6E0liC06OB0OgI13P0BJfLWL1237mQNXTvbBvA66afQ4
	 wS2jF3GaRzJK6x1sdeeJv6ADsFEAufVSmcs6YXJSJnHfrOa7b3NkJskIsDrhJiIzuT664
	 BNCJLo9XWZP6JVw4dN6f/+tvRbv0Ko+PZpC1AoJNosFEOjLllZ5cL06GIB1bDG/k/T0MC
	 gWuXEzn4vQqM3oizs+/xc6rkLcSeV9RFeWdhpDxyPr4MJ1rUqqnbmhbHpyMHxGoeECnYo
	 Gx/jBa8tD4bOnDnhc/Rd3eW30cVAXjqBbcrslCjm3Fysx7aWZVm9XqE84RFoSXZHPuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C3AtdnVH;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D8606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C3AtdnVH
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so22144265e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621763; x=1794226563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5OEi4AFHAPS6IUP4LkrtQ2C4AGOARjvYXHgM+3nAC0=;
        b=C3AtdnVHke/u0Gt/vQYHLcMEJrsifs+z9GnYGh1z4DMthWadjoQLxc9QbGbVnYpw/V
         lYWkySHzsfShlQ4UCFKcDawQvSbKCX17Y06Sfgm2HTQNUWwPXZxHuLIQLKEbfxKBWpZt
         2CabtMrZeXib0GypRqykiPy9/6hj0jzMbZsqEi65IuzHE19Z+YexK5HzXRFZlP9+i8E9
         lTQFKkCKw9UEF8t5IpV1d0J+7j925EhplVYfcrNHu/JOEppXvuL3H2g0AgzO2kKT2H7X
         qJ5DN1Lxl5uVKUqMRyaCXW0Skrz39Pa8pHr52mbGwXkgquAIpFWT/cSpRsAXLU8bhwYY
         +k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621763; x=1794226563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5OEi4AFHAPS6IUP4LkrtQ2C4AGOARjvYXHgM+3nAC0=;
        b=zgbYlXqdxvh5UMtx9ZgDNvK4kdnOYYO/LWEJN++8iNa5CF5n5yoajoKzIvceHYpTJU
         6RPeaPyPdqZnkHK4deQHVhl6ww70JTg+iIcqZZsNMQ2z6cb5XcjltOamRRA08Qzrm0JD
         x9w51qnSGjT3SgLtPtsgUtmOIlXzXvfiwRyH7xkAT+7br21xiu2dFYWzrU+FOvdrFr4K
         XVohQJ73qG4yftJYOMdkHzMXE0EZkdoTJFOECGIxgP2b2eQhP12JD7elPWpi6RJE0hu+
         NTx2upYCbTlUOzR+ERvl+BuZHDOLm+/pGMh/SoXM12x6FDoblv+ZyT/v5ljSLc+jJvWQ
         47Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwNQiOTiINDP/hNJsFyYGP2RoAveY8eoCHiBcE7Vt6uqVCkdtyheUm1YXHL80MwdMvyn46jsY1LULH7IH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuf3ZT4P9KMcY+JUThNvvA8UR+mKgU+z30F/LCZsEkdpx6mRS8
	NGV05G2jovq/+scURaQ0tQqN+DzsxcWS0IaSB7nl6Kf4EneMoY0n/ZNFcsNQhCHOHvI=
X-Gm-Gg: AYBFou3Cv5JV+olVc1ZmIpjU/1vcI2/vZad9fG0D8bVwdDlpoMhWhRpRu0j4uUUlYJ9
	a94l7kkj1zhJHa6lsC7d0elmPpM8YVGVeTaX8V0CjnVI7qs6z5M58nohHPuyp65HLmK3VeNyKft
	VoYu8HFHjfeNfL03N0xCtMtfOiEcUnvlkasvhQ4HoEqKgK8G6bhWX7Dh3CgXy768kHLiAfQp35F
	UUadT96d1qEOdKedZMt8foygEMAvzVbInHznQZbnPKbH//GKYFTLicirkbGVqMVq1QaeeMX6rpW
	K9Z3YTiQP2ZILP9LDQoGVbtOgcvjPHfOzeHkkspVuLBaA8m+sI5SgG/unLhskCJbIj4mstpSJpT
	TbBhKGotFzUNJQWT9bY4jfJ1lgoAuTbKexbQTF5snoFTvX0WiBAuGIqGkzWe76nQKYXwBf9sLum
	R9V+sNihj95/s+PcThjJg3Tra4T/uRA2QVH/Xr8Bz9R4NnOyKxohLPHEU6saYi4pN8D9uUof/VI
	5w8KkeKXcey5iPvjjQSEbkIV0ilnUB2yL84xDr1TQM8UtSUeSUtpQtrrhirDlQz3iaQ6pydg3kH
	QZX7z69M/yUoX0Oi4XtmkbQjm6Kv4J1WLlPd8cFbHdOYitpRNF2w3PE=
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr227993145e9.32.1793621762952;
        Mon, 02 Nov 2026 04:16:02 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:02 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:29 +0000
Subject: [PATCH v3 15/18] perf auxtrace: cs-etm: Capture wrapped snapshots
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-15-dbcb0c281b9b@linaro.org>
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

find_snapshot() isn't implemented for Coresight, so when a wrap occurs
we only save from offset 0 to current head, modulo buffer size, rather
than capturing the whole buffer. Coresight drivers currently use a
monotonic head pointer even in snapshot mode, which gives a lot more
information for taking snapshots than a wrapped pointer. It means we
don't need to search for data at the end of the buffer to guess if a
wrap has occurred, and we can go back to saving partial buffers after a
wrap by checking if the next size to take is less than the buffer
size.

The drivers will always be able to generate a monotonic head because
TRBE has a bytes written counter, so even if we stop generating an AUX
record on every overflow, we can check if the counter indicated an
overwrite and offset head by a whole buffer size if it wrapped. This
forces userspace to read the whole buffer rather than between last and
current head. ETR and other sinks use software double buffering, so can
continue as they are.

Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
A monotonic head can't be auto-detected in the default find_snapshot()
by checking if head > buffer size, because before the first wrap a
monotonic head looks the same as a wrapped one. The search would then
falsely detect a wrap when head is near the end of the buffer, and the
wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
driver's head. With a wrapped head that doesn't matter because only the
offset within the buffer is used, but with a monotonic head the next
snapshot would either save already saved data again or drop up to a
buffer's worth of new data.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c                  |  1 +
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
 tools/perf/util/auxtrace.c                         | 23 ++++++++++++++++++++++
 tools/perf/util/auxtrace.h                         |  4 ++++
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 5e7d09b7170c..84a5d7392a5f 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -922,6 +922,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 	ptr->itr.info_fill		= cs_etm_info_fill;
 	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
 	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
+	ptr->itr.find_snapshot		= auxtrace_record__monotonic_find_snapshot;
 	ptr->itr.reference		= cs_etm_reference;
 	ptr->itr.free			= cs_etm_recording_free;
 	ptr->itr.read_finish		= auxtrace_record__read_finish;
diff --git a/tools/perf/tests/shell/coresight/raw_dump_stress.sh b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
index bea70d825596..c9459ded4cbe 100755
--- a/tools/perf/tests/shell/coresight/raw_dump_stress.sh
+++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
@@ -48,11 +48,6 @@ read -r size offset last_idx <<< "$(awk '
 # everything was dumped. Allow 48 bytes difference to cover 3 frames: current
 # frame length, a partial frame and a final empty one, all of which aren't
 # dumped.
-#
-# TODO: for a single snapshot, offset should always be zero. However, we
-# currently output AUX records in snapshot mode when we shouldn't, which
-# increments the offset. Allow for that until it's fixed so we can test raw
-# dumping.
 decode_size=$((1 + last_idx - offset))
 if [ "$decode_size" -gt "$((size - 48))" ] && [ "$decode_size" -le "$((size))" ]; then
 	echo "PASS: AUXTRACE buffer length matches dumped packet index"
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index c613efd83223..3aabf2f4bd47 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -750,6 +750,29 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 	return 0;
 }
 
+/*
+ * auxtrace_record::find_snapshot() implementation for drivers that don't wrap
+ * 'head' in snapshot mode, so it's already monotonic like in full trace mode.
+ * No search is needed, only force a full buffer read if more than a buffer's
+ * worth of data was written since the last read.
+ */
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr __maybe_unused,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data __maybe_unused,
+					     u64 *head, u64 *old)
+{
+	pr_debug3("%s: mmap index %d old head 0x%"PRIx64" new head 0x%"PRIx64"\n",
+		  __func__, idx, *old, *head);
+
+	if (*head - *old > mm->len) {
+		*old = *head - mm->len;
+		pr_debug3("%s: wrap-around detected, adjusted old head 0x%"PRIx64"\n",
+			  __func__, *old);
+	}
+
+	return 0;
+}
+
 int auxtrace_record__options(struct auxtrace_record *itr,
 			     struct evlist *evlist,
 			     struct record_opts *opts)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 9d86f8366ad7..980acb2dc687 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -607,6 +607,10 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 					   struct auxtrace_mmap *mm,
 					   unsigned char *data, u64 *head,
 					   u64 *old);
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data, u64 *head,
+					     u64 *old);
 void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
 				     u64 *head, u64 *old);
 u64 auxtrace_record__reference(struct auxtrace_record *itr);

-- 
2.43.0

