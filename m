Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057457;
	b=aWtEb6uF/PMvoAR+mr//CRs28qFXwOJs1t3C/Oro1Wbt6pc3i/muRGjfRIW0YL2CL0dw
	 Dj2/OqRi8yulb99C8xvNrg//mDISem0n19AkospDqNq1UxlqUpHhY/hAF1IQO9mZy8ljk
	 oW3xNWbkeocfG3vYhJyIYWvggESS1wjLFTjx2cqRGk8tcI8c9S1f5ZX5dc50ZeTm2Idgz
	 si1hmA816u+K1zy0RGmcL80AdDOpRLuJckLk1KMt3re4A7IYZ172uAjG3pfZu/i+b99CI
	 7n6nPsXyqm2P67gM9g7CqZN7eJE7SmFIHZ2f52c4295KXdoCT9pXO1U+vM0B5v/BMsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ItPMq+0SKfbZaBB5rlvcWbCpgzrdlSr6QqqHBYde7Y0=;
	b=PW7ypZStGNLA9CP9WFmf9Kj+f4098BujtMqZWfePR/JB4S79mZopTsys5Jja/YoIW/vW
	 B0+7Mt7XdzZncvDQorBTteRDUidkHSgHgahTPjPCNtPjWCV2QJSEBpS0HksJAGtksqsTT
	 8za7GHVqo6SuKOXKnTvyDerbA9uzMzKQLFNQXxaYYFzgRSX1TG91T6JfFf4rFq/dTNmHf
	 B0TtXISWie5dQrdZraboKNyUJtSVjsOmHc5lAZ4djoZV6ldY9Fwi0sVYncPRJd0k4qfEw
	 WElsluOL4yc0owxjk8LjOhr0424vUFAORfOjiiwxeO4pls83GdSbDjSgSh2UJrpVOrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUmIkUMP;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B374606D823
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B374606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUmIkUMP
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4435595e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057454; x=1794662254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItPMq+0SKfbZaBB5rlvcWbCpgzrdlSr6QqqHBYde7Y0=;
        b=SUmIkUMP0C7OdI9O+va36LlYpsJEMCDGmmIxkT1S5oLMMOnj///GwPfGrEJ5zRTy7t
         hz5NI4D/2O5VdB0WsDE0BtvLl085u2GOnobaZ7o51Wzjnuwx7MHvxExt34ByCWRwlo1Y
         Fcpm6HXy3VQPPFI4XixmVfS4wgvPw+ghZhLE9dQEWhBQwlXoS07khH9kvh+rhtADfa/1
         HvJZMab7yb45BjDPZHqJpiGi5kA17iuQB39gJQovC6S6UYf2uEdecEqjZxx+Uw147uuv
         oL8JoS72FjfYtMBoeqErxCVvLe7xZ3W+usjTbPj6lnknTXKHDDRTV6Z4q9ADGMsXCf62
         OadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057454; x=1794662254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ItPMq+0SKfbZaBB5rlvcWbCpgzrdlSr6QqqHBYde7Y0=;
        b=CZ1xU6SEAAK+lfd/7ZQrtClAsPiXdokRt7SKzy443ficpJxMTjvappr0Edao+yUQyp
         ELI84zLxwqbi8xbJ1fCpVA3a8HW+YICE9TfB+gk4kgFfRGNrN4zxq8egdIcD+Qs0xOl8
         TsDUg5VGSNa1begpi3vsvjEAulyniclZjrUecsVdwAKPCGlSLPYgYhUdDUO/lAY8akqT
         DRigWYsKDYJkWL7cdpoMy1uOpbPlcWj3FmvY2kpraMMrm8AVUEwcvVOnH1bcqYx2ACs9
         H+ltwR7o7/eAVT/zd6ArIbLAyUf39Gjc2btrDvlZzsVjs3UAxOWY1HoqjRJFkdGK7yok
         kobg==
X-Forwarded-Encrypted: i=1; AKwUvBzpELwhzs5+7FyMGr960bCg36bjVu/tSX98CZ6GoKHa/FsmB3T3QD83kwUfattwEdSiFqkTr/qaG/13MLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZDW7vidLfj0YL7jqCsAeFoYTI6eCC7IoOkNzf78e0KM54hrCT
	mo45pboiFCaNQAajzDZlal+foPudp/JiO40gwQM+AHjbh3LfJVk7RKFJ
X-Gm-Gg: AYBFou3rIxWrZukf3XzRQrbsomlKWVW4fkKwDOS9cW+65q7GaMW2c+rub0wncyYjlIw
	lovL4bLATr11xN9pQrEr+erBvvvCZHLylMnUJoZofTVckfnNQ+sJ0vaeA/LZfuUav+bX/q8bQ2U
	zo21AedEKKKNts/C2RxPASIrS7Ja7t0nmNbU1b/9WDg26m4aoHKAsp6GdHj6vibSmxHvWFQUb4Z
	kYZRokf6jMUIJGbyQ+P0tpFrGO2Vo+ku/d6fjUxcy6pdppxvxbu3K4azx9T/5OqJrqXZCWu0/Ot
	+IuxdU+lhUfd+51gePyoj5FYZ7BRvbvU+VdJ1ap1D2xWK6sh5inUctbafO/UZ94uGdBotJGt7F4
	cm81l+Bls/LTm08+B/h+KTiJkVE8yqvsgJQyIOXR9QZs+v+sxUR0KKzOAGzqV0voID/gcmgtvwg
	d1tHFepnM8ROxawBfGVxawjJsm4wAeVlv38hlZi0UA3NW2tmNNsifJAbX7zYA3XT+PGpVWQMD6C
	a1MxfHSntu5v4Un3MKgxEwPgC6sB7RoK4NdA76sn1Lr09ntOF2Sz7u3O44/PPoFYH+djhfkvLoj
	lJY/Lif0cr5lKIQB2WE/MqXcm6ELikOkXvR+N1RNgq2nt5+12LnGUJnISB9nFbsBjtxg1UIVeZZ
	yAZkgV+IGyqbL60+XeKs4NGy7wuQgflxeOQM5jlgeLPWdoV9uFitmbMetcwwfsw9aue/htthKPR
	Hgu23GuTSjqG2Q2y9q7QsQeo5B6QapK9w=
X-Received: by 2002:a05:600c:4f8a:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4b819f51afbmr34182515e9.13.1794057454331;
        Sat, 07 Nov 2026 05:17:34 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3279f9csm65132675e9.8.2026.11.07.05.17.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:17:33 -0800 (PST)
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
Subject: [PATCH v5 5/6] sched/core: Pause KCOV in try_to_wake_up()
Date: Sat,  7 Nov 2026 14:17:09 +0100
Message-Id: <20261107131710.89264-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107131710.89264-1-kmehltretter@gmail.com>
References: <20261107131710.89264-1-kmehltretter@gmail.com>
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

try_to_wake_up() is built without KCOV instrumentation, but it calls
helpers instrumented with KCOV, such as kthread_is_per_cpu(), CPU
capacity helpers and SCHED_HRTICK arming. They can record into current
while in_task() is true.

During task-context wakeups such as a pipe write waking a reader, these
helpers record coverage that depends on the target task and runqueue
state into the waking task. Before commit feb5c9a2447a ("softirq:
Preserve interrupt context on return from interrupt"), the IRQ-exit
ktimersd wakeup under PREEMPT_RT also ran in task context and failed
CONFIG_KCOV_SELFTEST in kthread_is_per_cpu().

Pause the wakeup body with kcov_pause_scope(). Take it before the
preemption guard so preemption is re-enabled while KCOV remains paused.
Wrapping only select_task_rq() would miss SCHED_HRTICK arming during
enqueue.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1691eb19f31a..4bd0d5736ccf 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4323,6 +4323,8 @@ bool ttwu_state_match(struct task_struct *p, unsigned int state, int *success)
  */
 int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 {
+	/* Callees instrumented with KCOV would leak coverage into current. */
+	kcov_pause_scope();
 	guard(preempt)();
 	int cpu, success = 0;
 
-- 
2.39.5

