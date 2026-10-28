Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210984;
	b=Mn/CHdHTVit4HwFoeqWm3AQOTTg/YhbdwviO2AIqvn5XHuwY0kJkkdpm77A3isTe9P87
	 FvGdR+ftNWxhSCijEb+p4YwyQCZjxXwNNyvsrfN8r9bwrxXwmJhCDbkWM/GtyGxKjvFyl
	 25JnUalAzSKm1t6ebNx72WIonUGKFKMkh4boXy40QE3fPFdpnFPduQINiblsQLBJjbVlX
	 4p+dE9aCrl9xf6r6iFPxHDlz3iXRn4Qv9byk4kJD4FqARId/jET/T/bY4P6tO0mJjjyMz
	 KHVvkTl3sVLjMBVSiMg1AQ9JX0Nsho523nq1MpStDxaIN8yBDzxmb65j28ppTGZaEwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rMVi8SFFXKSrqwlRKxY/pjy3d5De/eMP8nsJ1YLQvSk=;
	b=B7KIX3q9cWlJLqTsbqPfnAqHTRZANyLTBik26OlBejc/bNJXgHOOz5aSynXo4PvZLZP/
	 tRWppvMbLP7fQ/tYx7z/W6lZnfW6JmJdxUNHNiGRNEtD59KewPnFo8WLkKEkOaX7ZZODh
	 YS/YO252v3S0T2TO5Qh1Trb/vOLKwcxeQ+GmQy9aFHp81NvQwbmRdKAwR2Ifc+EypZWAq
	 7ikvvGJc9DSEvu9UjT9YXVvInclL7/99VkNSS0mCEaUbmfyWb3orm1k2F/n7Gt1mkDO96
	 3lIVG0T1TQ2xdQFW5SsVTP1hXuSi7DRBuw/pIeKsP6BWI7HUvlREYKtjG6TIrykKMLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jt6MdRhj;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8071E60A263C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8071E60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jt6MdRhj
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0a921ee46so12262907b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210982; x=1793815782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMVi8SFFXKSrqwlRKxY/pjy3d5De/eMP8nsJ1YLQvSk=;
        b=Jt6MdRhjjDNiJqqa/Pc6TAGqThhSZzxewKrkW+b1dDL7CvX7lyeFXtXjLfsO6PTlBv
         Rch8BPG+BoazMiqpT3TNNYmVzKS0g6+QVD8AoawuTQYh3Cov/2Fdkfy+H4NB4w2EGp4y
         9jqyccHm8s2MSUQsv3WzHCVACOCb4d2MEOCR2zoQRzsFR++F/i8Dh3wPN290uwxtJ21Q
         OZIo5IwBC6G0AvHNQgzQ+PP5oLz6nza3wVZujefGSkYXrr2M+EwTEyAbBruCq4kehB9K
         5SeUcH1XDw6J3gRv3oYHiv+dMkJI50cSsjk07dZuv9pRGO98QlmAhZ8lrcLxCGYZ+A1b
         d41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210982; x=1793815782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMVi8SFFXKSrqwlRKxY/pjy3d5De/eMP8nsJ1YLQvSk=;
        b=emT8hWJPZ03VendbOQ5hv82XPeJkpDik2IOEsdup0QIyi2XuNidGNKW3f2cQqYv2Ir
         786UZfGh7Dqgh02X98HSSAoFMdLC/els8fIk8LeE7hKMoLP9xW9gwVNwe1Km66h2Pt7X
         h1yi5iovgb26SQd0gBF704LIIo66Rv7rwoWCpTgGgApPTKr+p5ulTDc8YhM0xWPUjisJ
         9qsTLX3hccodIC29zOmY+FOeLd+3ZOgVlTRmsKUtP7aJhdzkOidsSgiwAKGOTg/lgLhQ
         RfdWvZtmGwDmcdD91tenvmqd07+Ct8UH+v8Kz6SNbLtPjlrCAQig+zDqS+wO2AhArfY/
         w4cQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+Q1F8oDdLSHGUS28R0HmMFPx2I9PNEa3vPY36yvJA4FeUFNYfkOniV4rZzo1wGt9G6MxDxaxJKfqxVwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUw7CQYNx6Wvw+/2HNvPEKkjjldql52QHzkrJHpkGTW1LQxHJ1
	B8pm1U7E7SJyaYpA26w2nckKxqzw0h+L5kZckLmPrzZWJr1Sk28bHHC4
X-Gm-Gg: AYBFou0j2RRreUyIjuZsRFarzfF2Y8HpyPBcBN/9Yg6ZZgssc5Iq4JbqDPboWKwJQ4L
	VwunvygoKFght5D8TaWl4E4RlrfxXMF2rccLP4Lrfy1Q1Ymk4uPp9c4t/FOwjhBFTCK3GVdWMAX
	6KGDa0vyyz36Y78Nyi181zSQlDWGKicaUM0akoLFPcwA6dhfuAtwKyJSczH5LKOf0ArCqeKmEBk
	Uak9/TPeuuNCjNQvR32ofX13J5MvTPl5BnPBNVadINk6sjozI130XHQdQxmPbC2AmRrNxrN3uI1
	FIBnw2or+L0WESirXIG0nI/l++0BAQobpxhxUatdEdOHcwHG+2AME6OQynXeQh0CpIOQ3YVFJMw
	XK7xHe6qdI/SGYifE2/msciilwtt0JpMvE7e6a6hPQgrRTfk97Pav386viWawVkQkACY7iKcnOg
	qbcdKY/sfT8ZKeKYlZsQ9qOsKf7f/cne/he5ZzoUki1TPabJ8mtT9EJJg2FClRyOf1LPAg/hBFm
	F7XOCRnnOmnuYSOWEACMBWPCkM2V14tboVDP71dQhWf+gneqAMIYqQtjjbyco0OQ9fUhSwinNR4
	eTu0xyzetQ6kpuQz9hJBJ4SF6WRzRju2XICDePlM0OnnLOVyJhDQh9bUK1hWF+HGZfxk6iS7xKk
	S6GG2zX7wWBrgocRSdcHGsezso3QP3TiK
X-Received: by 2002:a05:690c:112:b0:8b0:a8f8:a12c with SMTP id 00721157ae682-8b1b5ec1c0fmr16444777b3.100.1793210982414;
        Wed, 28 Oct 2026 11:09:42 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm2194096d50.1.2026.10.28.11.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:40 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:09:34 -0400
Subject: [PATCH 5/5] alpha/perf: optionally randomize the ProfileMe
 sampling interval
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
Message-Id: <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com>
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4163; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=jVEkKBuejbJrCzLTdVIES+d7ed19TpFwYvlWuMBFngE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUXd/+9ptnj6EvHPbNEJ2Wdf5nMEvDk5KXKZdsLut
 KdXhOsFOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYaHjZGhv/dnIYNe0
 ROil57H17ZF3tMMedmzcOlon1mp7fvLudtWsXw3zmFM+7uc9eA/4v1DGV/qooUnr36cDFX67rbx
 TxObM083AA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A fixed sampling interval can phase-lock with a loop whose length divides
it, so that the same few instructions are profiled over and over while
the rest of the loop is never seen. DCPI avoided this by randomizing the
interval.

Add a randomize config bit that varies each interval by up to 1/16 of
the period in either direction. Only ProfileMe events accept it, since
Aggregate mode samples already land a variable distance from the
instruction that overflowed. Counts are unaffected, because prev_count
already records the value actually written to the counter.

The jitter comes from a per-CPU prandom state rather than
get_random_u32_below(), which takes the batched entropy local lock and
triggers an invalid wait context report from lockdep in the PMI.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 06c9afeb7c05..da8262c74d04 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,6 +16,7 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/prandom.h>
 
 #include <asm/hwrpb.h>
 #include <linux/atomic.h>
@@ -33,9 +34,11 @@
 /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+#define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_PROFILEME	0x1
+#define ALPHA_PERF_FLAG_RANDOMIZE	0x2
 
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
@@ -59,6 +62,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -246,10 +252,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -360,6 +368,20 @@ static int alpha_perf_event_set_period(struct perf_event *event,
 		ret = 1;
 	}
 
+	/*
+	 * Vary each new interval by up to 1/16 of the period either way, so
+	 * the samples cannot phase-lock with a loop whose length divides the
+	 * period. The count stays exact because prev_count records the value
+	 * actually written.
+	 */
+	if (ret && (hwc->flags & ALPHA_PERF_FLAG_RANDOMIZE) && period >= 8) {
+		long jitter = period / 8;
+		u32 r = prandom_u32_state(this_cpu_ptr(&alpha_perf_rnd));
+
+		left += (long)((u64)r * jitter >> 32) - jitter / 2;
+		local64_set(&hwc->period_left, left);
+	}
+
 	/*
 	 * Hardware restrictions require that the counters must not be
 	 * written with values that are too close to the maximum period.
@@ -715,7 +737,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -740,6 +763,14 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EINVAL;
 	hwc->flags = profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
 
+	if (attr->type == PERF_TYPE_RAW &&
+	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
+		if (!profileme)
+			return -EINVAL;
+		prandom_init_once(&alpha_perf_rnd);
+		hwc->flags |= ALPHA_PERF_FLAG_RANDOMIZE;
+	}
+
 	/*
 	 * We place the event type in event_base here and leave calculation
 	 * of the codes to programme the PMU for alpha_pmu_enable() because

-- 
2.55.0

