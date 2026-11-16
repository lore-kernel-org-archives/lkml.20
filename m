Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799382;
	b=glHYejM3A3rqZnGKc2kTNEVFlzuRae4x2CYtnliSSMHqNxe+HJ7FueiZFMoM5nk/JTex
	 6t3djXqi4DXalK3pSAKMWrWhx4MbpK++9DyC9ub9y269Pj+KcLi7JLGJ0teR6BCNq/OMq
	 tw7YLSy3hW+Moxcua1zlsypkMmS1QdUQ4XKMU3hqYozD3Xj5vArqzkamP1XWyNb7AoiIT
	 UhnjezGzqzpfOZrdx9z4mNVYkIEj+tqUHY3Vv7lbG6hfzJJtvcZJQL3y4ptV3DQ2I9MRi
	 GoZ/bsOXfHClIKDQMJ5tp/V9JUOjv69nBbekuSRCpQQTjrVv92X+D0eTGQCoMdCr/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ooEn12XwfXuGSQOnlTHC3VMKYjKiX/IC7zMY3dtpoFk=;
	b=zz+B3YCvWmUKk85mHmEVoS7jf1JMn/LPHhpRij94EG+Zmtgb5f/VygUZQhmI+zuCduDB
	 FgDWAZuj+x6HZ88obxeLaD4qb5ERTsmbaEL3KmUa5OR3OsoGqI15vjBL1rrj6F+kixaXU
	 Lout/cIsaur3e9c8MkxBzwRF5FTGah8RCzzbWfncB+yinP3DgX2nO2Fc/aeEzvNHLLjYi
	 8gaZXL1clJh2ZJpI9DE6hXBO3d6PJDetA0oWcECJ9RmzAP9aTkwK2Jypvlgj6BXCH0Vk+
	 I2CDkWVTaFugCMXNxsrGjZSedxasMzJtPZpDOqywjzXKjvvtq1rmVEkaAN27MSJTdpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikw5Lpwn;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F9606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikw5Lpwn
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0b8b5d28cso420260a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794799382; x=1795404182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ooEn12XwfXuGSQOnlTHC3VMKYjKiX/IC7zMY3dtpoFk=;
        b=ikw5Lpwn0n8u1bt+RZ5oZvms6fAWSgv8M2KZnTeTzr8Rcxn/RPZtQwngMukKEjUZ6Z
         MLtM9jqx3LiV7BLHhiZLKvH20Lw6fv8dyT/JSkqVU8ZOR+Ng3p79EpsGWp/BvrkcuqCH
         LU6xBYNonFSblxOJQFcNwN3UUM3BXHLFox/W02H/zBsKhE7HgSpC274Us/VWWhMtTD62
         LpmmpUxDdPuMZ87FQ7i1jYdc7B3p/zBeFwju3hwA1gbWQNyaP6wNWajLoCUmc4V93KJZ
         XdETZfBpqm1fAWxmf7pf8fJj7NAOvRllDAAXaGE/2CckrbdRmSgdB3itDiuYkjfz7Iyq
         MI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799382; x=1795404182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooEn12XwfXuGSQOnlTHC3VMKYjKiX/IC7zMY3dtpoFk=;
        b=My+3QNaoJaRqADUZc+T5xlktVOl/ohXXuwjFHFNfUUt93ovqH8ukX5gEThQZUS2XOD
         OHNW2I6jFlz1TBvWCpfdMxRX8cCM9/kt0jA5z/BMvMrrz987uA/N0fgZfRokdREkAzxD
         fa5wu1CCW3VN99PtOAU4FcZnE6Yr7rRZZACCX6xq93Q5zptRtdIkexs0d81lCbj/e2Mb
         +Ku7eo8WqLVT/yLbrA1d+REroNDsdZMyKdrVawuuvNKWQmo1ghT93xS7KVVn8JvSDPj6
         acV8GLEFCYNF6eeNp+XDhhc3jNGrAdV+O/td5WxLV9R5YcIgkkfYFqzbmTpuOkcsIyYq
         3Qaw==
X-Forwarded-Encrypted: i=1; AL+hErGBMhu/UUcH4zoWLXuQXnruuJbklPLwTbpAkHLI3fEiBb0ZMuUGN2ef+8rrxm6QN8mNrUJ+s+DwVH4Rqyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M73BA1qMx6QBVfrm9wsvwHtplfE2nAA8ZvDrAzkFLBBUupoNj
	ISiujDRyjKPZWgMLqj98tGgUvz4XQk3oz/G3Y4JXPQjfk36wJbDoLoJj
X-Gm-Gg: AYBFou2T1hAgF9SExUalPmu8ztOqxZ+UrgWBoD3lg+WbwCCGJzigeOsZn+B8J+mf9Gx
	YlEasvl3I7JLlVcRKdm7NsyfKXi8Io7ZAA9UP7OG12NOqdlFr4dm8/ZFhePJJBqXzeHEmwv46to
	xDlfF1610tAGqL5Xx79tj+X42G07GbRFrKcSb1XEc0RuDzOCGJcXdfhUQOTtbk8G6gwU1xS7Uaa
	3CaJDYZBP5dBBAbUq1WNJASTOmz9ZRezkgYFkGfzKbWA8v7NG7vA5jOLJqinEk+3puhIbX6XdkM
	BdaGes15Hk2KVjCjYsoSXe3a4vaBi2i434vCSgeqnVKAeCKpLgptPK5X7+sR9EgaBYKKViwscPF
	KUpGrFOxVdey+sYw6Nc3/RzbZHQlZ0Frz25SJWtr/O5mt0+yt9xxMklXY5uKvz/3dW3KUKj/GA6
	mZp4x3Df4z52w2ZLiPYSd5NMZRxpA9zdwyg/pno2IfsUUf2TUy8chElLt8kVh2FX6KagXJu5ZOx
	IHsTj2aXKoHW6cqBIeEIngopLx56olANWeT28Ls2fhw3ov4eL7ydiDnmTKRAYkBN02X2Sc9EKWh
	3A8DfwhF49JEwfkBMfBMqP7zg2fulmp9GT3BTtBT2oPUOq7L72v/ors=
X-Received: by 2002:a17:90b:1b06:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b1b085e335mr14790525a91.2.1794799381561;
        Sun, 15 Nov 2026 19:23:01 -0800 (PST)
Received: from mi-ThinkCentre-M760t.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm14908718a91.1.2026.11.15.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:23:01 -0800 (PST)
From: Wenwu Hou <hwenwur@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenwu Hou <hwenwur@gmail.com>
Subject: [PATCH v4] tracing/hwlat: Do the latency calculations in nanoseconds
Date: Mon, 16 Nov 2026 11:21:56 +0800
Message-ID: <20261116032156.3138060-1-hwenwur@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tr->max_latency is expected to hold nanoseconds: tracing_max_lat_read()
converts it with nsecs_to_usecs() to print the usecs documented in
hwlat_detector.rst, and the other latency tracers store nanoseconds there
too.

Do all the latency calculations in nanoseconds instead, and only convert
the durations to microseconds when recording the hwlat event.

This also makes the backward-clock error paths reachable.
Previously, time_to_us() passed the delta through unsigned div_u64(),
so a negative delta became a positive value after division. These
error paths jumped to out without clearing trace_hwlat_callback_enabled.
Fix this as well.

Fixes: e7c15cd8a1133 ("tracing: Added hardware latency tracer")
Fixes: 7b2c86250122d ("tracing: Add NMI tracing in hwlat detector")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
---
Tested in a 4-vCPU KVM guest; all three hwlat modes worked as expected.

v3: https://lore.kernel.org/linux-trace-kernel/20261113094918.2402297-1-hwenwur@gmail.com/T/#t
v2: https://lore.kernel.org/linux-trace-kernel/avW1t81WLQ9YrylB@gmail.com/T/#t

Changes in v4:
- Record a hwlat event only when count is nonzero to avoid recording an
  uninitialized s.timestamp after a backward clock jump, as pointed out
  by Sashiko AI.
- Check diff < 0 before comparing diff against the unsigned threshold.

Changes in v3:
- Fix trace_hwlat_callback_enabled remaining set on the backward-clock
  error paths, as pointed out by Sashiko AI.
- Add a Fixes tag for the commit that introduced NMI tracing.

Changes in v2:
- Perform the latency calculations in nanoseconds instead of converting
  only the maximum latency, as suggested by Steven Rostedt.
- Convert the durations to microseconds only when recording the hwlat event
  to preserve the existing event format.

 kernel/trace/trace_hwlat.c | 41 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index 65e184d800ff1..a69699daca558 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -203,14 +203,12 @@ static int get_sample(void)
 	time_type start, t1, t2, last_t2;
 	s64 diff, outer_diff, total, last_total = 0;
 	u64 sample = 0;
-	u64 sample_width = READ_ONCE(hwlat_data.sample_width);
+	u64 sample_width = READ_ONCE(hwlat_data.sample_width) * NSEC_PER_USEC;
 	u64 thresh = tracing_thresh;
 	u64 outer_sample = 0;
-	int ret = -1;
+	int ret = 0;
 	unsigned int count = 0;
 
-	do_div(thresh, NSEC_PER_USEC); /* modifies interval value */
-
 	kdata->nmi_total_ts = 0;
 	kdata->nmi_count = 0;
 	/* Make sure NMIs see this first */
@@ -229,28 +227,37 @@ static int get_sample(void)
 
 		if (time_u64(last_t2)) {
 			/* Check the delta from outer loop (t2 to next t1) */
-			outer_diff = time_to_us(time_sub(t1, last_t2));
+			outer_diff = time_sub(t1, last_t2);
 			/* This shouldn't happen */
 			if (outer_diff < 0) {
 				hwlat_err(BANNER "time running backwards\n");
-				goto out;
+				ret = -1;
+				break;
 			}
 			if (outer_diff > outer_sample)
 				outer_sample = outer_diff;
 		}
 		last_t2 = t2;
 
-		total = time_to_us(time_sub(t2, start)); /* sample width */
+		total = time_sub(t2, start); /* sample width */
 
 		/* Check for possible overflows */
 		if (total < last_total) {
 			hwlat_err("Time total overflowed\n");
+			/* Keep ret == 0 to preserve any latencies already detected */
 			break;
 		}
 		last_total = total;
 
 		/* This checks the inner loop (t1 to t2) */
-		diff = time_to_us(time_sub(t2, t1));     /* current diff */
+		diff = time_sub(t2, t1);     /* current diff */
+
+		/* This shouldn't happen: time went backwards between t1 and t2 */
+		if (diff < 0) {
+			hwlat_err(BANNER "time running backwards\n");
+			ret = -1;
+			break;
+		}
 
 		if (diff > thresh || outer_diff > thresh) {
 			if (!count)
@@ -258,12 +265,6 @@ static int get_sample(void)
 			count++;
 		}
 
-		/* This shouldn't happen */
-		if (diff < 0) {
-			hwlat_err(BANNER "time running backwards\n");
-			goto out;
-		}
-
 		if (diff > sample)
 			sample = diff; /* only want highest value */
 
@@ -273,10 +274,11 @@ static int get_sample(void)
 	trace_hwlat_callback_enabled = false;
 	barrier(); /* Make sure nmi_total_ts is no longer updated */
 
-	ret = 0;
+	if (ret)
+		return ret;
 
 	/* If we exceed the threshold value, we have found a hardware latency */
-	if (sample > thresh || outer_sample > thresh) {
+	if (count) {
 		u64 latency;
 
 		ret = 1;
@@ -286,8 +288,8 @@ static int get_sample(void)
 			do_div(kdata->nmi_total_ts, NSEC_PER_USEC);
 
 		s.seqnum = atomic64_inc_return(&hwlat_data.count);
-		s.duration = sample;
-		s.outer_duration = outer_sample;
+		s.duration = time_to_us(sample);
+		s.outer_duration = time_to_us(outer_sample);
 		s.nmi_total_ts = kdata->nmi_total_ts;
 		s.nmi_count = kdata->nmi_count;
 		s.count = count;
@@ -301,8 +303,6 @@ static int get_sample(void)
 			latency_fsnotify(tr);
 		}
 	}
-
-out:
 	return ret;
 }
 
@@ -839,7 +839,6 @@ static int hwlat_tracer_init(struct trace_array *tr)
 	tr->max_latency = 0;
 	save_tracing_thresh = tracing_thresh;
 
-	/* tracing_thresh is in nsecs, we speak in usecs */
 	if (!tracing_thresh)
 		tracing_thresh = last_tracing_thresh;
 
-- 
2.43.0

