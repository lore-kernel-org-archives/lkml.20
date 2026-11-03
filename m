Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712371;
	b=ZqHWIH5U3E3PG0Ewb0ZBDT9obxc2USW64tBOAP9WOrmXQoWlCQOKQM6RG38t29/QVFfF
	 /9BcGwFYQ8AqOrx5ozRnm7T4R06xNt8hNM305rrfMEFPHY5TV+AuZWpWbQF9PH6gd5Swu
	 W6ylysU56ATryV+eUdtR5ZAqurXHhWs8MSpXCVv5/uKzIRHpIV5hm8jPr/abtBwPD4NpB
	 h+vEjnuIj/UHKPVI3Ci10RhG0S+S/NW7nUEnwhXHhmE+uJ82SkPWunxK3SzswgBqRleVy
	 NCVrvNNcu6tziLlZsppPM4s9e7mWrOmp7yaEMGbW9HClllefjPByDUSZTveo8eqOmpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712371;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=mAmRe6Pu8imEkPpJDLQYrck1FIaGtVTQ3Foj2dLsSF0=;
	b=pTrDJs/FzOMUf+t/XVDt3O2qAIHQI6yZav9IaaHxNh+TFr58okU5VIVZCpAoe2InHvz/
	 tO4xHnJKQ060U4rBRhL/BejDc90f6neKpWNpSktiVHjUf2a64pVPN0fnT/2c/EyBpxsfW
	 nYlYcmPwfmd53keq++cZberuSt0SaYYib9kap7/nfAtvWTvUYRfVOZb+qVLaBv8j95nag
	 6pb784NR2uX7HlBEUiRhp+a6JR+S0SRDbe5GroYAEsx09zZdmqSDBoT57TWkE96vrkaIZ
	 p1EOss8MwO/hI0YdH/m761K/BZyYGVFxYHhBQroIiFx8tPMDGsQL168qlBqNgeS4q7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RKqxbg8i;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=x4WBzrQG;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227F606EE93;
	Tue,  3 Nov 2026 13:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2227F606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RKqxbg8i;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=x4WBzrQG
Date: Tue, 03 Nov 2026 13:26:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793712363;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAmRe6Pu8imEkPpJDLQYrck1FIaGtVTQ3Foj2dLsSF0=;
	b=RKqxbg8iPbLeohhHsRWkf3we4z8xfCRBUSmjDkNmKQxqr9gteHarLjHYOELmScUEupWM3F
	5ypq0BaKAbRKGWux2pBtGOkI4PwsUJo5MP2O+rydB8LaP1sLZ19B2J/K30H7kJ4x0s6Wl2
	eeFSbXRzNydKkGRIUf5qWoqy+X8YMcrrmJqI3NrEj32T8RaIw9FrAaXnfuXU+ys3Ts0lRJ
	Q+KxdnreOoDbT+I2QgiT8OtcVS2WfCktEWOxCh7995nPjrI9tPfEtb+P/Su0P7AC4yvstf
	YqsDZ4AVEyC0RDOQHBYYkyKupEQw5KbsKR2mxzSSdrB+Pw4ZCfG3xOd2l3IS4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793712363;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAmRe6Pu8imEkPpJDLQYrck1FIaGtVTQ3Foj2dLsSF0=;
	b=x4WBzrQGiOV6xZxDzlNBeD5bTy+Ko6k3jBa9H+xiuvu7h/gllkLcmctORHgrnkDfVPK4yV
	LK+G07Brtsio64BQ==
From: "tip-bot2 for Juri Lelli" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/deadline: Fix total_bw leak when switching
 away from SCHED_DEADLINE while !queued
Cc: Tejun Heo <tj@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-2-dd761fe005b4@redhat.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-2-dd761fe005b4@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179371236184.1009794.11736147904339400946.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     41a7968022ca3f72b180b4fc2125c66020c8c73a
Gitweb:        https://git.kernel.org/tip/41a7968022ca3f72b180b4fc2125c66020c=
8c73a
Author:        Juri Lelli <juri.lelli@redhat.com>
AuthorDate:    Tue, 03 Nov 2026 12:26:30 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 03 Nov 2026 14:18:04 +01:00

sched/deadline: Fix total_bw leak when switching away from SCHED_DEADLINE whi=
le !queued

When a SCHED_DEADLINE task is switched to another policy while it is not
queued (sleeping or stopped), its bandwidth leaks in the root domain's
total_bw. The leak happens because:

 - switched_from_dl() only calls task_non_contending() for queued tasks.

 - For non-queued tasks, it subtracts running_bw and rq_bw, but never
   releases total_bw from the root domain's dl_bw.

 - The inactive timer is the only path that calls __dl_sub() to release
   total_bw, but it is either not armed (the task never ran as DEADLINE)
   or already fired while the task was still DEADLINE (only dropping
   running_bw at that time).

Repeating this fills total_bw up to the admission cap, after which
sched_setattr(SCHED_DEADLINE) and CPU offline fail with -EBUSY.

Fix this by releasing total_bw directly in switched_from_dl() when the
task is not queued and dl_non_contending is not set (meaning no pending
inactive timer will handle it).

Fixes: 209a0cbda7a0 ("sched/deadline: Improve the tracking of active utilizat=
ion")
Reported-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://patch.msgid.link/20261103-b4-sched-dl-bw-fixes-v1-2-dd761fe005b=
4@redhat.com
Closes: https://lore.kernel.org/all/2b5fb3f22bca6aa383be8f4781923392@kernel.o=
rg/
---
 kernel/sched/deadline.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 68019da..963fda6 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3547,14 +3547,32 @@ static void switched_from_dl(struct rq *rq, struct ta=
sk_struct *p)
 	dec_dl_tasks_cs(p);
=20
 	if (!task_on_rq_queued(p)) {
-		/*
-		 * Inactive timer is armed. However, p is leaving DEADLINE and
-		 * might migrate away from this rq while continuing to run on
-		 * some other class. We need to remove its contribution from
-		 * this rq running_bw now, or sub_rq_bw (below) will complain.
-		 */
-		if (p->dl.dl_non_contending)
+		if (p->dl.dl_non_contending) {
+			/*
+			 * Inactive timer is armed. However, p is leaving
+			 * DEADLINE and might migrate away from this rq while
+			 * continuing to run on some other class. We need to
+			 * remove its contribution from this rq running_bw now,
+			 * or sub_rq_bw (below) will complain.
+			 *
+			 * inactive_task_timer() will find !dl_task(p) and
+			 * release total_bw via __dl_sub().
+			 */
 			sub_running_bw(&p->dl, &rq->dl);
+		} else {
+			/*
+			 * No pending inactive timer: the task never ran as
+			 * DEADLINE or the timer already fired while still
+			 * DEADLINE (only dropping running_bw at that time).
+			 * Nobody else will release total_bw, do it now.
+			 */
+			unsigned int cpu =3D dl_task_root_domain_cpu(p);
+			struct dl_bw *dl_b =3D &cpu_rq(cpu)->rd->dl_bw;
+
+			raw_spin_lock(&dl_b->lock);
+			__dl_sub(dl_b, p->dl.dl_bw, dl_bw_cpus(cpu));
+			raw_spin_unlock(&dl_b->lock);
+		}
 		sub_rq_bw(&p->dl, &rq->dl);
 	}
=20
