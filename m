Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE43BB123
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788039260; cv=none; b=PYAqGw1HGe8LYPKTnD6QkCJOcRxA0BVcPDHpwXrSyvrxZcaZ/GfgAxLCZomP041TV8DdxZD5QPWC9/pWv5pCFPuVKoYEgu83yXngDwkg0tH1VuOmjTC31JtYpkqGz1GH7lm7Zd/+48ezqHoQncLr2afIlHN8EbKK6IVE6AYnaMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788039260; c=relaxed/simple;
	bh=j4nwfEkF4DYlOTlB4f5GhOpkMuy9KoqFsSQJQgqPcpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owg5DY126exg2pGllBA34n7UuzdwuGYDatmtTJDXZ20oTqI2IDza3cDiw5x4Td1o6CwNp0gt6nG9uB8HnCdXPPok6YqX7RgrdnwpSJ2meX9AQJ6S1XXe/38ay7AD2ylSk4P5V+gm8cF+4PYkK908lM0Jz3PLlqnkSw30ZzElTDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cv85sR0W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cv85sR0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02C41F00A3E;
	Sat, 29 Aug 2026 21:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788039259;
	bh=c86yAAUqw1PEI48hVuJx+eWQphlPsYYM6FcKC2EZA4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cv85sR0WsS53CALYBAvguKvUaVRfoDG2zMXCYD5k1HZkrONkUEcY2LUpb2yoKfqa8
	 A2rDiryx6OpDkbIYTL9ZySSU6t6TcE6Vv4aaJwLvuF+Ru7i3FazUNkfbdhaCh1yptG
	 PfTJsxeM2JtjoSIRVhdEaa8GS3wLfr1n8UvyQNvX/pbR7MBiRTsCF582AH6oCkD64W
	 0u+7Txujk/C1MAFSZSsQl3oVY4Em19ADfptUfYTNKpB9uLVZHxpK3vCFCpGk/4MDdt
	 wxj7E5FjqvzdBMQg83NTT6+c29eJy6oV/8liwWqxASPBx5nFXy1zKxFKp/QpsftatJ
	 hyC8ZoF8NxDpw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id F2D06F40067;
	Sat, 29 Aug 2026 17:34:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 29 Aug 2026 17:34:17 -0400
X-ME-Sender: <xms:WVCTajWz5tKCMRErCSIlmEpCw6dHdwjvWLtZtsZWnqawhyZ_5GHF2w>
    <xme:WVCTaqrmgMrnI3A6PQ08s9IuwOIN3Aj4TEH86FtDJ_0b4LOej3lWbvNLrs87v4cXO
    orM64AxFg1hwXYgTaT-W1geAmVKMqvWReyE1EfxWrteqOT0rc-Lyg>
X-ME-Received: <xmr:WVCTalmwY6yoL7mdDoPxPtwNhq6uHc2pqRU8JzfoqhElGzHHuMhKwPk8YazbV0ZlRBTar3PwgZMrcB4MCemvaOo_DUlnCkwM>
X-ME-Proxy-Cause: dmFkZTGEmGXujidXmSvlGxSFHgsUDNrIWAkCDvChG2pkvHu1IfA10scQnm63QS0P/mRWGv
    MolCaXBRdzE9k/9RfAvx9sVk7iGLdccpBjZCGxZPLqnsp/RBgJGg31u+tLgLQQJ0rlHHKm
    7vZoFAOOBTkyw6+N7X2EAcoGSIkVtI5nzygiCxlbeMobPSTGGA8uxN15YAGXbRyVBqnrOo
    DWU7HnUzf/IlcoohKPqGtfuZWkCoXC4FLsO3lkazl556kOn8QBtpN+j89e2lxtzZhJYe3b
    85o8kT6hVmRCqedIpcBkaU5igPJwS8KjzfvczxCA/9Rj9fWF88V4wc/GSWcEZrzNc6ajkI
    eqDXK7zG7QK5NP6iKQlfMPrrW113tM2mjNjzGtuYluhvk5t5EeLvkvsI0X5jX1j8LwP7XP
    5Eq2thJM/aidzU4mzQw/+9uXFO940E6vNR/nEQe766HI11l70dDjnk82CoVSelbyB9u8xu
    iYbDqdFsrjGSPESOAdftUYsNJzhgsfvq7x5lrw82aItYVS4fMqL05/T/2kl+MhImE4j2oG
    +N+X7UW5DENuvTWrq0Se9wB7tM9/BrTRooJARER21qI6FVdKUJ2A7K0O1z0ZMM+V7WEyKz
    6dXIUtI0pZpKi78WNvF4X0fJaiEX3qsxWX/ApQsxvrGgivD61zDxxvqqkOrA
X-ME-Proxy: <xmx:WVCTaq0p1yvFpp0P3_GPQTpzidZrEcgi70Q0U1fyoUVS0LfaO4TvOA>
    <xmx:WVCTaiS7yJPgiILnmfXA7zwvf7GvbKJthX7G3RWDwhI1e9WAECswrg>
    <xmx:WVCTajwEguJRu_tPgioeBVftRTzGOplhs4F5FbDIPqgN3yv0WU2D-w>
    <xmx:WVCTaiAGPbMy9kiRZdIXf60Onu54QPIAamTRclj5hXZ57XPzi-NJFw>
    <xmx:WVCTavE7sLxP0LlSdFkiSDcace9tklPWT3gl2YnSocyzHDzz4eIb614n>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Aug 2026 17:34:17 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: tglx@kernel.org
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Lyude Paul <lyude@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v2] interrupt: Disable interrupt before modifying hardirq_disable counter
Date: Sat, 29 Aug 2026 14:34:12 -0700
Message-ID: <20260829213412.14303-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260827181106.30090-1-boqun@kernel.org>
References: <20260827181106.30090-1-boqun@kernel.org>
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

Because of this fix, the part of saving the current state is separated
from irq disabling, and the logic of local_interrupt_disable() becomes:

    local_irq_save(flags);
    if (counter++ == 0) {
      this_cpu(local_interrupt_disable_state) = flags;
    }

Therefore change the helper function _local_interrupt_disable() to
_local_interrupt_save_state() which only saves the current irqflags
(when interrupts get disabled the first time).

Link: https://lore.kernel.org/lkml/87v78wezid.ffs@fw13/ [1]
Reported-by: Thomas Gleixner <tglx@kernel.org>
Closes: https://lore.kernel.org/lkml/87jypbfu1t.ffs@fw13/
Fixes: e901c1510e24 ("irq,spin_lock: Add counted interrupt disabling/enabling")
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
v1 -> v2:

* Use imperative mood in the last paragraph of the change log.
* Add "Closes" tag to the email of the explanation of the issue.
* Apply the RoB tag from Bradley Morgan

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

