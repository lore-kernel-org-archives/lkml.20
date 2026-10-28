Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158315;
	b=rzBEPas26zZoy064eMc04cU4I2+1D3H2/PGI6JWWfiTH0EoQm8ke6i2jqG//y4rdcugP
	 3BKSW8quI+TITLkHv7dpDgBeml+7IZ2JumTtFz17/ARDNS/cHr87sy9vOgdZXjmfIXjKN
	 nxBI9kRfs2aT0g34UC8SgN+ntg5NhWGuqTR+WKWrGuHr9PdXhh3iuT72Nz59SYiOekiUj
	 xI0V5LshfAquMyvoLkibIC3V3nC9+E+bxab/ZdCKWzSX/DtifzULosxFMMtND/OkGyIDD
	 oVDdpKXSG3AMoDWyvwDMHaQhPwpPrLTr8HQ0ZVXouV+5g2fNcc8meZ/RHUQHnXX47PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
	b=XL3SV6Xv6Ix/pT1S9hpMK63Q+0mKUgLk0MEbFGTRq7U9H1NcN5WyfTEufk9jurj9zrje
	 a9vPPDoDGKXrcP4VqTJ5i2XYMP9QNmdSzOqDxqXRRCTkFUprVNsmFt0B8mFxsj6fR5KkR
	 jG0bENVO73ytHnU7/eVRQdwbwK0AQSQlw6uJ4pzfQw0DoCAWlvR64mrIlLx2M8ZlWnslf
	 PImVAWd+R+regtl0tEuDDXh/UNMicTfKnaNZO+7jgMxogVlAqzeSBXY8ZpDeQPaWxLHG0
	 FRrHcjECX2Mf4jHX3LhbFoe84KxpwVpTI174RKkMrviMGA5LhC3fvzIwuYSY5AeSXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMmmb3sX;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7592606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7592606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMmmb3sX
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0759so229897f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158313; x=1793763113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
        b=dMmmb3sXN+9+WtWYT5GIYxukvgjY6lg7vM9vMpuXULzuhss44sjTF2Ww0uz6wBUVUP
         YeyXil4UPV//QQdO3O7MzMp32Q6YpRghE8pNsbChAsRVNxGn1XyXw2a6Q1cdD1l9do3/
         Mpelq8RhzvmulGHfMQbtHfEmrTo/OyDUr27s14L52zhwTeIX1uJCQ0VKIatZERd4E4ID
         ILeSX8mL2xZoiZlK0PDPsikO1j7O9PBEuaFA6wJCnfEjmdArq0uwtfN7ov+2jQ/iXrp/
         zOgQBZlvtPyLXkoa4VVx2lWoCP+MyFqTzLTwDCnuaxA7aL4zMUNzZ3ZaNT3fJ/QXt6bm
         steg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158313; x=1793763113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
        b=VY45AlmRvHtkMHrX2ufUz4DITfna7l0YxbDS4fs8qTeh/+/FhLhVsBZ3txH+eyUrCe
         vX1JMtpcy3Tx7RRHqx0NTVxB8/ZujpIOye+5OTX2BLNR9LOoAlQPdQXP1U+TFd6VbcFW
         iwYz8gXKYivpaHucBfszSHcKfL9+qMtd0bFc0GIEFsongd3VYmwJ1b3+bXnis2rQGVzX
         eVQ5t5qG1T70431cOhN6dDZHtmOnQpeV0MYVUGfZdLOjQ2m6CnNMilGOLvoIx9nNL2fy
         K5t5F5ShyycB8QfD8/3yPE5hLt/o/+2l3xKcHeNjEx1+JQ9J9vCY6tlnKTF3vv4CYr1l
         lkUw==
X-Forwarded-Encrypted: i=1; AKwUvBwffRaLPKMtbV8mXOfBJ14U4f0719rQTECFw0frCUYzoMENGs12e71ig2KhXs+/mPMO316RYy5uBCqIA7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsArJcfQ7ddLZY8Z3xq+9UXNpj7c7EyLlEA66+cEA2OgvvLEDv
	CJ2pu+UNQsTI0L58VX+S5yS5mjQ7v8QfGQwXmP9gSXuOiNe/7tfV08Ir
X-Gm-Gg: AYBFou0PP4nCl+FapHalqd6siACush70/5v0RK4pECwjK4zIGC9SWfQ1e8JaeoQiy4d
	WRez8DqI+PKexgzarn4Pun7c60H1dcP0fxCV6m95h+CKRac/KDlbgsivcpq8dhObGbLJ8+epv3y
	olJO9Xc1zNeQ1FiW1V2UBlxGK/u36ULFjUfQiKzyUOFLRQkxkXXXQ9TdBxlOQafHmdZoEmI2O33
	bmSXtFkc8g0MUHjrAXh+6SxZLd9a1fso3aYKor9O3WaQiHTJ/Y8CJRLmS7DtIpO+R63Ck2Kd7DH
	XEhIQveUAP/RbMFgmzkBJgiESzTSsWOkRuWsW7mHBvZXryzlJQYYxZUf2VCrjs3+qU4/D7Vmr0b
	k0IFsn3eiIOsoiuCg9zGBHzBXeS7qqkvot1M8rpQ2x315Cd5+5E8DGx+OAvzdut4id16PrMLEqK
	yyhWPzGHcv3ZRWdtEGJuHwT4aG4G67FtKSEyuhvzIRVQibfzOb7ZoKVrK6beGNnyxZoND3ciXT/
	oe5oI9+S33bLCHIrjGD9jvMbZTlkO0h5SrzKnOwTq1iR5yJPVHpvpfHUYd6Pd4zFgxORH1icqY/
	RCg+UcANJIZwlA/1vS8pagZztlZq5pUbNVsk0TmH+KlNdXD9aZC2GJgHaHb9TyGtdrXRyWxcjhz
	Y/ekNnGD2XkmhwpgPnBuli3it48w0ZTpPxcIwPdsqrVXg+poB8dFy81WosSE23sRzCrhFso61uQ
	8nD2TXbVuh6GCvas5mt6IMutnXpPdzqh+y
X-Received: by 2002:a05:6000:1862:b0:48b:d9:cb52 with SMTP id ffacd0b85a97d-48e5d2f0870mr3087140f8f.27.1793158313112;
        Tue, 27 Oct 2026 20:31:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
Subject: [RFC PATCH v2 04/13] lockdep: Use raw access for pinned hardirq state
Date: Wed, 28 Oct 2026 04:31:18 +0100
Message-Id: <20261028033127.82193-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

On arm64, this change relies on __kern_my_cpu_offset() being forced inline
by the earlier prerequisite patch so the call chain remains noinstr-safe.

Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 6 +++---
 include/linux/irqflags.h         | 3 +++
 kernel/entry/common.c            | 2 +-
 kernel/locking/lockdep.c         | 6 ++++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 11d3f888fcd87..003f84109a913 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -177,9 +177,9 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
  */
 static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
-	irqentry_state_t state;
-
-	state.lockdep = lockdep_hardirqs_enabled();
+	irqentry_state_t state = {
+		.lockdep = lockdep_hardirqs_enabled_raw(),
+	};
 
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
index e234b04373fea..2f5229132466c 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -158,7 +158,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
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

