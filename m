Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE63E2740;
	Thu, 10 Sep 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030929; cv=none; b=ncfVm9vpCdXc2pjLTWAv+pnofdgBfOPuf4tWlE1wMV/Gn4QrKurlj8QD2+gwoYNr1gTYY2ddW5O+HBj/WAsHjOxzBr0Dh+cvZU9UqJQfrFu1kB+pAYutF+Pgr3WwsIXfivDZnl5EzUxo2azATLT0rK2fuDsxCCogVdKoE637y8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030929; c=relaxed/simple;
	bh=01xC+/GvzHMeRlHiaNgiH5sQvwohqbrLesVcfnjyGfM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=kwsXirPh+P/elOrNa1tB+nCV0cPzCiO6BzEi/+2tzMDz2VWzcPefrUWlGQC9+B0ThQhFmMD1Ll+qJXR02nA5tZtJl8bJSNaU9Bv26CluikGgFyyDAQ3Xn7v8f19dMsjIkx3aH57SBEbSkCFMQgtb0jncJYccQK2osIKLoye0A5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AaLWfYfK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5hq49iky; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AaLWfYfK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5hq49iky"
Date: Thu, 10 Sep 2026 09:01:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789030919;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtNMsoTZO8vyD+37AOKHx7Q0p7xhx8GBIiFvsg0bsVQ=;
	b=AaLWfYfKq3sIKyBStPe1Rd+XE5iZzZECloVTz5G2YN2TD1Dqr9fkTAEEq97WlfgnQq1Mh0
	0UnV4r4Zisb7oV3oC+w4vmRJsk3NkgyvbNb/LOB4YGVE0chiL4kEk+ReD+l7Zyx3riDWkM
	4fVyR3/oeLGC83XFyO9HjWPQxuqRsSmx4QzuckeB/bf2zIneid+ILU7uAS+TVT0ERcF6PP
	u/BqKMzD6lKbCx84viT1K+QrH7+d4DeMFXoglKRPr8E48+eDPNMkrFI+0UepPSnWo2elHM
	G8cTtJDb70GBV6Ghvbt49bzzQP310axcsBVmzp8Lk/VclpN7jZCNasBPSgvTCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789030919;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtNMsoTZO8vyD+37AOKHx7Q0p7xhx8GBIiFvsg0bsVQ=;
	b=5hq49ikyCnCa3ddWNfWJxiCl7dzKrvcs9hs4mPq+Dr9MqkKBvbf2Bo51+GXSVnbY2N3tyW
	OQP4JIDzJ/I8+8DA==
From: "tip-bot2 for Thomas Richter" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf/core: Allow list_del during perf_event_overflow()
Cc: Thomas Richter <tmricht@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260908105637.627004-1-tmricht@linux.ibm.com>
References: <20260908105637.627004-1-tmricht@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178903091745.623050.16822770456707355526.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     59e63416f5153e7d58652c616fbdcb7d5e01fff7
Gitweb:        https://git.kernel.org/tip/59e63416f5153e7d58652c616fbdcb7d5e0=
1fff7
Author:        Thomas Richter <tmricht@linux.ibm.com>
AuthorDate:    Tue, 08 Sep 2026 12:56:37 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 10 Sep 2026 10:22:50 +02:00

perf/core: Allow list_del during perf_event_overflow()

A PMU might use perf_sched_cb_inc() and perf_sched_cb_dec()
interface to get the PMU call back function pmu::sched_task
invoked at schedule in and schedule out. This is achieved
by walking along the list anchored by sched_cb_list.

The following scenario might lead to a list corruption.

   perf_pmu_sched_task()
      for_each_list_entry(..., &sched_cb_list)
      +--> __perf_pmu_sched_task()
           +--> event->pmu->sched_task())
                +--> PMU_push_sample()
                     +--> perf_event_overflow()
                          +--> __perf_event_overflow()
                               +--> pmu->stop()
                                    +--> perf_sched_cb_dec()
                                         remove entry from sched_cb_list
                                         while list node in use.

This happens when ioctl(fd, PERF_EVENT_IOC_REFRESH, xxx) has been
invoked and perf_event::event_limit hits zero.

Prevent the list corruption and convert for_each_list_entry()
to for_each_list_entry_safe().

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260908105637.627004-1-tmricht@linux.ibm.com
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 33210af..fe33fe1 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3925,13 +3925,13 @@ static void perf_pmu_sched_task(struct task_struct *p=
rev,
 				bool sched_in)
 {
 	struct perf_cpu_context *cpuctx =3D this_cpu_ptr(&perf_cpu_context);
-	struct perf_cpu_pmu_context *cpc;
+	struct perf_cpu_pmu_context *cpc, *cpc2;
=20
 	/* cpuctx->task_ctx will be handled in perf_event_context_sched_in/out */
 	if (prev =3D=3D next || cpuctx->task_ctx)
 		return;
=20
-	list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_entry)
+	list_for_each_entry_safe(cpc, cpc2, this_cpu_ptr(&sched_cb_list), sched_cb_=
entry)
 		__perf_pmu_sched_task(cpc, sched_in ? next : prev, sched_in);
 }
=20
