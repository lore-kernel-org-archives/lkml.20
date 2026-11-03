Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705264;
	b=LO6lw0o9Tx3nKRQZsA9GHsSFFg5vkLCGq+QKIlOs/SvrrxC6VthZKTMacIUFixG0/hQt
	 5DBpJmyQzOfvX9sDlT/szIw3XlNM/rCNTsVAEysm9lApUIdIARwmQ+W49kwqvXTruEGNu
	 pOeA6vUoBSGFhGbg/VO3uqcSU4/FwaFhk7lC7f3acL/WyUcU4fVcrhQshNzAd08B8HBm2
	 0QD+fEERbEYrgCJytGtBkaD9ZrzntqnxzrAaxzcfepNRhnapM9EVFlK3y17RjnkwtTP5u
	 R5gdXZE/4NQuX7OybFn0Jv/nEk9O79PpaLvr9QA2ZxCRdQMl8P2JSPQE+igkg104qhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705264;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=wmKUdadHAT5+foUQ/JhomrLckoEaF/o2L81a/0pC/A8=;
	b=vAfZ5jiE7KEHluWvVNL89s5feM5fJqnhYWawOoVlVs0MjU1he6t2Rr0cH4bJaLqLGZW6
	 3Ny53Cbjo16hTTyQ0/JL6htoRYvpTMCTrZmWJYQi1AHFEU6tBItpKCpECsuOquaTDr2Tg
	 o/ReiWy4fI9rqzW2hxIRdy90Zj+/59sPNwlMQoAOM/nmllSjIp3UbqF+TMhgLV/bk/c/5
	 QibYsSCjMpj8HrSaUIknsb+ieraU1yd9dsibh93PhjFKq5kbvfvZAyH8lRNnTv9x2fF9x
	 JlHYgDngVYaafgtSyToZ5vg5NuSrSHqNGw1/tUf8Q2S1xZITKrfAhUjLMPYbff5Z8Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NVRvAjgU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B395606C599
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B395606C599
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NVRvAjgU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmKUdadHAT5+foUQ/JhomrLckoEaF/o2L81a/0pC/A8=;
	b=NVRvAjgULeBRDQjEWGzkXfCQw8MY1BE9PYgDa7ip7sduJ4KuyrsdNWYVxivdNID+AGA4B9
	LmuBfHcvmmq96AzSVU/O6W/asVZA1z9AHg3c+0rGhYiOSzLX+L454Do9vKWiUUYOfOtTkq
	KTyEIv5nDshBeGoSosBNQFZeVP8djN8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-NVKYxFxFOkOAxxPNRAytEg-1; Tue,
 03 Nov 2026 06:27:40 -0500
X-MC-Unique: NVKYxFxFOkOAxxPNRAytEg-1
X-Mimecast-MFC-AGG-ID: NVKYxFxFOkOAxxPNRAytEg_1793705258
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EDD21955F6D;
	Tue,  3 Nov 2026 11:27:38 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8627026C;
	Tue,  3 Nov 2026 11:27:34 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Tue, 03 Nov 2026 12:26:29 +0100
Subject: [PATCH 1/4] sched/deadline: Fix stale root domain in cpuset
 bandwidth transfer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Luca Abeni <luca.abeni@santannapisa.it>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
 Weiheng Qiu <weihengqiuu@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
 Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793705249; l=3865;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=DSUyDRHGGzElsfF7ciHF+W6sg6QK60Bl8q9YVFwJV28=;
 b=EZyYP7Q9iCUo6Ofu2eGx+8doCZxfJWVu3KSEjAJ/loqGFG4TdOJQmsu5id/aWTp/TaZ1Fia73
 wzhsGn6QlzrC1FDqkS7cRqVjy6SFtWKSWsKZwUZ/2fWP+RvKL/z+9Cs
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

dl_task_needs_bw_move() and set_cpus_allowed_dl() use task_rq(p)->rd
to determine a task's current root domain. For a sleeping task, this
is stale: it points to the rq of the CPU the task last ran on, which
may belong to a different root domain after a cpuset move.

This causes incorrect bandwidth accounting when a sleeping DL task is
moved between exclusive cpuset partitions and back:

  1. Move root->partition: task_rq(p)->rd = root, destination in
     partition -> different -> bandwidth transferred correctly.
  2. Move partition->root: task_rq(p)->rd is still root (task never
     ran) -> looks like same domain -> no transfer. Partition keeps
     stale bandwidth, root domain is short.

The root domain then over-admits, and when the task exits total_bw
underflows.

Introduce dl_task_root_domain_cpu() helper that uses the task's
cpus_mask (which still reflects the old/source cpuset at call time)
to find the root domain where the bandwidth is actually accounted,
instead of relying on the potentially stale task_rq(p)->rd.

Use cpus_mask rather than cpus_ptr, as the latter may be temporarily
narrowed to a single CPU by migrate_disable().

Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
Closes: https://lore.kernel.org/all/14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com/
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 kernel/sched/deadline.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5d..68019dafbaf18 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3324,14 +3324,28 @@ static void task_woken_dl(struct rq *rq, struct task_struct *p)
 	}
 }
 
+/*
+ * Find the root domain where a DL task's bandwidth is currently
+ * accounted. For a sleeping task that was moved between cpusets
+ * without running, task_rq(p)->rd may be stale. Use the task's
+ * current cpus_mask (not yet updated to the new mask) to find the
+ * actual root domain. Use cpus_mask rather than cpus_ptr, which
+ * may be temporarily narrowed by migrate_disable().
+ */
+static unsigned int dl_task_root_domain_cpu(struct task_struct *p)
+{
+	unsigned int cpu;
+
+	cpu = cpumask_first_and(&p->cpus_mask, cpu_active_mask);
+	BUG_ON(cpu >= nr_cpu_ids);
+	return cpu;
+}
+
 static void set_cpus_allowed_dl(struct task_struct *p,
 				struct affinity_context *ctx)
 {
-	struct rq *rq;
-
 	WARN_ON_ONCE(!dl_task(p));
 
-	rq = task_rq(p);
 	/*
 	 * Migrating a SCHED_DEADLINE task between exclusive
 	 * cpusets (different root_domains) entails a bandwidth
@@ -3339,16 +3353,16 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 	 * domain (see cpuset_can_attach()).
 	 */
 	if (dl_task_needs_bw_move(p, ctx->new_mask)) {
-		struct dl_bw *src_dl_b;
+		unsigned int src_cpu = dl_task_root_domain_cpu(p);
+		struct dl_bw *src_dl_b = &cpu_rq(src_cpu)->rd->dl_bw;
 
-		src_dl_b = dl_bw_of(cpu_of(rq));
 		/*
 		 * We now free resources of the root_domain we are migrating
 		 * off. In the worst case, sched_setattr() may temporary fail
 		 * until we complete the update.
 		 */
 		raw_spin_lock(&src_dl_b->lock);
-		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(task_cpu(p)));
+		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(src_cpu));
 		raw_spin_unlock(&src_dl_b->lock);
 	}
 
@@ -3358,10 +3372,13 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 bool dl_task_needs_bw_move(struct task_struct *p,
 			   const struct cpumask *new_mask)
 {
+	unsigned int cpu;
+
 	if (!dl_task(p))
 		return false;
 
-	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
+	cpu = dl_task_root_domain_cpu(p);
+	return !cpumask_intersects(cpu_rq(cpu)->rd->span, new_mask);
 }
 
 /* Assumes rq->lock is held */

-- 
2.56.0

