Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646241;
	b=a2jJZxAZ05D//Xk1yxqDtwm8t7b76NpGNwn4YigFr3K4acj6s/owzo7FXHINFuLFaaMx
	 Sz57esrjiJ8TGvqfFQUF8R2HEnzQ5u4goN4Vbh03FPaerfp9AbzZ6lomWkWJQbv+726gg
	 HSFzEen3h257EiRoYeJYj+YhYvkDnTRnwJrGzyTmUM/1v6CZp9STxN4LXiP3opXVqFC72
	 HUqa756bHUlLUA4GpPIoiZaxs0j9ZUAk24FjJUsquF/1xSlNHDIt64gtU9p7l329dIp4b
	 a4flMQ5h46P9w0NXQuc6TDZyve8bEzhIjqGZQ3AlV01GprnlDNq25tzXQI/AdVa2ghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
	b=F1KCBnIlcRIw70kUpdq4398BG5XRmgbPaDDeWrZFtqdcoe+FyP0v7DRCMYzyrz4DlrZs
	 4NLR24g6Jiu9Aq97M+MkagF/JESBJcRxwc9Pb4DPWMFHgQdtoTGWvBd9VcJMagZ0QNH8k
	 X78cAe+DVLRHFgHFYnJKo3t2aixkujU76oSN/rrBkkvNJgROCb4bnUK8ROk/em4wvl11J
	 Ctha0kc5ugAAcmvJMAyaLyxqioUfHvyj6Bb7XNB0OFiOn+zQda4Y5Bwtu57tKCvTciAn1
	 Cr2b8QqFn8jhD7jocoNx8KaxQwCZdQgc5ximQW1eIKYnQ+yIN1DGnsKVhvnAj64821g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJ8MVNqh;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C860A2604
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51C860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJ8MVNqh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2650675e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646239; x=1793251039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=GJ8MVNqhnRrntr8SgM6UXidafF9eU+ZQd0Vc/ExGUloc15ICieAVftx4JAH7vssIeT
         gpv1uP2i99q9zJ7GxU1h5yYfKyuzVcFR7Pf5JBSLyLK829+VLlQ12Z7kIXurKA4HG4ss
         osOi8laCeLfIQtlnhFnufp/2cCQIsFivtIAPydAIib6/CYQSsgoilMYGcNVyRFWISaqG
         dzpiVJwT8C8qKYJuoSEyx5NflmKu369uj7BXTlEhpeqeV/LD+TqcsWtCVBIxlPNVIajX
         19LhZq/cRLgIIj8i7ZTD3NJvMpJClkpLPaeViTVwH6vouvhThL2rGV3cGBO7lTEyIHKV
         K6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646239; x=1793251039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=cSgSW28Hra4qWTJlV9KgprgTZulVTQ5PlEiM2ZXhrlrwlOZmqV6IjQCaoIsQQHBB4W
         eO8qPYjTk2TnbPSAHApcx/KeXfeoVFnq1zSfiVqKyRGfkeajQOpVKSNR320/srS4F3Xo
         T6BrSh3rqXoCivyPkaeUYCl7CYFhggEM83/BT9n4TmA0NewkKjj/eG1ju7LealMS3+dd
         4uPIWt72f6HBuJesUi8plP9Kvs+sGAhwxLBZ4MmK7RmdJ52zziB4zJIfl81XkURjVnGw
         o/4yaU46zSgirChMjC+NmPOajLHrXHr2Ge0iA1p8Ds4hEgxdubNPemZ9It5B2RbEUCuD
         YDvQ==
X-Forwarded-Encrypted: i=1; AKwUvByO+Zs/u1KYkAP9xgDeeyyd7v5H2qZXCuvaWqAugwL5s/eySgExQlNxLxpj9x3+IiFyFDiZ0mLI78T8abQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbp/UsuaVq6Ya/ZBcTW6UMcZ2F+6KPCqh4QaWGzY4ZQTLDiIvf
	F7h2MQUUYyOqgKJw7eGALW9axtq1Qm7o8rFKTYxd2mGWAjnGhfOffLee
X-Gm-Gg: AYBFou3a3T01OYjLQRnHiqVB48P6HHM7Oy8Y81z/w+zuXetD2Q91q9UdODfbPdgPKY6
	XQ7dvg5Ek45E98l61Mo3kd3PDyVTsW+NjgwV2GXSPKJBR81ahge33Zg5oB/6Quwr6Ej7VenAHRD
	5s9xIbzpDOv8/yfbPm605Fn/Ykv1V2uVlTNMlaw7JCO6LgE/b9Pez2YO5BA8PhWIbDfa4b5MsDR
	aYK3ugn7JcnOpRJNqcRcgzGHWVBmsfKiUMg1VVMv1Ibw6SSYNYuL+GXP9bFYnPdTpqI1p1lSMIX
	IRIiWa/ipqMt0/1uHleIHm4wQXvNBPrYZBOlLvo5AromcP4AZP+6a1v/pFgav3C8w7P1alS2Qy9
	WAwGkqA+I9+4zB/lNDox6L+c795siVfUScjOnoQegmR+Csg4t6MxnJGB7r2ssmRiwumhMQNxG2c
	RuWO4cDeYtw8Nn0cuNjBbVukUXr6QvmgIp8MLKqhHBRuk1hC90WK0x0ZJbzfk7U926K9/p2kKCQ
	F5vMNdaTRY0OXCuKCurQKa+3aW5WI4c4hNzS6DPNrLCGfCHRyU0C0G33JuDFunuGz1IDTTx9Z4J
	PCqy3G8eGzJJaItIYhcqH3kKIJVC4dVlYbYgEOyyVbIyMjasqPXCw8+ht39EYzWoGuqGDu9iDll
	E8DJTniZ2jNTLVNYvEYFjf9n3aAV/t/gx+gLTrXXOzLYl9KR8WvLPvlE175w=
X-Received: by 2002:a05:600c:4fc9:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a204b2032cmr26718835e9.12.1792646239093;
        Wed, 21 Oct 2026 22:17:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 02/12] lockdep: Use raw access for pinned hardirq state
Date: Thu, 22 Oct 2026 07:16:44 +0200
Message-Id: <20261022051654.79224-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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

irqentry_nmi_enter() reads lockdep's hardirq state before __nmi_enter()
establishes NMI context. Arm64 does the same for its NMI-like EL1 debug
entry. Both paths run with interrupts disabled and cannot migrate.

lockdep_hardirqs_enabled() uses this_cpu_read(), whose preemption checks
are unnecessary for these callers. Add a raw accessor and use it in the
two entry paths and in lockdep_hardirqs_off(). Keep the existing accessor
for callers which are not already pinned.

Check the interrupt state before accessing per-CPU state in
lockdep_hardirqs_off(), independently of warning suppression.

On arm64, this change does not by itself make the call chain noinstr-safe:
__kern_my_cpu_offset() must also be forced inline. That prerequisite is
listed in the cover letter.

Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 2 +-
 include/linux/irqflags.h         | 3 +++
 kernel/entry/common.c            | 2 +-
 kernel/locking/lockdep.c         | 6 ++++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59fe..93056a766fb20 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -141,7 +141,7 @@ static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
 	irqentry_state_t state;
 
-	state.lockdep = lockdep_hardirqs_enabled();
+	state.lockdep = lockdep_hardirqs_enabled_raw();
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	ct_nmi_enter();
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbbb..5bc179a88e513 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -52,6 +52,8 @@ extern void trace_hardirqs_off(void);
 # define lockdep_hardirq_context()	(raw_cpu_read(hardirq_context))
 # define lockdep_softirq_context(p)	((p)->softirq_context)
 # define lockdep_hardirqs_enabled()	(this_cpu_read(hardirqs_enabled))
+/* The caller must already be pinned to the current CPU. */
+# define lockdep_hardirqs_enabled_raw()	(raw_cpu_read(hardirqs_enabled))
 # define lockdep_softirqs_enabled(p)	((p)->softirqs_enabled)
 # define lockdep_hardirq_enter()			\
 do {							\
@@ -113,6 +115,7 @@ do {						\
 # define lockdep_hardirq_context()		0
 # define lockdep_softirq_context(p)		0
 # define lockdep_hardirqs_enabled()		0
+# define lockdep_hardirqs_enabled_raw()		0
 # define lockdep_softirqs_enabled(p)		0
 # define lockdep_hardirq_enter()		do { } while (0)
 # define lockdep_hardirq_threaded()		do { } while (0)
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d251..28399c41ebfb1 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,7 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
 	irqentry_state_t irq_state;
 
-	irq_state.lockdep = lockdep_hardirqs_enabled();
+	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
 	__nmi_enter();
 	lockdep_hardirqs_off(CALLER_ADDR0);
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26..01dba8fb32a90 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4543,10 +4543,12 @@ void noinstr lockdep_hardirqs_off(unsigned long ip)
 	 * So we're supposed to get called after you mask local IRQs, but for
 	 * some reason the hardware doesn't quite think you did a proper job.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
+	if (unlikely(!irqs_disabled())) {
+		DEBUG_LOCKS_WARN_ON(1);
 		return;
+	}
 
-	if (lockdep_hardirqs_enabled()) {
+	if (lockdep_hardirqs_enabled_raw()) {
 		struct irqtrace_events *trace = &current->irqtrace;
 
 		/*
-- 
2.39.5 (Apple Git-154)

