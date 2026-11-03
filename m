Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670775;
	b=exgXai5+qsSlQn67hKTdR1E/IKQlcucc+va/76cmv3lbmdQwjVFRWOdenffKXt9d6By9
	 qLECEyJsM6rUfEnYr/gdcEd03hjodnizCfxOlrY483nOlavqSU6bUEVoeIyhdf+FTN6Tm
	 SiYA2MTtGtTgyhlW90mzC3XjCNyIAYvbncOKNZ7lAgOyjgm6+SGwN1+aJtK5HyTwqjCOq
	 n8rYqTp4kilVBAR9vdKptPUB2ZH+KNe76g1LKlUTSi93V1vTE2aNVNbabjNr7bIXGFHlf
	 tqFL6IYrs4ObNjqAcyei9R2nRxhif0p0znLya/lrLgQ6P7OFAilmN/lP7HOVr+/LZ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670775;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZDSjTgXv/4Por/TZQS5mnyfp69SLks+picO45gYeB1U=;
	b=mNZoJPmrLbPk/9XMMFLlvLoO5KjRCJ00a0SktdkgDidSMJ2u2NUO3r1J+cW0uKi6xzeq
	 uDONpQRJKbpkIuDonvfLjP/+RqiONYLo0ThXSsp43EJoa4mUZTygrnQlutZRzguPlSwcZ
	 9cB14Yr2vHVUkTe/2IEw86RbUYDWLmHNZ35+LvlvTpf/WWHRM9gqRs+j8T/IrEtt4TqsO
	 0ykXo8PSfT8BUhz/Tu+/KdC4mrUGbNOq2d1YVbzBFrZcwcVw86p9LXvzBf6XbEXRSr53r
	 I112P3jMwHN6rQGSW8fcnrpYkTUSJloObWgmsVjrJ6Pc/MCW48BE1Yji8/rnYDU5AYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+kRYObF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E653F606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+kRYObF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88DD1F00A02;
	Tue,  3 Nov 2026 01:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670774;
	bh=ZDSjTgXv/4Por/TZQS5mnyfp69SLks+picO45gYeB1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D+kRYObFufDtgvfsPFz8G122dHCTLPJON/GcL2epf1tM3ZVCJUvFo6JZ70wzyGdRw
	 LZATKUnVysE/sFefucuBh7wrP6nUBimFNUSV0BJ/s8TrsKHU5qZBAzvqKvR494hrbp
	 RNLD/i6RFYaTRV9bP1ZEiN78Cwaj/FwdYhZEr6G75yuPRQTE0b15X2+es3oCFy0O2V
	 plEYPYVbSG0+xuLdgSaSZ6dNKMhFV3taswRFatcb3+yJgd4FZ7uyMqwHqE1nwxPYH8
	 A/yJCWzXpaT7Vvcceug67F1cm0RWWYdWghBGCkFsYDXeKDccAAuMsn/tW5awoZX8D7
	 uphgNk+ioh3iA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Frederic Weisbecker <frederic@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 05/20] context_tracking: Always inline the empty stubs called from noinstr code
Date: Mon,  2 Nov 2026 20:52:23 -0500
Message-ID: <20261103015238.3780910-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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

The !CONFIG_CONTEXT_TRACKING_USER versions of user_enter_irqoff() and
user_exit_irqoff(), and the !CONFIG_CONTEXT_TRACKING_IDLE versions of
ct_idle_enter() and ct_idle_exit(), are plain static inline functions,
while their real counterparts are __always_inline (user_*_irqoff()) or
noinstr (ct_idle_*()) functions. They are called from noinstr code, so
when they aren't inlined that's a call leaving the noinstr section. This
happens with code coverage instrumentation, which makes the compiler
refuse to inline an instrumented function into a noinstr one:

  vmlinux.o: warning: objtool: do_syscall_64+0x81: call to user_exit_irqoff() leaves .noinstr.text section

Make the stubs __always_inline as well.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/context_tracking.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/context_tracking.h b/include/linux/context_tracking.h
index af9fe87a09225..d0672916fc1d3 100644
--- a/include/linux/context_tracking.h
+++ b/include/linux/context_tracking.h
@@ -93,8 +93,8 @@ static __always_inline bool context_tracking_guest_exit(void)
 #else
 static inline void user_enter(void) { }
 static inline void user_exit(void) { }
-static inline void user_enter_irqoff(void) { }
-static inline void user_exit_irqoff(void) { }
+static __always_inline void user_enter_irqoff(void) { }
+static __always_inline void user_exit_irqoff(void) { }
 static inline int exception_enter(void) { return 0; }
 static inline void exception_exit(enum ctx_state prev_ctx) { }
 static inline int ct_state(void) { return -1; }
@@ -162,8 +162,8 @@ static __always_inline void warn_rcu_exit(bool rcu)
 }
 
 #else
-static inline void ct_idle_enter(void) { }
-static inline void ct_idle_exit(void) { }
+static __always_inline void ct_idle_enter(void) { }
+static __always_inline void ct_idle_exit(void) { }
 
 static __always_inline bool warn_rcu_enter(void) { return false; }
 static __always_inline void warn_rcu_exit(bool rcu) { }
-- 
2.53.0

