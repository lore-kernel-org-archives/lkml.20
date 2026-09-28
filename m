Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47D42F5495
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599752; cv=none; b=b47FC2FmJYFQeBAleLx3djqMomM3oipXp/zRcq8QNvN7LPZMTRUJA2ZaJsxK9BZPYIj4Cr13w0vnpyktJhz0vsiLtefsJMkKpEIVXMGMmQz6k6iT6zaF1D65kKJijWB3Hy4HNWAsHQ+QtGRhx+G5gmULHlB3MTnt5Iqa3i1mY/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599752; c=relaxed/simple;
	bh=iwPUjzVQ5FQXf0yt+FbVketC+cbR4rY68wr2/Q0ajLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZ6DpBzkrz5sG3XienXgiSkcoVV0X9S/g6oYheW2fUMNIDm0Cegt7ryHh5P7WcV1rx0nEcaKygMx1h/Kz68DCDa3ks1CXhUm7F5gPhiwUH8g3subpVuwlZ+4PYXTcqA7VfBBwB0pG9aCuDbz+VqIcHbbNqLHSVf6a+AfawyohRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LHzbMzbk; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LHzbMzbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4v
	XfgVlhxvGGj1ab1beMSZVI4bO6eO4i8/Cd0P0/eVc=; b=LHzbMzbk1V6MK/65ER
	V8TXyUL55mvJzK1pMfQMSw4AJ5vJG/aVR3vLgx+Bc9LHU0+FkEuKmIva00IanFuD
	IY7VN1JifE/ZrP8z8qoYMtu9qRt2D0uFErJxCBunVyH//nyj9Cvqucorz/6y6OUw
	pqJ63EJyl2sjsvLPSuWsjA6ws=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3f9L6YbpqlffLBg--.27692S2;
	Mon, 28 Sep 2026 20:47:55 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/fair: Avoid overflow in place_entity()
Date: Mon, 28 Sep 2026 21:47:54 +0900
Message-ID: <20260928124754.1692077-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3f9L6YbpqlffLBg--.27692S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr4DWF1DKFWrZF4DAFWDJwb_yoW5AFyrpF
	Z7tay8Xrs7Xw4Svay2yw4v9F15uwn5J3y3AF1v9FW0krn8Kr1qvryfK3ZIgFn0g34vka1a
	vrWYq347AFWjgrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwhvfP2q6Yfs6ngAA3X

place_entity() inflates an entity's virtual lag with

    lag * (load + weight) / load

Commit 4823725d9d1d ("sched/fair: Increase weight bits for avg_vruntime")
replaced the scaled-down weights used in this calculation with
avg_vruntime_weight(), removing the arithmetic headroom provided by
scale_load_down().

The multiplication can overflow s64 before the division even when the
final quotient is representable. A task's hierarchical effective weight
can be as small as 2 after avg_vruntime_weight() scaling under group
scheduling, while entity_lag() bounds |vlag| by

    calc_delta_fair(cfs_rq_max_slice(cfs_rq) + TICK_NSEC, se)

For example, with HZ=1000, NICE_0_LOAD=1048576, and the minimum scaled
hierarchical weight scale_load(2)=2048, this bound is 891289600. With 114
maximum-weight entities, the runqueue load is 10361604096. The
intermediate product is:

    891289600 * (10361604096 + 2)
        = 9235189971864780800
        > S64_MAX

The signed overflow corrupts the entity's placement.

Rewrite

    lag * (load + weight) / load

as

    lag + lag * weight / load

The two expressions are equivalent, but the latter avoids multiplying the
virtual lag by the total runqueue weight. entity_lag() bounds vlag against
the entity's effective weight, so the remaining lag * weight product stays
bounded. rescale_entity() preserves this scale across h_load changes and
already relies on the same product when rescaling vlag.

Keep the original zero-load warning semantics by multiplying lag by weight
after replacing the divisor with one.

Fixes: 4823725d9d1d ("sched/fair: Increase weight bits for avg_vruntime")
Signed-off-by: Hui Su <sh_def@163.com>
---
Testing:
- PASS: UBSAN positive/negative overflow cases, zero-load/control paths,
  64-bit landmarks NICE_0_LOAD=1048576 and scale_load(88761)=90891264,
  unscaled 32-bit landmarks 1024/88761, and 100000 random cases checked
  against a __int128 oracle.
- PASS: Full x86_64 kernel build; kernel/sched/fair.o builds for i386
  and arm64.

 kernel/sched/fair.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7455a83a6a99..a013bfba576b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6268,10 +6268,19 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 			load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
 
 		weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);
-		lag *= load + weight;
-		if (WARN_ON_ONCE(!load))
+		if (WARN_ON_ONCE(!load)) {
 			load = 1;
-		lag = div64_long(lag, load);
+			lag *= weight;
+		} else {
+			/*
+			 * Avoid overflowing lag * (load + weight) by distributing
+			 * the division:
+			 *
+			 *   lag * (load + weight) / load
+			 *     = lag + lag * weight / load
+			 */
+			lag += div64_long(lag * weight, load);
+		}
 
 		/*
 		 * A heavy entity (relative to the tree) will pull the

base-commit: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206

