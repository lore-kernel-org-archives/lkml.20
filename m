Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954945304BB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702224; cv=none; b=RuDo8gxepiKbcW1w4WUYAn3OSqoKpD6baiaznuywVm42/qb05lTa53Ksu/RAE0oiXEudCve9/J6xNfek9BmIvW1pweCYK2SDs0WHB/58DtkPapbv13ZQKtVRmhDN6bopBDmmI5u7il55JyxUHF//piMzDo1MrjDEPOkhT9hhN8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702224; c=relaxed/simple;
	bh=9eonOuXlSQQB3Y2602KC+0v/4Sir9GpsZC1qHWJlG3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsAovtR7rKrD4md7dGmcMrJKtXQsasO3z272BrI4oHc2vmkQRV6FpKDPDvqw19fc4v5wyJSfCL/Y0uTpd9JC2LVQIV0UX+LQ7H/xrhPCIX41VumLHdI70sj/ZXQg3pGl0m+muxKcOJeEj5fpQ62OoNRK9172brnYrVnkH9W0QnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=SQD1EBjl; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="SQD1EBjl"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab4620ecf9so7173997b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790702222; x=1791307022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIjCkz8UNvA2qIG9dz45tzUD6Rja3Nkqz84a93dGRfU=;
        b=SQD1EBjlv4XoWaGABcvXaPK2dC61YMStmF4HH6asFVT1DivmbHU01hP0ZGhNLmAdKR
         XgnC7APbnYs/gVjOSDlBwJUoRPpUnRDjm0NAt6MdipmtxXLDJnd7z+U0FHiULwsCt/yP
         L4K5YYyeRCFmomgjc2KNjyLi7ZU6yR2e09G0/9mHZTLFBN6aRQ39Qel2Hjbnj4j7laRC
         l0rT0o6Bu974EIWsYDn4mgvG/BMNBxmrYr6axcMA1DSG0DNQgF3w+kCqfZHJyrxuCB4t
         ZnrnwvcamAb+20cRiXtdkPFokmpog5HphLud6YzwCVMDWW/93byU1iq0Yyu1eYLErrQo
         Ujew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702222; x=1791307022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIjCkz8UNvA2qIG9dz45tzUD6Rja3Nkqz84a93dGRfU=;
        b=aGrXqeKT7OwnRTeKA0ZE+nq0gVvriSlpFxNNY/s0XblSqzsxuWpZPlqHlRewWKD9Ao
         LgP0HuGXvwzb4j2plpzFCTgN3CQwIzNM4dWQJSzS2jH7AlvqDdhHbv/GymGEdWobeW1F
         kATVI9WOoKjSkfH14UYLw8Q4UrbaIerWKdl9BELu3UE8b8ZSOy3gGRo6x64vtOBKEnFs
         mmSlXhQiI0nSCdr3WUNlGpP9MpfIlB5+BfpdVzUzvWAyoHTXZkc0YHtDyANHeMtjYYWe
         e2WIvhGsB8I8Qpljw+wHAwap+WPRUBhTUuNQpvFZt/VqKtIAwCFHMSFRpNUPqct2eEOu
         sv/w==
X-Forwarded-Encrypted: i=1; AKwUvBxDL3IHTQYxSz6+Rqu7spykXW7UbWtms3zuB4zYiY8nalqC7GIlnRj8cmf8Syp866T4pB1T/jllpATz5U0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqiRhqd9g+/BSWhr+tv36u6DavOTBiw2/TevwGvlpT/v33WlWQ
	wOHBdFIu85OpatzwSaK0hZ3vz2Da8WZ3ekxbuqYVYm0yDAsvoEHD1rqllNH9wOW/ecU=
X-Gm-Gg: AYBFou0P1ggNgMH6vtEPRLcFtYao295ug8u6IreKwvXtHhvo/sJf7HDQF9tU9tCD3aN
	jmaoTw8h32dvShQr+kWyCzh0DBAHbNvVMz5irO+fkZh2Etvzwz48px//zqk0KAEqF1baO6AQUYo
	ZHA2QCbnNRmMT1C4RGjWaE+MhB+el4h3AdTSAK17dk7dLTHbdhNK3dF22C+XyECcepjtoqrIXfy
	zxEzJoH3+AVtvKnQAiyfyUxcy7jA+UJAues54kEjkbg8ET9+8tXCwYtqSKTFoFUCyOYdEhPU2Lu
	zbSF7M+ShsLKjfOLVY9O+HVHDrBrD3Qmi/pey3uM7IOu4/fOgmcod4N54cLn41yinKsZgb4374/
	MTRXbtRsNFobOvsIMjSoGsal2yregbll87X2xld1gNfMHq3GzKQi/xrBnmDokXDZseyE8jrkk5o
	N7affRTLC6v6VpEGwSnjAMaiJQPytCV7XvvMP9n/d1sbNsqeF2hN6W+9aKdC4hbDhhyFRKbF+5w
	C+3/AiinXAXOmE=
X-Received: by 2002:a05:690c:85:b0:877:6e47:19ab with SMTP id 00721157ae682-8a6464b0faemr71025527b3.30.1790702222256;
        Tue, 29 Sep 2026 10:17:02 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f54529asm16493985a.37.2026.09.29.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:17:01 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:30 +0000
Subject: [PATCH v6 13/14] rcu-tasks-trace: Assert no reader is held on
 return to userspace
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-13-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701682; l=2562;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=9eonOuXlSQQB3Y2602KC+0v/4Sir9GpsZC1qHWJlG3E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGoTKCIpQWSPmmHIgYeGWzOz9qPWtP0J1Kgb5uyXWGZow9k+9qCcB70+Tvs9+2GkLFx/pkl6RW8
 XzN5ugLYM/Aw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

With trampolines now taking rcu_read_lock_trace() open-coded from
assembly and JIT-emitted code, an unbalanced reader would silently
turn every later Tasks Trace grace period on that task into a stall.
No task can legitimately reach userspace with current->trc_reader_nesting
non-zero, so under CONFIG_PROVE_RCU check it in the generic entry
code's return-to-user validation, next to the existing kmap and lockdep
assertions.  Compiles away otherwise.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/irq-entry-common.h | 2 ++
 include/linux/rcupdate_trace.h   | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index e19b41ee6b18..bfcfa2ee9498 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -5,6 +5,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate_trace.h>
 #include <linux/rseq_entry.h>
 #include <linux/static_call_types.h>
 #include <linux/syscalls.h>
@@ -214,6 +215,7 @@ static __always_inline void __exit_to_user_mode_validate(void)
 {
 	/* Ensure that kernel state is sane for a return to userspace */
 	kmap_assert_nomap();
+	rcu_tasks_trace_assert_not_held();
 	lockdep_assert_irqs_disabled();
 	lockdep_sys_exit();
 }
diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
index dcdb11643496..fed84052bce2 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -214,6 +214,12 @@ static inline void rcu_tasks_trace_expedite_current(void)
 
 unsigned long rcu_tasks_trace_batches_completed(void);
 
+/* A task must never reach userspace inside an rcu_read_lock_trace() reader. */
+static inline void rcu_tasks_trace_assert_not_held(void)
+{
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && READ_ONCE(current->trc_reader_nesting));
+}
+
 // Placeholders to enable stepwise transition.
 void __init rcu_tasks_trace_suppress_unused(void);
 
@@ -226,6 +232,7 @@ static inline unsigned long rcu_tasks_trace_batches_completed(void) { return 0;
 static inline void call_rcu_tasks_trace(struct rcu_head *rhp, rcu_callback_t func) { BUG(); }
 static inline void rcu_read_lock_trace(void) { BUG(); }
 static inline void rcu_read_unlock_trace(void) { BUG(); }
+static inline void rcu_tasks_trace_assert_not_held(void) { }
 #endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
 
 DEFINE_LOCK_GUARD_0(rcu_tasks_trace,

-- 
2.55.0

