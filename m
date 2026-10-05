Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D9F4DDB2A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226713; cv=none; b=FbBeAhEh6ZbfpTpmf9701/y34gcqRu+o4GqCbnts/D+/pCBKf9WOXrPSEqslDcVc9z9sL/geDJyPfene2gs1cnNW9i81w/+xwayR/n+qrfWz0bVegMHBuTU7w1pmO13ZvCSpqzruaSyORcSPZ0FVDb3h4mLnMckxp5wu6XLVX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226713; c=relaxed/simple;
	bh=uWLJhE4gif7RZ8mt+wzYrxDcQS3MG1MxrDZwbp4qFO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F43E+j/VLS9b6exN4Q64ciuNTOHgF1D0jq+h2yASUs9qR82Z99PK/5VXYw4fm2jJuHsERMEfYFzURC19iUXReF0s/XAKbOJNL3h/UBu6QbNQ1GvhOQR6yk18f59IMp2twRCtMk/FQJzv79mmXG5IaPejJ1flSUhwGnT+PzcrVjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo7ene6M; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo7ene6M"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so1182775f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226710; x=1791831510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBT8VnKHbqUAHOFreCce12tKQFcAcgcsqsShePksoqw=;
        b=Vo7ene6MNmTf5GRX0WzbskPTTa4wd4NB0VBABCyZM8IUdQHhKzlwGlU1eggnRelThJ
         SmHpK0fAc3JTJjBuzkxKcJtG7TXg3P8t3+DZwmphxrjdGrIu/GMNHcQrHhoeDnYUrH2i
         3HPDj/q+Km69gAeIIUprsksk7WtsCLkZvRboJvZrVSIZB4YjvyZRGQQSjZQTLVpLBxVG
         l+3edu1dhMFE2aHxqcBL/seCrWGI/Sou92lICvPtkYVtlNl4tgf7dr3/BWlc4Hds3RO3
         v+MNgu/ggvUyeQvGdWOsorGqVbXXJbgJAQCmFBEsGkf3qPnH5USFFGjI7zn8cHYu0JjJ
         1Xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226710; x=1791831510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBT8VnKHbqUAHOFreCce12tKQFcAcgcsqsShePksoqw=;
        b=Sa4GuVIeO6Hokx8Cq+3RTUN18skooytsRJKau9W/t1fKYYn/NH3ERSbnvy7e8oCoLA
         HC6bEziVbASgbH0WKm3gLsb4WFxjxQKmYMdO/H/sNQzWCEGjb2Ld5aoUh4Y8LWX0neUV
         j6MAebauy1ktfOIXSfo47f3ySVoQmGCXFfC0rjIpKb6GyOerrApCVReIudyGntTsL0Tx
         JrHQPaGFxQGI3uIvOhJRWSy4+WfB4YhnI6W2VduVmS258rCjqzgc8ji2c4gPOP3EuGjj
         TAeWmXr3XIBVO+JPPDEwlQdkCieMXIGyTXozxLJ3cAswv9Q50nDV+AqL/gIg9fBWVfO3
         LGvw==
X-Forwarded-Encrypted: i=1; AKwUvBxVsIuyPmJ6xSOcxtIMO/7wLcSNE94KH+kUrZioyH9Ca3iJwYlgt32XWYBV5G+7sSNTteqUU7jMNoal9is=@vger.kernel.org
X-Gm-Message-State: AFuF++nSEzLkh7Zu+aGN17pKqpjQAOlqVrAWb1FyV/2jG33e6zIKjN47
	wygBQ3CS7t2UdLz57jht4m/V/FwyxY5w1z2ks+1SmxvkKgaBAUVHO76p
X-Gm-Gg: AYBFou1o2T8nGmv64ccwTjIkwWEmNy83UVvu1cnAgHqqIeyYluQ6EUpPTtVk9qLGMTC
	qGHWaYrM3t00kTK9xIPow3QzzwhrpxF8RFE1x29TnD6sG/izxisTzPcU26XrygJfwONu3lmp+oP
	HcAH1/+pinhMunuOfJ2t84ZsvVGaZjpkGPPlmmdEaJugTLtCobN2llIVJ1YV50K0zBEaoeQJQBB
	vjkMT8gju8JT1V2GfgQAUY4jruGswMqpcWE8DHUlhY20p0eSkGGG4b+jbYDDZKpb4VTxzV7QIHQ
	DCuYqPapfsFpJ6j62g4NtBckg4fN66yato17y2aFOLkuZOKgzdrzbW1B8xXJkFAZjQzg7fDL5W8
	aOmHFJLG48bMdeYOwsPehIUP5VAfiz7/KHAGqlPu75sp1w5xmr/v6C7kO0Gueidb5NFwLRZpX8i
	whQysHh+1dIiwEOwGJQAZJgcz9vPfDBfdfe89f5T3SxneDHTEG/dk6rs1zTWwFmipu9Z2JJGu08
	GQCDB/Ahj9FUKeFmDaxNvvNajI9fFxORg0xAd8pJz7JFxbgPpiJDnIIGL4ADMg1xnfxgF0Tl5ij
	2daCw8HhUpSIL/eU5ceFPNYPrabcFWJphyqGaKHGb0x90sonP8O8vHJXzFfcWWQrGkto8oU+z/+
	Sgg==
X-Received: by 2002:a05:600c:37cc:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-4a1772c5ee2mr27447175e9.26.1791226709978;
        Mon, 05 Oct 2026 11:58:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm281196795e9.2.2026.10.05.11.58.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 11:58:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <brads@mainlining.org>,
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
Subject: [PATCH v4 5/6] sched/core: Pause KCOV in try_to_wake_up()
Date: Mon,  5 Oct 2026 20:58:02 +0200
Message-Id: <20261005185803.39170-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005185803.39170-1-kmehltretter@gmail.com>
References: <20261005185803.39170-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

try_to_wake_up() is built without KCOV instrumentation, but it calls
helpers instrumented with KCOV, such as kthread_is_per_cpu(), CPU
capacity helpers and SCHED_HRTICK arming. They can record into current
while in_task() is true.

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
index 419dd98645bd..f19221282278 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4273,6 +4273,8 @@ bool ttwu_state_match(struct task_struct *p, unsigned int state, int *success)
  */
 int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 {
+	/* Callees instrumented with KCOV would leak coverage into current. */
+	guard(kcov_pause)();
 	guard(preempt)();
 	int cpu, success = 0;
 
-- 
2.53.0

