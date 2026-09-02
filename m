Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A563264C2;
	Wed,  2 Sep 2026 07:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335701; cv=none; b=NgvcOJ8tKuy0mqazjqjIFoacFozCKWhJh/FObrxBuVWXYfJlv7yLpsWsY2fNMhvrF9YoFMmefvov2ssT8a4lIhuugXZNF890UWiA0ADDkgb1BqYDgACcsQ2EeNamrTlOp6NMbAfZq4Ie8za8mHXpaDGlAJ4WlSsed/y0Z+Wi84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335701; c=relaxed/simple;
	bh=pp1pZjUwXxTZ5uHKsm7kq7/bYSIXsKKpSp+SMbIZv+w=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=uM59eKJDIMTJIPTqB+Ry5MxJBALqrjd+H+HD84z65s4uyY9JGBCPfsbKyb6sPOOqXfTUXJNpl6QkfAPGoZpIWJdsSRG3Lr+k6s49wHARqyKJWaGgZZvT4i5tcOjwUs8JLlMa9hOaulyonoOjb6TP83EVc9A5s74x/MwfyMnREUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V225RgdH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8OyKdbr9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V225RgdH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8OyKdbr9"
Date: Wed, 02 Sep 2026 07:54:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335697;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSXilb+mjDNnbF3TavyQXgAiqRiaqfMnfzVHtaZ8GN0=;
	b=V225RgdHRDWb+gTZ/+mPXp0Ap5aUGPfhFpNtU0PCxNWre010JV0IVFO5l8EPeHPpkJDlpv
	WefALiy1tHD/GYXuccflrS9Hdq4uiy2KS3r/Hr6eTGfg0hzXDqMndgKueyLFA9TLjCqEIN
	CCWmlI6r3DeFkE5C8cguVHvJKpG1xnMQTXKNLU/mJ/AWpDjN2l4SZSTMNgtG2FFpIEtLlZ
	mW8WTPVG48uB28wNPkw0qIG3jRXXn/HUkrjMLaqAzFMeEjMvYu4Lxow1ccDxWrcsXOf2oz
	nuBon6Andb4XNl+O9sfCFi0/RMVJoY8LzERkyvEHZvdKrBTOhqNulXBnvC1zTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335697;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSXilb+mjDNnbF3TavyQXgAiqRiaqfMnfzVHtaZ8GN0=;
	b=8OyKdbr9Lr9i8FiivbZyW/0YHArde7up8S8ZubkPeKFeu2Sjg6uyGVy8CxExJTePXlQC35
	wExMmNl/aNFQvAAQ==
From: "tip-bot2 for John Stultz" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Migrate whole chain in proxy_migrate_task()
Cc: John Stultz <jstultz@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807035232.1881495-8-jstultz@google.com>
References: <20260807035232.1881495-8-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833569584.3717435.18415757153812981981.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     772d9ffbfd2627779ed9b73155585e63c940bcec
Gitweb:        https://git.kernel.org/tip/772d9ffbfd2627779ed9b73155585e63c94=
0bcec
Author:        John Stultz <jstultz@google.com>
AuthorDate:    Fri, 07 Aug 2026 03:52:13=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:21 +02:00

sched: Migrate whole chain in proxy_migrate_task()

Instead of migrating one task each time through find_proxy_task(),
we can walk up the blocked_donor ptrs and migrate the entire
current chain in one go.

This was broken out of earlier patches and held back while the
series was being stabilized, but I wanted to re-introduce it.

Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260807035232.1881495-8-jstultz@google.com
---
 kernel/sched/core.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f80b607..9841043 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6861,9 +6861,9 @@ static void proxy_migrate_task(struct rq *rq, struct rq=
_flags *rf,
 	__must_hold(__rq_lockp(rq))
 {
 	struct rq *target_rq =3D cpu_rq(target_cpu);
+	LIST_HEAD(migrate_list);
=20
 	lockdep_assert_rq_held(rq);
-	WARN_ON(p =3D=3D rq->curr);
 	/*
 	 * Since we are migrating a blocked donor, it could be rq->donor,
 	 * and we want to make sure there aren't any references from this
@@ -6876,13 +6876,20 @@ static void proxy_migrate_task(struct rq *rq, struct =
rq_flags *rf,
 	 * before we release the lock.
 	 */
 	proxy_resched_idle(rq);
-
-	deactivate_task(rq, p, DEQUEUE_NOCLOCK);
-	proxy_set_task_cpu(p, target_cpu);
-
+	for (; p; p =3D p->blocked_donor) {
+		WARN_ON(p =3D=3D rq->curr);
+		deactivate_task(rq, p, DEQUEUE_NOCLOCK);
+		proxy_set_task_cpu(p, target_cpu);
+		/*
+		 * We can re-use se.group_node to migrate the thing,
+		 * because @p is deactivated (won't be balanced) and
+		 * we hold the rq_lock.
+		 */
+		list_add(&p->se.group_node, &migrate_list);
+	}
 	proxy_release_rq_lock(rq, rf);
=20
-	attach_one_task(target_rq, p);
+	__attach_tasks(target_rq, &migrate_list);
=20
 	proxy_reacquire_rq_lock(rq, rf);
 }
