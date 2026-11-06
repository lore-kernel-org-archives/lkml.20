Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981208;
	b=kX9KBjC3h7TUfKR7VXtrOVru77ED8aumMuPGGEmabMuHfLDdw+MsN05A6zZeshvuypDc
	 VZ3GFAn6qY+ivz43ZzyvvqZ7Wb7o3w30yQH5fjPaaKfYio4EOjMNVVGjnpKqmzF7CjxxT
	 z8AmhBQ9zk8JrZ85XlAXS9xNAjWiJ2C2KYvlEPnlhmjzn69kHmGF0vamDf27WQs7tjCRj
	 NOYFZYOcWNGYvjOf+DEmfPB61+j3vpieP5Y9TxMhSjUab+oenyaElYo9qPLQTts8bO8tt
	 AdH7/NljYL+mzSxh3P9fuFXHfF71gfWcGCNEa+B2u+l3nb6ERboUkiS7uNlaMJ13cdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=onZ9SvOpPE1mfOyMecXO+SiLHoHJEwR8kdJKa7U2R1U=;
	b=zq6wx2Nwrrsmgxvbv94D8k2iUBMqrtHFoB9QTqVJxgkZrqVXns6tXRf8SzKVyTsC2yyH
	 2oDtwj+IbBd397mq71XgKKNtTI3f1XdZKkBBsQrO6syIuvWLGyuta3E04Dov0JJxUnxqy
	 9dq2uyCgtkUaTMXKwfZyEVoy3/j7qCOkh7p8wHwWDRB6aOsntWxphEPN2Gy6TYFtjImCc
	 PPguwOLR0vHfMiP7LiNQwKUQsQ6hZZq+25yrlg9bSJPTlBA/ac7OHyN6i7Z4asKrSPzBu
	 wyW9uAKU9sLHspRfQvGa/oqa9Qny7XdBRKTKamd4HPjAj7sNvAzKOc1z7hBTp+yZFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OoarBW4I;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B85606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B85606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OoarBW4I
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7557725e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793981206; x=1794586006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onZ9SvOpPE1mfOyMecXO+SiLHoHJEwR8kdJKa7U2R1U=;
        b=OoarBW4I4/UKZAa7dY6iUWxI4u5puvbjRFHCnaKQgD0WE1Lw12xMcFVFSsZ/LS3uen
         vqes28nr8m+VLDjV7n66A2tVYuWv21upBOyDeztPLn+MSTgVNC4qFeHGG983pgdev8iF
         GYDLazXYURWm8JKhXnfQQGryNy04yMdlprUX4TGkjCDxXukZ7OPygJAZj92H1GHEb1vO
         Z8j6bH9056I34cNCwH6nCanUEFSEzG8ZVV5OFeetvVektU+GX+D4WzjCvvtYhsq0vio1
         ZhZohHBiRknlekfcceaJQ0AfRD3JcJGrWKR94+K+VVukJjfZCLFUTbyGcF2E23tOyq0S
         G/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981206; x=1794586006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onZ9SvOpPE1mfOyMecXO+SiLHoHJEwR8kdJKa7U2R1U=;
        b=ll4P/ZknASEfPe4XqzJ0c3mkNNvdL38ToXRorzSEygTv4LSrlE9dGUUeHCSPsU+vSq
         9aMpsicd9si+eYc2m7MOB3P38+t0w1CCri+VQFhEVq6IJDOcpQZeYmLeYBH2rLPf0jzJ
         PqO9X8U4ANDJLo6tM/lD2G39XlIqQAjODTo7DO97jDaLDSV0cFKl+kRmrWXuuEuj1qK9
         0Q30F5Ag4HofekhpM8ngJFSTP8IdvYXcldI4MMz0uhI4skkbxbT2YKbbWfgs20m9t6M4
         h1CFwpa2hqeX2BMYElTXmC8QnWF9742ZBMHRIxr6np9q9btJJib1GcJ5vSuRO3gI/MWg
         Do5A==
X-Gm-Message-State: APuU4Z//hpxxaOxjkHeA3zxSR/2AsIPYaKRJvwx7DaCXeJ3CVrcf8KGU
	l0uxsS68Nu5IMcitChwskd/DcsL4/apR+Q0IBYgO6fWNmf9YF6mSm8FsRP7zir7gtVgW384axa6
	Dw83sjTw=
X-Gm-Gg: AYBFou2J5aSDn873IhfXUegdn+TNveIEuJlt09ygAkSdag8zhWXv1wOzoOZU6w9nknE
	Zkd4ii2mLuAMSW8gfdU+K0HgG5cIprfzZzvEJQIZHb1rw9BxT5Xoc4kM5LEUe3/8EvQ5FVj2hH6
	8xiuPNSj2K5tAa2GRDJR26szPnUoYd8SuBqzdiajMZ5hHhzDpHvrUDmzuYKeQC6Np4rhm9hAStq
	3WXS6knnnj90KtzgqkFo4Klh9giS4dmkwgr+VOwXblLdYmH9SkAF7ACZT8i/tYXtDfPy/vzzv3z
	AksydgMcL17AU3hbkSXbhIglSUphhVUX8IZY4r90wNui/0ykCq0xb9mo/A1ddP78LKgoBc6NOUh
	5gHezfri+17bzKhlDt8KGuvDsyWzOL+mW7Iy3RNyQCBhY7W+SUGSMQLYMlKsvXlaJn6tLeifWQe
	Wad/n5PO7XlNmrSrSvffBdZtg9oPh84fyEagqeqLOWaSpmlAXctSGOemmTofcjCr/NoPp7VKBiU
	IF26O05ggMwCEs+P9OAbneatBSJDONaM3VxVNXZUrRGFMNAGq9JwejTR5hHPmOWkuBvKqRTstmM
	MsQ9klQbAYcLdPdh2ylIAt5ElqhA0YCDdq5VDoS1lh9SxqQla3kA
X-Received: by 2002:a05:600c:4f52:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4b6dea69b1bmr54435435e9.6.1793981206114;
        Fri, 06 Nov 2026 08:06:46 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm172665795e9.15.2026.11.06.08.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:06:44 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH 2/3] sched/idle: Stop the tick on polling idle on nohz_full CPUs
Date: Fri,  6 Nov 2026 17:06:14 +0100
Message-ID: <20261106160621.347228-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106160621.347228-1-marco.crivellari@suse.com>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
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

With idle=poll, the tick fires while in user space, interrupting the task
running there. This is a problem when the CPU is nohz_full, as it
introduces noise into the workload.

To fix this, stop the tick when entering polling idle on nohz_full CPUs,
while on other CPUs keep restarting it.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Link: https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/tick.h     |  2 ++
 kernel/sched/idle.c      |  5 ++++-
 kernel/time/tick-sched.c | 18 ++++++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/linux/tick.h b/include/linux/tick.h
index 8bfbb053f4fd..be4940f76777 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -129,6 +129,7 @@ extern bool tick_nohz_is_active(void);
 extern bool tick_nohz_tick_stopped(void);
 extern bool tick_nohz_tick_stopped_cpu(int cpu);
 extern void tick_nohz_idle_stop_tick(void);
+extern void tick_nohz_full_idle_stop_tick(void);
 extern void tick_nohz_idle_retain_tick(void);
 extern void tick_nohz_idle_restart_tick(void);
 extern void tick_nohz_idle_enter(void);
@@ -144,6 +145,7 @@ static inline bool tick_nohz_is_active(void) { return false; }
 static inline int tick_nohz_tick_stopped(void) { return 0; }
 static inline int tick_nohz_tick_stopped_cpu(int cpu) { return 0; }
 static inline void tick_nohz_idle_stop_tick(void) { }
+static inline void tick_nohz_full_idle_stop_tick(void) { }
 static inline void tick_nohz_idle_retain_tick(void) { }
 static inline void tick_nohz_idle_restart_tick(void) { }
 static inline void tick_nohz_idle_enter(void) { }
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index e0c10a5dbda2..226d02d24c73 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -349,7 +349,10 @@ static void do_idle(void)
 		 * idle as we know that the IPI is going to arrive right away.
 		 */
 		if (cpu_idle_force_poll || tick_check_broadcast_expired()) {
-			tick_nohz_idle_restart_tick();
+			if (cpu_idle_force_poll)
+				tick_nohz_full_idle_stop_tick();
+			else
+				tick_nohz_idle_restart_tick();
 			cpu_idle_poll();
 		} else {
 			cpuidle_idle_call(got_tick);
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index a9f622fdeb12..3625ad9d2268 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1179,6 +1179,24 @@ static bool can_stop_idle_tick(int cpu, struct tick_sched *ts)
 	return true;
 }
 
+/**
+ * tick_nohz_full_idle_stop_tick - stop the tick on polling idle on NOHZ
+ *
+ * On nohz_full CPUs the tick restarted for polling idle would keep
+ * running after idle exit and interrupt userspace once more; so stop it
+ * instaed. On other CPUs, keep restarting it as before. Must be called
+ * with interrupts disabled.
+ */
+void tick_nohz_full_idle_stop_tick(void)
+{
+	lockdep_assert_irqs_disabled();
+
+	if (tick_nohz_full_cpu(smp_processor_id()))
+		tick_nohz_idle_stop_tick();
+	else
+		tick_nohz_idle_restart_tick();
+}
+
 /**
  * tick_nohz_idle_stop_tick - stop the idle tick from the idle task
  *
-- 
2.56.0

