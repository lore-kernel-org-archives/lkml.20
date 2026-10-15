Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357051C05B;
	Thu, 15 Oct 2026 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058782; cv=none; b=KOSdPQSZ0+VRPWoKORueFUqYqyjX9bmb+ray5mMVyOYCFoZ10r7BjvAoGMsSzMXu9g1gaeOAOajYWs1QHy1srT4P0psZmHbJBo4SJ4rsEYee9TXsEWpRzWHoFiWL5u0TDQ4fhJUuSf9QSjrITGWb1atAHFOf3jpUCh7l8YHNKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058782; c=relaxed/simple;
	bh=r7dp8gQ1lpWlIXLtDa3oxUdYkjwxfZIyD6SlxHm/LYc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FjBLoN66iAdzJXu9OIWcmk+HAAaa12UeGMmxdo17LCM0fqv3aXH8f2V+oWIvF8s6/eflzw2JYSNGuZOkbPSw3NbmtM3lh4A7SuSl7VIFQaAPlT1XzPKPxY/+fFfWuCJQkDW9SPo1q45/UI+xDiqozQUC8Nj3kmc4QNMN1iLv5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ji3TbZtS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v+yf8Wtb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ji3TbZtS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v+yf8Wtb"
Date: Thu, 15 Oct 2026 10:06:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058778;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6fVUW0shmQAOmb4/C80o/6pCUDIc52Z4gTNZglutuVM=;
	b=Ji3TbZtSsDb/V68rrbMgawtDk9o1WO53Joz8/Hv0ovRhFgR/HMc4kwO8li2+d8JkUO2mb1
	VaF84EBR38/265Lvfc/hbV8tdbDzcBlTDvr+15KTBZ9Lv2Xn6yhcAjBCIlIpRLKNKQFxWY
	ghzD3/t1/0eOS8nR+EYMj0zznJxCqpMCK5PCbP7Gfi09pFWuF+nGFHlPHaUN2+T2ZN3KCH
	W4qJasIf7/qI22q2hqtJ8GxHR07QYbeQqRtS8s2uNWW9SNECk8SWVDh7n+K1zIjGMDQDyy
	zvV7jeqrxSyHVyYvivlMyZTZBDfcfyfxpbEkbepBC2f7hLIlfj65LLyaQWzdcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058778;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6fVUW0shmQAOmb4/C80o/6pCUDIc52Z4gTNZglutuVM=;
	b=v+yf8Wtb85FOE7MSfH2b8tp8YAzcPq5S9u5wWVBXif+DrcBiNI46uCui4LTYgc087FSSo4
	D5pdKLTcTqMCzhCg==
From: tip-bot2 for =?utf-8?q?Beno=C3=AEt?= Monin <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/mips-gic: Fix unbalanced cm_core_lock in
 for_each_online_cpu_gic()
Cc: benoit.monin@bootlin.com, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929-sync-gic-counters-v4-1-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-1-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205877709.2666988.4985162757150973600.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     03c4d26933d54556a89379db5923ae9e474569e8
Gitweb:        https://git.kernel.org/tip/03c4d26933d54556a89379db5923ae9e474=
569e8
Author:        Beno=C3=AEt Monin <benoit.monin@bootlin.com>
AuthorDate:    Tue, 29 Sep 2026 14:14:08 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:02:16 +02:00

irqchip/mips-gic: Fix unbalanced cm_core_lock in for_each_online_cpu_gic()

Commit d9e2ed610a60 ("irqchip/mips-gic: Support multi-cluster in
for_each_online_cpu_gic()") added a gic_unlock_cluster() call to the
macro's loop increment, which unconditionally invokes
mips_cm_unlock_other() on multi-cluster systems. However nothing in the
loop ever acquires the corresponding mips_cm_lock_other(), so on
multi-cluster hardware every invocation of for_each_online_cpu_gic()
releases an unheld per-CPU cm_core_lock.

With CONFIG_PROVE_LOCKING this triggers a "bad unlock balance detected"
warning at boot, e.g. from gic_irq_domain_map() while mapping local
interrupts. Only the first occurrence is reported, since the first
warning permanently disables lockdep (debug_locks =3D 0); the unbalanced
release itself silently persists.

Fix this by moving both the acquire and release into
__gic_with_next_online_cpu() so they stay balanced. When advancing to a
CPU in a remote cluster, lock the CM redirect block for that cluster via
mips_cm_lock_other(); when leaving a remote cluster (or finishing the
iteration) release it with mips_cm_unlock_other(). Local-cluster CPUs
require no locking, so single-cluster systems are unaffected. This also
makes the redirect region behave correctly when accessing local register
blocks of CPUs in other clusters.

Drop the now-unused gic_unlock_cluster() helper and its call from the
for_each_online_cpu_gic() increment.

Fixes: d9e2ed610a60 ("irqchip/mips-gic: Support multi-cluster in for_each_onl=
ine_cpu_gic()")
Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Link: https://patch.msgid.link/20260929-sync-gic-counters-v4-1-ec70c4b60434@b=
ootlin.com
---
 drivers/irqchip/irq-mips-gic.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 19a57c5..3b31cbc 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -70,6 +70,10 @@ static int __gic_with_next_online_cpu(int prev)
 {
 	unsigned int cpu;
=20
+	/* Release the redirect/other region lock to the previous CPU, if any. */
+	if (prev >=3D 0)
+		mips_cm_unlock_other();
+
 	/* Discover the next online CPU */
 	cpu =3D cpumask_next(prev, cpu_online_mask);
=20
@@ -77,23 +81,12 @@ static int __gic_with_next_online_cpu(int prev)
 	if (cpu >=3D nr_cpu_ids)
 		return cpu;
=20
-	/*
-	 * Move the access lock to the next CPU's GIC local register block.
-	 *
-	 * Set GIC_VL_OTHER. Since the caller holds gic_lock nothing can
-	 * clobber the written value.
-	 */
-	write_gic_vl_other(mips_cm_vp_id(cpu));
+	/* Lock access to redirect/other region to the next CPU */
+	mips_cm_lock_other_cpu(cpu, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
=20
 	return cpu;
 }
=20
-static inline void gic_unlock_cluster(void)
-{
-	if (mips_cps_multicluster_cpus())
-		mips_cm_unlock_other();
-}
-
 /**
  * for_each_online_cpu_gic() - Iterate over online CPUs, access local regist=
ers
  * @cpu: An integer variable to hold the current CPU number
@@ -108,7 +101,6 @@ static inline void gic_unlock_cluster(void)
 	guard(raw_spinlock_irqsave)(gic_lock);		\
 	for ((cpu) =3D __gic_with_next_online_cpu(-1);	\
 	     (cpu) < nr_cpu_ids;			\
-	     gic_unlock_cluster(),			\
 	     (cpu) =3D __gic_with_next_online_cpu(cpu))
=20
 /**
