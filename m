Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CF38A71F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854272; cv=none; b=gsh+tLhCFLXSTR8gNuIzjogBHVUXoi/jezkOH6JzbvN0bIY3u4CBiomMXFKwcy5Irh6aGyRn+c0YWAWFLdNLzBqIDwFHFtkmrhzSH6T8dvNUm596QBofDDIsWMhv5yPuhpkYqk4wuPJiYp6/04zdt7TbcWS3LyW6eL7dkYhrdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854272; c=relaxed/simple;
	bh=lN9I1ArjYqp5/3BS9rnpljlF5FI+XXWTt/M3dAbs6Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQQMWVRu/XGzQWN1AJttv/UngGGaZ688psTrx4wpN5IawQGnYYsehCgvm4MhiqNIV6rDohcouDWIeItoinCRimw3q/Ez8PgVH9yFKSjJ90R5leRsRUzNYHexNbJTgwMRoAmuNdVz1haregi36VAdMwlfp5zTzlq3Sla8Wyi8uNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7A7dwBq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7A7dwBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5551F000E9;
	Thu, 27 Aug 2026 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787854270;
	bh=hOW49uuJwmo8NBAn6wYRhXexQ4V8weHNlo67FAviZRI=;
	h=From:To:Cc:Subject:Date;
	b=f7A7dwBqLqdnq5xjhtgsT5z8Nl2C902zU/pk7eoloCIRiRWXE5HIU6eki4wSieCYg
	 38fOKvJRCM266Aq+1wCjtAxKCuGnEVVVM/IP1J9poLtENrIr9Z7iui1254Tb88afGy
	 xKDl962AzM1peUMcij3f0wuV7sQEIKo5qFEbuwF+V5wmT9uexxLK9l4vkwH2mAcXNS
	 QQk/35paXY3GDMnzcBof0P01yBuBfOo8c0i4hRAAEuqmKAiDxm7GanyEbxef1PGXmE
	 e2QptMKUGqKAw4rjqGVdfib5Y8D1ICmkJK0X9eODEQVyUZP/YoyCOhckNpMTce91K6
	 Z1rjaQdHGfVnw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id AFDA2F40066;
	Thu, 27 Aug 2026 14:11:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 27 Aug 2026 14:11:09 -0400
X-ME-Sender: <xms:vX2QalFbjPweG4p4mAc9927XHfqa0ugDelIkBN3uHruDrFxcA1simg>
    <xme:vX2QasmrRw25KoI5YROArko9VUucX-fEKswcXvEFQQzCBfcBxQ0kM_POOQ4LlLOUo
    plYAgbcp5Ng1ItWsdPMsLCT9PrPKFK7bbbHbDxudbPiiNFWrONT_w>
X-ME-Received: <xmr:vX2QapaWaqKYFLLY_Kee3HetAG5cUyS9Tu9hWh3YcnTcWmLW1W66OogyW8uJOfb4ZNDQ9CI2V-fd8r_DSSoitDn-vyznVqsX>
X-ME-Proxy-Cause: dmFkZTEKcNTLMkLyP7X1AMl61TMtAkEcUI7bXqcUbPS5IvIIKDVYAyAVyoeo0a8DFipGM6
    qp9AhHvmR/TC/oLewcxP8U2hyNw0drh7dn3D4wZ3zd5ONoCPlOnv5SlT9/IasKwIEaIeqw
    GfCV4zdNfo/bk6wOpmb6DcvuoBrgUVd2czGjyAHn4a/bNVgrgaMScyFwsP8uioeZjkEsQ1
    aazLPfgD+d46Bktavc1ULQAeyxWY8GMOPzAFtSZn1Ac75idKBKClqSslmuqcte3XkDX8nw
    OijRqKxddzRvIKJO73OReSsqI1G5UcVwhOHUCjRyvY1mb91uFn+znoQPH9tf3bc05lOnqc
    Nn4k8WbjLNrqByTOd/yIoy9OdAZaoTZpmSjTS94UNrbAGXKXAbCKxE3r/3lW0r6g+j3ogX
    kOpqX96iLIsOvbjSDCGi/NN6oUJCWDi4z6YuZv4ByzKU1ONF5bWVAumosI9duid96UOyut
    quGRxZIrlgN+JMRgQW/4BqZ4kKH3xZX9g2+6UKVj5O1CXN1kpKzYgmaxNUGyaEdDhQ87Ae
    LYqEFYTs91lJQs9ZFbF9ggjQl1a8ZYZlwxUaqkUREdkLNGm7uFKK8m9MFqglZn/++/ZBby
    M8L/Dx0mrFT2kYbQ8EscGdUm2cMAFtI66xO0U1fxPh7wWoUcdDyrYAwjS5tQ
X-ME-Proxy: <xmx:vX2QahFQpF_4Sl3OPWoHZavBV1j8wfZUO4bIcZ8jcSnBq_HNB1gr6w>
    <xmx:vX2QaqIxRi7_wybZOGH8XN8bdwJl2NukmH2I5m-JBi87pTl7M-7mXg>
    <xmx:vX2QasMNIFTfR_Sfx7wSQ3jU5RuitPKFbvMjnINt9Kj0yAfbdd68vA>
    <xmx:vX2QaqlpoduatIWzfrwS5F4ZZUEF_zZfnoyK2XT5JtHLVSHEN3qGLA>
    <xmx:vX2Qag7O3Az3YHsIJzboVMnoVP9td3ZVr4hYs5JQ2WuCQJYOJJPwgJMm>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 14:11:09 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: tglx@kernel.org
Cc: Boqun Feng <boqun@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Lyude Paul <lyude@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] interrupt: Disable interrupt before modifying hardirq_disable counter
Date: Thu, 27 Aug 2026 11:10:48 -0700
Message-ID: <20260827181106.30090-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently a softirq may be pending longer then expected if the
triggering interrupt happens in-between hardirq_disable_enter() and
_local_interrupt_disable() in local_interrupt_disable():

    local_interrupt_disable():
      hardirq_disable_enter();
      <interrupt>
      ...
      __irq_exit_rcu():
        // false because hardirq_disable_count() is not 0
        if (.. && !hardirq_disable_count() && ..) {
	  invoke_softirq();
	}
      _local_interrupt_disable();

, it'll defer the softirq to the next interrupt which can be forever.

The order between hardirq_disable_enter() and _local_interrupt_disable()
is to optimize re-disabling interrupts if they are already disabled, but
as 1) local_interrupt_disable() is not widely used yet and 2) the proper
way to achieve this optimization may need fixing up the counter at
entry/exit time [1], so reverse the order for now to avoid the softirq
pending issue.

Since we are doing this, the part of saving the current state is
separated from irq disabling, and we basically do the following in
local_interrupt_disable():

    local_irq_save(flags);
    if (counter++ == 0) {
      this_cpu(local_interrupt_disable_state) = flags;
    }

Change _local_interrupt_disable() to _local_interrupt_save_state().

Link: https://lore.kernel.org/lkml/87v78wezid.ffs@fw13/ [1]
Reported-by: Thomas Gleixner <tglx@kernel.org>
Fixes: e901c1510e24 ("irq,spin_lock: Add counted interrupt disabling/enabling")
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/interrupt_rc.h | 19 ++++++++-----------
 kernel/softirq.c             | 17 ++++-------------
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index b9a7f05ecf42..e68e1bedba66 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -20,11 +20,8 @@
 /* Per-CPU interrupt disabling state for local_interrupt_{disable,enable}(). */
 DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
 
-static __always_inline void __local_interrupt_disable(void)
+static __always_inline void __local_interrupt_save_state(unsigned long flags)
 {
-	unsigned long flags;
-
-	local_irq_save(flags);
 	raw_cpu_write(local_interrupt_disable_state, flags);
 }
 
@@ -36,9 +33,9 @@ static __always_inline void __local_interrupt_enable(void)
 }
 
 #ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
-static __always_inline void _local_interrupt_disable(void)
+static __always_inline void _local_interrupt_save_state(unsigned long flags)
 {
-	__local_interrupt_disable();
+	__local_interrupt_save_state(flags);
 }
 
 static __always_inline void _local_interrupt_enable(void)
@@ -46,27 +43,27 @@ static __always_inline void _local_interrupt_enable(void)
 	__local_interrupt_enable();
 }
 #else
-extern void _local_interrupt_disable(void);
+extern void _local_interrupt_save_state(unsigned long flags);
 extern void _local_interrupt_enable(void);
 #endif
 
 #else /* !MODULE */
-extern void _local_interrupt_disable(void);
+extern void _local_interrupt_save_state(unsigned long flags);
 extern void _local_interrupt_enable(void);
 #endif /* !MODULE */
 
 static inline void local_interrupt_disable(void)
 {
 	int new_count;
+	unsigned long flags;
 
 	WARN_ON_ONCE(in_nmi());
 
+	local_irq_save(flags);
 	new_count = hardirq_disable_enter();
 
-	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
-
 	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
-		_local_interrupt_disable();
+		_local_interrupt_save_state(flags);
 }
 
 static inline void local_interrupt_enable(void)
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7980a4a232f9..5d02c36c40e3 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -91,11 +91,11 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 
 DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
 
-void _local_interrupt_disable(void)
+void _local_interrupt_save_state(unsigned long flags)
 {
-	__local_interrupt_disable();
+	__local_interrupt_save_state(flags);
 }
-EXPORT_SYMBOL(_local_interrupt_disable);
+EXPORT_SYMBOL(_local_interrupt_save_state);
 
 void _local_interrupt_enable(void)
 {
@@ -749,16 +749,7 @@ static inline void __irq_exit_rcu(void)
 #endif
 	account_hardirq_exit(current);
 	preempt_count_sub(HARDIRQ_OFFSET);
-	/*
-	 * Interrupts may happen between hardirq_disable_enter() and
-	 * local_irq_save() in local_interrupt_disable(), if irq_exit() invokes
-	 * softirq here, we may have a softirq handler calling
-	 * local_interrupt_disable() but it won't disable the IRQ because
-	 * hardirq disabling count is already 1, hence we need to prevent
-	 * invoking softirq when a local_interrupt_disable() is ongoing.
-	 */
-	if (!in_interrupt() && !hardirq_disable_count() &&
-	    local_softirq_pending()) {
+	if (!in_interrupt() && local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run softirq.
-- 
2.50.1 (Apple Git-155)

