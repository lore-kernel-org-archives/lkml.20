Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489038;
	b=vPmRO6LL5UNrsbs2O+RGg/1qFOk9KjJl4euLeH3hrV8nSgM4H2KNxr8LVl2ARbzza/Ff
	 qKhb295bU6r4c3lNWRX+ZZVhxqZlziPJ4IHwgKAloG65N0aL2ZdTe5YzH2SM7Xi0DHb2P
	 8y9qrUh/YzzdHrLGHTpUStmcTw9A5bFsXLBtcfIWcwAUJ1nmfocwXXfz22ONOCAnkeamw
	 pclaFAi2Q+PsiJFNqxQcRK9KI3ZLJG8g/Tldae2BNRRym5DcJs3eI/+F4dosvW7iCkwnP
	 UfH+kHQHmlJLpTMfrykIZQXVZ6P22HWy9frYJdVrWR20rrj+sihyFnoELrVjPQj/l8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489038;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CpuKkXH89DE72g3q3A2BBjC4W8j4PRXj24oxWP7atUI=;
	b=fS43T6QbiS6NFCkXnzOHHh4Ub5MRG1p9kTa9bsWs2+7zuCCy/iIN/LWRjNY1LoGeb4Au
	 pCzQKqFiy+ZmvI+dzPfVoOpnAIyPFpC8McNtTgvEfT+2Tx/P71JjOXVXQuPLGLkmWAeO7
	 /q0HuaX4on3bzMyMOkYkrECCd+GK2uUjXbGD/HMP8+oC/6ARkn2MGMfE+8sUq1H9bVLYW
	 LLPvupm4N1bdWujdZVDSrLhafkHCdaXZF9EslRa4nbuf7OoUCP1tdoy06PzO5dp8cr4Bn
	 hL9XEC8YZ8JEMuC3TBPz5wGROWsoThJP67DBYJV+Db68ApZXOkgYahnTjRJNyw32+Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MPp9ma1+;
	arc=none smtp.remote-ip=95.215.58.15
Received: from mta1.migadu.com (out-15.mta1.migadu.com [95.215.58.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616A606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E616A606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MPp9ma1+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FR3xtWrOv3CbYRT4VvRu+Yy8kCQGznQLHhChKo1P2Dc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794489036; v=1; x=1795093836;
 b=MPp9ma1+69EGc5SS0xzpV9Qcfse/6zWaQhbiPa4c3rKsszYw3iM2wbQqIAb43slvtuj7Lk2h
 IJEkmCW+fsXceR5drcL3Sre8TvCceFyy659u25xDQkbGlA3QjsTWNrneC0NOgQQ0wzcDX0a2bTz
 hJhByqnNTylZcpbwRO0y/YiI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d1fb0a55dd6491ca;
	Thu, 12 Nov 2026 13:10:29 +0000
X-Mizu-Trace-ID: d1fb0a55dd6491ca
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	liwanwu@kylinos.cn,
	usama.arif@linux.dev,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 3/6] sched_ext: Return -EBUSY from a pre-init scx_bpf_sub_caps() read
Date: Thu, 12 Nov 2026 21:09:31 +0800
Message-ID: <20261112130934.563321-4-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112130934.563321-1-cui.tao@linux.dev>
References: <20261112130934.563321-1-cui.tao@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

scx_bpf_sub_caps() flags the scheduler for exit when the target's caps
storage isn't up yet. But the guard's own comment names a legitimate
way to get there: a scheduler reading its own caps from
ops.init_cids(), which runs before scx_alloc_pshards() publishes the
storage. An init_cids() implementation that starts by querying its
caps, a reasonable thing to do, kills the scheduler it is still
initializing.

Return -EBUSY instead: the caller sees a retryable "not ready yet"
and the comment's expected scenario stays survivable. This mirrors
how the cid path already handles the same class of pre-init window:
reads before the tables are published test the table pointer and
return -EINVAL instead of killing the scheduler.

Fixes: 86094b95efcf ("sched_ext: Add per-shard cap delegation for sub-schedulers")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/sched/ext/sub.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/ext/sub.c b/kernel/sched/ext/sub.c
index d2da4d2322f8..55e637e7a54a 100644
--- a/kernel/sched/ext/sub.c
+++ b/kernel/sched/ext/sub.c
@@ -3081,8 +3081,10 @@ __bpf_kfunc void scx_bpf_sub_revoke(u64 cgroup_id, u64 caps,
  * child - the literal granted set. A sched can read only itself or a direct
  * child.
  *
- * Return 0, -ENODEV if @cgroup_id names no direct child, or -EINVAL on bad
- * inputs.
+ * Return 0, -ENODEV if @cgroup_id names no direct child or the caller has
+ * no scheduler, -EINVAL on bad inputs, -EOPNOTSUPP on the cpu form, or
+ * -EBUSY if the target's caps storage is not up yet (expected from a
+ * self-read in ops.init_cids()).
  */
 __bpf_kfunc s32 scx_bpf_sub_caps(u64 cgroup_id, u64 caps, struct scx_cmask *out__arena,
 				 const struct bpf_prog_aux *aux)
@@ -3124,15 +3126,14 @@ __bpf_kfunc s32 scx_bpf_sub_caps(u64 cgroup_id, u64 caps, struct scx_cmask *out_
 
 	/*
 	 * The target's caps storage may not be set up yet (e.g. a self-read
-	 * during ops.init_cids()). Pairs with the publish in
-	 * scx_alloc_pshards(): a non-NULL pshard has every element set and the
-	 * acquire also orders the cid table reads below against it.
+	 * during ops.init_cids()); return -EBUSY instead of aborting the
+	 * scheduler. Pairs with the publish in scx_alloc_pshards(): a
+	 * non-NULL pshard has every element set and the acquire also orders
+	 * the cid table reads below against it.
 	 */
 	pshard = smp_load_acquire(&target->pshard);
-	if (unlikely(!pshard)) {
-		scx_error(sch, "scx_bpf_sub_caps() called before caps storage is initialized");
-		return -ENODEV;
-	}
+	if (unlikely(!pshard))
+		return -EBUSY;
 
 	ret = scx_cmask_ref_init(sch, out__arena, &ref);
 	if (ret) {
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
