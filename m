Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612848;
	b=4HHsH5mu/HHe0NKPyqi7RyU3lBkqDQFSEFkNk20RI+DUJU9wjPzL08cVy4HMIGmLVvNd
	 QFbd93AsDwSAfIT33V/Mci5I2o893reVYQLE2IrSEqNKGSJ6kVRZpDuXKB0nY7WLRcHhU
	 u1cphkSshLTZsNYzyuoQVyPkMWJCpjzAqOXHf+8kHRcRLjt6Je0fGZKkJrttl7x50imB5
	 DIP8fbTfENOP+Hb6qSMIMAokYuO9nbQyC5ymvzq84FN7iC/DkTTAwlfOoCR3lschcndwA
	 qNX9iYjMeeYVtKwKKilyU2MbPsIFKmhrV3q9pCkkB3XEUESU3I9zwxI7Gc1I//NsG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
	b=bpyhZ4A4XGl+xokDQJOPCY35fVpy1VpttgzPhxfgJOuVjYIipM131Tej7i1Wxu8QjVzs
	 YOyIHj0qyoY3SgZ4XA+p32nG6gr2ZISCAQHxUUR80j4THqOMVW4d9q0bGKgBhKNpYC7Y+
	 27bP8BVJaWBYUKPOCZSYu3+/kRJfmKBds3tPWZVSMh9HplVbyUPTa/qMbzRTnoIlO6/3a
	 KgrbRYueSZGgFEHky3aiONsZMwzMEV6ZKSxXKE5bsshiPSuQkFRGfSyAiSh5SU88EE9cv
	 9Eo6gV8oQdIZJ/ynMAU9LKuKID/oyhnLD2lINNV8hT0oJ1zdvy2l0Fb/bu66t+XDuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLiJPtBS;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC2606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64AC2606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLiJPtBS
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso2066000eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794612847; x=1795217647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
        b=mLiJPtBSVGhrUpA13MdIbITgeD+abCmPhZF8x7yOtZiy69eErcO6h6LL44qhQnIiHc
         w8etQfkamep/BYddLZLkiFdVQOhEuokALzTcjK1JQU0/Z4ILB+mdE5LroAAK47tTnfI7
         YA+TONp6k6MzPTSU6+qcC1qgfjgYxrxPpNeNMQajw7PVXkoSMOtBvIgqiHiOBEis63kv
         Dnb9Fdn3EakGr9tkH6YOLqyjPOlLMg6ZvnvBbEdwcxpt4w9Z8cozwcpUf1+3GYohlfDN
         NJf4ArrapvyGTRvzDuXD9+ojkwzmS33evyAc4yaV0Sv3jqdsUjAjog4DYIZz+XnxRZWf
         PS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794612847; x=1795217647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
        b=J9N8sut6E3CPr2SXYRyGEKEydXE3H8MupMMQGrow0qTiPKgxetkKyurvG+xINN4PdW
         iSV9PHhHNff4zYluMJwePMu6DrAui+Vda2zxBo+YdoZWqj5zgczXnKFaiv9iCqyv8Y+C
         0oVQFJ8BwRNOZ2X0OGBKnwtBbft2HP3kAiUfUKDjkjiWXin7qZifkuSvF4mO7qEbQXIz
         EKetBUsI0iOZGbZvZxGkDzK5u58hUZoEEVznTFTN24hrdMWKVasPNwM8ku5IjFwu0s6S
         wVT4FyLPh7JdHwtA2u/CVuNtpj32iLVAaagHQCJ9WVXQ4WQxy8ZbSvDwzAc1t6Nw9BbI
         q/vw==
X-Forwarded-Encrypted: i=1; AL+hErEvBB979Enm+ybRfPHM6coLb9vBv1VXlv+oR2NuOilJbr9UW27qvyR4pUfNLH41pZruLZyxajY03c6zNkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S4GFQxeohWvgqtfW25FpYOv5pqoEZAagEEPj3QFcJqoWwMe9z
	RXoXzLz0G1QM/SBUnvJw064kRfRZwkbk1zSWcEpKcbh1QFiZ72DMd34N
X-Gm-Gg: AYBFou3W9RZHsGTx2AR6zCD9i7l55Ifxo4aqTwkh7Js1dUei4NEChPY71x5xOmOFBQB
	QDqEX7D05vUS0fTxgLu15wpUPwnSGjA2ncoD7g9Jw0rJ5tnSkUG6Y2boMxAkRfGJnCyLTm0eXs8
	Jif3Az5hmvbokwXCkDQYB6l4+xZSbPRB1CcIZpdOQ5I/NJIHUCitdA65z6gJTC4k8ODOjATFGCe
	uUpc2DLpnbCrpMSVG++3x72Yc1sB/fB7osjTtjgYcC5jlLs5ZFM9MNUQtU7IKo8N2nFh0aucPZh
	xmPwyTRd5L/k4Zjs8eqdOIvdYFscX6RCtjT0nrnyI6kMDNiXKl37a2Hk1ieeOWvGbfLorsmDa9b
	GsQfTYnEp6/f7OHSM/kVeScZaj5toscYRnYZTRagWGFo9ovf7byKhfvQdzKDJLRk8ybkiyMGPz6
	1GOh7FCAR35025njD5k+WPQs/XiUOBEdxINbJ2HzvDjqW8j5Ek3dee0vE0lbiQ9h9TQyzVEUhjA
	3MDl0aF88+ijzEQdbe5Aww45T/qBh+ZaChQwr7AbaVjKSHRWXlQuWVEGGCgUH9X0nXrC9YMsyNu
	+AW9gA9Q9uCjmM3oVsO8sQ7UhmCHr/U=
X-Received: by 2002:a05:7301:2a9c:b0:372:79a0:e8a3 with SMTP id 5a478bee46e88-37963374fdemr3580596eec.1.1794612847372;
        Fri, 13 Nov 2026 15:34:07 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm10726041eec.9.2026.11.13.15.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:34:06 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v2 1/3] MIPS: SiByte: Wire up the CPU interrupt controller
Date: Fri, 13 Nov 2026 15:33:54 -0800
Message-ID: <20261113233358.538698-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113233358.538698-1-f.fainelli@gmail.com>
References: <20261113233358.538698-1-f.fainelli@gmail.com>
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

Initialize the MIPS CPU interrupt controller on SB1250 and BCM1480 so
CPU-local interrupts have a configured irq_chip and handler. Reserve IRQs
128 through 135 above both interrupt mapper ranges, and dispatch BCM1480
IP7 through the CPU controller as SB1250 already does.

This provides the CPU-local IP7 interrupt needed by the SB1 performance
counters without overlapping the SiByte interrupt mapper IRQ numbers.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/mach-sibyte/irq.h | 10 ++++++++++
 arch/mips/sibyte/bcm1480/irq.c          |  7 ++++++-
 arch/mips/sibyte/sb1250/irq.c           |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

diff --git a/arch/mips/include/asm/mach-sibyte/irq.h b/arch/mips/include/asm/mach-sibyte/irq.h
new file mode 100644
index 000000000000..b7073830d2ec
--- /dev/null
+++ b/arch/mips/include/asm/mach-sibyte/irq.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_MACH_SIBYTE_IRQ_H
+#define __ASM_MACH_SIBYTE_IRQ_H
+
+/* Keep CPU-local interrupts above both SiByte interrupt mapper ranges. */
+#define MIPS_CPU_IRQ_BASE	128
+
+#include <asm/mach-generic/irq.h>
+
+#endif
diff --git a/arch/mips/sibyte/bcm1480/irq.c b/arch/mips/sibyte/bcm1480/irq.c
index 4c18a2c755d2..5eff85a8659b 100644
--- a/arch/mips/sibyte/bcm1480/irq.c
+++ b/arch/mips/sibyte/bcm1480/irq.c
@@ -15,6 +15,7 @@
 #include <asm/irq_regs.h>
 #include <asm/signal.h>
 #include <asm/io.h>
+#include <asm/irq_cpu.h>
 
 #include <asm/sibyte/bcm1480_regs.h>
 #include <asm/sibyte/bcm1480_int.h>
@@ -242,6 +243,8 @@ void __init arch_init_irq(void)
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
 
+	mips_cpu_irq_init();
+
 	/* Default everything to IP2 */
 	/* Start with _high registers which has no bit 0 interrupt source */
 	for (i = 1; i < BCM1480_NR_IRQS_HALF; i++) {	/* was I0 */
@@ -337,7 +340,9 @@ asmlinkage void plat_irq_dispatch(void)
 
 	pending = read_c0_cause() & read_c0_status();
 
-	if (pending & CAUSEF_IP4)
+	if (pending & CAUSEF_IP7)
+		do_IRQ(MIPS_CPU_IRQ_BASE + 7);
+	else if (pending & CAUSEF_IP4)
 		do_IRQ(K_BCM1480_INT_TIMER_0 + cpu);
 #ifdef CONFIG_SMP
 	else if (pending & CAUSEF_IP3)
diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index 57943fe3ac03..2df115269f81 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -15,6 +15,7 @@
 #include <asm/signal.h>
 #include <asm/time.h>
 #include <asm/io.h>
+#include <asm/irq_cpu.h>
 
 #include <asm/sibyte/sb1250_regs.h>
 #include <asm/sibyte/sb1250_int.h>
@@ -225,6 +226,8 @@ void __init arch_init_irq(void)
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
 
+	mips_cpu_irq_init();
+
 	/* Default everything to IP2 */
 	for (i = 0; i < SB1250_NR_IRQS; i++) {	/* was I0 */
 		__raw_writeq(IMR_IP2_VAL,
-- 
2.53.0

