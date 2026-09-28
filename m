Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A214352F95;
	Mon, 28 Sep 2026 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578887; cv=none; b=a6aXS1eskKTtfWpNPpseRK4xAhxgv88KBLL8h0mCrDRH1SEp1sftrViyqnEBS78TZ5kt9ta9ee2p8vpYpwFjsdmu9aK6fk5MVlnMLTzozlhp/WA+21DdOsts59r1eHYd1A0rSTYDgFQGhQUTlwocLfXRYuoaDotgUvORC1xaxbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578887; c=relaxed/simple;
	bh=EloA9ZQktrmIBxG4suLasSPFZCfFhJoDh/CUe8Uo+zU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=lSrGd2E0YPggWJtgAv1C3/haEXsZfNTbz91WL8sAZBkt0ieLhTHyjfubI6EpgX5aetA1oFZhs5d1BH4+4g27D9plfPSDfTi2VWEkInYfq1URZ8nj1Xg4h7Y0TRqDLxS3R5/D2sIUhQ7ofiCW1CPrnAfYn9v4cWg9Rchy+8/Jrwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VrRzEdKW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UP2IWzFc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VrRzEdKW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UP2IWzFc"
Date: Mon, 28 Sep 2026 07:01:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578881;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HxfnLvM0090jbeaK5qDSIVekwipimr7ZYXU2N8JMULY=;
	b=VrRzEdKWJOFqYsdG1dkzVxnJFDV4QcdBPIZ6KAVXopbFhWhpl0oeg/kt0HAZJ/MzFNCX13
	jefBy5PXZDnPLnslkrR7GwIp5Cilq5HA7h18fWXlGjKqgxXR9Mj5Q+WPYeBLZkMHkew4RT
	Srl2X+FhoS/wsIvfaljlhRLWm+coWkQKeHe/SlD/9VaNzezsRA7w0ZPKNOX3Suo5PlqYgR
	4yGcoqFwcbGhK6l+tQAtFKjdyl4adSyYainnkYKSupal2sZVd0VbCZqw2xA2MKSmW9hrt0
	bAUphAH5YnllNQRvWxZVZvl3nDY47P0PAUWp3hgETO0SonrXryfCk5XH76LyAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578881;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HxfnLvM0090jbeaK5qDSIVekwipimr7ZYXU2N8JMULY=;
	b=UP2IWzFc9FDnnXYLz9sgEAuvQIuQFLO8wlpHdni/AtgsHR0OvJxA6kIsFwJ9Wul2SXAFCM
	u+uZ3dGPzC5qFuAA==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/debug: Add migration stats due to non preferred CPUs
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-10-sshegde@linux.ibm.com>
References: <20260928053728.797539-10-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057887942.3910103.2100266210191832471.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     68957caaa9c0e127bc87fee64e45be843f6c5c91
Gitweb:        https://git.kernel.org/tip/68957caaa9c0e127bc87fee64e45be843f6=
c5c91
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:24 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:42 +02:00

sched/debug: Add migration stats due to non preferred CPUs

Add a new per-task stat,
- nr_migrations_cpu_non_preferred: number of push migrations while the
  CPU is non-preferred.

Since this new stat is per-task, it changes only /proc/<pid>/sched.
It doesn't update /proc/schedstat. Hence increasing the schedstat version
is not necessary.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-10-sshegde@linux.ibm.com
---
 include/linux/sched.h |  1 +
 kernel/sched/core.c   |  9 +++++++--
 kernel/sched/debug.c  |  1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d7cc771..48639b0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -554,6 +554,7 @@ struct sched_statistics {
 	u64				nr_failed_migrations_running;
 	u64				nr_failed_migrations_hot;
 	u64				nr_forced_migrations;
+	u64				nr_migrations_cpu_non_preferred;
=20
 	u64				nr_wakeups;
 	u64				nr_wakeups_sync;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0e40055..0bb86a4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11288,8 +11288,13 @@ static int sched_non_preferred_cpu_push_stop(void *a=
rg)
 		update_rq_clock(rq);
 		context_unsafe_alias(rq);
=20
-		if (task_rq(p) =3D=3D rq && task_on_rq_queued(p))
-			rq =3D __migrate_task(rq, &rf, p, cpu);
+		if (task_rq(p) =3D=3D rq && task_on_rq_queued(p)) {
+			struct rq *dest_rq =3D __migrate_task(rq, &rf, p, cpu);
+
+			if (rq !=3D dest_rq)
+				schedstat_inc(p->stats.nr_migrations_cpu_non_preferred);
+			rq =3D dest_rq;
+		}
 		rq_unlock(rq, &rf);
 	}
=20
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index fda10b3..e6a3b51 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1440,6 +1440,7 @@ void proc_sched_show_task(struct task_struct *p, struct=
 pid_namespace *ns,
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
 		P_SCHEDSTAT(nr_forced_migrations);
+		P_SCHEDSTAT(nr_migrations_cpu_non_preferred);
 		P_SCHEDSTAT(nr_wakeups);
 		P_SCHEDSTAT(nr_wakeups_sync);
 		P_SCHEDSTAT(nr_wakeups_migrate);
