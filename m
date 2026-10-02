Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C347F3A1;
	Fri,  2 Oct 2026 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933603; cv=none; b=Tblxb5NF62i54nkDhPFKoDE324spdEIJ5wGwrE44MXy9FZoP8q1HqXrLc3ic6zuaI8a7JqNLNYiAb2coAvXeQ5LMROz3lctLyQrYYaI6fBcCK8aAUbZcDKSCgWyXioRVNH1/QGra4TtqbfVOtSvtRrurC3AbtUpAZr7D1cQyKEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933603; c=relaxed/simple;
	bh=W8wdVkooYRqQH26wIiQV3yV6M85VpsdG2OoKxUgxLUM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CZG4s0LKl9YfC4NKvFNTefyGlXtLPdx6jK9yRy+i1mcBVMt0PgxM5ubMy8jZaFyXqzKaGxqx9mFyN6MSbF5u0ACYsKqHlDRPvKRb+2lDjOdp+lyHxFMnjhdqdb/SQRy/ctY1ak8Ag7mjZe3xfDB/9gSKyuOmldL8ghM+U0C9pLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n273O1rO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GpPZxzNE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n273O1rO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GpPZxzNE"
Date: Fri, 02 Oct 2026 09:33:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933600;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRhapI9dBwuV2j2FTrKOiFnT7A6oA+aOfx2eLIiNiuk=;
	b=n273O1rOvZvvWs1dVb2Vpwlc9k5Sm5E12tbr+xvgXO5rQgDINHWyx5B/gMd2rk9/6co3Xr
	3ue/P3Uc4u8dRBgRx4g21N/xLHO0tBqnBZOPCetdsHPHz1to0WU07aNC4H28X1CO1YbuxW
	jnGrYIql7wifD0uyHmRjY5E4rltlVdQDI556Gypie0w7mKkExLEK1DtR2W0USa1AIfNBQD
	uw2lA2u0cez3rngPWi6vO1DM7aIoNs9Ji4raZ3++LeV77DY6NKpfjtqVeQpNaMZy/8mkjm
	rUJf1Z+5QZd3eAbkC7YHExWB7bgpx/26Q9yPcPBDYIT/7qdcpQcb/1dYhZs+zA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933600;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRhapI9dBwuV2j2FTrKOiFnT7A6oA+aOfx2eLIiNiuk=;
	b=GpPZxzNEzbBhopsNKS1fdTQ2Uf0kYxtR+3ti8hguSOXiyiy6iOaiBc0vP0a2IsLcOqU+09
	ZM8A6tpeaiH17WCQ==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/core: Fix context analysis errors in
 non-preferred CPU push
Cc: Nathan Chancellor <nathan@kernel.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929164712.1054883-1-sshegde@linux.ibm.com>
References: <20260929164712.1054883-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093359837.3910103.7014063937587288325.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     4b1f75be23c4fb0016a102d1cb108ba355c4c00d
Gitweb:        https://git.kernel.org/tip/4b1f75be23c4fb0016a102d1cb108ba355c=
4c00d
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Tue, 29 Sep 2026 22:17:12 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:34 +02:00

sched/core: Fix context analysis errors in non-preferred CPU push

Nathan reported build failure with clang23 when CONFIG_PREFERRED_CPU=3Dy.

  kernel/sched/core.c:11298:3: error: releasing raw_spinlock 'rq_lockp(rq)' t=
hat was not held [-Werror,-Wthread-safety-analysis]
   11298 |                 rq_unlock(rq, &rf);
         |                 ^
  kernel/sched/core.c:11303:1: error: raw_spinlock 'rq_lockp(__this_rq())' is=
 not held on every path through here [-Werror,-Wthread-safety-analysis]

context_unsafe_alias(rq) was placed after rq_lock(), by which point it had
already associated the lock with the original rq alias.

Move the alias barrier before rq_lock() so that the changing rq alias is
accounted for before acquiring the lock.

Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
Closes: https://lore.kernel.org/all/20260929121838.GA1814129@ax162/
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Link: https://patch.msgid.link/20260929164712.1054883-1-sshegde@linux.ibm.com
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0bb86a4..23677d7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11283,10 +11283,10 @@ static int sched_non_preferred_cpu_push_stop(void *=
arg)
 		 * safely bail out.
 		 */
 		cpu =3D select_fallback_rq(rq->cpu, p);
+		context_unsafe_alias(rq);
 		rq_lock(rq, &rf);
 		rq->npc_push_work_pending =3D false;
 		update_rq_clock(rq);
-		context_unsafe_alias(rq);
=20
 		if (task_rq(p) =3D=3D rq && task_on_rq_queued(p)) {
 			struct rq *dest_rq =3D __migrate_task(rq, &rf, p, cpu);
