Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A833CC9EA;
	Fri, 18 Sep 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727240; cv=none; b=be14fpBxjIkwyKlnC1VqL7qNEjZyETfOg3BYKu9h6J5OorDJXVBQAza3Lp1IKb8GgeRG3qk1kuUBHDJC3zsLHNdxR/wSe5t3G2qbBWZ+oZ4E0T4MB/LIfsOuJoYcErG4WNxhc2dFI3WRhL0mrdz5orwAGjUoYLfcy/43TMazSng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727240; c=relaxed/simple;
	bh=QLzIRpbs8OgFMZOUTItjU+aVTVZ2l2qJHGgaxcrnEiE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YlSKAI/Y5NyWA4MHMHJ0DhMaYsSMctcAio2VP4lXMDgqSTovBXrdlQdWJEHysIOAoNEBPvdaLNT5wwsfVYsRsx+hzsYBGtHsbcFhWvLVp3JZruimTiAXMpYUgNNPCHA0yaFuqGGpEdn+xPaf2xcZdkdXosQf6+mZ7TewZB7P+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b/SFm3Z5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YjtSN/bM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b/SFm3Z5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YjtSN/bM"
Date: Fri, 18 Sep 2026 10:27:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789727234;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bdp+GG3CE9mCMAnBeTYr7SLWZMSJgROybfmBcZY6Lx4=;
	b=b/SFm3Z5rTEKWsJ8YOPiTi1MhVwo3KX3VAIK8d6i3ts1cQ6NfqYBt5XL7eugqhHR0v2sM6
	PAPeSRmGwOF7dHPTTiSbxkBRf4GJS62CEKZQPU8gZc46IBbeQDD8t3moBr1xTRZ3UFvj9j
	mZhbBZaZkv0eNCXGg1mMljZ37tnQkovvThQ4/54S4KYZNBwFsQPCh9vPUekcmx+XN05lQ5
	mdyJF+AHSX/8nRMv9ICKYjlELm/yoAia7hYOIUx3tiUwy2iC9FzNpOZsvTROktn5TPxFxB
	/9Ev/aYljr2hvmoeUVvFVaEcUl4gAnCX7FNqeHwoMWDodpi69hPmXlp+8gwhIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789727234;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bdp+GG3CE9mCMAnBeTYr7SLWZMSJgROybfmBcZY6Lx4=;
	b=YjtSN/bM/IIDjQcAII9vSBjP7P6DqUdMtNQ3hjrTeOnYoLvHxHSa6Fl8kJ0tirvn+xRVl9
	AEVKr+vck16OlbBQ==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/core: Avoid false migration warning for
 proxy donors
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 John Stultz <jstultz@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915184101.2621252-1-arighi@nvidia.com>
References: <20260915184101.2621252-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972723300.1720534.16948692139087509736.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     fe3c73d7bc769e7afc252f867a3421fe168b898d
Gitweb:        https://git.kernel.org/tip/fe3c73d7bc769e7afc252f867a3421fe168=
b898d
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 15 Sep 2026 20:41:01 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 18 Sep 2026 12:19:43 +02:00

sched/core: Avoid false migration warning for proxy donors

Proxy execution can move a blocked donor's scheduling context to the
lock owner's CPU even when the donor is migration-disabled. The donor
does not execute there, and its original execution CPU remains recorded
in wake_cpu.

set_task_cpu() warns unconditionally for migration-disabled tasks, so a
subsequent proxy migration or the wakeup path returning the donor home
triggers a false positive: moving a blocked scheduling context does not
violate the migration-disabled execution context.

For example, creating a mutex owner on CPU1 and a migration-disabled
waiter on CPU0 can trigger the following warning:

  proxy_migrate_repro: donor blocking on CPU0 with migration disabled
  proxy_migrate_repro: donor moved from CPU0 to CPU1
  WARNING: kernel/sched/core.c:3389 at set_task_cpu+0x1d3/0x280
  ...
  Call Trace:
   try_to_wake_up+0x43f/0x780
   __mutex_unlock_slowpath+0x330/0x540
   owner_fn+0x9f/0xc0 [proxy_migrate_repro]
  ...
  proxy_migrate_repro: donor woke on CPU0, task_cpu=3D0
  proxy_migrate_repro: completed

Exclude blocked proxy donors from the warning. The proxy wakeup path
restores an executable placement before clearing the blocked state.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migr=
ation)")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260915184101.2621252-1-arighi@nvidia.com
---
 kernel/sched/core.c |  9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7885ff7..0b846a1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3351,6 +3351,8 @@ void relax_compatible_cpus_allowed_ptr(struct task_stru=
ct *p)
 void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
 {
 	unsigned int state =3D READ_ONCE(p->__state);
+	bool proxy_migrated =3D sched_proxy_exec() && p->is_blocked &&
+			      task_cpu(p) !=3D p->wake_cpu;
=20
 	/*
 	 * We should never call set_task_cpu() on a blocked task,
@@ -3386,7 +3388,12 @@ void set_task_cpu(struct task_struct *p, unsigned int =
new_cpu)
 	 */
 	WARN_ON_ONCE(!cpu_online(new_cpu));
=20
-	WARN_ON_ONCE(is_migration_disabled(p));
+	/*
+	 * Proxy execution can move a blocked task's scheduling context to any
+	 * CPU without moving its migration-disabled execution context. The
+	 * wakeup path will return the task to a CPU where it can execute.
+	 */
+	WARN_ON_ONCE(is_migration_disabled(p) && !proxy_migrated);
=20
 	trace_sched_migrate_task(p, new_cpu);
=20
