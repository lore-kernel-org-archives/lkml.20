Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F069286881
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808080; cv=none; b=qdkC0Y+92ZSY/67Y2wFN0gs/m8FLTTv3RmtlvTbPGsENEE2/g2l5NcjyUPLUDLND29iTUJCJmtxiYoM7iseW8NNpGuySpL/T009kyEZR3ct2aSY7WgnQb3V5EFEH5/u9vKN9+rFrYFJFCQew4OnW8hzDTBXsRYjcslNDmlpvVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808080; c=relaxed/simple;
	bh=YTC2a5INYjpakMMBayVLgaN9fcrqTzlfCEFcqNRJA7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPYDl7aVjxis/o9/LO6riin7Dj88fqXeHfuXJRKm8F2wC5MBlbOJfDIJiVaRm4dNBU3DPh8dgVmY+d+hQU5E7u8JT/hZYRsjmVghux7Xj/2WPWu2Ew6m9HKBqgpyU8plWd1Wx6+OfW2p9em/FdqZGagfT4DDGYngA6RjEvdFp60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caQ9FA9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+pRAHSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caQ9FA9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+pRAHSb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3J18r2861714
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9ZrWjcx63Nd0pIr0om8uI+X2l6rfXA78LDeZeZ0iEo=; b=caQ9FA9HRzWPooZV
	piwKivQRwj7x1oYdmDXJrUR/TIhymw+yjNw0YeJHY7SuBFRmEXe98RKWjxkySK3Z
	63GOEWfNujHtqoTIWNNGI+0XL8DR7zGNo18UxwnfqUeBjUo2SaI29Rx2wok5dx01
	aaFk7fNQcdQFqWr7t6DymBeBK811zcIO13xVyg4u97niorLWDEm38h59/HKhSPSg
	XZdxXXWs7WXLhrutnj3LZdCoS4iUIYeoNSlBPJjDpHxlWaOI5u58M3KIl4U25v0R
	NgaSYheq+XlOvaH48A88ePcX3xVMdmuWZ+JFgo8YzQYbJvO4lcPUakuNTrSxZCFi
	gaJcmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075ba3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2323531a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787808076; x=1788412876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9ZrWjcx63Nd0pIr0om8uI+X2l6rfXA78LDeZeZ0iEo=;
        b=Z+pRAHSbUKYwCN8x8/LjlarNcqgQdTL1TG3aPNSvpZVODVZurWNyDcj+Fjh1lxV88d
         CkeJmQ/WN2Gf9Bpqy9mQVPzhcOGgp0WFZPnQQcenS0Aadlr1oRGSS0aDqVzNgzqsxT3y
         ND+jUaoEHMzzNfJd5JxYYNeBwqCunGCjlr8xanal+uwB3YcpvBGsSxIdjWLH7y68xmd3
         x2Kh7yqBlXCRYMFXMhf6PTHEXTx5CMSe/AcjgVkUx5/xG5I2j2BXKuVeHKCj0KBLykDC
         gmjHIf3zIdx+Iqxfm6tQskPejaV0N/1KRadiXUIfSqCOWSsBZHrZg8dWo8Upd2vlrl9S
         oT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787808076; x=1788412876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9ZrWjcx63Nd0pIr0om8uI+X2l6rfXA78LDeZeZ0iEo=;
        b=RJwvOXnf668grZTCsZ0Xt1nv2p9RP7jx+LN/4mqbF4J/Hu8mBZtFvsW22HaSZgFhxU
         QnNgw3QSrTX0qv6BlNE081ss2m5oKi2Otzh9dGlBNbh0a6roFqZ6qXMgP1g89plgYGpL
         7jklzvPb/YFqfV8RfhTGD8gm85SE2wYKMw3v90i2e9SXbS4C5MtsXyA5BhDTLDBRXkH0
         3rFd6Q8+mDzIO9JfyEGtpSu4nUhKJFbelYJSE9DGMmKv8jODa2ggCpoUw8YzuLyUgmbA
         Klje5oORyeEmo5n4ikEx7/Gi9CMyyVgUVCcgi4AVUkQx6wFbPKPy2qi9oWpXMKwKakoZ
         PEWw==
X-Gm-Message-State: AFuF++nPiDGteUuMBOLE10YAHYe9uyNSKDUPju1EnCs/cvBEIMBPgLJt
	Vdb4M6JEJq4yhf+QjB42kVFlN2jYnzDLMgkLwj76ypbdvK5QcX2Uzn53Esr88KHLJ7S7vRWyIDc
	PIQxOKn5l0uYxQsvGQ9MZ0P9YR2Ocp9igyIcg+so9YZ/1GfbS4AVlzCo6PkBrvU3Wmx4=
X-Gm-Gg: AR+sD10WgWMl6kwKv+LfbMbRf+2m98g5U7yLdxxgCAvCS0nRGZIDhRocFBXnItcaEzU
	3OdiKBvuX7Ht90CqbszZeLZIxwXd2jJ/x7t81bZB8zlhGRZAZ+ZCIS2dcoQv5sWG843ScjxB/6X
	RMBQzKrH1WNf/tUIR2KT8Bi/2lTdVF1lAOJJdbd1pbnsi5VF7mj0ELVMmh0Jmm7yZyv5Z0sIivi
	7YfgrO3sKVDx7Zj3vtf5LTrxF+A4+uYxjDIdRh5mhJuz+5ubpoVgRt3idrKr0cb6K8DEe2WW5qX
	RfEpbUr0aMYMRfUHcYkYk/P4TvmO+DFjzGPnkvnVviQN0mrdmXirFviPJ29xZ9ti9aOmBkJbA4B
	Qo+FxCOfHl4HFg7gaHsLr
X-Received: by 2002:a05:6a20:684a:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3cf76084069mr24417459637.6.1787808076405;
        Wed, 26 Aug 2026 22:21:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:684a:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3cf76084069mr24417369637.6.1787808075837;
        Wed, 26 Aug 2026 22:21:15 -0700 (PDT)
Received: from [10.213.104.145] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm23734633eec.31.2026.08.26.22.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:21:15 -0700 (PDT)
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:50:58 +0530
Subject: [PATCH 2/2] printk: Defer legacy console flushes while a CPU runs
 a stopper callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-2-3b9f6bb4679f@oss.qualcomm.com>
References: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
In-Reply-To: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org,
        Aditya Chillara <aditya.chillara@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787808067; l=5222;
 i=aditya.chillara@oss.qualcomm.com; s=20260626; h=from:subject:message-id;
 bh=YTC2a5INYjpakMMBayVLgaN9fcrqTzlfCEFcqNRJA7g=;
 b=nRORsC8ftY5WQJwBU4AiGoBGndkRa0PXb66VfzAOuAFnAGsYCmupNE7lFnpvSOBQZ847dTymD
 FSg+02QGAPkA7cDlj2YO8heUsD9uABA9+uhAHWJ077MkPBcF0V/lBcf
X-Developer-Key: i=aditya.chillara@oss.qualcomm.com; a=ed25519;
 pk=3vcOzHlHNCpL/4rvfU3cpTk2xIC7SI+TH0gypa9FdZQ=
X-Proofpoint-ORIG-GUID: kzFQyqQtkctf4yu56JiS9DrPxSVdcgjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA0MiBTYWx0ZWRfXx8wGp7AgS1Mk
 JxegUEco56uGLV7iMq942n6xa+KAGDxpouOY2UNev9MeKW1QB8yZa47YV4IzVG6gcyl6I7+r7q7
 3FbqBeghtpzwcGcvXSNBTIfgHVWEDsNVmzPTyhaBy9rHSEKP6ZNMK4qw3PMuGzmkfR6vaXKcu+q
 l+iNTH7iaomn5Sm9lFgyqxO7jfjcPEhARJHSurmM2aNUxm1T5p5CoR05Qo9uxJmF4mWHYR7qmhb
 A4FNxfMuYcQ5SAjd57auND05E1ZZhca9X5A2G88WbjfxT+QbHMSqIFqFLXvCvJ4q3KJUk4ZnWBQ
 +CAmmLZENSfcSdLzC7pJE/s6LJHCy4EjuoD2QbAY+VAqHIKbUM9b6rdzpC4i9BFMQQEiehkBr+f
 UEFuznPqOOWDgvJoun9i8xVZLyVNjZ/mF8dRCD3A1p34gVAy/uP66A40D1B8LzebRr1lQiIjky9
 q7O4VEfNiqGd2kAT9Cg==
X-Proofpoint-GUID: kzFQyqQtkctf4yu56JiS9DrPxSVdcgjm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA0MiBTYWx0ZWRfX5up0OI8bJc5m
 c03ELNY7P+ZAflLZa+MvfgMJf/lpTEgz+Xv58suWwC3EQraM0jfGCfA4KZcnxvRnV39aAI/0ZzL
 wVti1wpx4ZVOWMci21WRus6F0+yAfVk=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8fc94d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5A7826UXk9eT2lxxAD4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270042

The cpu stopper thread runs above every other scheduling class, so while a
stopper callback executes, nothing else on that CPU is scheduled. If such a
callback emits a normal-priority printk(), the legacy console path can
synchronously flush the pending console backlog. On systems with a slow
UART and a large backlog, this holds the CPU long enough to starve RT
kthreads such as the watchdog pet, and for multi_cpu_stop() prevents the
CPU from advancing the state machine while the other CPUs wait. The
resulting delay can prevent watchdog servicing long enough to trigger a
watchdog bark or bite.

The same can happen from an interrupt taken during the callback:
multi_cpu_stop() keeps interrupts enabled during MULTI_STOP_PREPARE, and a
printk() may be emitted from a softirq run on irq exit.

Defer normal-priority legacy console output while a CPU is executing a
stopper callback (in_cpu_stop()), and reschedule any pending output after
the callback exits. Keep emergency and panic console behavior unchanged.

Assisted-by: LLM
Signed-off-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
---
 include/linux/printk.h   |  5 +++++
 kernel/printk/internal.h |  9 ++++++++-
 kernel/printk/printk.c   | 23 +++++++++++++++++++++++
 kernel/stop_machine.c    |  7 +++++++
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd..4f3fb4ef5b92 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -166,6 +166,7 @@ __printf(1, 2) __cold int _printk_deferred(const char *fmt, ...);
 
 extern void __printk_deferred_enter(void);
 extern void __printk_deferred_exit(void);
+void printk_defer_console_output(void);
 
 extern void printk_force_console_enter(void);
 extern void printk_force_console_exit(void);
@@ -239,6 +240,10 @@ static inline void printk_deferred_exit(void)
 {
 }
 
+static inline void printk_defer_console_output(void)
+{
+}
+
 static inline void printk_force_console_enter(void)
 {
 }
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 85fbf1801cbe..8c02f93e798c 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -3,6 +3,7 @@
  * internal.h - printk internal definitions
  */
 #include <linux/console.h>
+#include <linux/stop_machine.h>
 #include <linux/types.h>
 #include <linux/sysctl.h>
 
@@ -206,7 +207,13 @@ static inline void printk_get_console_flush_type(struct console_flush_type *ft)
 
 		/* Legacy consoles are flushed directly when possible. */
 		if (have_legacy_console || have_boot_console) {
-			if (!is_printk_legacy_deferred())
+			/*
+			 * Offload while this CPU runs a stopper callback so that a
+			 * slow flush cannot starve RT kthreads (e.g. the watchdog
+			 * pet) or stall the multi_cpu_stop() state machine.
+			 * Flushed once the stopper exits.
+			 */
+			if (!is_printk_legacy_deferred() && !in_cpu_stop())
 				ft->legacy_direct = true;
 			else if (!console_irqwork_blocked)
 				ft->legacy_offload = true;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3fcdf4b4e2e5..379fcbe6914c 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/stop_machine.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -4602,6 +4603,16 @@ static void wake_up_klogd_work_func(struct irq_work *irq_work)
 {
 	int pending = this_cpu_xchg(printk_pending, 0);
 
+	/*
+	 * Don't flush the legacy console from irq_work while this CPU runs a
+	 * stopper callback; keep the bit pending and re-run once it exits (see
+	 * cpu_stopper_thread()).
+	 */
+	if ((pending & PRINTK_PENDING_OUTPUT) && in_cpu_stop()) {
+		this_cpu_or(printk_pending, PRINTK_PENDING_OUTPUT);
+		pending &= ~PRINTK_PENDING_OUTPUT;
+	}
+
 	if (pending & PRINTK_PENDING_OUTPUT) {
 		if (force_legacy_kthread()) {
 			if (printk_legacy_kthread)
@@ -4687,6 +4698,18 @@ void defer_console_output(void)
 	__wake_up_klogd(PRINTK_PENDING_WAKEUP | PRINTK_PENDING_OUTPUT);
 }
 
+void printk_defer_console_output(void)
+{
+	bool pending_output;
+
+	preempt_disable();
+	pending_output = this_cpu_read(printk_pending) & PRINTK_PENDING_OUTPUT;
+	preempt_enable();
+
+	if (pending_output)
+		defer_console_output();
+}
+
 /**
  * printk_trigger_flush - Attempt to flush printk buffer to consoles.
  *
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index d38fabb0b9f1..18ae7ff2d8b8 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -22,6 +22,7 @@
 #include <linux/smpboot.h>
 #include <linux/atomic.h>
 #include <linux/nmi.h>
+#include <linux/printk.h>
 #include <linux/sched/wake_q.h>
 
 /*
@@ -530,6 +531,12 @@ static void cpu_stopper_thread(unsigned int cpu)
 		ret = fn(arg);
 		this_cpu_write(cpu_stop_active, false);
 
+		/*
+		 * Flush console output that was deferred while the callback ran,
+		 * now that it is safe to do so from this CPU.
+		 */
+		printk_defer_console_output();
+
 		if (done) {
 			if (ret)
 				done->ret = ret;

-- 
2.34.1

