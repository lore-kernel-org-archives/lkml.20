Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAA4DB547
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226717; cv=none; b=h0PNvoHrPjH0G2wWUzMbzBlBuxWwlP2Zv3MMRwy5ZRKUpTmfBVTgQZfj4a+tUewM4c3q9b1xP8zcplkqcGnkGd58eq4TD8bJkooDP1q/btgDW6Knsawl5SfNBDS7GtVjJxSEQ4unh2vN3H4dqDQfFMgJv4i2MTtLTa49m5G/510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226717; c=relaxed/simple;
	bh=u/B9IvaEgiAIw9fjlzqtULKm2yBgA+iavYEM8xsWyAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iz5vKWQ5UCEEuJXn88js+nqKC59y1Fn5xOj8Js09chVVHCcYHvmS6Lq8tXImstv7GaKfhK1Wq9mUdb9zXWds3RbG1uGv2NmaPzSF2wtjnni2mP2aJ/1gnahUdGkWHAIx+8oNsJ3XO4zs2YMEwWsnVpxJU8ezC5ctBpk04ZCXvdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfIPZGbY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfIPZGbY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ff680331aso21428015e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226713; x=1791831513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwC+jUdtFWGLh86kjV+y4udd2rd2bSTuCpSQzL1jA44=;
        b=AfIPZGbYlH9/+AzmjFHiaYh1Biq3dIDgLXACcDCCWp6GBT1G6pcXRORIUjaLq6JmAt
         kU6nf10qxVi8xVEPRDrXghT+t6Ubg+JU1HqrJAgcX+yEwI/hOdwqIDc+G1X91ot4J5Xo
         ICCDtnNGHv8WmSGzzhL9QYxlvUWhAQhFwnvJx6uB0mb9qq9gif4hwg6TE4DGuN+TXa6H
         SlPnaks1KxWj8lB3N1gSnfy5v72QL34mbeMgC7uFtZ/A5x9ClIfOBE5xxecpuEXQDdPA
         umoAMiSTqeSL1XW8CRFV4JT+3VjNWQAzvtOpeMMELOx3tHyncMY8ECm1jrIRH84T2A7C
         6B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226713; x=1791831513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwC+jUdtFWGLh86kjV+y4udd2rd2bSTuCpSQzL1jA44=;
        b=1T8mdKzEhttpwoGsB/QUqR8q7+LII/aiKCLJk/dbjOVoEGtC7H74JLvgSkNXlHuzWf
         ZF3Ojau4LJmIxQ9xPUjTyFrOymTT9PRdk8D9GKSLP3TlguwsiozRoS/2jXH2VSAPqMn3
         j9mtuAWL3SCi51L+z9Khoe2qRWaxQxAQ4i/WNhQXz/z/CEzb7JrZ8AG2NqVBu+7bDaF3
         LZYrMoTzd837itqhttQJZs/B5ZQmu3145Kxlle2Gi72uMNLzBbXt4b0Pd2Qk/D12LDcj
         EqJKFaA0Y+tJnPEPdo/VfN442DPutIUf2gFM3H0Ek0HwPiRtIoaNpSGdNZLTXQC09eYA
         7Byw==
X-Forwarded-Encrypted: i=1; AKwUvBwxsfVmHuFrOMAjMSQ7ZgI7xLwz1YYAFXcSzhbCpuYiQTJGRkzHCESaLfKbMJCQ9YUpx09JRYnDCJdoS70=@vger.kernel.org
X-Gm-Message-State: AFuF++nS3P/ZalHm9uBWXJNs8y4ZwQJmV7T2TiREmK1qd+YIvzI0UVvx
	QzNC7r/SOZOXCG7sXIC3PNgjBf6Xc/KXjOpzKS+QAJDfdOb6d5tirigE
X-Gm-Gg: AYBFou1/WA5OhiKlyuWsWNAfIfIJ4FNrOsYGhjFYg8jBU9/p3DCaqiMMS0ElQCbIshM
	cLSSuTpLVORRToVLb0sEVbJS8EkmeZWkljTS1sqohIbGv+Gap6YgNNJWexpSxDnGvUUOwuN30Ie
	8cpzT4CrdZoNDVmItU6UbpojFmt1qhvYiX6PEF1zgt05ZOEcgOJ/JCSY9d35KNTkFGW/Sb3ahUE
	1RC1zbmMHF4CT5xidApHZNSrCMerxJYkRNBCNvSQ5aq2j90PLhJKYctYMcHHeeZHM4X637/m2WQ
	cNuUaswwaxQyq+JKVNyNKxIwSSQ2yJbe8D8CW6wecoh9ozmA0Vgn0nKX0Bk5tND/GRE3MWYfBQW
	x8B8mRen/dXcXYtQZP1g9qXxXxJWafj6vPoZ1l00UF2y9xsLyA2AWmZ3tmGxN6vDtFLBztCoEl/
	Y6rO48o7yv9sxNlHohKnwPoUjR6lXWgi0Hl+5UKylyJYgos2kjDh6gT51ETfn/yGsPkHM7Pz0GE
	diBAE16U2IleABMQjevX3coaxvzMJkbeF6+w96vln6PMB+jvoebqXsQufmBAAGWNIXpimS55X+g
	HYu5s6vXLsm3X9n3vkIv+cUWO+2K7XiHwfU3swQrmKKcWPdgTMsk3iLIA6QXYbyc5qzvq5ysg1s
	YJA==
X-Received: by 2002:a05:600c:c44c:10b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-4a1680f7b15mr98951035e9.22.1791226713432;
        Mon, 05 Oct 2026 11:58:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm281196795e9.2.2026.10.05.11.58.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 11:58:33 -0700 (PDT)
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
Subject: [PATCH v4 6/6] sched/core: Pause KCOV in wake_up_new_task()
Date: Mon,  5 Oct 2026 20:58:03 +0200
Message-Id: <20261005185803.39170-7-kmehltretter@gmail.com>
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

wake_up_new_task() is built without KCOV instrumentation, but CPU
selection and enqueue call helpers instrumented with KCOV. During a
KCOV-enabled fork, they can record scheduler, hrtimer and clockevent
coverage into the parent.

The paths depend on runqueue and CPU state, so coverage varies between
identical forks. Pause KCOV for the whole function, extending the
scheduler exclusion to new-task wakeups.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f19221282278..888460c97952 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4969,6 +4969,9 @@ void wake_up_new_task(struct task_struct *p)
 	struct rq *rq;
 	int wake_flags = WF_FORK;
 
+	/* Callees instrumented with KCOV would leak coverage into current. */
+	guard(kcov_pause)();
+
 	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
 	WRITE_ONCE(p->__state, TASK_RUNNING);
 	/*
-- 
2.53.0

