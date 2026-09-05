Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B574FECEC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634763; cv=none; b=jRITQ1jBAPCD+66fhyNMrpqns89wNSmzXIVHAKnh0glAIEGKo2+bWA0EM9F/CQALcOc9zQ9zTjyQ373YzD1CzVn5KFdCXEf/kJ2OdExSXUhq4JH2NgtzkXI/ldTKqByjSQGeemgiuYRL9DmyG1xzNVutjR0S4r1QfZtoo3uhiAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634763; c=relaxed/simple;
	bh=W725Erh20uSzqoVnH8TC3MWTcLXMTI6gq1pvobwiT2Q=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Ktu88UbNLyySpK6fFIFE3tIDH6WIsqm1hejB1RRUAprpsWffo/21fDa7ctc44GwyXrafhOe4xofF6eX3E8vPEt4zM1jOQV4MF3wMlyxqoqsxvUptbPSuHxqj9XIH1HDVa6CJG6+kFxNfcn1c0VZGp8W28pL0TpisvAuqyfQUCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQjUQ+V8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQjUQ+V8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84BE1F00A3A;
	Sat,  5 Sep 2026 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634762;
	bh=YJCZME/594Xy8B8jVu6Smq4mlzmi2kmZv8iQg1LGClI=;
	h=Date:From:To:Cc:Subject:References;
	b=mQjUQ+V8PcZjuOAoKXQl4LyuuqNn4V5z7N6LWNoH3MbHsh+8uxv2qnjA1xDyiEcni
	 ahPTypFlCCau4TDVfRb+iWBfoX1aieaQ9vAm9O6GXynNNReiP0RVp7rGlwM4v2VwFj
	 ddELlVRTmVyoxlos5M2azhcDbsbIcOMF0MtBj7UsHv1sc4CHYRMenO4K28rtMOHC9j
	 S9b5agjkUr2kpRyONoJARTpqssFjsQIvZvGVlJYnE+SXs/p6MlOeCbNYUu8ozFsUjF
	 1vz+iFOpSyw4jC7ldlDDllquKtmnKzEsGdPgYqAE2f1/fJIae75X+RXLdESGajsEMe
	 g7Q3HMAChhcMQ==
Date: Sat, 05 Sep 2026 20:59:19 +0200
Message-ID: <20260905185839.868259402@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [patch V2 5/8] posix-cpu-timers: Move inlines out of public header
References: <20260905181551.738186850@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

They are only used in the POSIX CPU timer code. No point in exposing them
globally and parsing them for nothing.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/posix-timers.h   |   32 --------------------------------
 kernel/time/posix-cpu-timers.c |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)

--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -66,38 +66,6 @@ struct cpu_timer {
 	struct task_struct __rcu	*handling;
 };
 
-static inline bool cpu_timer_enqueue(struct timerqueue_head *head,
-				     struct cpu_timer *ctmr)
-{
-	ctmr->head = head;
-	return timerqueue_add(head, &ctmr->node);
-}
-
-static inline bool cpu_timer_queued(struct cpu_timer *ctmr)
-{
-	return !!ctmr->head;
-}
-
-static inline bool cpu_timer_dequeue(struct cpu_timer *ctmr)
-{
-	if (cpu_timer_queued(ctmr)) {
-		timerqueue_del(ctmr->head, &ctmr->node);
-		ctmr->head = NULL;
-		return true;
-	}
-	return false;
-}
-
-static inline u64 cpu_timer_getexpires(struct cpu_timer *ctmr)
-{
-	return ctmr->node.expires;
-}
-
-static inline void cpu_timer_setexpires(struct cpu_timer *ctmr, u64 exp)
-{
-	ctmr->node.expires = exp;
-}
-
 static inline void posix_cputimers_init(struct posix_cputimers *pct)
 {
 	memset(pct, 0, sizeof(*pct));
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -438,6 +438,38 @@ static void trigger_base_recalc_expires(
 	base->nextevt = 0;
 }
 
+static inline bool cpu_timer_enqueue(struct timerqueue_head *head,
+				     struct cpu_timer *ctmr)
+{
+	ctmr->head = head;
+	return timerqueue_add(head, &ctmr->node);
+}
+
+static inline bool cpu_timer_queued(struct cpu_timer *ctmr)
+{
+	return !!ctmr->head;
+}
+
+static inline bool cpu_timer_dequeue(struct cpu_timer *ctmr)
+{
+	if (cpu_timer_queued(ctmr)) {
+		timerqueue_del(ctmr->head, &ctmr->node);
+		ctmr->head = NULL;
+		return true;
+	}
+	return false;
+}
+
+static inline u64 cpu_timer_getexpires(struct cpu_timer *ctmr)
+{
+	return ctmr->node.expires;
+}
+
+static inline void cpu_timer_setexpires(struct cpu_timer *ctmr, u64 exp)
+{
+	ctmr->node.expires = exp;
+}
+
 /*
  * Dequeue the timer and reset the base if it was its earliest expiration.
  * It makes sure the next tick recalculates the base next expiration so we

