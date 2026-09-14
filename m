Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833035E1D5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364887; cv=none; b=qj1YHwi8YbdDut0hFqLdGRIrYr7ASWsTfyTnlVa2OFElAj2PX9NQbwQJ5uLUrtKTSPLzQZ/ToLgt1tzkapgXl4Yp8hZEI23whjCP+9AC7+isgnoQ3vOGFBdmL8UGAjIxMP6zd2pidN6VKMOVnF9v5dnLNJ7A28I+Bl9uPqenjMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364887; c=relaxed/simple;
	bh=4/rEt6aIcLBVMLDQITGZHHjQoIY+CauyfASRMhD8tuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HholtLNf1B1Pt0bzMOzdEVIVp94vBTDr8s3Qp3QXYoQCBPmXtHzOUjbCe/zHAe6l5RDwxLoPMvoJhlpvBbMLHtTIeXTDqlCKOWBKQZYcPbvIkb4IIXwSFac1ZEh4uqvAt0ozyOCIq3t/Cwb2aubYQ7RjTlDx9/q5aPetP2mUdsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjFqBAl3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjFqBAl3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so6013875e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364883; x=1789969683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRxtvgP8q+4kgTU7CEIUrbrLAuy9hfqDj2Yu0xRVbQE=;
        b=NjFqBAl30sDz+PC29xrxhoS735qj64UxPD3xCckGXm4nNj7HWL8CvKWfFfU14AKapO
         hk2Syu1UXxzDux6dXq2yY/vzNCCGQpfcf2hnxXs1PhjZ9ma+11JQAIPj0ijBYJln8KCd
         E6GUoBuzDeySirzF8e6TvFQLPVG8PWKCjPdc6+a08cGL1D/HD5ClUcFIzgmU4EKWTqfe
         eWI8tJyrXZG8OuT+d39ahxrqUPqEABrTZU0Qsfvf8us2LvYii+TTQEw/EJkNaPGqi7hp
         AIcJ4rg3Ha3hmQI+yzHWFzBaf88beB+pBFI59CPFNh3VWs056m22bvMNmhSQITpSCkai
         imbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364883; x=1789969683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRxtvgP8q+4kgTU7CEIUrbrLAuy9hfqDj2Yu0xRVbQE=;
        b=ibpfpqEK9+eTsQAr4Q0wmomTbar2uzAkuGAMPWBnMTPRD9LAEr417rdjCG2swg1uAZ
         +DVYC04ZkK/JK3elWnmRGpYsVknBvidYtIgdE01ZRW03fuXX8Pqi8mArHJYUA01dhsrR
         GqnPDAPZKLEIq/W4+Qu/N5TxTCOGDCMmvjhZgbEf86AVkAqXZxOOe5867A55brIVKscS
         4U2SqvSsq2EBR9RSjvbKWsklbcJM+1bWZlZgtY3MfecXRrsgB6svGTuZoDms0ZnDYcgN
         LBaUJT23hcFZePdkAmTNdMxRUjQGnZzRTHF0LwBzz48CkrKZJo97MYiVqOxZ4S9eNyKf
         NiAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/8qrr0FQZw+u4FL0EL139Aukp+P4CFkm1e/qe5uCEqjmXhG2+hX/DPAEnraHBVSKDZmc2ss4umdYmt2c=@vger.kernel.org
X-Gm-Message-State: AFuF++mfpnp1sgGZ97tON6JJw+YmVtYf5M7XX99Qgoc0SV/+vgpYEzzW
	H73fTOynsrOJVXaaC8P7aaKTWcRiApk6BhgR5h9dLfi+pZRAqWY8hinE
X-Gm-Gg: AYBFou3qOlH+o37qRMSFZvsz5IDOadWzUujhCojz6b1bCel6DI2CABKB7vbki+sDlcK
	ZlrxaAmvG2di4QaCCB2LugOJCSdGkhMLzJG3p9cOublpMmV5pivBVDcSzBg2yBrXIlHKgB9EX9H
	EG4cHVqTiRcypOWhCyJJe7qa0mQkf5ckwmUde9daPa3r9Sx3/8rJLUm4L476lUYQRQ1FPcalJbF
	TbLQ/OAJwwMSplxogi+Xmkwa77D1HTCJB83M+coto5vL1BRgawb0Jemwf3WE44R/R0Mw1Z/js+Q
	18n92GGeGyMl9DwnP9Tb5eHxbLkbZhjY0RiG/dnyuxgm3a+vQca0cjEZbwWL1lPg3eHjkop7Cro
	VIwH6eNXfz/ZsQyKKFzf+xspyzrpG3fTjeluTWLdkmsuRGqaJWThH8Lv7LXVt5F/5ztn/1JMLXx
	DwlqJ9XZVUd8Hq9774X+CE6I60+jHcT8k5u9UAWyAQGs9YOkQ4Gd61g/3Jam513JsjUBoTPyZBC
	dFLmgdZrkkHhuSUeQ90TdARXhukd/J7hyHN6DCLz45ryQTnveUvH/XK5FWBcPmRJDwHyfPbjHV1
	G4iNjGRm/xZTzWE12vL9MabN0qoZm+y/
X-Received: by 2002:a05:600c:3484:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49e7a6865c1mr10069645e9.15.1789364883547;
        Sun, 13 Sep 2026 22:48:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm214537735e9.5.2026.09.13.22.48.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:48:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <include@grrlz.net>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] sched/core: Pause KCOV in try_to_wake_up()
Date: Mon, 14 Sep 2026 07:46:31 +0200
Message-Id: <20260914054632.12877-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914054632.12877-1-kmehltretter@gmail.com>
References: <20260914054632.12877-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

try_to_wake_up() is built without KCOV instrumentation, but it calls
instrumented helpers such as kthread_is_per_cpu(), CPU capacity helpers
and SCHED_HRTICK arming. They can record into current while in_task() is
true.

CONFIG_KCOV_SELFTEST exposes this under PREEMPT_RT. The interrupt
selftest fails on x86_64 in kthread_is_per_cpu(): RT runs the timer
softirq in a thread, so the wakeup runs in task context during the
selftest's spin. The same helpers leak into non-RT syscall wakeups such
as a pipe write waking a reader.

Pause the wakeup body with the kcov_pause guard. Take it before the
preemption guard so preemption is re-enabled while KCOV remains paused.
Wrapping only select_task_rq() would miss SCHED_HRTICK arming during
enqueue.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 54b5c5383fe6..e3b50bbdf3a9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4266,6 +4266,8 @@ bool ttwu_state_match(struct task_struct *p, unsigned int state, int *success)
  */
 int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 {
+	/* Instrumented callees would leak coverage into current. */
+	guard(kcov_pause)();
 	guard(preempt)();
 	int cpu, success = 0;
 
-- 
2.53.0

