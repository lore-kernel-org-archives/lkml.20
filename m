Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188859;
	b=n9wSu2bedpyVoOvCwN4onkWWiztbam/xw5eLDsQTrffqQNL4dRA4dVCU3JKIRzPIPW4u
	 73AUDO8ejhe4SnTAp7IZo2+3STgGP8G2HMzSN5PNDNmMbwPVFL3lkAzBrTmNQ/sgIyCeX
	 UOJRclCxCnfziV7Rv3465dQJcMf8psI+r5LHSsvSxNN2ZKqKv/wiqLCK8VJD1c6A7hoqH
	 Bckiyut8ULg9dLf4B6q+oF+mJ5PudhU6z5zpu1N7aebdvj4CR49LDIHk0L/g/D7o2hY1D
	 tmUA0rsZZ84Pe7Y4j2e5Vu7CHfcgvwhSIdhnGmawQdow8svkJ4sVQEFgle1Wr83Iejw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188859;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZDSjTgXv/4Por/TZQS5mnyfp69SLks+picO45gYeB1U=;
	b=MiItT2Tj3hJHjLst0KN0Zw0Wak95RYVZBmCpokiSkCjTsINfhKmxyD1RaulXL87wBmRS
	 Gmv8qd6TvwYol5QAkvo7y9Mole3VdI3nQQQoV36HZUlVy5G4E0y+PSiZXKlMfdIkMLcJj
	 BZjqoI2YYnPsdxCHwsfrdeHwQrb0s2mxcGHAKx5Jr3Vs+C4AcR+gjm2Oc31CsCIR9Z7aV
	 OdNfCbABWLKdG008oOLX4Fi7YF/fQJahhJ+ZmppkW7SGCQrrSq1FE8lAOIommomZB/X8R
	 HFIbELN/OCa9kbvanPv3o6I+v/oE4+y9Cgme0yNf4m4jh6LgNYuXaGEoxUO+opoY8gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iq6Ssyb/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CD660A2607
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iq6Ssyb/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC6A1F031EC;
	Wed, 28 Oct 2026 12:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188858;
	bh=ZDSjTgXv/4Por/TZQS5mnyfp69SLks+picO45gYeB1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iq6Ssyb/oDuz33UyFg7FTw/+/u37Q5sPhcIr0ZFNmaGD9F3PQxPv2qyDrQluVtPiC
	 CGM26IVzksG8Ns/QkRdxrbPfmd4EfKJWOIbBWgEMPN8HmfaLYrDOlVH0n5vZC/F55T
	 C3BNHDao0zUbOffBv7G5CbByy8loqOzvnZQOMBwWx7h7YMfrzm5+KcBp30pOC5ecqz
	 C+aImbZjTLjU1Ma+xeU5VvyHfH0WD+yanWuDC9Nd4c+4oVhuOWz7Jr+072G9lZI9bJ
	 5OsDNT8yCDilZuzzjplZev1jktQDpszObzXF5uVmoQ7cAbHeI08vFbFaD53kz0OcTT
	 VL99jqqUIXqIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Frederic Weisbecker <frederic@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [RFC PATCH 05/20] context_tracking: Always inline the empty stubs called from noinstr code
Date: Wed, 28 Oct 2026 07:59:29 -0400
Message-ID: <20261028120034.871983-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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

