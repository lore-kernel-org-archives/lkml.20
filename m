Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A63F1052
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861260; cv=none; b=WO2uWKqeWHe/RoN+USojgvsUmA6NNksYs34ty22ZgdijHjoVwgxPqicUu6NNUgSJpn/yaIyFDhwq4Ch2DIiGCu53IcQBc4dRVE8ZPZLo83CGkqnjfX341+vfXA9FmaQB6V2KnV4tO5xXfpChmnF8uaBzKsAi/+kFS6bK8vHGlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861260; c=relaxed/simple;
	bh=XGNnluYMjVsPKHYbpot+lm10wNfPEEfRYzSCrmXvQNs=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=lv7oce5WRMpzG3jsDssBvreboI8yLSzMoJMX/mUYzJ2lyytwmb7zTk1F3NVasxE4b6ApQ9m5vItwCR/9Ldu0POjvxkDlVN3dUlfFFlKgeAcmt+pbbD+GqaAT3cnl6SuMZeFuOQvIqUQpPFdIGFm3AXLbXAmci7fkUsXkwfFO5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=iiqCC2vB; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=8jpQwkMe; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="iiqCC2vB";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8jpQwkMe"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787861234; bh=1Jer9tgFXkC/FvHEjO0Tomt
	ZXVeE2IyY75XNJRo6+OM=; b=iiqCC2vBPnV0/SC8EWe90ASI+eNefaiSU8F1EfFGYdaQTYBfI5
	7gPLhP0uqekLNnAyjvNTNQ7Y6mhj9yNt9geoRsLSH+0GkC38Zv/blNhB4z9Af9DxXa3SJdNQtky
	qFV8AnVUnueQEg8HXfzY8f0cuD+8nWpsxZo7nki2oOZbRoEeQniSfayquTzdVLVf10MKLPTdIIB
	OwMcnOWNtGWNbR8M+sN8Fy025/VyR+M7+XXKNFzJ/CnReoyaflPAtViICJWABhNnQiMP1Rz5//V
	zJ7R+fKSpqGQATkY7szSK3FOcfu6Ycg0/FTZsmSfbpCog9zMgdv9XEuAjStJkCmcVVQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787861234; bh=1Jer9tgFXkC/FvHEjO0Tomt
	ZXVeE2IyY75XNJRo6+OM=; b=8jpQwkMeu6ooapYVLRHou/9rDnNxGxwEE103zZSFmgftjUdeTr
	TPQnh83iWf/FfGjCpNwankZz4G7lC8xwzhDw==;
Date: Thu, 27 Aug 2026 21:07:14 +0100
From: Bradley Morgan <brads@mainlining.org>
To: boqun@kernel.org
CC: bigeasy@linutronix.de, joelagnelf@nvidia.com, linux-kernel@vger.kernel.org,
 lyude@redhat.com, peterz@infradead.org, tglx@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_interrupt=3A_Disable_interrupt?=
 =?US-ASCII?Q?_before_modifying_hardirq=5Fdisable_counter?=
In-Reply-To: <20260827181106.30090-1-boqun@kernel.org>
Message-ID: <5292B0E1-930E-4999-A448-53749A7D8D21@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 27 August 2026 19:10:48 BST, Boqun Feng <boqun@kernel.org> wrote:
>Currently a softirq may be pending longer then expected if the
>triggering interrupt happens in-between hardirq_disable_enter() and
>_local_interrupt_disable() in local_interrupt_disable():
>
>    local_interrupt_disable():
>      hardirq_disable_enter();
>      <interrupt>
>      ...
>      __irq_exit_rcu():
>        // false because hardirq_disable_count() is not 0
>        if (.. && !hardirq_disable_count() && ..) {
>	  invoke_softirq();
>	}
>      _local_interrupt_disable();
>
>, it'll defer the softirq to the next interrupt which can be forever.
>
>The order between hardirq_disable_enter() and _local_interrupt_disable()
>is to optimize re-disabling interrupts if they are already disabled, but
>as 1) local_interrupt_disable() is not widely used yet and 2) the proper
>way to achieve this optimization may need fixing up the counter at
>entry/exit time [1], so reverse the order for now to avoid the softirq
>pending issue.
>
>Since we are doing this, the part of saving the current state is
>separated from irq disabling, and we basically do the following in
>local_interrupt_disable():
>
>    local_irq_save(flags);
>    if (counter++ == 0) {
>      this_cpu(local_interrupt_disable_state) = flags;
>    }
>
>Change _local_interrupt_disable() to _local_interrupt_save_state().
>
>Link: https://lore.kernel.org/lkml/87v78wezid.ffs@fw13/ [1]
>Reported-by: Thomas Gleixner <tglx@kernel.org>
>Fixes: e901c1510e24 ("irq,spin_lock: Add counted interrupt disabling/enabling")

LGTM, thanks 

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Boqun Feng <boqun@kernel.org>
>---
> include/linux/interrupt_rc.h | 19 ++++++++-----------
> kernel/softirq.c             | 17 ++++-------------
> 2 files changed, 12 insertions(+), 24 deletions(-)
>
>diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
>index b9a7f05ecf42..e68e1bedba66 100644
>--- a/include/linux/interrupt_rc.h
>+++ b/include/linux/interrupt_rc.h
>@@ -20,11 +20,8 @@
> /* Per-CPU interrupt disabling state for
> local_interrupt_{disable,enable}(). */
> DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
> 
>-static __always_inline void __local_interrupt_disable(void)
>+static __always_inline void __local_interrupt_save_state(unsigned long flags)
> {
>-	unsigned long flags;
>-
>-	local_irq_save(flags);
> 	raw_cpu_write(local_interrupt_disable_state, flags);
> }
> 
>@@ -36,9 +33,9 @@ static __always_inline void __local_interrupt_enable(void)
> }
> 
> #ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
>-static __always_inline void _local_interrupt_disable(void)
>+static __always_inline void _local_interrupt_save_state(unsigned long flags)
> {
>-	__local_interrupt_disable();
>+	__local_interrupt_save_state(flags);
> }
> 
> static __always_inline void _local_interrupt_enable(void)
>@@ -46,27 +43,27 @@ static __always_inline void _local_interrupt_enable(void)
> 	__local_interrupt_enable();
> }
> #else
>-extern void _local_interrupt_disable(void);
>+extern void _local_interrupt_save_state(unsigned long flags);
> extern void _local_interrupt_enable(void);
> #endif
> 
> #else /* !MODULE */
>-extern void _local_interrupt_disable(void);
>+extern void _local_interrupt_save_state(unsigned long flags);
> extern void _local_interrupt_enable(void);
> #endif /* !MODULE */
> 
> static inline void local_interrupt_disable(void)
> {
> 	int new_count;
>+	unsigned long flags;
> 
> 	WARN_ON_ONCE(in_nmi());
> 
>+	local_irq_save(flags);
> 	new_count = hardirq_disable_enter();
> 
>-	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
>-
> 	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
>-		_local_interrupt_disable();
>+		_local_interrupt_save_state(flags);
> }
> 
> static inline void local_interrupt_enable(void)
>diff --git a/kernel/softirq.c b/kernel/softirq.c
>index 7980a4a232f9..5d02c36c40e3 100644
>--- a/kernel/softirq.c
>+++ b/kernel/softirq.c
>@@ -91,11 +91,11 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
> 
> DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
> 
>-void _local_interrupt_disable(void)
>+void _local_interrupt_save_state(unsigned long flags)
> {
>-	__local_interrupt_disable();
>+	__local_interrupt_save_state(flags);
> }
>-EXPORT_SYMBOL(_local_interrupt_disable);
>+EXPORT_SYMBOL(_local_interrupt_save_state);
> 
> void _local_interrupt_enable(void)
> {
>@@ -749,16 +749,7 @@ static inline void __irq_exit_rcu(void)
> #endif
> 	account_hardirq_exit(current);
> 	preempt_count_sub(HARDIRQ_OFFSET);
>-	/*
>-	 * Interrupts may happen between hardirq_disable_enter() and
>-	 * local_irq_save() in local_interrupt_disable(), if irq_exit() invokes
>-	 * softirq here, we may have a softirq handler calling
>-	 * local_interrupt_disable() but it won't disable the IRQ because
>-	 * hardirq disabling count is already 1, hence we need to prevent
>-	 * invoking softirq when a local_interrupt_disable() is ongoing.
>-	 */
>-	if (!in_interrupt() && !hardirq_disable_count() &&
>-	    local_softirq_pending()) {
>+	if (!in_interrupt() && local_softirq_pending()) {
> 		/*
> 		 * If we left hrtimers unarmed, make sure to arm them now,
> 		 * before enabling interrupts to run softirq.
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
