Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599778;
	b=Lt+uKNj+93ik160gps+An113H0IcKAssB3PD5ll3h4zGgNE1Aqo4EweFsH0FF26oSlvG
	 i+zUPfVGV6eSS9poojfOjXSLVm9I0sWCkXKSfYdOs1Lchq9EfpPyur0apf2BLLwEZleLe
	 z1BF9sugwN0lLp4yBkRCZEZMs8bfUXxs0aS094iWcKp7qjen9skqhmjDtQ+z0C+7i29Vz
	 HMmeyJ1TSv7tq8BMJ+lEj34qBBOvz6sTsfwpSBDGhNUQQbR3fIYO1XijoMp5zfiASBNTM
	 7ey0tlmpC4XKpSZ+Jvw9gdiDER24VXsXtTId10fPwLyHqishk67aGW6XCYUJBAQANYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XMmzbunlJH192qX/W/79gqtuC2lEBdkCTnbknIAFCWo=;
	b=dILHKmpKrPKJ01/MbUfaGNI91hQcutrMvhOACzdIHCgP85X0wNPK1AACkN9+7Mwlp1b7
	 ZfaSIwI4fYeZxu4Q7V7T5BVAa08YLKW9Nm4MzZLk+g+yFdHL6vFydKWH6uJTc2aVC9gt9
	 lPoW0nVrLmSx4KP811MuIhtz0xqRakYgqLVv6GKuU+uWQcF7uasS+EMXHQZuBdJZJuqhn
	 3eKNmZcRQwy5ZpmNvodNx2Sf7lLK2PIDSux1/Sw3u6wSpIsBQ8KNGcZXWxTzE0RlnrbOJ
	 +srn8kDBak39C+TdnWtMjM2ikzYl+0yn4YyCuebeePMiyCXQC4l+yFfaO6K6KjYhs9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pbkkONk1;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8260A3835
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD8260A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pbkkONk1
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1369299eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599777; x=1795204577; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMmzbunlJH192qX/W/79gqtuC2lEBdkCTnbknIAFCWo=;
        b=pbkkONk12KAMf9mup0dhipMoiQnk3CQSZlnUMbKm7a7zLG6DWX0NKcjjKHOLoJLUH+
         Q2crmDQ7+ZZLqmr+um8SbUb36NzEoWswXITeg+IfGujvYoizOj6cLDzhK1daVnu33OKY
         sVGOyTEJ8SxJ4XcsZ+H5pQK/QKPCafJgHmez8G/7eCNQrQCh6yEVfmjw89+SZU4esWGJ
         Zc2PhLbcWYkNMZ7IPgh6yjLjFJwiOlxIGnxlq90qmLJ5R9lGzFOLhHoBfXzjavr/uJS0
         ZXyIZloYl/aVWo/YxI31hhdZJoga6cWQC5yzvKlGZSnPTfnIbF9Kl2XaeqB3oqONCbIH
         dX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599777; x=1795204577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMmzbunlJH192qX/W/79gqtuC2lEBdkCTnbknIAFCWo=;
        b=qtp2EyT42zg7+bmV/fmkPja+tN/6gnGYr+MJPdclpfphixMeVefPT1JqnM/RbgThuZ
         Uhc6vlskpxpL0Et2z2xTEVwuEnfE6S4EjhXwT6kuZCjMeIR0UEukNRkOpJR4s1uzii6c
         0KVV0JZrBhUjqJxh2BKLBBOi8IUt1Bs/KjAXPHeG2kP2q4IGSwPMbck5VZ0Qfo5cFMWt
         VaI8Q8IL26C1ZnUTEB4pVMGHs8JABIxsO5QmlK/7SvfIdQU5klUb5M2b+rs/X7jKx7K3
         OdMOj761DmSgWZizZ5ZuSZ/WHWqnQg/rIcwt5Hkco4jkdrzinuGGzDSHujOdkV/KTJ7n
         ffBw==
X-Forwarded-Encrypted: i=1; AL+hErHhPxCa0EbfLlSw31eb+Z01WjR7kzFr+sK8A+7odqxGn6Kb2n4ych2KYe0WHf5D8pd+/fMbZv7HvBoj5XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o6CQPc4iKVP8Bl33KpNnIL8lgZ5/8zYYEZ2IbCs2+ypzf0Pz0
	pGhvJX2vl1WDM7UjUxRoENG68CVlfwvD1JFLhk6ORVKg1S2MgAbHIxfnnRiYLBiLTAIfPet65HB
	ze8dSNRQ1Gw==
X-Received: from dlbec12.prod.google.com ([2002:a05:7022:d8c:b0:19d:e7f1:171c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4354:b0:143:26cf:8615
 with SMTP id a92af1059eb24-1b5031111afmr3091648c88.25.1794599776816; Fri, 13
 Nov 2026 11:56:16 -0800 (PST)
Date: Fri, 13 Nov 2026 11:55:50 -0800
In-Reply-To: <20261113195601.2872738-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195601.2872738-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195601.2872738-6-irogers@google.com>
Subject: [PATCH v2 05/16] perf pmu: Probe precise_ip levels
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Extend perf_pmu__probe() to probe supported precise_ip levels (1..3) and
populate probed.precise_mask and probed.max_precise.

Some PMUs that do not implement hardware precise sampling (such as
software, breakpoint, or AUX trace PMUs) silently ignore attr.precise_ip
even on non-sampling events (sample_period == 0), whereas PMUs that
genuinely validate precise_ip either reject precise_ip > 0 on counting
events or are sampling-only PMUs. Check for this before probing levels
1..3 so non-precise PMUs are not misreported as supporting precise_ip,
while still detecting higher precision levels when core events are
forwarded to hardware sampling units (such as AMD IBS).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 60 +++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h |  4 +++
 2 files changed, 64 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index d8bcf0e91f6f..322d90695c4b 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3475,6 +3475,66 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 	if (pmu->probed.can_sample)
 		probe_sample_types(pmu, &base_attr, pid, cpu, flags);
 
+	/*
+	 * 3. Precise sampling support (:p, :pp, :ppp).
+	 * PMUs that do not validate attr.precise_ip (such as software,
+	 * breakpoint, or intel_pt) silently accept precise_ip > 0 even when
+	 * sample_period == 0. A PMU that genuinely implements precise_ip
+	 * either rejects precise_ip > 0 on non-sampling events or is a
+	 * sampling-only PMU (such as AMD ibs_op).
+	 * Note: On AMD, core events like cycles:P are forwarded to IBS and
+	 * support higher precision than advertised in sysfs caps/max_precise.
+	 */
+	if (pmu->probed.can_sample && !pmu->auxtrace) {
+		bool ignores_precise_ip = false;
+
+		if (pmu->probed.can_count) {
+			struct perf_event_attr c_attr = base_attr;
+			int fd;
+
+			c_attr.sample_period = 0;
+			c_attr.freq = 0;
+			c_attr.sample_type = 0;
+			c_attr.precise_ip = 1;
+			fd = sys_perf_event_open(&c_attr, pid, cpu, -1, flags);
+			if (fd >= 0) {
+				close(fd);
+				ignores_precise_ip = true;
+			}
+		}
+
+		if (!ignores_precise_ip) {
+			for (int level = 1; level <= 3; level++) {
+				struct perf_event_attr p_attr = base_attr;
+				int fd;
+
+				p_attr.sample_period = 10000;
+				p_attr.sample_type = PERF_SAMPLE_IP;
+				p_attr.precise_ip = level;
+				fd = sys_perf_event_open(&p_attr, pid, cpu, -1, flags);
+				if (fd < 0 && p_attr.exclude_kernel && p_attr.config2 == 0) {
+					p_attr.config2 = 1;
+					fd = sys_perf_event_open(&p_attr, pid, cpu, -1, flags);
+				}
+				if (fd >= 0) {
+					close(fd);
+					pmu->probed.precise_mask |= (1u << level);
+					pmu->probed.max_precise = level;
+				}
+			}
+			/*
+			 * Sampling-only PMUs, like AMD ibs_op, can't be checked
+			 * with a counting event. If every level, including 3
+			 * that few PMUs support, opened then assume precise_ip
+			 * is ignored.
+			 */
+			if (!pmu->probed.can_count && pmu->probed.precise_mask == 0xe) {
+				pmu->probed.precise_mask = 0;
+				pmu->probed.max_precise = 0;
+			}
+		}
+	}
+
 	if (keepalive_fd >= 0)
 		close(keepalive_fd);
 	pmu->probed.checked = true;
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 658485faa05d..fea65e314547 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -238,6 +238,10 @@ struct perf_pmu {
 		char *probe_event;
 		/** @probed.open_err: errno if open_supported is false. */
 		int open_err;
+		/** @probed.max_precise: Maximum precise_ip level (0..3) supported. */
+		int max_precise;
+		/** @probed.precise_mask: Bitmask of supported precise_ip levels (1..3). */
+		unsigned int precise_mask;
 		/**
 		 * @probed.sample_types: Bitmask of supported
 		 * enum perf_event_sample_format flags.
-- 
2.56.1.703.gf848ed807c-goog

