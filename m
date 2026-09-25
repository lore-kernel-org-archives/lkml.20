Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD343E51DE;
	Fri, 25 Sep 2026 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333652; cv=none; b=IjH6EH4KnSMOmGBkwupooQcZzEcOT8MPqgTaAIloOubbyGNcDvxCTCcJ5t9ogsk6hs31zezXoIwnYi64afEhbhilz8m4npDnzNMDk8yvndoAa4SjiGyS25h7sE+ZZRx/In4JJ1/RHTKPj6qiyQMKDgqSwX+xGeJkc7E2KJrcD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333652; c=relaxed/simple;
	bh=2m56XyGiz4jS1eGi7Y3lX/Pjpvxsj5RTHc/xC4Q92a4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=r/0PAddaoH1DU6QuXUy0X+EcUu/gc8KbpIrLppC1YboDEduygM5OiQXSJRqlPcxP7ya6Ks4PlJJLy5CMu3/9spcEFG7wioHAJrh95w01OwvgKVeo5nmsQtQ4H5UNFI+iaoUy0MJcu8WoSQxZCjAIQ+7FrxL121lmouXsPgudp00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H2e44+L5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kvRu+vH8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H2e44+L5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kvRu+vH8"
Date: Fri, 25 Sep 2026 10:54:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333649;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6RxzzKAcxqdUe+QMEnH1GX1GMD1Yp4WwxnZbFBZ9bI=;
	b=H2e44+L5jivBBAm/65F2XS31QbzwmUlUNu4E/SaGvfhwD0iKa6i6ANrM0j2JY55lIaJJeq
	vX985Mrhqu14IZEP8GYyc5i02Nugrgx12+62sJALb91tfJS9VN0vxeQy/W1KR1xc3r5EI6
	529tPwvOgh7CSosl6nvVIY96qDi9iJarzeSp6xc5xer6vQuPOf2ceKSi54M+IgZTGWUXpc
	UWlOF1KExBL2qxbqX/hT8Irnxurnmxvg6z/bwZri6s+g0rf9SQYWeecKQPS+a2MdqH03Zp
	+1HTgfGp9g2QA3kWSv9Bqg5Qz4LfDmmk9DbPCh7dqhy4Po43NMtrK9cixGJmZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333649;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6RxzzKAcxqdUe+QMEnH1GX1GMD1Yp4WwxnZbFBZ9bI=;
	b=kvRu+vH8wz8r4owieypW3eAf69FLhYSlZjKjCTXMJ4AIVSKLCF1OGje6Ked0vnlaVjku3F
	j5zymJ3oFTTOnWDg==
From: "tip-bot2 for Christian Loehle" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/fair: Randomize equally shallow slow-path candidates
Cc: Christian Loehle <christian.loehle@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917153915.1563875-3-christian.loehle@arm.com>
References: <20260917153915.1563875-3-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033364754.2819794.12206803922125590104.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     c9ce69fc43bd07dbed9d23a504e56f84604ecf42
Gitweb:        https://git.kernel.org/tip/c9ce69fc43bd07dbed9d23a504e56f84604=
ecf42
Author:        Christian Loehle <christian.loehle@arm.com>
AuthorDate:    Thu, 17 Sep 2026 16:39:15 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:58 +02:00

sched/fair: Randomize equally shallow slow-path candidates

Picking the first eligible idle CPU leaves a scan-order bias. Concurrent
slow-path selectors can choose the same CPU before either task is enqueued.

Use reservoir sampling for equal exit latencies, resetting the candidate
count when a shallower candidate appears. Use the per-CPU scheduler PRNG
and reciprocal_scale() to avoid variable division or a second scan.

Use a u64 latency key with U64_MAX for unpublished states. Published
states take precedence; when none are found, sample among the idle CPUs
without a published state.

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20260917153915.1563875-3-christian.loehle@arm.=
com
---
 kernel/sched/fair.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index c4d4b55..2f5c706 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -24,6 +24,7 @@
 #include <linux/mmap_lock.h>
 #include <linux/hugetlb_inline.h>
 #include <linux/jiffies.h>
+#include <linux/math.h>
 #include <linux/mm_api.h>
 #include <linux/highmem.h>
 #include <linux/hrtimer.h>
@@ -8443,7 +8444,8 @@ static int
 sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_stru=
ct *p, int this_cpu)
 {
 	unsigned long load, min_load =3D ULONG_MAX;
-	unsigned int min_exit_latency =3D UINT_MAX;
+	u64 min_exit_latency =3D U64_MAX;
+	unsigned int nr_candidates =3D 0;
 	int least_loaded_cpu =3D this_cpu;
 	int shallowest_idle_cpu =3D -1;
 	int i;
@@ -8464,12 +8466,16 @@ sched_balance_find_dst_group_cpu(struct sched_group *=
group, struct task_struct *
=20
 		if (available_idle_cpu(i)) {
 			struct cpuidle_state *idle =3D idle_get_state(rq);
-			if (idle && idle->exit_latency < min_exit_latency) {
-				min_exit_latency =3D idle->exit_latency;
-				shallowest_idle_cpu =3D i;
-			} else if ((!idle || idle->exit_latency =3D=3D min_exit_latency) &&
-				   shallowest_idle_cpu =3D=3D -1) {
+			u64 exit_latency =3D idle ? idle->exit_latency : U64_MAX;
+
+			if (shallowest_idle_cpu =3D=3D -1 || exit_latency < min_exit_latency) {
+				min_exit_latency =3D exit_latency;
 				shallowest_idle_cpu =3D i;
+				nr_candidates =3D 1;
+			} else if (exit_latency =3D=3D min_exit_latency) {
+				nr_candidates++;
+				if (!reciprocal_scale(sched_rng(), nr_candidates))
+					shallowest_idle_cpu =3D i;
 			}
 		} else if (shallowest_idle_cpu =3D=3D -1) {
 			load =3D cpu_load(cpu_rq(i));
