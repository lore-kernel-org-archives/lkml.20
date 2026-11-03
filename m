Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674934;
	b=VRbgpM9nSgT8eiDOG65kRwn/zs9Z/WAG0fBcKivTCvH6vPRBE5miyzkm7UFhYJSU1nTH
	 Ks2mvymDqB7eD2EkPNoTlD945EOWJ24+Rma5FAl5w5xdu8NTgZ/jwv0GNbjyY5sQEvYsH
	 KpFa3BuIQfu5D8cEDelTsFx/uemivAjCqLL3JEgv9+JofsVrlA/krfpLM9W3P+qta55FC
	 Qaqs4s4FIB+zQ4p87TPHc1NHXENgkg1zqQ+VFIGSy5VvTl7TxZ9bnjd2IBbIH0zkqxNpz
	 zmr4I8WLouT6v3NWIy2eU7QLIll4jYgavmEvhYu9Gj9DMMieNKnDV1NZNsLwO/OzgHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zoeng03qSXDfvs56xwI56lFUqLeEqxchZI3MiXXMNUY=;
	b=uyJIWQ12f6dWbD49q87aX5IUkIY9pLzlc8dIXI1F4RqCzO1xC5tdwsdzYzztlp5j76zu
	 iiYTXTyw3AvbeSBcgymk0OKfnsl7bbpSZ9ykWdkErx30d1WM0F5JJQAAhVIMrVW906SSB
	 R5hnyhrVuDPldkCIt3ZUmcOjsDn2m0uDs6ebfrJnbYdrtmEDJTZy/0YtKWtainkvpfsiW
	 KYTFgJcesS0kYpQ6+8ysP6HQfOxi9ON593BpyZpWUZ+8fmhWJaPTQCLwdSh5p+haBX6fQ
	 tafX89iP1OKUWWHlsJHh5SpXnK6uEpf1MIJdkKWI2a8Oa34BC6Q/vDK1K+y6JBU5pUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3dElHcb;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70236606D809
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70236606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3dElHcb
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ab395abf79so32108567b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674933; x=1794279733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoeng03qSXDfvs56xwI56lFUqLeEqxchZI3MiXXMNUY=;
        b=Z3dElHcb0sBByQrCqzecKaMkQryPfcruEvNnYRMc03qES7Tq+f7z2LuxGdUV7eo0wF
         DConaod0TfDHZkXibwmj6umHWUofMXUFFNmLwpGP67r+v9tSa4U1agln3JmnZgjmnn+k
         Y+DV1R1dM0LNL/shGkzolhHAhUSoWPEWp1r/uovzi+WMs+yZdvfEk9wjidgAKAQ7IvxX
         rtTPApAZ2J0tGMfyAUJgiAoLykRsmIpPDsIUWXwHFlFPmYuINKS5RhBJV+qfycAkSVZ2
         xZr4x6P9LUp0QQhaoTlIa8zY7ftnqHPLa0kuGEHepye9q/vzjmSAQ8Dh/gE6G2QGR/CM
         zBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674933; x=1794279733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zoeng03qSXDfvs56xwI56lFUqLeEqxchZI3MiXXMNUY=;
        b=FDBdHVFChHMwmVua7WsQjY0TCOInLv6C/DYRLd7HwQqapEPqR+WP0Ucomj9QeEi35l
         ql9NiESUECJpGg1Y4tAy1Oqx1YnFjeW5LxeDNABrY3abrYx5lpCkL8+jZDI6aj03bnvd
         fKoOeUsBmFidl0JSm/C4TOpQtYhKZf7Tjbx/0vH6duZ1+uwKV8pU/EU2EuftzZBbc8z+
         tXhqbewXfpGSPgzAc1j8O974h/uhANPbA5xEuL0AEA+tU4LnOPbJO9kWVY46nrX/oNWP
         lQB6bNULEKpUsvz4ya5GynrDmP4kTtgQn56lpIZ336v71GPBO5kq20FlGEGd/qdzH8MU
         jpgA==
X-Forwarded-Encrypted: i=1; AKwUvBxUPb5PJmPudLD/U+W73CiqhbqVsdgB48iaoAmr9/0w3/RoXZtpBfjcJ6nNYQ+vQ8N7lBFk18jGOUuanq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JHB2VukOYH+P9I2kFTEEBmEaul3tQjDqVh67LBUBKSgy4XNsH
	eBMTAKyXMp7egZ989TCiBrPJG84C4+KoRATLiSv5iI/bfgK8w+IAUFiY
X-Gm-Gg: AYBFou2Yo2mn5vgWdkKxBU0I+OcaY2/x/2KeMmxmuXhFevTc0ZFbxIV3Xri1pvL68c9
	7p8b07MOqSn4cDJg+JFVJ6Pv0zLPe2myLNevc/JTyU5KNpxXwZctY/O/EneIHZIVHa7aSuPHapu
	n6ASpJhPv0qdh1dPwFh3dnBh/u7KDfpQchrh9s/C7FGKeZpx63/zpT3rVNlBxegRPlDrGwxhr3O
	79KTaH6cmMlVCuLiCBsGs38cmIzK6iAhzZWpv0n70VsHeN8wtPAAiBk39o+AaP74YBvZ8szdNOb
	nxkV9C4UVJk/4LdT4X/ZLqMdHFrGa81RAFK98RFG1WzgfzQGOyJDlsoDbTZ+BwH4fQ60xLynv+Y
	JgECdArgS2Ixmim90QgC54XvddxK9+3scbCVTubU5DESYGnhKbX20zsi8fyH4AEFpl/rruAGziQ
	zBsWmwK3XNP0RP8MhMXGwLZyC61LHig7DX5/yrkiMHvjl8UvwMsX0oomZcfLUNtLBX/vZ2i5JC4
	1Ndw/ICRdL1psQIljDhcfY1RAUK6O7dsUvCQC9zKd8/dTn6fF4eM7ZDzUgw3IGg1EfU2acUIyQo
	L050DjFSIqC+EIzQ88goCo01lvQ0wUM3IN32KQpzU+hK8Hxfy4Tx1Il+PpLOmzho3DRear1I0GF
	kRGAKR2yWDg==
X-Received: by 2002:a05:690c:9211:b0:8b0:e93e:7620 with SMTP id 00721157ae682-8b2b67ca89emr77676827b3.50.1793674933275;
        Mon, 02 Nov 2026 19:02:13 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71240bcsm63421957b3.9.2026.11.02.19.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:02:11 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:02:02 -0500
Subject: [PATCH v4 7/7] alpha/perf: optionally randomize the ProfileMe
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
Message-Id: <20261102-alpha-profileme-v4-7-61e00f5e1da8@gmail.com>
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4513; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=alrzls4dkQtjgilYGKQomh9GJHAOGLFLpn/Z8s3isAg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i0xcRQuCDj9Nj5wY6noyrClYZe3Ov1erM6mNPvl+
 SPvJoh7dnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw15/Yx/HcLU81eeX
 TdgrPFp67aeX/fs6rAf9MkTqeW08e2pqbExTxnZJiVc/V40Scjnxmd7zw5xLj/3LgswRxoMXV9y
 ZdfM/LVnnMCAA==
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
already records the value written to the counter. The jitter
is computed with mul_u64_u32_shr() and the sum saturates, so that a
period beyond 32 bits cannot overflow.

The jitter comes from a per-CPU prandom state rather than
get_random_u32_below(), which takes the batched entropy local lock and
triggers an invalid wait context report from lockdep in the PMI.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 862824ed6a68..982522dd427e 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,6 +16,9 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
+#include <linux/overflow.h>
+#include <linux/prandom.h>
 #include <linux/sched/task_stack.h>
 
 #include <asm/hwrpb.h>
@@ -34,9 +37,11 @@
 /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+#define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_PROFILEME	0x1
+#define ALPHA_PERF_FLAG_RANDOMIZE	0x2
 
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
@@ -60,6 +65,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -247,10 +255,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -385,6 +395,22 @@ static int alpha_perf_event_set_period(struct perf_event *event,
 		ret = 1;
 	}
 
+	/*
+	 * Vary each new interval by up to 1/16 of the period either way, so
+	 * the samples cannot phase-lock with a loop whose length divides the
+	 * period. The count stays exact because prev_count records the value
+	 * written.
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
@@ -751,7 +777,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -776,6 +803,14 @@ static int __hw_perf_event_init(struct perf_event *event)
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

