Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958637;
	b=vRfWFTiuQxpAd/kCI1EceuJoohqxlTZzKzPFFVk//Bqy1wz6sYRLh/ffZPJmHfsNxXvh
	 s4D4PVBUIPwq/3PBDid/nx5BI32FY3H17FiojdVpWB5GHoOZEaydBd6f6C8oosDFnxoVJ
	 v3+ZmQr7LH5aLDO3RxE/vChan5hYNHmAhQD+RN1mt7XGJ5IkCyxni6vY1s0tlpPWnIp91
	 h5QuQmDY4VFt9DvgWLJ+TBKaULRcqIesJLdXotwkF9EJSpmHepq7VaG+TkhJv2HNavzwv
	 9oYPrdeSzGs5CEpOOGU8X9NVQ6Eb0tt/xAAkU5yS8lYqWRUMU2K70Spb3OqcXxylqhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958637;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=T2ukIQcyNu7w3VdRWu1sNYM1/yvv8vle3+cBmjCOGL4=;
	b=Ww05WBov2yThFXTz9u1JT+sXrRUjnTXkhRD/UZLFkqsXV093lNqPA+kmNY+FybuLMe3Y
	 Im/hDzPXwvvCR8uUPPIfZjf5jqkQsQBlRbF4QtvdNgqK9hCY29mfh+zx3k/DUOXe7kek5
	 JnRE9h7t6y8zy7Xk2F7Yu0QuMxeYuTFkesEGp3cWCVfzUPkljiz09eXMF/6o+LfBigWVr
	 XW1DJ/14HTaKrdHX5PA39+PYXQd41jwIwDxfbB/WL1+kpYUK2DOFgVvPEzk+jrTmHH7tB
	 6Ke/O38/+FggI05g9Tjve/oVF+kfTsfxb/HQns0SELr2UKo2ofPLLURjqf83UHylNwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kYFdvNoq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lNIzHVOn;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3249606A33D;
	Fri,  6 Nov 2026 09:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3249606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kYFdvNoq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lNIzHVOn
Date: Fri, 06 Nov 2026 09:50:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958635;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2ukIQcyNu7w3VdRWu1sNYM1/yvv8vle3+cBmjCOGL4=;
	b=kYFdvNoq7sFmer6MMEzbP8En69a7DdnCuYeefaQPDqwfe2r/I0+4ktaJbMOCOvlQiP6ukq
	h1U19jE27FaJnKwP2yd0xa8BihZWGQMHw29za4Zg+jXtSyIiT2LPZJmsjvjRzt1jENJYDc
	BhOPn86RC1oDrweLtYbAoPOHNg8j9jRq94SewKswx1R0rKYf9x+Gp9VhwEFzNNKJlFn2ES
	EVcrIjx/fsS5xkc+VXyHCOrfielA3ctK0h9wh4MuETvcCFT3TzoWyOaRJViOHNsq7DwB2X
	E3ulf6UeHG31CdsEfqWoMMNX5RXDZ+OLNat/KjZ0ckGFVjY60FB9OL5nBoHlfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958635;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2ukIQcyNu7w3VdRWu1sNYM1/yvv8vle3+cBmjCOGL4=;
	b=lNIzHVOnU5aBh9VwazGS9ml4jBihs740gBGtnzrN4pof6sL5EyS3mLPABe7xdPI5YT69y5
	2dRYN0AY4IobtGAA==
From: "tip-bot2 for Kayra Cizmeci" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] sched/cache: Ignore non-fair current in alb_break_llc()
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Tim Chen <tim.c.chen@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020185402.57017-1-kayracizmeci@gmail.com>
References: <20261020185402.57017-1-kayracizmeci@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395863356.1009794.10322114886183761945.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     006991aa89974378ee579416dba87adc22cd60fd
Gitweb:        https://git.kernel.org/tip/006991aa89974378ee579416dba87adc22c=
d60fd
Author:        Kayra Cizmeci <kayracizmeci@gmail.com>
AuthorDate:    Tue, 20 Oct 2026 21:54:01 +03:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 10:10:52 +01:00

sched/cache: Ignore non-fair current in alb_break_llc()

Commit d6b9afab44e23 ("sched/cache: Fix
checking active load balance by only considering the CFS task")
stopped using task_util() for non-fair cur.

__active_load_balance_cpu_stop() calls detach_one_task(), that only looks
to cfs_tasks list. So if the rq->curr is not fair, doing a decision
according to it is wrong, since we only migrate tasks that is fair.

Commit f0d243a96f26 ("sched/fair: Avoid creating misfits during
cache-aware balancing") passes cur to task_misfits_asym_cpu()
without checking if the cur is in fair class or not. Fix this.

Fixes: f0d243a96f26 ("sched/fair: Avoid creating misfits during cache-aware b=
alancing")
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Link: https://patch.msgid.link/20261020185402.57017-1-kayracizmeci@gmail.com
---
 kernel/sched/fair.c |  9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ad41453..79f6b3a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11029,7 +11029,14 @@ alb_break_llc(struct lb_env *env)
 			return true;
=20
 		cur =3D rcu_dereference_all(env->src_rq->curr);
-		if (cur && cur->sched_class =3D=3D &fair_sched_class)
+		/*
+		 * Active balance only detaches CFS tasks, so a non-fair
+		 * curr is never migrated. Ignore it and avoid using its
+		 * state util in the misfit and LLC checks.
+		 */
+		if (cur && cur->sched_class !=3D &fair_sched_class)
+			cur =3D NULL;
+		if (cur)
 			util =3D task_util(cur);
=20
 		if (task_misfits_asym_cpu(env, cur) ||
