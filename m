Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714246D579
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520964; cv=none; b=Vz+FATqediz+98kwp3NEuBenYtkWedX4E6YMrj2xTDhi7AbaTWbtuYtfCa54RWmZCNpG14R0S8/XjuUKZfwRbJhEypjHpiamtRndLaMj5G0vHQ/GCLykreUCL5rsKmCvTXlQzQPBTzlLccbq6GNs9XJW1Km2px1ZX+TNAdT94mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520964; c=relaxed/simple;
	bh=W725Erh20uSzqoVnH8TC3MWTcLXMTI6gq1pvobwiT2Q=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=UwhTyOvlELrdiZv5cJG+BvcXkocGlSR2qJkW2HRqICgBi0o3/J7J2TJE/tjhdPYxjRFQ8v8cueeZ9CHHLzDnNK0t1fVwshHj0xFGQ4sxmd2xIuf+qmhihV1dsL6zLSOgO1MJ2ahU364dLFDqT8zAc4CvntGoZq2GaSRJvpgkMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acHx8TAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acHx8TAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2A91F00A3D;
	Fri,  4 Sep 2026 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788520963;
	bh=YJCZME/594Xy8B8jVu6Smq4mlzmi2kmZv8iQg1LGClI=;
	h=Date:From:To:Cc:Subject:References;
	b=acHx8TAwq3Uec8APqro0iawU8qHMQ40z7WyUSpgksTnbPGjWw7xQT/7FpEsFEO64D
	 cLhcja5D03qwg8XAEcFAVn+lf9DsKwq6gW0sGboefoFsacuQ6Vfns8N1TqMsefFkSy
	 YilRvSrC5Eer+vuFN6SHXvE9bcrQJybG4A/wVz0DW+TsfeudKVMVu0CT82+KuBJsCy
	 yqu+2zcS8VWBxuCyo85Y0K6+89eCDIuQO7Cy5E5vF6EmHzRmuir0XP2RGyl51qmAWS
	 NR7pnZ40lGinE2r4gQmh0bvuch9PshfnEcxFf9euof0bElaTaCKFhItk1teqCDyFAv
	 CotoJuekn8m3g==
Date: Fri, 04 Sep 2026 13:22:40 +0200
Message-ID: <20260904112202.297869969@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [patch 5/8] posix-cpu-timers: Move inlines out of public header
References: <20260904112100.683893401@kernel.org>
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

