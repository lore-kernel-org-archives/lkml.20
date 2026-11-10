Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315063;
	b=tkq6KU1RYnHOhZzyDi4QvsrH4jt4gcZ+A9nWQtCTLri/a/ebzcieg39BKouiA1lbeH9l
	 oOe01dPUPkrXOpak/pHuqCzFyiza0nIdkVKaVHmHwnU1n/SphmprqD5bKy+lYxjfswNSE
	 5WeW1GgUOQk3P+QgvjfY192uXAaxDcBa3RCNG9q6aZmgZeXhfzqSC6x4D4CjNRiz8bSsd
	 urKdm3/8cQdPqNzhPW21/HHpIEVElPsuurgs08D3mPDc0iEtJFx5B1OFRFEo2hJtP8gHL
	 KgYMSDWYoacsQb5AlolxItE6A8CMJwKWNwANjo6f371Bf5cJUvi7i17rRTVZKrrwDpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315063;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pHWIyoAzkRKGt/Ae6HP4k4i1zKiGCLCBeF2M5OsTr4k=;
	b=pmU8YLLQZ+ZxaXQQQgsUSKUu1zFPfWjUKOK9U7j2oopiTuLhBgYP4Nqz6ZYp950Og4EO
	 HtlbOjQFyDX3rlnJT7yyXNEIkuvXFU6HcTkHCV5+qTwSH9CUHdhvuEWIqWHLqp82iMfec
	 DkJMJZ+qRgV6EjUAoyvvFG0rsUV8BnF2/n9aPXc3ddQPvLN9yqsULmvm4Ccjn8V3qh3bH
	 IvYfAjF05tO4Nqshy+TkY7XBa9/EukZlyrsi8ihYDKGKxTrhS+DcgrPrZ1XvzOBzQKMtL
	 M6QxGbqS77rXNGTvc3L9TXKXuBU9yt6KviAo0zh2a3C//48wxGATjQOToqQ5LQ5nZOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="nnfwV/FY";
	arc=none smtp.remote-ip=95.215.58.106
Received: from mta1.migadu.com (out-106.mta1.migadu.com [95.215.58.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DA460A2608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DA460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nnfwV/FY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DkQ2NcU3+tFcoDyU9HG1mfFsUe9Q7GZ8wrWu60m10JE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794315060; v=1; x=1794919860;
 b=nnfwV/FYx3qYdyug5kYFoaPZFnh3XlKO7fAIR0r/P8PEpWRwQvaN9fEHMV8PxsDcsqvvunx6
 kKCqScY5gD1sbMtF2rVkzyAa01VLI/5gNgLZ5zIttMDaueHFEn3P+7W7LZhPL0mUp0anFZbGQPn
 r/Pd82iqMfIkvg0Jo0fjJ7OM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 776503cc40e57f66;
	Tue, 10 Nov 2026 12:51:00 +0000
X-Mizu-Trace-ID: 776503cc40e57f66
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	liwanwu@kylinos.cn,
	devnexen@gmail.com,
	zhaomengmeng@kylinos.cn,
	emil@etsalapatis.com,
	yphbchou0911@gmail.com,
	mingo@redhat.com,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 3/9] tools/sched_ext: scx_pair: Don't abort when the dispatching cgroup goes away
Date: Tue, 10 Nov 2026 20:49:55 +0800
Message-ID: <20261110125001.4167503-4-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110125001.4167503-1-cui.tao@linux.dev>
References: <20261110125001.4167503-1-cui.tao@linux.dev>
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

try_dispatch() caches the cgroup id in pairc->cgid, drops pairc->lock
and then looks the cgroup back up in cgrp_q_idx_hash. pair_cgroup_exit()
deletes that hash entry when the cgroup is removed, so a plain rmdir of
the cgroup that is currently being dispatched, a normal event for
short-lived containers or cgroup churn, hits the lookup failure and
scx_bpf_error() takes the whole scheduler down.

The expiry path already knows how to re-pick a cgroup; make the fast
path tolerate the disappearance too. Mark the pair as drained on lookup
failure and return, letting the next dispatch expire the batch and pick
the next cgroup instead of aborting.

The enqueue side is left for a follow-up: a lookup miss is reachable
there in principle (css offline runs under the cgroup mutex alone,
and a sleeping-task migrate-out does not take the rq lock), but
handling it gracefully needs somewhere to put the task, which on the
enqueue path means a fallback queue; that is a larger change than
this fix scopes. The dispatch path, where the miss costs one skipped batch,
is the cheap half.

Fixes: f0262b102c7c ("tools/sched_ext: add scx_pair scheduler")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 tools/sched_ext/scx_pair.bpf.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/sched_ext/scx_pair.bpf.c b/tools/sched_ext/scx_pair.bpf.c
index 0d61b7b812db..d38d3a078ade 100644
--- a/tools/sched_ext/scx_pair.bpf.c
+++ b/tools/sched_ext/scx_pair.bpf.c
@@ -478,8 +478,16 @@ static int try_dispatch(s32 cpu)
 	/* again, it'd be better to do all these with the lock held, oh well */
 	vptr = bpf_map_lookup_elem(&cgrp_q_idx_hash, &cgid);
 	if (!vptr) {
-		scx_bpf_error("failed to lookup q_idx for cgroup[%llu]", cgid);
-		return -ENOENT;
+		/*
+		 * @cgid can disappear from under us: pair_cgroup_exit()
+		 * drops the hash entry when the cgroup is going away.
+		 * Mark the pair as drained and let the next dispatch
+		 * expire it instead of taking the whole scheduler down.
+		 */
+		bpf_spin_lock(&pairc->lock);
+		pairc->draining = true;
+		bpf_spin_unlock(&pairc->lock);
+		goto out_maybe_kick;
 	}
 	q_idx = *vptr;
 
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
