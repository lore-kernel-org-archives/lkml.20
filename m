Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501506;
	b=fbzjntm/jv/OIW0PupUAxXSQG/6xgQ6uiM7DKvK/U4XlAxP6UWrrBjC3gquIF5p8pdsY
	 SuAX8CE5rNwRUgEY/iAIfV6dbtWgGqr14ZWzfiwE2VtRRcj5rSAP1cJWYleM8JbHeMJKH
	 g6Fs25qk4DiUAeIxP2rz2iQRZlZbQqKpNVS6h7r6lmI+uBLxy27IdHtEKUSMZzxZ9NGJT
	 p5AaRTcsmo17RkqX4eio3NJ0iBCd4ZfGB7s2OtmL9rKj9V0mGGEYesf2p1G0fUDAP+5Wc
	 jebZfllBjpCkmfx1l9NzXQnkh+loy4VudlACFXUW8QOIoJ8gYKi6FR0DiU7SUiGAXpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rEUmTOrx0T2zoLe86TCgUxCp+5EVbGS2C6tn5MjcNZk=;
	b=uCCfG1yQHKPpzW5gOrquzCEkLqFAZcDmRhGjeJowy1ZKX6/aUGHgpSTNrkW/1NSU9t4k
	 B8C7jhfsOWt/P69CMF7fbl5OL+jiIiMEvhpdYbU/zYLXQtU//pU6H0BDwH9kBGepTuQ5f
	 0ceLU3WCr65isKh2h+TgmRJ3pGtDSHmAHNwrl6OmW1jRqP3mhqltcD6UZ0G/PvhGsuP7y
	 VEth9BE0CC5wAsXMRGEozkS4OpkPQPj6qXVzpd/Fd/3cXUqCzTwRqxtT4cWqvpzh4Hy0Q
	 B39aYWfkC9wVXV1ET5UOEJ3d2gXeybHBNdripQ3eRXj5bxkQYmtd3gHbOSkETGuo0oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UZ1omjEf;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A29606A8AF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A29606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UZ1omjEf
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso31827975e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794501505; x=1795106305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEUmTOrx0T2zoLe86TCgUxCp+5EVbGS2C6tn5MjcNZk=;
        b=UZ1omjEf6fLj6d0pZE6OEPGULTpeCuTNoMt/ggEkQC2zjb1MJqDqubRll2q89bqipo
         Egwj5jJknBJOeXf3fLPzPtpcX1yJOU2QU/weeK9sRhYCot48pFbOeR2Tt7YM49pmPGtv
         1IgFnTgFUPCy40HPuL6LzHl+8okIDKuXvO7nXkGT8ZkJrHVGFNYTQPvIRaNEnNYvkj91
         9B3fTN5aq1ci1qGH19BuMwApnQY36b7pELEnZ9jroWoyd/sKRqhhAWISf0WX1LS9Z1iu
         3zsy0vr5g0TTjBwqFe0tkMWBrMdfPwBDWrxAFVkxuP6ATd7vXgUQUuGqP/j6kMTR3ukW
         CxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501505; x=1795106305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEUmTOrx0T2zoLe86TCgUxCp+5EVbGS2C6tn5MjcNZk=;
        b=1IAjLhLk0oahLS5VxYZWrmpF8IvKksSKtG5S6sbVG6MoXq2K45PHZIEkguHIryAqVt
         C2oCJNYfQDk/rHOz3H6EREuPMlgYF3y4Ex89q0KtWSxYBUOldn1RKBjXQdSImuMU8bMP
         O3/Se8zVd5bNJHn5b/7TUxvpIUkw9QLpAze1oXqFCOGB/NN7v9FXUwbstpPIFec55oAP
         QOL9gBlTsk/xxKx0JVRoxAENv+hCeRquUzV1Kw5EN8/URYIscOpVVc2YMIqeatm2jWr7
         AuV+asO6qh6mD54JWmGDtxoydLStIMlP2DUVIuPLVA9H3RDVhTeXJ1W9+ka6i8EGlvpl
         zdoA==
X-Gm-Message-State: APuU4Z/LsVECUMfyUnKnF4bmJtLA46H1dzQ3MbM93930Hyp4NdR4VUlf
	TIDJb0GSNF3pODvGQq7RFzOeG7+ReEKrOa3myAk+jKFTMPT6aOCjLvZMx2FBtLwQ7YgcA6WnbnJ
	L8BPn5Ho=
X-Gm-Gg: AYBFou23hMCBzhPBc84J0zw45+/HlAiiCk7tVhkj9J2QlOXwtuHDVdbTzflUu2O0kQI
	TuY/2l23BYybSDWVIXsifg+RtCnTC2fuR8Vb2oly2ckmUdqAqDdOtmY1cj4TYPoeyG58AEnF3gu
	ID3svX0AjuTevlZ6d8Sgg5uMsM1JLvRCHVkXu6q8h51eccJtH5JQRkJpQElCMSGL3IfmKNSWRzY
	SGtjXd/y0i9Oxe2qkn5uu273ubyqJ1pOihlnEK9zzdLLH2b2aQPqqbGoxCVw/+b+u377pvp0UdS
	A9BWzhfCfLGz3ZJtPQNkk0jWS067wDKvs35oZHw2MyLr0FEYmyZ9A3VyAVO6I0BrQ515HzHYYXL
	3e9vd40rmHoqTDqi7Oqfy46vg8t5ucLvFI3xqTJvHJQrASKrzEei4vdZsF62t5N7+LDV12cKvsr
	9blYxTKRi8r9C54njNWRhPzNPMo2GxBL/8R/mLywcRSgaxObUCQT4WWmpaiHxLDKEySJ7UuZWey
	dOO3bUPHJRcWS/rae0oQlx8xYrsm3PBaf9oEI6Pn1ACbEkSqJZfRgHxS2z0OWH6VHvzPvS24WzJ
	mrF+MMp7YS3qUagBQmitR25NQvj+RiSiB91oQ/YRSzEyhg==
X-Received: by 2002:a05:600c:3b83:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4ba0935dbfcmr126679025e9.10.1794501504768;
        Thu, 12 Nov 2026 08:38:24 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm226827f8f.8.2026.11.12.08.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:38:24 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v3 1/5] tick/nohz: Re-evaluate the tick on return to user space
Date: Thu, 12 Nov 2026 17:38:09 +0100
Message-ID: <20261112163813.524336-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112163813.524336-1-marco.crivellari@suse.com>
References: <20261112163813.524336-1-marco.crivellari@suse.com>
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

Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/tick.h      |  8 ++++++++
 kernel/context_tracking.c | 12 ++++++++++++
 kernel/time/tick-sched.c  | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

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
index a743e7ffa6c0..8e898b34977d 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/kprobes.h>
 #include <trace/events/rcu.h>
+#include <linux/tick.h>
 
 
 DEFINE_PER_CPU(struct context_tracking, context_tracking) = {
@@ -470,6 +471,17 @@ void noinstr __ct_user_enter(enum ctx_state state)
 				vtime_user_enter(current);
 				instrumentation_end();
 			}
+
+			/*
+			 * On nohz_full CPUs the tick may have been left running in the
+			 * kernel, e.g. kept by a tick dependency that is now gone.
+			 * Stop it now rather than let it interrupt userspace once
+			 * more before the next IRQ exit notices.
+			 */
+			instrumentation_begin();
+			tick_nohz_user_enter();
+			instrumentation_end();
+
 			/*
 			 * Other than generic entry implementation, we may be past the last
 			 * rescheduling opportunity in the entry code. Trigger a self IPI
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c6d86e4da8a9..edaac8e7c669 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1026,6 +1026,28 @@ static void tick_nohz_full_stop_tick(struct tick_sched *ts, int cpu)
 	else
 		tick_nohz_retain_tick(ts);
 }
+
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
 #endif /* CONFIG_NO_HZ_FULL */
 
 static void tick_nohz_restart_sched_tick(struct tick_sched *ts, ktime_t now)
-- 
2.56.0

