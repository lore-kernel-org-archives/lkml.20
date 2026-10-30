Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333053;
	b=tFYIrPI6ITiBAxSEt770XkhEWm/Od1WcNO6gr/noodg29/QiB22qaVQvvF/lflfh5HY3
	 8kriP8wMcLaVEFGqZT2bt0uc0wIEdzW5XvwXIgZXv3xJ8ExZ8o5CxOvSboofTY/hY7nLo
	 Npa2AAR0qRCbb0e+4YWhJTTsMwZUspUgdy30gni2ZXhUiu2uSyG8TccZzZmzovTObCms9
	 ZQYKe0FEDnpfoHpYzucBuwq2j4eYnQVEQiCJr405xsyAQiYSniL7M9sVsrQc77mS7iiUp
	 pxXEIMdUPdxicJTRVNJGCxX8alvt7C7PEbv3ViAx2LBTxSAnpzD+D5Ea5h+1ti9tLiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lNqmpGtTgW9fUJol2Sbmf3JaAFwyCUvKXpRbTU4nX5o=;
	b=kzt8LWkDQDbTW7RYCFMDPQp/U5Vj5MyuSP4SuGzj0pl85cu2Uk3YTZHeBPzySIVB9P5W
	 laUqCSdClSqojvdIb3aTE5JZm0mxJNNd2IlHmknSzSJ9jQ1Eilc2P1s6pSAdaL+FKtKej
	 MZZkiD4LpzlOgf1Cs//MqpDe4SxK4Vp42jv3+s9a8FHGXrY5EOeRURr9mD/hYu0UE56th
	 fwjNf3/5nws5ty88uNm+85U1LFC8Ktp5JHH12y1LK66ie+BQ13mZrasjHTh7/N1/E+DMj
	 +pEOtyEWckR/hPKfY1i8L89JaA6rZKZzhJoVNSdF5IbWoHJts4dyFqxj3cvTHmDgLhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3pKE8Mk;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD077606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD077606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3pKE8Mk
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798c43a3d6so183210d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333051; x=1793937851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNqmpGtTgW9fUJol2Sbmf3JaAFwyCUvKXpRbTU4nX5o=;
        b=o3pKE8Mk5lLoXMN8tyFjew+zoik7KSYUndCtzpeYTexQYSJ2fBZ4mQhkpISh+08wMH
         hzSrOYsCv53Q6E/c7K44HuYsOr0EQ8DidRsIXP1GZWdc/5kDCc3lQG8VAFAxpeR9S60Q
         P69+G9xmVFaMzAfT3+bm0GL4RmWgKcC0vLbSie9S1yukd6vqeOuFq+JF1oIEvq38nZp3
         JLhHNf1NKIxif1aiFVOlUYGKxU61Sj2JeHcqVxkljzfjGCiGeIODJ/gsuMH93khorrfD
         gw5iJ+WXdaK9LlcL8O7geZeJGIMr5gc8NJ5FGYacWxyyuqnX7oxDGnn2zuCuD+msuyo0
         m2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333051; x=1793937851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNqmpGtTgW9fUJol2Sbmf3JaAFwyCUvKXpRbTU4nX5o=;
        b=hbt0VKVloTOaJlalMGVXzTjffXFc3cFDWoK0LCUzQqhXcxnNbB16U3CY2bVIntzaCh
         o9g1hyxL1fpWOUCYlEjZqjvp8BEMyg+Lf6rXusr7HntkHEIMTstA8nHSvpH4Arm/lcrK
         vQp8vIn8g9ZrqzH0nnS/SxbEaAv4/jjzycOD4PdZY01Wl23MaZEItzJnCbZhRLom5LgG
         qvTANaxAi46z575KfOvcX8mTNa731bKR+sdvTDqqyaTo7lDVv/0y0n/+CQ+mMl8/9NOQ
         ZBJ+lXi1dWSu1usEBwRdAihdq6G0bUPTYYh31XdlDvnhJq37Cm6vUCIb0SocXQtKixi7
         /JBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlWvvsrJDfXB2K5WEBOqPZLQNe1ben5F/pPpBJS4myaVoNxiPsU03hWeuntzD9kDD2TrDcYlbg6HhlnKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT7aQEppNQiV0NoE86ecdLL9tbRNmxfYzCE6VWbOIw++Kso56T
	siaUjR85p/+/EUMrWr3guMVY0bDaXex+tlGpU/hJ/yOZQ6j3+NyoBBY8
X-Gm-Gg: AYBFou0bRzZwtlYrwGbWCzoti2G8BHuCiXRptgqL2xTsvKEDXwvNys5QIm9kiKVmISu
	VoNuceJK2gD38BhYdAMsCtX5iWrZNQHoxp30WgOCLpFUGPHkzSwjQni2RcjMxCtEVAjoTzZzQ+e
	l+0+amIg/NlncADDokpYhQP8sv1HmHWkfpUPme2mOdmwCYo7HgSGb56YOL6db1Igb7x+cSscWwl
	o22Pv6jGiYygzaZ6Ttq4YYympMGXFBIJBphy1+ehRxVgGxsBqCSz/BuFgF+6b+5ts62PLaSkRJp
	uikNHR3Uh5Oe+y6Ul8iDSShk5Ut8GEMADWTiwyFUZWWPWMKAn+b+yp2KqAteizaE3kbDTrcNar4
	XCsjLWaL9vF0zGQa3SMcb182aBE0VE1xISldreHkHgwdzFKdQx5M6SiTy6G3Ib2BXL3O3jdB33t
	QfoTzujpE6AQUXRoWZWyyA+kvIZrsUpd9Tdap4JvtpgF7Mg7AMbLuHhahaz7WpKZDGHHWGu9XNq
	aj9BRl/OgGmlhABQYRZTXH+NR6Bw+iKeWvDpLoXlF58E+sQvurbEkwlc8p2IVtkCWvZh3fV4t1O
	NUZ84x+gYVvrjQfYNi8mYjWMwQ52oM7R8XPeqPsGlki3VtBTtBGcqr4NwlB/7t2RoWe63PZ2dC+
	lFxZD7diFA7Ma6GZSUc5hVs9Nou5W5gQ=
X-Received: by 2002:a53:c849:0:b0:679:aa23:415e with SMTP id 956f58d0204a3-67ba502ce45mr538074d50.87.1793333051349;
        Thu, 29 Oct 2026 21:04:11 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba7514e84sm310708d50.16.2026.10.29.21.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:10 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:04:03 -0400
Subject: [PATCH v2 5/5] alpha/perf: optionally randomize the ProfileMe
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
Message-Id: <20261030-alpha-profileme-v2-5-c702f1c65272@gmail.com>
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4423; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=k1TKL1tsmpw+6SouF+Nkc9CqghjK65hgxaoQW1zZB34=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOv3sUVzTfoceWLxFj7mw8c2O780YnxbnHfx1vLXP
 4/nnJizueMjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuWb+XkWF904sfLH
 98r1VPTV5zSPmC4P3SJ+I5utVVFw7p8Xbf36PC8D+zsLjPOlX49y2DXTsE9A+cObD+TtXxO1ebV
 24pPX8zcxsHAA==
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
already records the value actually written to the counter. The jitter
is computed with mul_u64_u32_shr() and the sum saturates, so that a
period beyond 32 bits cannot overflow.

The jitter comes from a per-CPU prandom state rather than
get_random_u32_below(), which takes the batched entropy local lock and
triggers an invalid wait context report from lockdep in the PMI.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index c9d4b13817bc..c553cbd6c7a3 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,6 +16,9 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
+#include <linux/overflow.h>
+#include <linux/prandom.h>
 
 #include <asm/hwrpb.h>
 #include <linux/atomic.h>
@@ -33,9 +36,11 @@
 /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+#define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_PROFILEME	0x1
+#define ALPHA_PERF_FLAG_RANDOMIZE	0x2
 
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
@@ -59,6 +64,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -246,10 +254,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -367,6 +377,22 @@ static int alpha_perf_event_set_period(struct perf_event *event,
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
+		long offset = mul_u64_u32_shr(jitter, r, 32) - jitter / 2;
+
+		if (check_add_overflow(left, offset, &left))
+			left = LONG_MAX;
+		local64_set(&hwc->period_left, left);
+	}
+
 	/*
 	 * Hardware restrictions require that the counters must not be
 	 * written with values that are too close to the maximum period.
@@ -738,7 +764,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -763,6 +790,14 @@ static int __hw_perf_event_init(struct perf_event *event)
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

