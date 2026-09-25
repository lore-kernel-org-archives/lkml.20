Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F6043C7B4;
	Fri, 25 Sep 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333317; cv=none; b=fRazkdlWsCGo6JbqmTqpE3Buplg9eJk7e1IfK/coxTPHETUwgtEMgXECT51VUbo84OPVvEdikF7NZ4uNeFt2v/FBGpVnLTfKH6bBDZAfV0KBk0gS+Jr7/Rod7l9Szq+YOq+h1X1rP/FFcQRn4ShSZzrRumZjsj0Tgb08HMrJ1/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333317; c=relaxed/simple;
	bh=v4QFvnURsRgLkvY8MlgCWQTaukLArIkkJRbszFR+EfY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FziJ3XGd9Yd3ZE6vxJwvukbPWg3VlO8s5Juf0Trk+bjXJj2YygWTO05aJDqQus68BZ9TgenA9FFvtye0izZa+ZWRRHWiRZ0kiepTaFUDeXXNcWp+pfgKnWUesG2UOspSYGZqriAdMRWMoROJoSsMGO4+bIa5nu+MUsY0vK3WMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lfy3grBQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ul1wnTCV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lfy3grBQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ul1wnTCV"
Date: Fri, 25 Sep 2026 10:48:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333310;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDXvccPu7vzDdJLTviMVm2vVF0ydU8/89+crIpr3aDc=;
	b=lfy3grBQpU2cKW1qoW4052kZU8Nfv1w2jM7XfCs9cuoO0dqTlonSxZWuExx15wWWqNnMc/
	XhqM3WuFf4sUGYeYJQ1VRh8zo+JMQQov8v4OWUVhG7SB3dKv6Js05VWNxJ0TIWAUG9chMt
	zfg1Rq2d3xlkMKofD3r/cloW2VFN8IJX3+OdBhYkTcNnsbQTaEJlXLnbsrP4KemWzSjuiZ
	tJ6KuNsYhQQRhNRGDu42fC7Q4hbRUOf5mS5LIWlhIYq9aKeLun3Wq0vZqmEfYxOqrKJYIl
	SBGfGgEnxRpx/G+6OOUSQys/wiU9dDnxK4J3QtLqICQaHeFasSbQwK8WgU2dTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333310;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDXvccPu7vzDdJLTviMVm2vVF0ydU8/89+crIpr3aDc=;
	b=ul1wnTCVUbfGtWPceAsV23zFu/9w15Ie3eFX+/jGaqDuFoqGjkS6h4GmfoyRYOwU08zjVH
	B5YWyR6vCc+rTYDA==
From: "tip-bot2 for Rosen Penev" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/amd/uncore: Turn amd_uncore_ctx events into
 a flexible array
Cc: Rosen Penev <rosenp@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Sandipan Das <sandipan.das@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916004516.268192-1-rosenp@gmail.com>
References: <20260916004516.268192-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033330842.2819794.4497110493637677653.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     df935e26ca9a8fd4ac7431b73348938250f80c6e
Gitweb:        https://git.kernel.org/tip/df935e26ca9a8fd4ac7431b73348938250f=
80c6e
Author:        Rosen Penev <rosenp@gmail.com>
AuthorDate:    Tue, 15 Sep 2026 17:45:16 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:52 +02:00

perf/x86/amd/uncore: Turn amd_uncore_ctx events into a flexible array

The events pointer was kzalloc_node()'d immediately after the parent
struct allocation, with the count (pmu->num_counters) trivially
available beforehand.  Move events to the struct tail as a flexible
array member and fold the two allocations into a single kzalloc_node()
with struct_size(), dropping the separate kfree(ctx->events) in the
free path.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Link: https://patch.msgid.link/20260916004516.268192-1-rosenp@gmail.com
---
 arch/x86/events/amd/uncore.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index 7181973..74b9c92 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -39,11 +39,11 @@ static int pmu_version;
 struct amd_uncore_ctx {
 	int refcnt;
 	int cpu;
-	struct perf_event **events;
 	unsigned long active_mask[BITS_TO_LONGS(NUM_COUNTERS_MAX)];
 	int nr_active;
 	struct hrtimer hrtimer;
 	u64 hrtimer_duration;
+	struct perf_event *events[];
 };
=20
 struct amd_uncore_pmu {
@@ -519,10 +519,8 @@ static void amd_uncore_ctx_free(struct amd_uncore *uncor=
e, unsigned int cpu)
 		if (cpu =3D=3D ctx->cpu)
 			cpumask_clear_cpu(cpu, &pmu->active_mask);
=20
-		if (!--ctx->refcnt) {
-			kfree(ctx->events);
+		if (!--ctx->refcnt)
 			kfree(ctx);
-		}
=20
 		*per_cpu_ptr(pmu->ctx, cpu) =3D NULL;
 	}
@@ -567,18 +565,11 @@ static int amd_uncore_ctx_init(struct amd_uncore *uncor=
e, unsigned int cpu)
 		/* Allocate context if sibling does not exist */
 		if (!curr) {
 			node =3D cpu_to_node(cpu);
-			curr =3D kzalloc_node(sizeof(*curr), GFP_KERNEL, node);
+			curr =3D kzalloc_node(struct_size(curr, events, pmu->num_counters), GFP_K=
ERNEL, node);
 			if (!curr)
 				goto fail;
=20
 			curr->cpu =3D cpu;
-			curr->events =3D kzalloc_node(sizeof(*curr->events) *
-						    pmu->num_counters,
-						    GFP_KERNEL, node);
-			if (!curr->events) {
-				kfree(curr);
-				goto fail;
-			}
=20
 			amd_uncore_init_hrtimer(curr);
 			curr->hrtimer_duration =3D (u64)update_interval * NSEC_PER_MSEC;
