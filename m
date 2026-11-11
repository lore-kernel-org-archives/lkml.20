Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397467;
	b=jC7oOURfSMGKTDojn3ThaSQWA7WjmgYMOr/4RlmsinOMOp3GQ7aM6VkiavSIrfx0EH0F
	 EUrV8SeY514k3Vs14WsF4g9qVuoCBGY4YptSpLYElQjA+nG4CAIN0XqrQz9sl3XCahlXg
	 CQmmrUykjg/QUJ1n8Xs/5uXLV3klPNBCIZFW1bPcEguwsE0BFRx73Y+z9mGBCGVEjQcA9
	 f5k/BvB2jzxpICAs0jf/qbvuC4n6Pagn822l+Yyr/fUNuwhyQzmkRnStjhylA6TGexgsm
	 oceErKs5yO5TB66Zs0T4Rpgk+TMaACuJYawi/ah+OMl9QpXWH4gBv6oJTiWisSB8OQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VfBfIbNifGJkAf3qRXHsNSk62urVL1juKkiUmxuL6iA=;
	b=Jr+1ILfDpZb3ujIBXTQBZiF2KreA+X00U8gsnlO+Jb3JqsbYmtJRo0ggRYt4Y4QwsWy0
	 qXM+Ars8M11zZhwUC9mWdTaTeEc6BsQmeOOPGz+Yc0EgTPU6mHqsQ6K69SSA6Hc96hGib
	 Lxnipw7kfs6yrbiJ1uUauLS2UVEapaZLZaLscWN+eHpC4hPf/FDAoX+Y8d/p7xkN6xZrs
	 4msZKsCnPPxylPQbDbOJmqQUcI/qVhJNdtQbmf92BbkkuCcxvFTM8YPBMsSuAABOkmwjn
	 c30VFaCG6Kd+VWTdkjmWJQ/G5qoNQOfG+cSnOAMiClDEJ4Qf4vn5s19YesHMyOAIkQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g7TuMAFi;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2927606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2927606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g7TuMAFi
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so24010715e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794397465; x=1795002265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfBfIbNifGJkAf3qRXHsNSk62urVL1juKkiUmxuL6iA=;
        b=g7TuMAFiE5gnsBrZtwjbEAiYQVNxknSgnzVnyiVGVYEQJY6pqM3jA83zxiiclzrB89
         cnmtHpfvyAJr4X0Rva1XwWT3t309hRjE2sKUpHmg1bYWDn46bNoogVSp7/N+xfmStB31
         GZyXPzSXo1omidfk7DrCQbQx++7sgVatwf/eRW1u6jzK6+HIc2IbbNHBZUfXRLiPd6yi
         8CkhzxeOiDA5V3NRgnN8g/Lu505+ZNkHnEZdWiKZKd/fgtYC59LwBd+BMxI1aGmusf+D
         TG66o7I6x98rW4atSQchZrUbU+ER2xNmPVjxemM746X8qibnrOMfOyv9HAq8GXPlMla3
         oxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397465; x=1795002265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfBfIbNifGJkAf3qRXHsNSk62urVL1juKkiUmxuL6iA=;
        b=JimnWLJCDs+MFuEimzgJ+NzW1/jWCUmD4IY5alvyIti1KGc9wqHReR16iUk53irM//
         L3UeKFP1X+mUpXqxS/7oQs2SC69KKPN9bU10OZNOQjnqDB68FOp5K0tefPgkWeYzxYXY
         i2cblVQIPMC7sNFS3AzhsRPTEkAy+Md8ZWTTXBFZ2N8PRRJ2uwGTTDFF+UQdwEWwtXNZ
         gwIL1d2EZDD256GJ3xMcukwe2i4saYBzmMK8mkzFlZTqeiHGWcW3LMNd0hE8Op8s+xwy
         OYgmVnUubVfN8kKyfSGOnhUHNW+GjZ3c5axKiQVOvGT14ZQpkDGmpHCPKyqTm2qIM40n
         jFrA==
X-Gm-Message-State: APuU4Z9krQxLP28LuEuKjQvIFhoBS7oTDf11DbgIZIirRUhYVD15CS94
	YE1j4nF42PziXkSuTcqeUAGjR66/RlJcfw4Eoi/tZM51kYXhuCmZTw40f0SfY+ST/7tTN8x2Trt
	ONgoMkps=
X-Gm-Gg: AYBFou1e694Ll8/j3nwdiECaNf9Um3y7KtWORwk4pYcNpwdJzIS7LeZX2qHCSoKFFXs
	Dh/Gro+9GwbKT1zdC21qjvgkxTgWto5ZTb/hzoe07WSzJ5NKoknbqeEqTTuRfRvoqgjExjVR6Su
	xyFaXEqpTzTjqZQt1ax1ek+8fgPLu0wtKVwFTmX1o5GGQy9C4dpHqNJobh8z42yMQMdKN2m1rpu
	DDwpKAJj98ReeZFoOGIha4QF9bYj0xnruk+vqZrC6W8tByhgsg9fFL2G/1J7Rw4jcm9TMBOFse8
	Xf7Pm4CaKxTb84USiU/3KOL4AJxTNDzNxpuVpOZofytkEwySEhtPrcUOmoFuJsobg5PJjKkeJEJ
	ranjuNXOL4X2aRu0lk1T37A5mNWqQ5CHsmKVHPVYvju6hV3BoswHguCS7WnMR2kyMfRnLOv8YO5
	rhFTO0ZYtJTkSBXdjqC8P5c1gjlW1RcvdFfVod4e+f+Nsv1MroOh6XHCIe8bnm8NyHT6qYCX95f
	BYp5ZioafYZoxB7FYkws7cM1sZcg5H21HMwws0aRUVjZVermJnQGepQJXkk7Jo4H1zzZ96zPcz7
	xWI6cq7m4QMGjRc+G4ilVfAI0+3fY+Vf4vBQdqRUUFkjOWzNJAs=
X-Received: by 2002:a05:600c:6308:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ba09381867mr41762875e9.22.1794397465359;
        Wed, 11 Nov 2026 03:44:25 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm43238545e9.1.2026.11.11.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:44:24 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 1/4] tick/nohz: Re-evaluate the tick on return to user space
Date: Wed, 11 Nov 2026 12:43:47 +0100
Message-ID: <20261111114406.346953-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111114406.346953-1-marco.crivellari@suse.com>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
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

On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.

This is not enough on return to user space. If the tick is left running in
the kernel, for example because a tick dependency was cleared
(tick_nohz_dep_clear*() don't kick the CPU) or a timer that kept it
running was cancelled, it fires at least once in userspace before
tick_nohz_irq_exit() stops it.

Stop it from context tracking right before resuming userspace. When the
tick is already stopped, the common case, this costs a few flag tests on
each return to userspace.

Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/tick.h      |  8 ++++++++
 kernel/context_tracking.c |  8 ++++++++
 kernel/time/tick-sched.c  | 24 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/include/linux/tick.h b/include/linux/tick.h
index b121c5d53e30..8bfbb053f4fd 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -269,6 +269,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
 extern void tick_nohz_full_kick_cpu(int cpu);
 extern void __tick_nohz_task_switch(void);
 extern void __init tick_nohz_full_setup(cpumask_var_t cpumask);
+extern void __tick_nohz_user_enter(void);
 #else
 static inline bool tick_nohz_full_enabled(void) { return false; }
 static inline bool tick_nohz_full_cpu(int cpu) { return false; }
@@ -294,6 +295,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
 static inline void tick_nohz_full_kick_cpu(int cpu) { }
 static inline void __tick_nohz_task_switch(void) { }
 static inline void tick_nohz_full_setup(cpumask_var_t cpumask) { }
+static inline void __tick_nohz_user_enter(void) { }
 #endif
 
 static inline void tick_nohz_task_switch(void)
@@ -302,6 +304,12 @@ static inline void tick_nohz_task_switch(void)
 		__tick_nohz_task_switch();
 }
 
+static inline void tick_nohz_user_enter(void)
+{
+	if (tick_nohz_full_enabled())
+		__tick_nohz_user_enter();
+}
+
 static inline void tick_nohz_user_enter_prepare(void)
 {
 	if (tick_nohz_full_cpu(smp_processor_id()))
diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a743e7ffa6c0..347f99e1880f 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/kprobes.h>
 #include <trace/events/rcu.h>
+#include <linux/tick.h>
 
 
 DEFINE_PER_CPU(struct context_tracking, context_tracking) = {
@@ -466,6 +467,13 @@ void noinstr __ct_user_enter(enum ctx_state state)
 			 */
 			if (state == CT_STATE_USER) {
 				instrumentation_begin();
+				/*
+				 * On nohz_full CPUs the tick may have been left running in the
+				 * kernel, e.g. kept by a tick dependency that is now gone.
+				 * Stop it now rather than let it interrupt userspace once
+				 * more before the next IRQ exit notices.
+				 */
+				tick_nohz_user_enter();
 				trace_user_enter(0);
 				vtime_user_enter(current);
 				instrumentation_end();
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c6d86e4da8a9..645dba919386 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1071,6 +1071,30 @@ static void tick_nohz_full_update_tick(struct tick_sched *ts)
 	__tick_nohz_full_update_tick(ts, ktime_get());
 }
 
+#ifdef CONFIG_NO_HZ_FULL
+void __tick_nohz_user_enter(void)
+{
+	struct tick_sched *ts;
+	int cpu;
+
+	lockdep_assert_irqs_disabled();
+
+	cpu = smp_processor_id();
+	if (!tick_nohz_full_cpu(cpu))
+		return;
+
+	ts = this_cpu_ptr(&tick_cpu_sched);
+	if (!tick_sched_flag_test(ts, TS_FLAG_NOHZ))
+		return;
+
+	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
+		return;
+
+	if (can_stop_full_tick(cpu, ts))
+		tick_nohz_full_stop_tick(ts, cpu);
+}
+#endif
+
 /*
  * A pending softirq outside an IRQ (or softirq disabled section) context
  * should be waiting for ksoftirqd to handle it. Therefore we shouldn't
-- 
2.56.0

