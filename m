Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699458;
	b=XYZnwgvyE8xfDJ675Bw/u1hG9WVDBIggY+he/ZOsMBhAeSJekoBysTOtK3JGK3DQobN8
	 U+gceIA2djvrZ+h4P/UsgcCbYXw7RktjQM4WwDXWBMH8o0D94QwAToa709P9rbVtYGP6w
	 pPcCRsqE5rMQztW2nW/a5Ve2IwYAzZvVPP0Cj8QUQ0LYH3OgQ4Q8OWnHWBrkIBpbMfmUg
	 wQPhShe0EjGUBXrwe9XgMRxUj64ema6CGkL/M9XY05yhfPBRPNWe0wASnoEZN4UWuqDI3
	 U7ViHqPkfGn6+ZxBDz5SATur8HjqcN5aEjBoFL/QMrmGuKVzQ+qH7TgzV4OaS8WN0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zPxwQZ24qNZrX3J3/HAoM3bM0nDSHqnSDrrlD4YRwII=;
	b=YH8kMW7bYQhWDu7i9vLZVJnX34LLQB+fMz4KFKwDe1zHyuL/wsZX3mbuPRrqKj8u4KHf
	 FetY5/lF8oUn6NAlZxHRnfsjM661WcPn0bONz+oVSq5DxgRn9iYWthN+vZLvdWCwTLlqt
	 UCFQW5tmFVpTTsBxx2grMbJRHXQnA/1pWS42mKBaiTEFL0ZkIKFrMoB4gxbhSs1ssKQqf
	 HH6kTq1CWRLaDj4+v6rJEd/wRe4QaqTbcLxGXLYcX98HhQHLNsWlLfb7EmY9a3Mm9D4gQ
	 /YcMM++juzYuCLOngJaCcqMfBng2trMu1A3MsAhOVZJBiTbh9eNg+cr+mBGhE/xRrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqkD68Kq;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA6B606A8A9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA6B606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqkD68Kq
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1313309b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699458; x=1795304258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPxwQZ24qNZrX3J3/HAoM3bM0nDSHqnSDrrlD4YRwII=;
        b=NqkD68KqiFujgPDXz4hpk/E8NENKbPH+Io2MzZfurch0T/qeDpe5CQQTTtl5RFlXSN
         cb0oWbI6tA4jvOg5OjuFfBdV8OKEVvCX9BSeYKhxgl+LXpKoJ578QA6DpRRVwiGs2jK7
         CwtTNlKIJANFa/JkRM0SlHaf5oJ5jlcdmXUuIOGBxIRu+++8Ho0sQJRfpZ5Yu8LDhk2S
         n6BdJRhFExZ4V+ulIHlfsK8Ft73eeZ5137FXsFhWDLpDoEiNXIM5x23RSP3wqLH6+QPX
         4hBYZ3puw0ja4MzVfmqQZCQZTufYWqkD+Pni+SgY+WPb098TcmKfXvp+Nb7pVfaoFpe8
         C8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699458; x=1795304258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPxwQZ24qNZrX3J3/HAoM3bM0nDSHqnSDrrlD4YRwII=;
        b=thp/S3NdDG3rPthn6yR8s6LeUgdc2bLwG92281bv1z+6UxCUR2klwyYm72xBoLV9VC
         KwIXpGxRVgHMTEYVG6H/6xpuTM9M3oczvfhYCdrnAG1KXYMuaAMwb038HH7LkdvG2+W4
         Af7wYVa6yh2BH2CRA1hPErJhxsuIUgZ6ybSBv9DCcah5lkE0W/07rhW8hZhrXyov0g6s
         YOwZ6Bp5e2Ww4TAGo73Rvs2OA6+85RgXN+sUtuTCsBQlCzy6HY1ahyTW86DXxdLw3cW9
         ibIhJYMhaA45+Kzl4MatZV5ldtqPrW02CCQsgGi3hI+GKxHDYB0go5tm/hGn2t0Wel6J
         gXkg==
X-Forwarded-Encrypted: i=1; AL+hErFtlFo40wNaVex0lRAg6aqyXQd5a9SSB1F0uV0hPzX8YngYI/haDN/mIOdmjNczSfyDCCX47V6c5uHkfhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ofYKfhGq1xL6XPicm0hFnhj7rXz5fLamLBgGcreLYHgCVF7W9
	WGXR8IfCLJ13uvXCgEk8DzxThT/8WVMeElrVUy+MSk4ULGZ8aUgPRU9QriH0Ag==
X-Gm-Gg: AYBFou2fK+PoQSyyO54oCdjB59EvmN9exfA9rr72qEKkbgfSexwFaSgqsnhDyovCPyG
	iLXABQcjfMFQxWeULx3C65HDXMktJnv68imr+wfgRDOMAVCjNFYTmXH5el6N6hvVeWQUXvtGNan
	xCgPxGBWrqJxpPsfmc1RhSjOxCFpVP5aFrrrv4BAtenudT+fFZcbS9vBlczUjIyO3awPSYqn6Xl
	lCcYr6HUpwS9lgn3XDgXnP0ltYvdfSRTZO3w+8PA7yVFbdefwF4CHlWVlGCpd6XoudEY4Aa0E38
	YU0UpDCiGmODuYVwQYEAivhxWHyaMpug4IDbFRWfgf8+oirbxze0L5mlPe8JY22QKeZckvRvQHX
	wP1uOF9q9NkxA2NoA3rd2ITt67PaHOL5TdlAy3JfRo9pX2iZB83D6yk3AktFWIVl6WkqZaqxSpP
	PzEQbJYPK4LwqsxFazrpg16jVmpEKySIQZ4fgnwszQi/aIZeXzPdicTPp5o25gv1o4JkzE3LNJG
	3/XkibKjpzG0G39s/U6+YB01QE4Kx10jBJvnim63DbKgdBa8G0ZzcbuW8zH9+0op22fNl9tc+nO
	RyS+33aygo2D8dQMUghRXDXMUlSl2dh3B93bPs48K0wkTZNb/j5cAosoVnBYPE1f3B8LGYQDU3n
	ajjtdFro4mYcLdwFIohD/3cUiDaVzZN9w7UqzJsxcWLh/b7pqPZ89LwCBBtmB3vpAYzFGbx/RQj
	hhhQ==
X-Received: by 2002:a05:6a21:3989:b0:3fa:3e8f:4b3e with SMTP id adf61e73a8af0-3fa3e8f4d04mr751659637.44.1794699457752;
        Sat, 14 Nov 2026 15:37:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:35 -0800 (PST)
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
Subject: [PATCH v2 4/4] irqchip/ath79-misc: allow COMPILE_TEST builds
Date: Sat, 14 Nov 2026 15:37:18 -0800
Message-ID: <20261114233718.86520-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114233718.86520-1-rosenp@gmail.com>
References: <20261114233718.86520-1-rosenp@gmail.com>
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

The driver is only built with ATH79, so only ath79 kernels build it. As
a platform driver, its only MIPS-specific parts are the performance
counter hook and the call to spurious_interrupt().

Add a Kconfig symbol that defaults to ATH79 and can be enabled with
COMPILE_TEST. Build the performance counter hook only with ATH79, as
other MIPS platforms provide their own. Drop the call to
spurious_interrupt(), which only exists on MIPS: a cascaded interrupt
with nothing pending only bumped the error count in /proc/interrupts,
and the handler now just returns.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/Kconfig          | 14 ++++++++++++++
 drivers/irqchip/Makefile         |  2 +-
 drivers/irqchip/irq-ath79-misc.c | 19 ++++++++++++-------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8aee8f731848..f83fe64f066b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -127,6 +127,20 @@ config ASPEED_AST2700_INTC_TEST
 
 	  If unsure, say N.
 
+config ATH79_MISC_IRQ
+	bool "Atheros/Qualcomm ath79 MISC interrupt controller" if COMPILE_TEST
+	depends on ATH79 || COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	default ATH79
+	select IRQ_DOMAIN
+	help
+	  Support the MISC interrupt controller of the Atheros/Qualcomm
+	  ath79 SoCs. It is cascaded from a CPU interrupt and collects the
+	  interrupts of the UART, GPIO, timers, watchdog and performance
+	  counters, among others. It is enabled by default on ath79, and
+	  only needs to be selected by hand for compile testing.
+
 config ATMEL_AIC_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eb539d41251e..c51e79d3621c 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_IRQCHIP)			+= irqchip.o
 obj-$(CONFIG_AL_FIC)			+= irq-al-fic.o
 obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
 obj-$(CONFIG_ATH79)			+= irq-ath79-cpu.o
-obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
+obj-$(CONFIG_ATH79_MISC_IRQ)		+= irq-ath79-misc.o
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
 obj-$(CONFIG_ARCH_ACTIONS)		+= irq-owl-sirq.o
diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index e69d4eca929f..c25676a1c1cd 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -16,7 +16,9 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#ifdef CONFIG_ATH79
 #include <asm/time.h>
+#endif
 
 #define AR71XX_RESET_REG_MISC_INT_STATUS	0
 #define AR71XX_RESET_REG_MISC_INT_ENABLE	4
@@ -25,8 +27,14 @@
 #define ATH79_MISC_PERF_IRQ			5
 #define ATH79_MISC_SI_TIMERINT			BIT(28)
 
+#ifdef CONFIG_ATH79
 static struct irq_domain *ath79_misc_domain;
 
+static void ath79_misc_set_perf_domain(struct irq_domain *domain)
+{
+	ath79_misc_domain = domain;
+}
+
 /* Called by the MIPS perf code when the first event is created. */
 int get_c0_perfcount_int(void)
 {
@@ -40,6 +48,9 @@ int get_c0_perfcount_int(void)
 	return irq ? irq : -1;
 }
 EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
+#else
+static void ath79_misc_set_perf_domain(struct irq_domain *domain) { }
+#endif
 
 static void ath79_misc_irq_handler(struct irq_desc *desc)
 {
@@ -53,12 +64,6 @@ static void ath79_misc_irq_handler(struct irq_desc *desc)
 	pending = __raw_readl(base + AR71XX_RESET_REG_MISC_INT_STATUS) &
 		  __raw_readl(base + AR71XX_RESET_REG_MISC_INT_ENABLE);
 
-	if (!pending) {
-		spurious_interrupt();
-		chained_irq_exit(chip, desc);
-		return;
-	}
-
 	while (pending) {
 		int bit = __ffs(pending);
 
@@ -159,7 +164,7 @@ static int ath79_misc_intc_probe(struct platform_device *pdev)
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
 
 	irq_set_chained_handler_and_data(irq, ath79_misc_irq_handler, domain);
-	ath79_misc_domain = domain;
+	ath79_misc_set_perf_domain(domain);
 
 	return 0;
 }
-- 
2.56.1

