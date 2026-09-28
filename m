Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4B7449B2C;
	Mon, 28 Sep 2026 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578887; cv=none; b=YesLNwGqq/ijYYbvIZfispCTuA19owxnqFi0BxcpXCZsZnSuf9zMM6f/ADu7Vlrt1ngoVL6LRMMC4tZPEQARBRmh57z1CzJkqkBHpX/lW9Gg40g01IvaKpSrHydJL/yfCLNkARHGcbTMVtM8LaC1FNA8Ig6bs6WchHNySgJKZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578887; c=relaxed/simple;
	bh=9zDU6kFKLS1KozcmbMTbQML5ZN2yxV0QM2TbiSn/wYc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ATPNFUjCjgplUllEZ7b+qr0ow3BGsFo/rXFl2rQFqxD9DX0j7JQtjWfhIiSdPwZtVOCn10e4PYWVHq0WPjjd6L+bA9hEIbinMTfbCxxetTtY/eJI6obv6d5DdhSNTRwEIa6VpJqMe392RSOnYF/AcCVQNY+yNVF5NfYWmEaZB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TlPjw8P/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bkI1eg/A; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TlPjw8P/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bkI1eg/A"
Date: Mon, 28 Sep 2026 07:01:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578884;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxHo04VJqM01uSPHVTPqfKKzYzZKY37KkVb6Ka7+2cE=;
	b=TlPjw8P/0+qB8qrCrw33qI/gnQSk4Yon6BcdS3LS65gHzFT3s2nyfGJJ0vNtuqsNGX7DbL
	9KJK+edOaWSdEjEFgh+Ao7bYL3addOzWybFUYTyc1PYdsyXqqqMo4+/UdJGZ7RNqPrpYMm
	V8Xoj9Wjh87f3FfqNW8p2TjIa1WZek87bN4xE1whXO4Pu3xm9tvxRlNVqs7jzimy6H0//y
	jF7wTD7mVlvODxwDM3zD41UCq2ramFCJSKaXSiIlATUjnsGkwrkqX5EUgq3ENQ4HyVRnbT
	yKAwcsf1EPlcHsqth6A8ZMZA3Bf3uRK9OksYNHMwJJ2Cl01cPyp7yT/4tcN9OQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578884;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxHo04VJqM01uSPHVTPqfKKzYzZKY37KkVb6Ka7+2cE=;
	b=bkI1eg/APtRzXRTUrvY2x79UsaXBlOwYLDdapYLEePYS5h1BC2lCz0VwP71F0Oc7zFqz1e
	MU63eWkvYNgN8VBw==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/fair: Load balance only among preferred CPUs
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Yury Norov <ynorov@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-8-sshegde@linux.ibm.com>
References: <20260928053728.797539-8-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057888237.3910103.4761326457236588774.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     4ee29b029058a8f06fbb91425e1d9351e8015b53
Gitweb:        https://git.kernel.org/tip/4ee29b029058a8f06fbb91425e1d9351e80=
15b53
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:22 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:42 +02:00

sched/fair: Load balance only among preferred CPUs

When a CPU is marked as non-preferred, any load pulled towards it is
pointless since the task will be pushed out again in the next tick.
So, consider only preferred CPUs for load balancing.

This ensures load balancing does not fight against the push task mechanism
which happens at the tick. Also, this stops active balancing from happening
on a non-preferred CPU pulling the load.

This also means there is no load balancing if a task is pinned only to
non-preferred CPUs. They will continue to run where they were previously
running before the CPUs were marked as non-preferred.

Bail out early for NEWIDLE balancing, as load balancing is done only on
preferred CPUs. Note that idle balancing is allowed to go through, since
that naturally updates nohz.next_balance when all the idle CPUs are
non-preferred.

Also, optimization in find_new_ilb() is skipped. The steal governor driver,
which is introduced in later patches, updates the preferred CPUs state in
descending order. find_new_ilb() checks for idle CPUs in ascending order.
Hence, in most common scenarios, the idle CPU found by find_new_ilb() will
already be a preferred CPU. When all idle CPUs are non-preferred, the first
idle CPU has to be chosen anyway. All of this is naturally handled in
find_new_ilb() currently. Adding additional complexity to it for rare
edge cases is not necessary.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Yury Norov <ynorov@nvidia.com>
Link: https://patch.msgid.link/20260928053728.797539-8-sshegde@linux.ibm.com
---
 kernel/sched/fair.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 03206e1..1c687c3 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13467,7 +13467,7 @@ static int sched_balance_rq(int this_cpu, struct rq *=
this_rq,
 	};
 	bool need_unlock =3D false;
=20
-	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
+	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
=20
 	schedstat_inc(sd->lb_count[idle]);
=20
@@ -14582,10 +14582,8 @@ static int sched_balance_newidle(struct rq *this_rq,=
 struct rq_flags *rf)
 	 */
 	this_rq->idle_stamp =3D rq_clock(this_rq);
=20
-	/*
-	 * Do not pull tasks towards !active CPUs...
-	 */
-	if (!cpu_active(this_cpu))
+	/* Do not pull tasks towards !preferred CPUs */
+	if (!cpu_preferred(this_cpu))
 		return 0;
=20
 	/*
