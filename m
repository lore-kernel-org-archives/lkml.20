Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6C3E3156
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965447; cv=none; b=dSHEX82DWjjvvvF4jyRfPSGhGAYhdCb8C5/ySZ1wtHzm8iR2w5akmjWK6cJr4KVloYwmaIwufigRvrxAjKU31PilJ7yIwOhjBolhcfayH/rj5pMBWBKQJE7FTmWHlhtAxE/fF8KTjRX/3gT5AgPkJGUpjsmgyN9MEp3RL7V58W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965447; c=relaxed/simple;
	bh=g6hFtLVrE/UjzzVSQQOzbX4cj/oiFJZYtfo2+FNowfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C3iJCfe+PRSfv5DyKUc4DF5jTk1YSCg4CV5bzhxrhJ4JVp4scRJc3fpIZ7C8w83I2Zcr40k7C2/h0hoiE49Z6QhoPeCtw0jJ7hAzEFZzXeiGZQModw4aEhPPTCGvx3bVpUKMWertwjkooWGZPx0XxuWrUTqftrJWU6DsFsM0qog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYnEJZbO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYnEJZbO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso4414925ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965445; x=1792570245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9mA2qoZtggQ/j/8me9B77LmzqnDxoGP/VtqAIm/t1U=;
        b=kYnEJZbO5Gvr3rfc9dhuvUnEeU1bw1gJ/TBYCnOkAO+upF6gjIuJJzTmlXciGFRK5d
         1gTqUNfDbxFMP5xMT47gD4h4DJ6Msr63aKdMIvQKKR1WfuV6PoP7VN7obRsPBRvS2hBf
         ovAFT+zFdqGwAsnDe2eCLwk+3Z/4/8938FntPpiYvOzfn/l6FdOqcxUvnHD7N/iQSZw1
         uH9yr2eHTbpkMGGgDIMMB/LYYXMm90zd0shZy3ibF3iMZOQEmw2dCF/eKNZYX5ydbteL
         41c6aHDo0TFjZDvw6RuP9/VaP/boVcmOD+nIW4HQyVbSthSDK4wnjL+BUIO9blPiKicj
         CPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965445; x=1792570245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9mA2qoZtggQ/j/8me9B77LmzqnDxoGP/VtqAIm/t1U=;
        b=fwdarESo2so4O8S0oFWG2/KqOBXkWmXxh0M8tmVM0fYHIksGC2guPc1LCrmq0VoNWc
         CzyNm70sIOy4sVKdDHylzc5ZlM+8PvvyScCR3tSgg8o0AgKUJy7Wv+hXtXEAKRe2eJ2O
         9UX8cWfetwBy4a/IYTyadk7fDUFD7JucLmaGkdBu0HQoWOBLkVM7nqOOnsCI4zE3ggnB
         xnejL4XuxDT8u9GeptYjLeti9ws/Esj9eGUum1mHrNbUi24sNNa8/6Y8yc4TREBrWgvK
         kZJBfIlRmSWIOPuvNVsCkZ6lpT0233JUY1eOaEjqbkZ/uQLe5naQ1D1Ji/BZKBJMgLMk
         PG0A==
X-Forwarded-Encrypted: i=1; AKwUvBxuEEXwYDEX1m+TC4ZjoriUFj6qUQZ6BUe85mMKLCfLAdz0Yp45oijLkfzCGnJGDttepWA1bn/mwyzP6rU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt/bhhqATUY09eumfIuzq9/t/mmt9MhNvYr5JADcnPRPN4N7c2
	91lxt5YJEd2R/kO/yb+IiEl+jksrYZuW7AE/PJ9AOE3cUdPJiY/NbdxG
X-Gm-Gg: AYBFou21f2rwGjSHbgHoP6LFNvg5OSk1n82f4CZAXkvSCwCFoRkdyVaU5dK4jcU3tTv
	ycvxxKAbvTy2aymr5dMJVjZ9MeUq7JH7Wqnqr2N1V2YMY/Bjd1iAe9APu49haeeyn6cpZibtY4d
	XTXTlsamDo8N4rRyCYUbz85UrXMHx154rm/Xhq6c6DxLqDYzEyBjW4yYNpSzOXG2FuaDke58vOR
	cxvDgyfsoNxU8hbhPKjG0QAmE15ao4CvOMJW/9ZDo4A58zDUi+FLNrqEDqfJfXlCk1tG24cUbCp
	1y/CANz2EO6d04WUxQ0WEmjMdT93YMNCMX87f3unXn1YDyKF9+JU44Dn0ChAAzuvCX6jpRBuMAu
	LdKCcsDfqQ/Hlr/HMRMm6/0lQYOEW0Tj21vFpaaLojqE/vjQDgQVNvY4RJMeSvpUF3N/qVUY/fU
	GXvlFZPqiZDldIo/peYNpsiOEXtUiewg+Adxj6Bg9gHR0G0dg4Oq4uw9zU25kgvvqmkYzsnR7ig
	2h1IUEUutfFkMtJ4H1yoFVWiabgDrMZysE7TIV6XKuig1s=
X-Received: by 2002:a17:903:120f:b0:2e8:e617:18 with SMTP id d9443c01a7336-2e8e617032emr63957225ad.48.1791965445086;
        Wed, 14 Oct 2026 01:10:45 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2511sm65145085ad.76.2026.10.14.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:10:44 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tracing/osnoise: Don't start a kthread in timerlat user-space mode
Date: Wed, 14 Oct 2026 16:10:34 +0800
Message-ID: <20261014081034.12702-1-chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In timerlat user-space mode (NO_OSNOISE_WORKLOAD) the workload is a user
task reading timerlat_fd, so there is no per-CPU kernel thread to run.
start_kthread() only checks for that in the osnoise branch:

	if (timerlat_enabled()) {
		snprintf(comm, 24, "timerlat/%d", cpu);
		main = timerlat_main;
	} else {
		/* if no workload, just return */
		if (!test_bit(OSN_WORKLOAD, &osnoise_options)) {
			...
			return 0;
		}
		...
	}

start_per_cpu_kthreads() guards against this mode itself, but
osnoise_hotplug_workfn() calls start_kthread() directly. Bringing a CPU
online in user-space mode therefore starts a timerlat/N thread and sets
its bit in kthread_cpumask while OSN_WORKLOAD is clear.

stop_kthread() uses that bit to decide what the recorded task is:

	if (cpumask_test_and_clear_cpu(cpu, &kthread_cpumask) &&
	    !WARN_ON(!test_bit(OSN_WORKLOAD, &osnoise_options))) {
		kthread_stop(kthread);
	} else if (!WARN_ON(test_bit(OSN_WORKLOAD, &osnoise_options))) {
		kill_pid(kthread->thread_pid, SIGKILL, 1);
		put_task_struct(kthread);
	}

The bit is set but OSN_WORKLOAD is not, so the first WARN_ON() fires and
the && short-circuits into the user-task branch. A running kernel thread
is SIGKILLed and its task_struct is put without ever being stopped, so it
keeps executing until it is freed underneath itself.

Any write to osnoise/options reaches this: osnoise_options_write() stops
the per-CPU threads before applying the new value, so stop_kthread()
still sees OSN_WORKLOAD clear. Re-writing the value that is already set
triggers it just as well as changing it.

  echo NO_OSNOISE_WORKLOAD > osnoise/options
  echo timerlat > current_tracer
  echo 0 > /sys/devices/system/cpu/cpu1/online
  echo 1 > /sys/devices/system/cpu/cpu1/online
  echo NO_OSNOISE_WORKLOAD > osnoise/options

The offline/online pair is required, otherwise no kthread is recorded and
no bit is set. Running this on 7.3-rc7 with KASAN gives a WARNING in
stop_kthread() followed by a slab-use-after-free in update_se(); leaving
out the hotplug step produces neither.

Keep the check in start_kthread(), where the related hotplug bug was
fixed in 0bb0a5c12ecf, instead of adding another copy to the callback.

Fixes: e88ed227f639 ("tracing/timerlat: Add user-space interface")
Cc: stable@vger.kernel.org
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 kernel/trace/trace_osnoise.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index 0e1265acd..9715462ee 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -2038,6 +2038,14 @@ static int start_kthread(unsigned int cpu)
 		return 0;
 
 	if (timerlat_enabled()) {
+		/*
+		 * In timerlat user-space mode the workload is the user task
+		 * reading timerlat_fd, so there is no kernel thread to start.
+		 * One started here would set its kthread_cpumask bit, which
+		 * stop_kthread() reads as "osnoise workload kthread".
+		 */
+		if (!test_bit(OSN_WORKLOAD, &osnoise_options))
+			return 0;
 		snprintf(comm, 24, "timerlat/%d", cpu);
 		main = timerlat_main;
 	} else {
-- 
2.43.0

