Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713837F32C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792200801; cv=none; b=Pqc0cPjGYnZJtRXVplD2x5HNO5/KoqR/WJkXKWDd5fVITInwq2zaC+ardkY/Fh/CHJVQ51OtY90TYVZ2x0bdKD8x4roobhHDlBinP4hn0ajGy1q0PrwJJMo5x8rhOW+cklhAvjvHyUUD+vBE3GZpQo43OYqYFe29YkuOA0God2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792200801; c=relaxed/simple;
	bh=Q0OVgxmRG3Mb1iEUhHgWM/JD7gZywVlYcymBliEC/uI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsumEcxEvilfnmVUiBa3OACWTibJBeT6Cu+DaQHztMcZ58wA0fQFA+X8svNvbeM0kcOB3DH/S3X+twd684K+JqFWLg0jSvtIcTzEt3eID0ujnO/MXqZq273RbB6j3wDOOSd4lyekT+jCu/eQM1WjFpJuNk8BWV/XImh1hf+ffhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJi8QQqN; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJi8QQqN"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35ef6b49813so871813eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792200796; x=1792805596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/BMbVAoUESCQf7TQMH9otLhUC/2dV1sy9hX9s5qH9w=;
        b=QJi8QQqNUDf2K/ZlWzxB9TPc+j5SPtVFmYt1aDYkWQ3FxXnpfKtlB8tKTYnq/A8b/P
         54h/AGWTdnabfJw39g1GQBlyYJ9Q2IK1vOBAPbXsSm8AgewH3taFAH6CslMr2RDQFEed
         KF64Dk4C40oRsPGPlHDG1Qx4/PVRRDVTXsVyYp2jKMroDy2oab72c15ZzTaAMwGF1uiS
         XbdSAkzqPYmfOgs/vyWqFEE07AKn6wJ6sDjQiB63mP/QFxwlolMQGrfxTlkgKIVzVkWa
         NhxgUvixFinC6Fqc+y6+HQxoN311qlA59KHsfp6gPYO7fKEWlNqOjFYxxROazj9ItW4D
         GBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792200796; x=1792805596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/BMbVAoUESCQf7TQMH9otLhUC/2dV1sy9hX9s5qH9w=;
        b=zvkx7RHEcFg9E8x5rXlLYAZPvowcv5KQUKH/7x3ETZbNtOwkbugS4la5pBeiGofpCO
         BEzlAOpi/HSqbEH+6I5IwlM9w+E43iGW1KxaRnXG5bCAkDTIaglqXitpnKWGnUPY8E2r
         d2LCRGUexZd236Bf0GLCChz4LXfGMFmguiG7yB55nrv++cBHhLg91MEFD8mQFMCHrgik
         dQNzU6SJ6IKXN/z5yTsHnc9xTFZjEIvk+QhAIc3C/MfUNkmV/aKhNI/bt9WpzCr8aSz0
         U553gp/RF2ag+XhHHu40RcI9FHTHV5CDyjMe1sFbb71d/oq+7zRCkQnRbscAUY2sbGBv
         BRdA==
X-Forwarded-Encrypted: i=1; AKwUvBzmtAxdoZG8cvc1m+4aBqPoSMZmzRoM6KlVK4CgAtq0XfIjiKUmEYPLFIZHL3MA5l4e6Q9MVHIUiaQCW1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIaceWq1D6PcFYfCIIH79M5Avvu48ZChhlyLu8Q8kHkiMRBONK
	erzpnPnVtZ9uClWYHFJae2bum2cpkJXpg3Mqev5CDzCQHuJxabkOP1so
X-Gm-Gg: AYBFou0DrCkFf5z8W+plSScwmwxMK1BYy6yZGTB2rQC/2pfGidwJh4+srlNL+mexMum
	hZ3Jae8rI7GG/zgFe372WlPRT1jdPD2C0N6tjbm8IaSlsJNB2sswQkRChteeE3CmOWy6QqQo5CR
	v/Tapy1Sax9eMu4mDzrM4XARKquy7PITnytSdxOx67n/nbrf5EqtuMzcXLi9Uk/FkgjCLed+2Dd
	5rt+2CWZ2pOvGm410DCxoWYZeVhh2bLsv2ejjjpeQYG8TT9bLKBjECikdnNn90o0w8LquG9/VFC
	HVR+O77RKbu2FODYynAX4+nHZxAFX9NCOnhTXhYB4Fk0pKCY0EPk2pE+wRnWq1cCLvI30khurS6
	7rMYwmZo+LU3xTJraK1rbOjeBeFYT6LVOn9juvuCXdBFX9ioRTA9OmIO1703ged0ZP4kGT2aKBL
	9FM7+Ywn+aCMwmaS9Y3Qluos0FgB6KBG0NbX1jzefBN8BDQbqSeFIOAxUFVDvUiWF9T42O7XyNT
	+dvjJ1Pb6dF2StOnLGgsLrabwgqTZ4Bbw76WKFi4M8J4HoYMao60lIPsRa4Yrgt0yuxJbBw5HHq
	7eRrSiefxwveXDHRTU0EVRNEhg==
X-Received: by 2002:a05:7022:ea8b:b0:16c:6459:35b1 with SMTP id a92af1059eb24-1851310977dmr1987494c88.28.1792200796321;
        Fri, 16 Oct 2026 18:33:16 -0700 (PDT)
Received: from server1868-4.tail96fc24.ts.net ([199.188.91.198])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm13878785c88.11.2026.10.16.18.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:33:15 -0700 (PDT)
From: Austin Schuh <austin.linux@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	Austin Schuh <austin.linux@gmail.com>
Subject: [PATCH] io_uring/wait: wake real-time waiters from hard interrupt context
Date: Fri, 16 Oct 2026 18:33:03 -0700
Message-ID: <20261017013303.3919170-1-austin.linux@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit cebf123c634a ("io_uring: implement our own schedule timeout
handling"), a CQ wait with a timeout sleeps on io_uring's own hrtimer
instead of an hrtimer sleeper.  On PREEMPT_RT, an hrtimer that isn't
marked for hard interrupt expiry expires in the per-CPU ktimers thread,
which runs at SCHED_FIFO 1.  A real-time task waiting in io_uring_enter()
is therefore not woken at its deadline while any other real-time task is
runnable on its CPU: the wakeup waits until every one of them has blocked.

hrtimer sleepers, which schedule_hrtimeout_range_clock() used to give
io_uring, don't have this problem: __hrtimer_setup_sleeper() marks the
timer hard when the sleeping task is in a real-time or deadline class.
Both of io_uring's callbacks are fine in hard interrupt context:
io_cqring_timer_wakeup() sets a flag and calls wake_up_process(), and
io_cqring_min_timer_wakeup() only reads ring state, under RCU, before
doing the same or re-arming the timer.  Apply the sleeper rule to them.

Measured on a Jetson Orin Nano running 6.18.39-rt with this change
backported: a SCHED_FIFO 40 task waits in io_uring_enter() for 40,000
deadlines 500us apart, while a SCHED_FIFO 20 task runs bursts of up to
1ms on the same CPU.  Before, 6,647 wakeups were more than 100us late,
the latest by 1,040us, and 2,758 deadlines passed without a wakeup at
all.  After, none were more than 100us late and the latest was 18us.

This mirrors epoll: epoll_pwait2() waits on an hrtimer sleeper, so its
timeout is already hard for real-time tasks, and on the same setup it
was never more than 17us late.

Fixes: cebf123c634a ("io_uring: implement our own schedule timeout handling")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Austin Schuh <austin.linux@gmail.com>
---

Notes:
    Based on for-7.4/io_uring (89f193dc3ef4).  Built for arm64 with
    PREEMPT_RT and with PREEMPT, W=1, no new warnings.  The numbers above are
    from the same change on 6.18.39-rt (in 6.18 the code is still in
    io_uring.c). I haven't booted for-7.4 on the board.  The test program is
    a small C file, which I can post if it's useful.

 io_uring/wait.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/io_uring/wait.c b/io_uring/wait.c
index b7a0292767c7..ef4b89d3c66e 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -3,6 +3,7 @@
  * Waiting for completion events
  */
 #include <linux/kernel.h>
+#include <linux/sched/rt.h>
 #include <linux/sched/signal.h>
 #include <linux/io_uring.h>
 #include <linux/time_namespace.h>
@@ -120,23 +121,39 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
 	return io_cqring_timer_wakeup(timer);
 }
 
+/*
+ * On PREEMPT_RT, hrtimers not marked for hard interrupt expiry expire in the
+ * ktimers thread, at the lowest real-time priority, so a real-time waiter
+ * isn't woken until every runnable real-time task on its CPU has blocked.
+ * Like hrtimer sleepers (see __hrtimer_setup_sleeper()), expire the timer in
+ * hard interrupt context if the waiter is a real-time task. Both callbacks
+ * only look at the ring and wake the task, which is safe there.
+ */
+static enum hrtimer_mode io_cqring_timer_mode(void)
+{
+	if (IS_ENABLED(CONFIG_PREEMPT_RT) && rt_or_dl_task_policy(current))
+		return HRTIMER_MODE_ABS_HARD;
+	return HRTIMER_MODE_ABS;
+}
+
 static int io_cqring_schedule_timeout(struct io_wait_queue *iowq,
 				      clockid_t clock_id, ktime_t start_time)
 {
+	enum hrtimer_mode mode = io_cqring_timer_mode();
 	ktime_t timeout;
 
 	if (iowq->min_timeout) {
 		timeout = ktime_add_ns(iowq->min_timeout, start_time);
 		hrtimer_setup_on_stack(&iowq->t, io_cqring_min_timer_wakeup, clock_id,
-				       HRTIMER_MODE_ABS);
+				       mode);
 	} else {
 		timeout = iowq->timeout;
 		hrtimer_setup_on_stack(&iowq->t, io_cqring_timer_wakeup, clock_id,
-				       HRTIMER_MODE_ABS);
+				       mode);
 	}
 
 	hrtimer_set_expires_range_ns(&iowq->t, timeout, 0);
-	hrtimer_start_expires(&iowq->t, HRTIMER_MODE_ABS);
+	hrtimer_start_expires(&iowq->t, mode);
 
 	if (!READ_ONCE(iowq->hit_timeout))
 		schedule();

base-commit: 89f193dc3ef462059387e9691bf6af4b1808379a
-- 
2.47.3

