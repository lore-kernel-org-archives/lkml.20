Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939431;
	b=xScIuoHk4IAPSXhHEvtkMbwGS3OfHHlFzqKHtcO3cHXczxe4qBJaHrte/8JHe2HjeD8w
	 f1L9gWgb2tF6CGAaommJ6+2yZnue3/PFdnZa5Z53qLA2SI3tICPocA1qwiT3glw+ccD4J
	 bGoLt/wDR+zM4GhejR+IPGz1p1oVWOvKVj6jvex7mnFO6iMStWNxFtofgxPn/qssyl9IC
	 MgYn6u8arCngm1ayKQ5/ANDqnwkBiJLlEawnGn7H3OBioGhvUYB1zBtsyBFtJH3eSAznI
	 p5G1kBCnms6MjlyzbzR1KVD8B+yAaKSTToeiuiuQvHvoEFOchymJyvli6G5Etwk3yDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=l9FfNcYVQqBj1OaIcv9GJuMGud6+OOiFH5MqJ1VwAOI=;
	b=VFUlzWnfmgn6/PKAaYQBj0XhU9Dyo3IhxW+odFYU6MPqo9+8IShEw4cI/cESssL+DWG3
	 9eYCew+gX4P4ru/Lps3himDvHHMMpEIvdmdcfVuDEfxTpwDC3WAJZF7VJU45rjIsnJKry
	 oBPtHvMhuE8wmNK/SN1/7KlnFvAz14FnazhuXggz+QeAZRNAFoUSzJo/BEZ17QaIoqKES
	 cYlFRBeb80JqkHUzB+J6MJa3OeJ5+vnSzLyo2ksjtBZ7XB4MhCWEkLGDu+PsbqpTsDH19
	 KAHBB34FVgnLBfWkZiY42SMbv0pFYHMkfgpKVdH2I+fMia0HJEvXpyEsBlQX3485x6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maQRfi8d;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A16606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A16606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maQRfi8d
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b31448caccso1322957b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939430; x=1794544230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9FfNcYVQqBj1OaIcv9GJuMGud6+OOiFH5MqJ1VwAOI=;
        b=maQRfi8dTvCJ4SDIG50ec6x7qj5P2kQOrFggAQuLC7NiykPOscxAT2lnG9oKwNoZp+
         pLZe6X4gL4wJf5UB83AXJ6XXcOrP+YQd2GuMc8HTRvGDVTtIM84q22s/VTA/dbJCZ4X1
         VW59dD7gdct4AZ4fcs54FfSdb+tO9S/Gl0DFp29UMwukVPY2mUQ6mj3rKwpD/1xPPoNL
         nOe0VuQFCCaTJsoYuO30qTY+e6SPwGlD4ysQ8QBRd6ihgRO3IMi/XaYJt1ttV7XmPolQ
         xQVJCMs1MRnZSP8ggvBVHmjoHUExirqtJ5K/ZLoViY3tO4kbI5L5vaqbrzReObpfgWwt
         DIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939430; x=1794544230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9FfNcYVQqBj1OaIcv9GJuMGud6+OOiFH5MqJ1VwAOI=;
        b=EH3SW56dkPrKKHRcwChzqiXe5SCmO/2BFfOqXSkGQ7coFV4lbLOpueWrpLUuxZnblc
         UpY7M4R7R/9vG7cZfuYOTpXuoJcFeHd95X5Z47WFIYaVpUVm3kXqro5Ps4OrGs7LLv9S
         +VkV3uZ4HbXjXoLDASqT/6CaElKTq8qVNH52tXRsP+G6Wd4SpTKeejd7Qy6q6YDUPIMx
         fBPtKURM0TCZB5CdjpkCKs8HcVq1bOszxkHQcZTL6tvWycayshYhbx0bQ4jv+bKlc51m
         1lI4jZVm+SeNEZMMBrHnIlI1Wa+Rj6d/aP2M/q+/URR0PpWGKmxkAgrlCcp6o3kDuS1q
         CTGg==
X-Forwarded-Encrypted: i=1; AL+hErFXQRWz7B5EVkGBLgKA6VxOP5CqH+uxPQHyjuuTv/IAaOy7KqBClkHf0033fOj6wzD2A7m2cLeXXd4O3MA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bobw/m08/qp694GlyISZQA6cu3lsAsyCFc+LRTa36EIRF84dB
	ghIwvgKkCo25OcmqChtqyUsPmGQqbcU6hm09Uubv1hkkGJ4eKqLz5Llw
X-Gm-Gg: AYBFou2ev+UHdfwsP6W8CMLvHCSOZLWRjvrcrTBbz8oZ9e+bPU+yHS6l+k9DN5AXKf9
	2sSFkVKFUtYkQ3RQajZboG+SUafe2eyN1+hSPZnKkm416PrtCdcacSsu41KlWuONIPKo9hHhe6F
	1Cdc0tE/4g0rL+c8rVFNPpCzbXIbQw4+9f4ApziMm6LO3unXbEJKMbauEsEtxeOCZLxD/DBVvDQ
	hlFJmXn4ZaWnVTBtGhOHsAak0gSahuP/zlARPOTweuP6RmGo+EbC3SANG15CncTFRwGGmnXY8OI
	aVgAovYuNkst6zanaFcFjzlDtXTwbv6dTSxFSJW9YhAI7Ge95T65vGZzYCOv9fVjmyrUGVD5pP2
	F7jsVefgJtK71G/k06fYBLOFmTNvqMRJn/rNf8leHJWnhb3yvSSXxj/L8CuTDiNnY7Qy7D8+sWH
	UrZls7lXd534jSeaiSpRpRrR/oAbeCti5oBC9lgiHzIpuSXSnAQPq7+5DWVWJT1NpNYpre9Ogcb
	uVnueqFk2kjUxFscjk87IED40YljhoHrq5NQeG2k+are+JDhuAGRAPZPxhvsgRHNbFA5333L2mg
	d35xh/56+xZNLiFxYnOhtwdIvMTO25VfwtKfO58iAkGvnN1mURNq/DUmCrCJTzDG0X4exHlknET
	DSEoqvqzLJw==
X-Received: by 2002:a05:690c:d8a:b0:8b0:a4c4:1b16 with SMTP id 00721157ae682-8b3417b00e5mr8467667b3.1.1793939429778;
        Thu, 05 Nov 2026 20:30:29 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2e0fsm11446517b3.4.2026.11.05.20.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:29 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:22 -0500
Subject: [PATCH v7 03/14] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261105-alpha-profileme-v7-3-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=DYl5daD4UHTnU+7rIRm7Di6fwnbZDZlkODIauQebLPE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht/ZkaA5YYH/w8QFzr+6/i9PP39G4fFu3rCbpjIZQ
 fyWio9fdHxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1H74xMjQdnrHRKV
 2qXXWHzpEzM+sDvuxN//3/U7zp2uK4m/GxwSWMDMsTMz9+v9d6xC8wc9W62B3qVopFpsEfnyROZ
 Tsuxfn0OAsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha PMU registers with no attribute groups, so the perf tool has no
way to learn the raw config layout, and the PMU's own events can only be
named as raw hex numbers.

Describe the event field in format/event and export aliases for the four
EV67 event types. mbox-replay has no generic hardware event, and can now
be named as cpu/mbox-replay/.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index bb0692e93748..2a00c4b86223 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -212,6 +212,44 @@ static int ev67_raw_event_valid(u64 config)
 };
 
 
+PMU_FORMAT_ATTR(event, "config:0-7");
+
+static struct attribute *ev67_format_attrs[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static const struct attribute_group ev67_format_group = {
+	.name = "format",
+	.attrs = ev67_format_attrs,
+};
+
+/* Values must match enum ev67_pmc_event_type. */
+PMU_EVENT_ATTR_STRING(cycles, ev67_event_cycles, "event=0x01");
+PMU_EVENT_ATTR_STRING(instructions, ev67_event_instructions, "event=0x02");
+PMU_EVENT_ATTR_STRING(bcache-misses, ev67_event_bcache_misses, "event=0x03");
+PMU_EVENT_ATTR_STRING(mbox-replay, ev67_event_mbox_replay, "event=0x04");
+
+static struct attribute *ev67_event_attrs[] = {
+	&ev67_event_cycles.attr.attr,
+	&ev67_event_instructions.attr.attr,
+	&ev67_event_bcache_misses.attr.attr,
+	&ev67_event_mbox_replay.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ev67_events_group = {
+	.name = "events",
+	.attrs = ev67_event_attrs,
+};
+
+static const struct attribute_group *ev67_attr_groups[] = {
+	&ev67_format_group,
+	&ev67_events_group,
+	NULL,
+};
+
+
 static const struct alpha_pmu_t ev67_pmu = {
 	.event_map = ev67_perfmon_event_map,
 	.max_events = ARRAY_SIZE(ev67_perfmon_event_map),
@@ -767,6 +805,7 @@ static struct pmu pmu = {
 	.start		= alpha_pmu_start,
 	.stop		= alpha_pmu_stop,
 	.read		= alpha_pmu_read,
+	.attr_groups	= ev67_attr_groups,
 	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 };
 

-- 
2.55.0

