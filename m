Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523510;
	b=IruA53YlctO6pORFLX1lwX/Y6s7Spdf6Q6xc8Xm02LYXEGzfG29dNf0uUEcrHxKVJ/Xo
	 B0l/WaIKWg01O0kC01O3n30NR3HI7OYtmbHnx+6HMeGUmVfGrI4Kc+l74x9PfLxXtQs0g
	 7Kh6AjuTOcuaYWYxk/IeDxi557GJdeBqEgMhN+0cEGl+GXzBlM/X8hAVjy/gEDFgrZoY6
	 V/CKYqADqbWD7bzlLRHu7XafsbnJBzy9iyaxns8xr0EqAa+z5U2GxRa0GFqotilu5szeC
	 DDqLd+qkYM4S87AQDLjn3xZMNPV6vqo9zzotI5vWNe6cBbQElkWuiq7co7RIq3ZTNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
	b=oD8kImAyDalUmYtjeOLYWDd147rFLjFojYDSJGsoNnIamgrbCPlLRHIXJwQmHVT4800Z
	 QFivH7Hm80qX4a8YuHQIrlDzbHxg8lGcBXUFTtOPfBXZ30Kw+jKMlJc45eq53L6nzIDLR
	 8uLjTtpVvG3Op3a/zVQniAPT1jC7vOmP/0bwz5KVA+Q8MA/2/5jUyWPFXhKbupFOgwcSp
	 nW6brLfWckDRB1AhKmblSAqJYGMdlQ4DLIWuo5SK+yXgE5sW9UjQF6sAmrNVr+XR/2CCv
	 onNSp5fqUX9fqCq+yDKeQj0U77AXrZgCksMAGNxWxPAIgbTAOyxq0868tmVzv2i+yOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NwXqQ/rX";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455EE606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455EE606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwXqQ/rX
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so386450a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523509; x=1795128309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=NwXqQ/rXiLJqLEAXQgQVUH9RWV8PsTXIFsGtPcd9sOiN9fPGAhvdoAUe8KiWy7wOZw
         PV9zzkGuX+aNjarAexQz31FkLIAPvytSFd/4T3Y30dFKluBuVdWDWLSEPbfaUXHr9r0C
         xaXD8rAUoCoCQiREV4OYzPG0sL8C9EwgF79ttpEUTxGMw292c2vzipsSScsPF/Aahc5V
         TM+5Tk1kIO9Z99whwa/O8OJdtP3IfMdGBjss23H23PHk/Ns2mKa23dzhvHCT+ZZy9mu1
         YfpqicM4CLW4ZgcL5hW9D4ZAERn8e9ycLifBL8GmUTA/lyK5tjb/tVMgCpQxQIdouTKd
         kT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523509; x=1795128309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=m7VGGQkj0a5XjbWzShFiYqJgOJEwAHbC9kRNp8bu/UFiXEjeKlx8oMsTQvUyAGLSAt
         18EvohOyi528TllOXBtq3svNnq8N5q675Gi1o1P4q7VfHdFO7aDlxxjj34KQhtpRl/+a
         bCXpgD8H2SwWQzTAs1dvfKv9vKn3fgnG1Db2yhujhYYyLgelfGYNNyEi4BwY60qIAYQB
         tEk+aGdG0UfATuPEyPQbcxQFlWHeuISrk6dFxOmrStQTA3f5FBwqASqG+y63SjXuTjl+
         Vb+FWE4fL7BpR0zgwtFIEAFc3RG0b+vemHjtTIsLYQjEzby0m0iRFnZBko0hTAiik0NP
         jEsQ==
X-Forwarded-Encrypted: i=1; AL+hErGfe3Dd5uG2h0HpbPuopqXZBoprX1DAWGeP4JT+z67cdadIJd+nDN0zJPFt6BTILEWOdclFFzQXLG780ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vkDTatKnV7RJsiCPAVcjBvKQ5sP5pFMaourlUiad5Nb0Jequf
	MC60hoDIt4hINgh9ZqCCIrpeViR/GsBexz3QbQ4uaaEabQnotKGG7A3G
X-Gm-Gg: AYBFou2ITk9hFThH9ym/LimJzz+TvQ+Hfb9e3tNwQdonc1c0FFys5TaC3/9pjhVGsd6
	x9ZCknW+lDthJffGq9qKi0jV6YMwAnzVST/o2RFrd91mv6cihphVq1Hp4iOSmmfJuKT6uMPUdlL
	3MzqYlZjJgnWt15lk05oa++7FJQF97H1+R+Etpp+9OshK/Hespj5pSoOccOaKhnsOQG35zqqTHQ
	092GLqtsx/vwUq+znscY1Erv/3+sLPa8jxoAk3CTu5yzBHSp/1y/rBbMypiOgiwsjnZ78ZAHh9q
	TRY8zC+IeqZFRd+FskC2eiz5cJjOWxpRU0vNw2jm0RkfZ+zPYoV21mvMw6LNaK4t6ITK4xhrAn5
	dECHSSCqfC0RpTc90hoHhDt6nJGdWauojT3NuThyM9fz7djP2s/5z7POoOphiHPEpzj9AS2uAjA
	9c97g04zXcXQNZbzJq7wbJFsMJDIvN+o+wJWB36V622yNfDN8nF20dn7prZerPHZojSbB++sCcB
	zR4+5WR2RvOQPgI5UTZ0eQ490YYg7ajAAAQlcK/5/QLTNHLoyd9g1qbmdLMh+RMjZCA71FpgNXf
	SstEP5YYNbn/ryfzBdtdfHehw0Jnu7e9WQPoHwYcFQYCCVk07Xqp3BhU2QaVKMncbwr7vzjal/m
	zeI6vjGGKQfKDLzhope0GJM8F5n5izAEqW08vI34H37GRn8N9d354S8NjcKF2CrTnv88DUcxc0s
	+98A==
X-Received: by 2002:a17:90b:4f82:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b1b09fd889mr441375a91.29.1794523509368;
        Thu, 12 Nov 2026 14:45:09 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:08 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 1/4] MIPS: perf: look up the PMU interrupt when it is requested
Date: Thu, 12 Nov 2026 14:44:42 -0800
Message-ID: <20261112224445.213324-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112224445.213324-1-rosenp@gmail.com>
References: <20261112224445.213324-1-rosenp@gmail.com>
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

init_hw_perf_events() is an early_initcall and asks the platform for
the counter overflow interrupt through get_c0_perfcount_int(). On
ath79, that interrupt goes through the MISC interrupt controller, so
the controller has to be initialized from IRQCHIP_DECLARE before the
early initcalls, even though nothing else needs it that early.

The interrupt is only requested when the first event is created. Look
it up then, so that it can come from an interrupt controller probed as
a platform driver. The boot message no longer prints the interrupt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 30 +++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 196a070349b0..4d660952e643 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -589,10 +589,25 @@ static atomic_t active_events = ATOMIC_INIT(0);
 static DEFINE_MUTEX(pmu_reserve_mutex);
 static int (*save_perf_irq)(void);
 
+/*
+ * The interrupt is looked up when the first event is created, not when the
+ * PMU is registered: on some platforms, the interrupt controller that the
+ * counter overflow is wired to is only probed after the early initcalls.
+ */
+static int mipspmu_find_irq(void)
+{
+	if (get_c0_perfcount_int)
+		return get_c0_perfcount_int();
+	if (cp0_perfcount_irq >= 0)
+		return MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
+	return -1;
+}
+
 static int mipspmu_get_irq(void)
 {
 	int err;
 
+	mipspmu.irq = mipspmu_find_irq();
 	if (mipspmu.irq >= 0) {
 		/* Request my own irq handler. */
 		err = request_irq(mipspmu.irq, mipsxx_pmu_handle_irq,
@@ -1889,7 +1904,7 @@ static const struct mips_perf_event *octeon_pmu_map_raw_event(u64 config)
 static int __init
 init_hw_perf_events(void)
 {
-	int counters, irq, pmu_type;
+	int counters, pmu_type;
 
 	pr_info("Performance counters: ");
 
@@ -1904,13 +1919,6 @@ init_hw_perf_events(void)
 		counters = counters_total_to_per_cpu(counters);
 #endif
 
-	if (get_c0_perfcount_int)
-		irq = get_c0_perfcount_int();
-	else if (cp0_perfcount_irq >= 0)
-		irq = MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
-	else
-		irq = -1;
-
 	mipspmu.map_raw_event = mipsxx_pmu_map_raw_event;
 
 	switch (current_cpu_type()) {
@@ -2017,7 +2025,6 @@ init_hw_perf_events(void)
 	}
 
 	mipspmu.num_counters = counters;
-	mipspmu.irq = irq;
 
 	if (read_c0_perfctrl0() & MIPS_PERFCTRL_W) {
 		if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2) {
@@ -2044,9 +2051,8 @@ init_hw_perf_events(void)
 
 	on_each_cpu(reset_counters, (void *)(long)counters, 1);
 
-	pr_cont("%s PMU enabled, %d %d-bit counters available to each "
-		"CPU, irq %d%s\n", mipspmu.name, counters, counter_bits, irq,
-		irq < 0 ? " (share with timer interrupt)" : "");
+	pr_cont("%s PMU enabled, %d %d-bit counters available to each CPU\n",
+		mipspmu.name, counters, counter_bits);
 
 	perf_pmu_register(&pmu, "cpu", PERF_TYPE_RAW);
 
-- 
2.56.1

