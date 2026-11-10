Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339105;
	b=DE+t2nUHmvJjcpbwNsrK2K2tU20NDCV+cn6SBx+N8yV6z7IoYNEsEpFtcTFTPDX+sUIE
	 syOtXTOS5ozEuJ5K1RrpGgKSpmzV0lrnRF+5h6QRD1jW84bgcGL3tu3fpO0r5vIW6dSn9
	 HQbteiWvynpwa98D/lRtSLRgozAzONq3zIYlPg9VaucDV+YgVj+IxKbrXwKKnyEoC6EHN
	 EKzoh1YHIlHGo6+uM7Kw4hYC3oFjY4+jrMi5Ncv5VdoiT7ROV1VjDg+gZNnUwF27l7uem
	 xHb4gaA2dEN/4QXlOVcBXIPrF6CxlYz57WqW/DnZOkmboihbCvAGZ38A2sgKlJyL1zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=39IsulrmdJQpmcMRRFD042SD33tJZE10yGbFFT1TgRg=;
	b=F8P5MOJTcOx3EWN/WYhCxRQ8+eueGEtD3FjPQH496sybt27YXeiXwzh/d6Fd5FAQzzSk
	 ZFmyiqUJ6AdkSFgRqnrB7eWaw2Sz0EeF+2K4pFca8npP8T2OQ2mbyu8+5TAt7o0bNm7fd
	 rwoaiAe2rtAFOsut13rlQfs8uRFQR21imre/Emk0Sh/w6oSBRwV1DlNa3luAvzput1N6P
	 m5tbxuadWSz7jhlx98/0HiNUAU8r4fzA9Q0I77ReQUSLTbq2jwz7lC248WpQjyHJz2XJm
	 IiDUHzSdhpgh2HlsUklczVtQZmwf9J1vagQQbiMxsc0y4i+s5U61mHQ+BOntSG2hFJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mq7ZoJ/T";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA73606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA73606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mq7ZoJ/T
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d21051042so384153666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339103; x=1794943903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39IsulrmdJQpmcMRRFD042SD33tJZE10yGbFFT1TgRg=;
        b=mq7ZoJ/TFrgTWoYAZajjjeJqSKYHCq1KAIde8jRGDyR6sW2imzRntMmoh7A0osyaXa
         bizwxHT6utUg05sprCpgXuK2OBGy4svUiZ7hjdNvm+lixXrKmRwQlDdk7rNRWfHCmhAX
         Bx3wLtaWgUIysbcrLKgZ8XbKic8e2YhN11mZMScvSWjvOVoBjCf3+QL7yIw0EtiRQeE3
         t4UPIdMtd7fA7jMtsHC33b08NQL2VuEJTFm7wshFS/1MBMddA6VL0I1ukF2+kRbu2Mwc
         SvKHjn/l2U3BgmVQGkooZQOuaPkOQTemcD+pZGMxyrjbJ6TZIQcTtAHzjN/fU28wmGom
         GlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339103; x=1794943903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39IsulrmdJQpmcMRRFD042SD33tJZE10yGbFFT1TgRg=;
        b=qKt5IzczxlZThbAqn52WrOg19gzJoFBjIbqBU8UEbU0SdpQXCGU4aL3CmhwerOUw0V
         FxKOTNMhO21iw7IX8yj1XQGBzQmDPxmLQ6Bj5DndkCjRNRm2U1xPvy3SIDtegD1hrm1e
         ojjsCGRObg1JX2zJr3lI3BI0uJLlbGqCcWTxCnGDww2ULNYmzw4zGrLwdMq39ujNhkqE
         Up3xmYZzRvoPbj8mK4CCtfUgExBvrAy+6ae3YNeC2v0svzB87u5lF2MnaPf8g52mnnkP
         A+MOWQ66nqcNblxDEkOqung0XVrzVIUyOsblDgeXxDuFOGfBOwq1lqp9Dc4isWB30/C6
         oVfw==
X-Forwarded-Encrypted: i=1; AL+hErFuSKzmaZg6PhZ1N/E+z6bbONYn8BRpW3oV4xIEpXjwE+evqQq8OYs0IKM7NdOytnlmfL8D3zdk/iQ5noE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qxlztg5AvzTperKOPR3L0uAK3naICsN4mEKLnChLQfjiLgNfQ
	Gpklh5rIQbLIfOFgDDIaOI7I+cT1hW2pDbN1SwoyhfaT94UjPSWJBY9v8m4GZ0z1a3s=
X-Gm-Gg: AYBFou3/gr8roVwOitfqmPDAHfkus51PkeTTTjOW2ijuW5JsgsGB4BewDtdVlR90LkV
	ATjNPBLFx3FreegNPMwnDdEv4uTTE85KtNV6gKYdLpsWFPEZDg7YEd2BFKbcRoVH/P4DlE7SVXg
	ct1fde3TL0P8DuEzmGNq0HB+sqy+LbUNfbYfjqw03mNIIBz4osMpqpzo6nuhBtywfzcV1T3Xlfq
	NGW5iIP8YTsC5EmwNmHDS/WVZgDMBneUnifWFUgfvIwQLrje+ocB14YaSQK1GsvG98oA45L4uS/
	bGBMH0BqdCo+9PpHc8CM9voNY9KqHWlAf081coydNNTITI7cwjp3HnbtZiPvhawbeOOjqZsM1L1
	jyE4gD9L5AgoOLLLXODMnj4BfgqeO9b6h1fD3+eAlrGukKXTKLk+EXrga2FSdcoECJlOd6ZW7K6
	4KlOxh6cch/Q4mPT+2Sfkk8paddfBInBb2rawrwct8DZWhAU7QlIfHbOARRJBkHLg3aZ+Gu3mGD
	rcwMY1XLreVrVE8SHST62BT8DfA1OG8FJAK/tGNntPCeKlTejbhrRl6Q3rJQuS/EkKqG+ZrfB6a
	sleC/guJ3Pmn8/7TzZ/5UC1FelkgtPhimW2rvfsSHTNt+ZCkbddc+E0+8yq4w5tQ1W+4SPo=
X-Received: by 2002:a17:907:9446:b0:c3f:d912:ff8e with SMTP id a640c23a62f3a-c5066ae9baamr8161466b.16.1794339103208;
        Tue, 10 Nov 2026 11:31:43 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a66b9sm147465866b.9.2026.11.10.11.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:31:42 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 1/1] alpha/perf: Account for time spent handling PMU interrupts
Date: Tue, 10 Nov 2026 20:31:32 +0100
Message-ID: <20261110193134.1151112-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110193134.1151112-1-linmag7@gmail.com>
References: <20261110193134.1151112-1-linmag7@gmail.com>
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

Alpha does not report PMU interrupt duration to perf, preventing its
adaptive throttling from reducing an excessively costly sampling rate.
Short sampling periods can leave the machine unresponsive with RCU
grace-period kthread starvation reports.

Measure handler time with RPCC and report it to perf_sample_event_took().
Precompute a multiplier and shift using the frequency selected by
time_init(), avoiding division in the interrupt handler. Alpha's
tick-based sched_clock() is too coarse for this measurement.
Wrap the existing handler so all return paths are accounted for, without
changing counter programming or event handling.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..09033c2d1f66 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,8 +16,11 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
+#include <linux/clocksource.h>
 
 #include <asm/hwrpb.h>
+#include <asm/timex.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
@@ -25,6 +28,10 @@
 #include <asm/wrperfmon.h>
 #include <asm/hw_irq.h>
 
+#include "proto.h"
+
+static u32 pmu_cycle_mult __ro_after_init;
+static u32 pmu_cycle_shift __ro_after_init;
 
 /* The maximum number of PMCs on any Alpha CPU whatsoever. */
 #define MAX_HWEVENTS 3
@@ -797,8 +804,8 @@ void perf_event_print_debug(void)
  * Performance Monitoring Interrupt Service Routine called when a PMC
  * overflows.  The PMC that overflowed is passed in la_ptr.
  */
-static void alpha_perf_event_irq_handler(unsigned long la_ptr,
-					struct pt_regs *regs)
+static void alpha_perf_event_irq_inner(unsigned long la_ptr,
+				       struct pt_regs *regs)
 {
 	struct cpu_hw_events *cpuc;
 	struct perf_sample_data data;
@@ -862,11 +869,28 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 
 
 
+/* sched_clock() is tick-based on Alpha; measure a short same-CPU interval. */
+static void alpha_perf_event_irq_handler(unsigned long la_ptr,
+					 struct pt_regs *regs)
+{
+	cycles_t start = get_cycles();
+	cycles_t cycles;
+
+	alpha_perf_event_irq_inner(la_ptr, regs);
+	/* Unsigned subtraction handles a wrap of the low 32-bit counter. */
+	cycles = get_cycles() - start;
+	if (likely(pmu_cycle_mult))
+		perf_sample_event_took(mul_u64_u32_shr(cycles, pmu_cycle_mult,
+						       pmu_cycle_shift));
+}
+
 /*
  * Init call to initialise performance events at kernel startup.
  */
 static int __init init_hw_perf_events(void)
 {
+	unsigned long cycle_freq;
+
 	pr_info("Performance events: ");
 
 	if (!supported_cpu()) {
@@ -878,6 +902,13 @@ static int __init init_hw_perf_events(void)
 
 	/* Override performance counter IRQ vector */
 
+	/* Match the calibrated frequency selected by time_init(). */
+	cycle_freq = est_cycle_freq ? est_cycle_freq : hwrpb->cycle_freq;
+	if (cycle_freq && cycle_freq <= U32_MAX)
+		clocks_calc_mult_shift(&pmu_cycle_mult, &pmu_cycle_shift,
+				       cycle_freq, NSEC_PER_SEC, 1);
+	else
+		pr_warn("PMU interrupt duration accounting disabled: invalid cycle frequency\n");
 	perf_irq = alpha_perf_event_irq_handler;
 
 	/* And set up PMU specification */
-- 
2.43.0

