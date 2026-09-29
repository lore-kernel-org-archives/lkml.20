Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9A470EB1;
	Tue, 29 Sep 2026 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708744; cv=none; b=hXP8DZHerrdEgmlk1l3SFrPgxCRFh8bIetzR91CMbSab5VvguEoEcng5b+tWTHQaaIT38Yc9bCdw5z/pOSA5DYx9Zfk7CXtzEILFsrjjT5FY52bMLmiNR3qPLDtVQKfSKldcVsFKdiPRxPomhETniSCEV5gp4HjAt3XXYBsw4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708744; c=relaxed/simple;
	bh=FQliRaILjAKYUnP/2XYZaYjMV9blqjtMU6EnXEKQHlo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=q8tPOGtW29fKW+7y9cBbexdUCYyRLUi9Ks9kv9yRDh6Ws43yyQesVusoXCdJ7fIMgRvQK08uygmBUW0ueLUEqrT/uSK3nhkpJa35rOx8Ywz6mfg6G5MVvGYDXtqvwRkvKQFMZ8pT7gvqN0RFyma2ZbpP25i+HB2Dgn03OoHzmS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vx0zUeSn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8eMeqspM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vx0zUeSn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8eMeqspM"
Date: Tue, 29 Sep 2026 19:05:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708741;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DwVKtEqxjDxmOBYHVpoGm4c/xLv8Fc3GqREPtymUX8=;
	b=Vx0zUeSn4VvyhuG8B16uwnjih8KWKqJ9jbvoCTumuTw1YIE0b+hhTMek6WV6bWUpyXU/W7
	2Km767V/O2lJykR/5lAyjcmn09irDHiaHHSZ3d9BobkGTEVLfeIgWHoSJDAKboWFF+xQOA
	//PLnb32mae8j+s5O/dmWjUZnbUJpIiaYPPaR9pOd+iDaGLcofmvHT8Ccae/QfzKVZFaJh
	uo/W+qe7h9PN36RTt49ocVvfzFCWjS8xulbGKA09vXSvSw31xcfIX4bdZmGN4YRyaI5Drx
	/eUUrAn3Rqn9YjsqVx+6lPvCHkmCuundHbvUq6Ej0f3vy63oe+ZcEVlOp02/nA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708741;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DwVKtEqxjDxmOBYHVpoGm4c/xLv8Fc3GqREPtymUX8=;
	b=8eMeqspMSt/TGOEN7hPTO6ys0lxfSUCGdvzkhVMqAwi6VBBBmUBR5/Sd4CThtH2OrlG9vV
	S2InxBuDC5DXjBDA==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] io-uring/rw: Use accessor for hrtimer_sleeper ->task field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-4-paulmck@kernel.org>
References: <20260919001428.3133388-4-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070873934.3910103.1896574908492600798.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     851c30277918e1f1aad12394235d87c00afec464
Gitweb:        https://git.kernel.org/tip/851c30277918e1f1aad12394235d87c00af=
ec464
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:20 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:51 +02:00

io-uring/rw: Use accessor for hrtimer_sleeper ->task field

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to the io_hybrid_iopoll_delay() function.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919001428.3133388-4-paulmck@kernel.org
---
 io_uring/rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 432820f..d9b1e09 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1295,7 +1295,7 @@ static u64 io_hybrid_iopoll_delay(struct io_ring_ctx *c=
tx, struct io_kiocb *req)
 	set_current_state(TASK_INTERRUPTIBLE);
 	hrtimer_sleeper_start_expires(&timer, mode);
=20
-	if (timer.task)
+	if (hrtimer_sleeper_task_get(&timer))
 		io_schedule();
=20
 	hrtimer_cancel(&timer.timer);
