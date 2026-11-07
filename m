Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794043200;
	b=WLw7g29BHbN8G1KSsV9fukOtlJlmm6clSkWeO9YRNahpOpzZpTxH4qgP7obNjZc6OOAG
	 RlR7xMP2M+KzDnGiqHleuG9GRhSEF+HiolGx3yMyoUziqxuidcr8vlz0ItCZ6lE5TaPiv
	 eUCyPKbr0ZvzgvThKEKyGHOkJic7v8hsTbzCNR8Db3flesnEA1mpQ4DuiDbOiYPW/mrOs
	 hj1Qij83nVHg1atsMwLIf1ztS/MsrNg++sIh8h6aJQFU4+SvDBejMBNKW43Nab9OYRR7T
	 HxC/Zw1D9Nj+fAWcE896Er61n6+RHjfDLLMv5U526J9z/axVIiiglCefeSGmHLTFPFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794043200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qNorqVzMtOJQNgkxj+V5JXWSTJIpc86ccOUkJXX2g3M=;
	b=5hiEp1COSO0G7iGDPAvyyJLkEGG5ahFm1+88twUe03zns+bq62HQKBlG1ADIo1+8MW1t
	 DFYwdSRnc//iQkdRMp5XIFhE9oduGsMCoh/1Z1BE3ELo+fzZhAhvzAYccjuG/vRZ/q2UX
	 jCHP0gEribkBlZrSzcNnL6jo8YBTDVCOqKqgBwj3Hx1vqghCSRJfOLPvoYcwJbpRWhbvE
	 YjR20djn8ieUlQQLWe7lvDmGsNPm/QbccMjYhX1/oHjBNCijkBoTM9PB2CNySmhgypw7m
	 T01Ts5PZ/jHSk0JAt8GYSu+RmzKXhEJjxseDiVObQv8mrWHOoFM6bcqVuW9dEQhRzeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOttPRcq;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F89606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F89606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOttPRcq
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso219164266b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794043199; x=1794647999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNorqVzMtOJQNgkxj+V5JXWSTJIpc86ccOUkJXX2g3M=;
        b=BOttPRcqgG+uZ0c1NZVMcEkJcW1JBATm1iUsZXY1cNHKw4awRWDBfFfwiWoaQEjWSp
         UwRL3Ci0zb4a/nyLBsQnHMHkdJQPqyMg6rYE/GraEnvlkmyU+KvGMaMAdhBdflZ7JDi6
         Xnl+Dy2hD7bOw0D4DOdEh7zb7dcgXgbEVN5WpJM1KtBXvGKJ4il9XbmOR4eb6zHqbima
         7Frh6KmDI2DT/AeMhD7Pd6lc5twnabWf3Qxouxey718ovDVBfcaAFUOr8LDrDDFu8SG4
         g7fob+Y1QR+lTTmG4nD2Kgg0HhL0buO1J0Cw0QTfGyEjk1YWonsivVkTKfAdVgS0t/eV
         XyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794043199; x=1794647999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNorqVzMtOJQNgkxj+V5JXWSTJIpc86ccOUkJXX2g3M=;
        b=g7zmb5vXkgFLgEP8uEQ9wTZi6HKFII7WaOnZYbkmiZhIlwboWAfjtoD9yp8u0pVt+9
         1POBSEaFkQ7qAs89SKO66loqas2xiPmAvRfhWThuRrKOmbEERFR8smguVN+kv0bJLTni
         nlz2TXG5OOlw+zVKwLbG3oa5kvvXscwubgDFW/do8pXoeZWjVu6JIxiV+2EVwmrBsonC
         bVhMwg1JLC5XoZId58n0DCoWpOdu1rhYF9IgW3T44DeG39FmNwU7iqPmwqXBBAPP1Kmn
         wMeG4+8Obs8wiISuvdAtIzcWNIV8bdIC3a87YxEkiEu7F2tm/M7mafyvT/KWiMOskr57
         RUug==
X-Forwarded-Encrypted: i=1; AKwUvBzZ96gLPw+KjxPHo3DuIDVSINvjjeRQoUstP8CLUTVXdX67DA2LpRt/dkJTmHYYOfgcKgt4v5YrigGsBiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kgdhzywNsc1bBfqPT57IbR7dLHizfHvFCnOXXE3ifgk7qjnqe
	rgdsiZ9+so20Nm6tS3y/QwGmargoU28Z3wD9XRQpg1wGDt4bI1rhA0htUeT4S72R
X-Gm-Gg: AYBFou1qt7itwCq0bxrhg137mFCs7+RdTEogsstMS1oOku9DlGO18ZauzCxvQcRSMJv
	Jq7IZ01IKiwjBlmKvvtHbbg5nF+dRbStiytFGt1NMartsJHXvSkzE8KlWj2qZLpbj3q8gtlamSa
	ERhXwg0kGPM6vLvtvrmJPgSk172AOopea/KW4tBB9340ww4qYUoa6hzeN4YKgF540UwY8fEoMRR
	sic7FYtz5DpBBL7Ltw9okb4C9G+gWUCnsNYyHVpR1Q0pSeKx+HQaZ2vgyNjdsdDATDhP9D7NMDU
	xW3rcjaVcYRWqgpZr090YHSETxmsOnnGEQ8g8HJesHiCf+dA+1SEb/jZC6xXFY/1jzpevug4WXk
	n9bEJBNAJjU/jA5YB9xP9z7cxEA2s92grWmzz5Lmc+7yLXKOL59E3EYwFyVuhWCg72Lsgd7g8dM
	mGZigH1iXWYM/x6PG1oenwD0fjPcifKHHfn9PruC219B2GOxszBx5Z+O7yjgsfBLdJd+8xae9NN
	EVTAqK0kGw4NL2B2PdWIpXz+RJb3clLjlwUjMMsMRftyyCCY9PjR9CdddTCUEFZZRt4MMgbWbg3
	Jf0/39Sst3eOh4lUrWx1lcevVqAF7BCIWJ0AUxVTp94ADlB4CGf1xo9DivPXnVENiP5p6/ZOLeq
	GyWNVY1qob2qCtubG
X-Received: by 2002:a17:907:3d94:b0:c2a:b1cc:158d with SMTP id a640c23a62f3a-c4d35554748mr386898566b.32.1794043198450;
        Sat, 07 Nov 2026 01:19:58 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c776csm138824766b.70.2026.11.07.01.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:19:57 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 1/1] alpha/perf: Account for time spent handling PMU interrupts
Date: Sat,  7 Nov 2026 10:18:35 +0100
Message-ID: <547ee20a68b3f2d848d451c69ad023c0361f41ee.1794040317.git.linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794040317.git.linmag7@gmail.com>
References: <cover.1794040317.git.linmag7@gmail.com>
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

Measure handler time with RPCC and report it to perf_sample_event_took().
Convert cycles using the calibrated frequency selected by time_init();
Alpha's tick-based sched_clock() is too coarse for this measurement.
Wrap the existing handler so all return paths are accounted for, without
changing counter programming or event handling.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..dd3bc70b71d7 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,8 +16,10 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
 
 #include <asm/hwrpb.h>
+#include <asm/timex.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
@@ -26,6 +28,9 @@
 #include <asm/hw_irq.h>
 
 
+extern unsigned long est_cycle_freq;
+static unsigned long pmu_cycle_freq __read_mostly;
+
 /* The maximum number of PMCs on any Alpha CPU whatsoever. */
 #define MAX_HWEVENTS 3
 #define PMC_NO_INDEX -1
@@ -797,8 +802,8 @@ void perf_event_print_debug(void)
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
@@ -862,6 +867,21 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 
 
 
+/* sched_clock() is tick-based on Alpha; measure a short same-CPU interval. */
+static void alpha_perf_event_irq_handler(unsigned long la_ptr,
+					 struct pt_regs *regs)
+{
+	u32 start = get_cycles();
+	u32 cycles;
+
+	alpha_perf_event_irq_inner(la_ptr, regs);
+	/* Unsigned subtraction handles a wrap of the low 32-bit counter. */
+	cycles = (u32)get_cycles() - start;
+	if (likely(pmu_cycle_freq))
+		perf_sample_event_took(div64_u64((u64)cycles * NSEC_PER_SEC,
+						 pmu_cycle_freq));
+}
+
 /*
  * Init call to initialise performance events at kernel startup.
  */
@@ -878,6 +898,8 @@ static int __init init_hw_perf_events(void)
 
 	/* Override performance counter IRQ vector */
 
+	/* Match the calibrated frequency selected by time_init(). */
+	pmu_cycle_freq = est_cycle_freq ? est_cycle_freq : hwrpb->cycle_freq;
 	perf_irq = alpha_perf_event_irq_handler;
 
 	/* And set up PMU specification */
