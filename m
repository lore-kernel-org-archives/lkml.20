Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651145FFD2;
	Mon, 28 Sep 2026 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578902; cv=none; b=EB2t5K0rY+JM7i4RGoE3CGYhHzPAhm/YkCfkNf6AKj8ADn4+dTnZs1tMSAmTxvwmCgahqBAiOAKjl+KHTqEGz38kDlfXQL6p9P+Bs5PUPD1keWJijUJBYQrprzW2qb6Bzq8BAQ4eU89eUl1I2gf+Xml/UcrPMiSzMffgINGq6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578902; c=relaxed/simple;
	bh=4cFxQbNg+LYKANcMpbrzLBxV/75cU/kwqvhdNcFGA+c=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Av/yDoLQ88fT1TeILRxKYOM1kg2hmmM8WvKg8MwIyXYDZsEWvT2BQetLBTR+0L65wMBPZrm3OLnrfxMXguPVYzfjGA9JuSE9+051r72C7uzpdCjBWb1XaW8Oe7Je2TwfWhpCKI2YOMC8LF32rMQgtuvVfk2EAERSqhvza6r4z2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HzdOM1bw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SnmkZ0c1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HzdOM1bw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SnmkZ0c1"
Date: Mon, 28 Sep 2026 07:01:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578899;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3tjyGjGYgpCryyAvIqLFwYaYqyBJBxPRoqIC3rO510=;
	b=HzdOM1bwGd/Dv2PZxsOXLd4LV6Z8aLx+cLthXk4C6msJm9q3919odju3jKSZEdH6gjE2E0
	Hz95fwN4hdxygXB1vjyyqfaW+B8HtlDNZuqOEiIcD8cBxlLTqQzlKMxxvcW27Sv8WkvGH+
	iMDdX6pai8PoyEHHyWJhLgteS0qrbvacJBUGOGvFvauVoiVAUgxc0AkSNZJXOVcFbN4BRp
	E0+Ck14UG4DXI6wiBgRxwsnoXE5G3f2Hrbbr/ZF0RvLxmNiM4gEnQ2ZxeOS1fQ/BL9a3Vn
	fu5ZmlrdaUAshqAmUGOFmhdMR2OiWO0gbMlBbXfpX9R1o0QGqvl2t9guqta+SQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578899;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3tjyGjGYgpCryyAvIqLFwYaYqyBJBxPRoqIC3rO510=;
	b=SnmkZ0c1/DUlxn+zjCH/S9lWhCmsT221a+DXJTY044Z3/NVBlqo6lqrPsLVLjOagAAmQ9p
	EZhoo4ZTGVh4pLAw==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/core: Mark wakeups completed through ttwu_runnable()
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922165445.943315-4-arighi@nvidia.com>
References: <20260922165445.943315-4-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057889770.3910103.7688900958947733764.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     a49653d0abebee32bf3ecf650fae9f9dd8298135
Gitweb:        https://git.kernel.org/tip/a49653d0abebee32bf3ecf650fae9f9dd82=
98135
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 22 Sep 2026 18:51:42 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:39 +02:00

sched/core: Mark wakeups completed through ttwu_runnable()

ttwu_runnable() completes a wakeup for a task which remains queued
without calling activate_task() or its scheduling-class enqueue
callback. Scheduling classes currently cannot distinguish this path
from wakeups which performed a full activation.

Add WF_TTWU_RQ to identify wakeups completed through ttwu_runnable().
A later sched_ext change uses it to reconsider retained proxy donors
which wake without another ops.enqueue() call.

No functional change.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260922165445.943315-4-arighi@nvidia.com
---
 kernel/sched/core.c  | 2 +-
 kernel/sched/sched.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 07cc171..6b42f91 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3919,7 +3919,7 @@ static int ttwu_runnable(struct task_struct *p, int wak=
e_flags)
 		 * When on_rq && !on_cpu the task is preempted, see if
 		 * it should preempt the task that is current now.
 		 */
-		wakeup_preempt(rq, p, wake_flags);
+		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
 	}
 	ttwu_do_wakeup(p);
 	return 1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b98084e..a0f391f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2545,6 +2545,7 @@ static inline int task_on_rq_migrating(struct task_stru=
ct *p)
 #define WF_MIGRATED		0x20 /* Internal use, task got migrated */
 #define WF_CURRENT_CPU		0x40 /* Prefer to move the wakee to the current CPU.=
 */
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
+#define WF_TTWU_RQ		0x100 /* Wakeup completed through ttwu_runnable() */
=20
 static_assert(WF_EXEC =3D=3D SD_BALANCE_EXEC);
 static_assert(WF_FORK =3D=3D SD_BALANCE_FORK);
