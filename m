Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831E2F12AC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637738; cv=none; b=QpRa5Zfy5wXLY4JckUAkBmsNwiHIXHkUavsiuTUDn0BvmBOkUHBruv0jlG8nZ7l7MqJNEK4ThZ9lgSD4fu6UA9icGqii+QH0GcC99dwpWGKB/7c5f2z3X2IripazpxwP7sTCxbR8YW5h/Pt2IwY16eeoiZ1/lyzP4gimivungwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637738; c=relaxed/simple;
	bh=RXXJCYmXAtRSLcGrIrL29ngWTCZ1VeeFztkokEt5Wjg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PXZHcfQGYPtb/39ApdOnNOYehq9ORw2MX7cgCQB4nWT4bx1BeeKjTErJqfjox3gan4+XfRnDR3aY0zKVFFIndbgAihww/P/OQyz3AXWAb536ghHQnHVJaa4s99qzkgyiZVbyN2vNFmRTO+v6WC5cqscbUgSL3eJ866QCz8YJ/Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NcsfWy+R; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NcsfWy+R"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a165fb7beeso5784095e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791637735; x=1792242535; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZqiwYuJOtlaGHOqcy8WXlOxQsipLnbzYkSusU0nh1k=;
        b=NcsfWy+RSFwdRS4mUL2ZDdSnRu/7aQ87cslm4XXbmWAaKSFO+dvlZEre8n1kDFwOFa
         BrV0Kl4n5+kA+1FvUjnEqmyFf/aFNCiZ3V7W8CUVRdquCxOOOylO1JaQbPbNDtZbZcQ6
         lJrZdNsPf++TwUF2Cfovn3a/KZCHG5LT009wYjytj+yLdbcP1p5r3ocz11kohUkNjHap
         aX31N1ZU9G9R0pmzkZ3jC73E3+ELm4KMcoQPppbEyetolvRm0Eqf5hi0NqFveMwsX56N
         CZ5FHtLupMbF1+zyDoNkN81/99DOjZGivWyx+d/yGDn13AY7QzwUr/v4Qz67VLqIILAi
         1+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637735; x=1792242535;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZqiwYuJOtlaGHOqcy8WXlOxQsipLnbzYkSusU0nh1k=;
        b=sVDdpOHc4mj11isOAM12vZcrzZYUS1Mb7EnQuNP7wi4uRHqSIvirTZ0C2GLnzYqNCB
         EPKd5cp2Y7TMUQOgRqCx/zPU33j3cKQ5ydmjJbu0IMu1Kb6f0r40lGCu3bu+fJOTw9w0
         Yy23E7CjzHn8Gd5dxKuYUqGOmQuH4z/VKuyP9gnk5qZVLBQuZ7Z4ocz22rgvdjD6g6QK
         ruHWPF5KDC51lduLheuBLTv1mE0nbCEQngBtp1Z8iUgj74ZNVF/BtCsmPnqkXqXVGZzQ
         Wm0Jh8IV+NNBAdZaj6MucIZNiF6pxZLJfclFzcIwGKh9N85UIHOhovfmVp1RCv7tM/Rp
         wInQ==
X-Forwarded-Encrypted: i=1; AKwUvByyoFvckp4vG3M3CtpDVVW2Ec+AqVYtu5BC8yzK71UumnHZLzGfJ+3cDLvkDOUx32gGoRWPMH7JmmFu2G8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIki4mULG6X/uCrW1NGpNffGNe3sl3Jw7DxM88QAm0o3NlPsuO7
	vEuPGpCRZHdiK5rVzZhDTP2mRZdT/JtQdRgFCTioa6zU2SEAr1sp5lbEqTvWnVz/CxH77PzcZJK
	MFQ==
X-Received: from wmgf6.prod.google.com ([2002:a05:600c:1546:b0:4a1:9839:71f5])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3f0c:b0:4a1:85d9:13be
 with SMTP id 5b1f17b1804b1-4a18e498471mr101875555e9.20.1791637734500; Sat, 10
 Oct 2026 06:08:54 -0700 (PDT)
Date: Sat, 10 Oct 2026 13:08:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261010130846.2202593-1-elver@google.com>
Subject: [PATCH] kcsan: test: Do not count report printing time against test duration
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since commit d3539347022a ("serial: 8250: Switch to nbcon console, take
2"), several KCSAN tests fail with CONFIG_KCSAN_VERBOSE=y when using the
8250 console.

With CONFIG_KCSAN_VERBOSE=y, the report prints the racing tasks' IRQ
trace events via print_irqtrace_events(), which marks its output as a
printk emergency section. Within an emergency section, printk() flushes
all pending messages to nbcon consoles synchronously. With a slow
console, the reporting thread can therefore stall for over a second
while holding report_lock, i.e. before the remaining lines of the report
are stored.

The test, however, stops checking for reports after a fixed deadline,
which is easily exceeded by a single slow report:

| [    5.360278] BUG: KCSAN: data-race in test_kernel_read / test_kernel_write
| [    5.360303] write to 0xffffffffab95a478 of 8 bytes by task 237 on cpu 7:
| ...
| [    5.360411] irq event stamp: 23
| [    6.059836]     # test_basic: EXPECTATION FAILED at kernel/kcsan/kcsan_test.c:735
| ...
| [    6.616416] read to 0xffffffffab95a478 of 8 bytes by task 238 on cpu 9:

Waiting for in-progress reports to complete is insufficient: a slow
report that does not match the expected report still uses up the time
to observe the expected report.

Fix it by pausing the test's time budget while a test-related report is
being printed, bounded by an upper limit to avoid stalling the test
forever. Once a report completes, always check it at least once.

Assisted-by: Antigravity
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/kcsan_test.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index ae758150ccb9..760686e130ad 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -48,6 +48,9 @@ static void (*access_kernels[2])(void);
 
 static struct task_struct **threads; /* Lists of threads. */
 static unsigned long end_time;       /* End time of test. */
+static unsigned long end_time_max;   /* Upper bound for end time of test. */
+static unsigned long report_budget;  /* Time left when report printing began. */
+static bool report_paused;           /* Paused while a report is printing. */
 
 /* Report as observed from console. */
 static struct {
@@ -69,17 +72,46 @@ begin_test_checks(void (*func1)(void), void (*func2)(void))
 	 * least one race is reported.
 	 */
 	end_time = jiffies + msecs_to_jiffies(CONFIG_KCSAN_REPORT_ONCE_IN_MS + 500);
+	end_time_max = end_time + msecs_to_jiffies(10000);
+	report_paused = false;
 
 	/* Signal start; release potential initialization of shared data. */
 	smp_store_release(&access_kernels[0], func1);
 	smp_store_release(&access_kernels[1], func2);
 }
 
+/*
+ * Printing a report may take a while, e.g. if a printk emergency section (such
+ * as with CONFIG_KCSAN_VERBOSE) flushes a console backlog synchronously. Do not
+ * count the time a test-related report is being printed against the test's
+ * time budget, so that a slow report is neither missed, nor prevents observing
+ * other reports. Returns true if checking must continue.
+ */
+static __no_kcsan bool pause_for_report(void)
+{
+	const int nlines = READ_ONCE(observed.nlines);
+	const bool in_progress = nlines == 1 || nlines == 2;
+
+	if (in_progress && !report_paused) {
+		report_paused = true;
+		report_budget = time_before(jiffies, end_time) ? end_time - jiffies : 0;
+	} else if (!in_progress && report_paused) {
+		report_paused = false;
+		end_time = jiffies + report_budget;
+		if (time_after(end_time, end_time_max))
+			end_time = end_time_max;
+		/* Check the now complete report at least once. */
+		return true;
+	}
+
+	return report_paused && time_before(jiffies, end_time_max);
+}
+
 /* End test checking loop. */
 static __no_kcsan inline bool
 end_test_checks(bool stop)
 {
-	if (!stop && time_before(jiffies, end_time)) {
+	if (!stop && (pause_for_report() || time_before(jiffies, end_time))) {
 		/* Continue checking */
 		might_sleep();
 		return false;
-- 
2.56.0.385.gd3acb90ef8-goog

