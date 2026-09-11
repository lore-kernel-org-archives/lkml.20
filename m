Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723B466B01
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117775; cv=none; b=E2BgSw9VEVAsz12dRUebUjArI5v6nXnLUoPaMQraNW5u2CbTy23KhFOiBkGNUZokVmWSi40MoqQdEb6UB24DkDjkqnAWYpyPaifW3PER5Hku8TrEXl0WOeU/98H+JGWffiWb0eXJN/EIOpxGZ5+yzMfW5IYxtuPlcBhmOedageE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117775; c=relaxed/simple;
	bh=auNF5ZAwigJWxcTq9+9rQwCUSJTmyJg+oUb42yt5uYc=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Xl3pRYDAZiDUJj4hYVdu+O+OaGuHAgr+b8wzKe+dLG21nhvS6el+y1e1+SL6C1ScjTGNUpOFJwvEN1lcw2dx23ltnKIytNXB2PxuVBUbZTVNnlia6vupcNPyRRGWhChR+/pml5A5bkYAHgpdyhvLD0kNDob0xxidZKV2ivBFaAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBy1ScLm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBy1ScLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C001F000FF;
	Fri, 11 Sep 2026 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117774;
	bh=JRZ8BBMudhq1Q8x9ccrDWF+8TmIKlrUIqw0uwbr+vn0=;
	h=Date:From:To:Cc:Subject:References;
	b=IBy1ScLmcG/IWsq5LouuzTvai3kYw5MscgdlITVIPVKhwqHlavKGp2z1J3ys4ZDw5
	 78dTp/5omzpTEMcEiKtJ8mMDZ3QSJir6aTfS6yQIIoZyLKfLiwOJh4RclQu4mObkVx
	 ORFZclSt/IWOQ0/MTnz01QGfgdefu54MOalqU+zVEs047iZ5N79L2kOkuf9mXxKF3w
	 gU1HstQdAbg9l7/0bZulMw1tRSPm74bPWbGtKyBhq/ewisFwgamBw709eC9GRNhJ36
	 95EAdioBBBkSLbhBbd8yqBIpr0x0ZCJh9L/K8KfByQWdJt2EOV/CJ3qygr9b27dHZn
	 5TazFHRYq9VWQ==
Date: Fri, 11 Sep 2026 11:09:31 +0200
Message-ID: <20260911090541.785749315@kernel.org>
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
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: [patch V3 5/8] posix-cpu-timers: Move inlines out of public header
References: <20260911090341.949101445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Thomas Gleixner <tglx@kernel.org>

They are only used in the POSIX CPU timer code. No point in exposing them
globally and parsing them for nothing.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

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



