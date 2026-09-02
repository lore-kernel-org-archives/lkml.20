Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A44328B7B;
	Wed,  2 Sep 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335700; cv=none; b=gylky/Noj3yOhe0/pZEYl1QBgGiEmMRmY11LrvMrkxYPssaaCbWLpqt9RPfmb4u8Ama/EAUJAlKL7MvURJPAHej5EmtrBH0V8MpNFZoe6yn7kh6kv86jhiu0KlKBHP9XR9Q4mhjUbwBIu1DgKnsVvrp5qPRuH/vR05N9Q53wz4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335700; c=relaxed/simple;
	bh=5QpCdDPtNnhVs8oN0HiMlxRgtVnTRZgHX/FEgxWyYYY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=lMtJV4XU07lvW4Vz1h1/K00Dya8+FOT623XX7NrYGowZQn1GytGhVFhp4CkHJLzWMD2lemk1A4Lx7VXIQFpmn7320Ph6cFfFwPSwg9HBIxWG7nHCR2iIbf4qHkB7Kqvv+y6o7iL6FwpSFMwDGtpzx80B7PUPTaJv7g6hl0OGiz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mT8wW+OU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IcW2u7qu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mT8wW+OU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IcW2u7qu"
Date: Wed, 02 Sep 2026 07:54:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335696;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8yiMgwc0Ui4yKjcxWyZtveL3x3nGJ70m/h+vfPUkvrM=;
	b=mT8wW+OU504dCbCHJdkFE/Gf99PNtvr61ucaZSHA7qn0/CQs4Fmu2MeGhhKoCXp8RalETV
	/fqQfrL9seNgm0agcmavusacvvasikGfkxmRuA5O/sAiWjviIZtOHksGyYnEtf44WBmgC6
	oUjvcDXL/YVY2k9urpeUZaVo3Yykao3YLCXvpSCT1ePSxn2It1Ra6zSu2HQsioPuUqQjOD
	181abMCWz+anRvslX3mTXomKGwLIpR/IVxlIHwWMSe5fZxOLdVli18do01EyMu7wbVJwlw
	8Fj1OluCF9NNvlV/vYMZT64xPHTHraAeg59DZ9gZRgnHDhuQVBEmUNyuvnbS0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335696;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8yiMgwc0Ui4yKjcxWyZtveL3x3nGJ70m/h+vfPUkvrM=;
	b=IcW2u7qu1GNYf7ve0hqZb3x+UtMpYm8K4HDmkDeCLcmmLhfw3Jg8Xoxo4/LXGJ/tGFCUTu
	rWt4mlthZ/J79WCQ==
From: "tip-bot2 for Mark Rutland" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: dynamic: Make PREEMPT_DYNAMIC depend on
 ARCH_HAS_PREEMPT_LAZY
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Mete Durlu <meted@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803191731.3244294-2-mark.rutland@arm.com>
References: <20260803191731.3244294-2-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833569432.3717435.14198874154482354522.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     d3d16750693b540299cd105968174556012aba09
Gitweb:        https://git.kernel.org/tip/d3d16750693b540299cd105968174556012=
aba09
Author:        Mark Rutland <mark.rutland@arm.com>
AuthorDate:    Mon, 03 Aug 2026 20:17:26 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:22 +02:00

sched: dynamic: Make PREEMPT_DYNAMIC depend on ARCH_HAS_PREEMPT_LAZY

On architectures which select ARCH_HAS_PREEMPT_LAZY, it has not been
possible to select the NONE and VOLUNTARY preemption models since
commit:

  7dadeaa6e851 ("sched: Further restrict the preemption modes")

... which was merged in v7.0.

All architectures which currently support PREEMPT_DYNAMIC select
ARCH_HAS_PREEMPT_LAZY:

  [mark@lakrids:~/src/linux]% git describe HEAD
  v7.2-rc1-1-g871a4586ea2e1
  [mark@lakrids:~/src/linux]% git grep 'select HAVE_PREEMPT_DYNAMIC_' -- arch
  arch/arm64/Kconfig:     select HAVE_PREEMPT_DYNAMIC_KEY
  arch/loongarch/Kconfig: select HAVE_PREEMPT_DYNAMIC_KEY
  arch/powerpc/Kconfig:   select HAVE_PREEMPT_DYNAMIC_KEY
  arch/riscv/Kconfig:     select HAVE_PREEMPT_DYNAMIC_KEY
  arch/s390/Kconfig:      select HAVE_PREEMPT_DYNAMIC_KEY
  arch/x86/Kconfig:       select HAVE_PREEMPT_DYNAMIC_CALL
  [mark@lakrids:~/src/linux]% git grep 'select ARCH_HAS_PREEMPT_LAZY' -- arch
  arch/arm64/Kconfig:     select ARCH_HAS_PREEMPT_LAZY
  arch/loongarch/Kconfig: select ARCH_HAS_PREEMPT_LAZY
  arch/powerpc/Kconfig:   select ARCH_HAS_PREEMPT_LAZY
  arch/riscv/Kconfig:     select ARCH_HAS_PREEMPT_LAZY
  arch/s390/Kconfig:      select ARCH_HAS_PREEMPT_LAZY
  arch/x86/Kconfig:       select ARCH_HAS_PREEMPT_LAZY

... and hence in practice PREEMPT_DYNAMIC no longer supports the NONE or
VOLUNTARY preemption models.

Make this official: have PREEMPT_DYNAMIC depend on
ARCH_HAS_PREEMPT_LAZY, and remove the trivially unreachable code.
Further simplifications will be made in subsequent patches.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Mete Durlu <meted@linux.ibm.com>
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://patch.msgid.link/20260803191731.3244294-2-mark.rutland@arm.com
---
 kernel/Kconfig.preempt |  1 +-
 kernel/sched/core.c    | 63 +----------------------------------------
 2 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index f294dad..68f3218 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -133,6 +133,7 @@ config PREEMPTION
 config PREEMPT_DYNAMIC
 	bool "Preemption behaviour defined on boot"
 	depends on HAVE_PREEMPT_DYNAMIC
+	depends on ARCH_HAS_PREEMPT_LAZY
 	select JUMP_LABEL if HAVE_PREEMPT_DYNAMIC_KEY
 	select PREEMPT_BUILD
 	default y if HAVE_PREEMPT_DYNAMIC_CALL
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9841043..84e7685 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7931,20 +7931,10 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
  *
  *
  * NONE:
- *   cond_resched               <- __cond_resched
- *   might_resched              <- RET0
- *   preempt_schedule           <- NOP
- *   preempt_schedule_notrace   <- NOP
- *   irqentry_exit_cond_resched <- NOP
- *   dynamic_preempt_lazy       <- false
+ *   (unselectable)
  *
  * VOLUNTARY:
- *   cond_resched               <- __cond_resched
- *   might_resched              <- __cond_resched
- *   preempt_schedule           <- NOP
- *   preempt_schedule_notrace   <- NOP
- *   irqentry_exit_cond_resched <- NOP
- *   dynamic_preempt_lazy       <- false
+ *   (unselectable)
  *
  * FULL:
  *   cond_resched               <- RET0
@@ -7975,21 +7965,11 @@ int preempt_dynamic_mode =3D preempt_dynamic_undefine=
d;
=20
 int sched_dynamic_mode(const char *str)
 {
-# if !(defined(CONFIG_PREEMPT_RT) || defined(CONFIG_ARCH_HAS_PREEMPT_LAZY))
-	if (!strcmp(str, "none"))
-		return preempt_dynamic_none;
-
-	if (!strcmp(str, "voluntary"))
-		return preempt_dynamic_voluntary;
-# endif
-
 	if (!strcmp(str, "full"))
 		return preempt_dynamic_full;
=20
-# ifdef CONFIG_ARCH_HAS_PREEMPT_LAZY
 	if (!strcmp(str, "lazy"))
 		return preempt_dynamic_lazy;
-# endif
=20
 	return -EINVAL;
 }
@@ -8011,40 +7991,7 @@ static DEFINE_MUTEX(sched_dynamic_mutex);
=20
 static void __sched_dynamic_update(int mode)
 {
-	/*
-	 * Avoid {NONE,VOLUNTARY} -> FULL transitions from ever ending up in
-	 * the ZERO state, which is invalid.
-	 */
-	preempt_dynamic_enable(cond_resched);
-	preempt_dynamic_enable(might_resched);
-	preempt_dynamic_enable(preempt_schedule);
-	preempt_dynamic_enable(preempt_schedule_notrace);
-	preempt_dynamic_enable(irqentry_exit_cond_resched);
-	preempt_dynamic_key_disable(preempt_lazy);
-
 	switch (mode) {
-	case preempt_dynamic_none:
-		preempt_dynamic_enable(cond_resched);
-		preempt_dynamic_disable(might_resched);
-		preempt_dynamic_disable(preempt_schedule);
-		preempt_dynamic_disable(preempt_schedule_notrace);
-		preempt_dynamic_disable(irqentry_exit_cond_resched);
-		preempt_dynamic_key_disable(preempt_lazy);
-		if (mode !=3D preempt_dynamic_mode)
-			pr_info("Dynamic Preempt: none\n");
-		break;
-
-	case preempt_dynamic_voluntary:
-		preempt_dynamic_enable(cond_resched);
-		preempt_dynamic_enable(might_resched);
-		preempt_dynamic_disable(preempt_schedule);
-		preempt_dynamic_disable(preempt_schedule_notrace);
-		preempt_dynamic_disable(irqentry_exit_cond_resched);
-		preempt_dynamic_key_disable(preempt_lazy);
-		if (mode !=3D preempt_dynamic_mode)
-			pr_info("Dynamic Preempt: voluntary\n");
-		break;
-
 	case preempt_dynamic_full:
 		preempt_dynamic_disable(cond_resched);
 		preempt_dynamic_disable(might_resched);
@@ -8094,11 +8041,7 @@ __setup("preempt=3D", setup_preempt_mode);
 static void __init preempt_dynamic_init(void)
 {
 	if (preempt_dynamic_mode =3D=3D preempt_dynamic_undefined) {
-		if (IS_ENABLED(CONFIG_PREEMPT_NONE)) {
-			sched_dynamic_update(preempt_dynamic_none);
-		} else if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)) {
-			sched_dynamic_update(preempt_dynamic_voluntary);
-		} else if (IS_ENABLED(CONFIG_PREEMPT_LAZY)) {
+		if (IS_ENABLED(CONFIG_PREEMPT_LAZY)) {
 			sched_dynamic_update(preempt_dynamic_lazy);
 		} else {
 			/* Default static call setting, nothing to do */
