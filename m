Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489053;
	b=i8E09l2+CCRRh38LEZi6WuRaUl8dI/y9CzDjHSiEGhRE9QFhar/rjeabMvbb5VxDIu67
	 0mEQF/mKKZQVemXLNWJ1Wx6mvgihANSFRn62PawAsziGlOc6WnkGPhHSHnQk44yNEgWWD
	 ke/es3FpNy+r6HPqIQVSvzO4fMHVZPoGZq5ea3oq1aLB3e/3U930afDNqmTAORS5TmWut
	 UqNqWjludPzuMpIWxfQ7J52LAr8iLxOBR/7BiJNtPPvAG52RB0KTZBtxetCp5h39+nbVe
	 EhTH2XlZ9UHdxTRhaakBhV/ArNYGAyf+uzy5RmeScaCOYXaxivSImhzA3Zek6z/1nGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5WLV9GwJEw5snsivwVTcevybITAUjlFSXt5ZHXYJVNM=;
	b=APqZ/zsYRqBx1q2YvmE+47OL9WJIZK5MMfB+7rJu2AUd7cNRu7xyTItQD5MboiwSRrpF
	 eV9GTFqDZkyk3Hhn7yoDC1/Xqd1JGOEAx5iLgPcWPhi9UziIXMX9vOnUqwhca2jPn0rud
	 01rloTd7OFnn+rq+wTaJsDia0u/QL9dmyhkACYuzXF7kM3HjDhO+WPZ/d875QbAMXKp11
	 AN9RYe8VJ39En35APn220XONmIhvM9wcQ8tagfX0hH0Z0EbT0gMhSuayXjXC9xedOUk56
	 7kTjDyB6KGxLSDZfcwTwWHegvmWWyLBD+PE6cyAPtcme3FbkPZxM2Ymdkk8rSOV3bfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sibHd4/I";
	arc=none smtp.remote-ip=91.218.175.228
Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0960A3809
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D0960A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sibHd4/I
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1ASfApR/tWCoxARtdYT6Dnyb/jCq3rXoAd9CiF8q4Us=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794489051; v=1; x=1795093851;
 b=sibHd4/IY2DocB0iDzYKQYfmRweYlr2RxY4mGvZ3KRUatGk+6djqlV1tichgJEz7Mi+Spm5b
 F3gb6nhs7zO7Pq8RrcyatNx+zCmY5itpWL2FNM0tNYyYetLt2h07u75vVFzzHdWF/NiRQk7NYuB
 nk+pwIogBCV23n7WB2Mge40E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 960a86b2038b9ab9;
	Thu, 12 Nov 2026 13:10:51 +0000
X-Mizu-Trace-ID: 960a86b2038b9ab9
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
Subject: [PATCH 5/6] tools/sched_ext: scx_flatcg: Don't strand a cgroup on the ENQ_RACE path
Date: Thu, 12 Nov 2026 21:09:33 +0800
Message-ID: <20261112130934.563321-6-cui.tao@linux.dev>
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

cgrp_enqueued() bails out on the ENQ_RACE path when bpf_kptr_xchg()
returns NULL: the node is either back on the rbtree or in the hands
of try_pick_next_cgroup(), which found this cgroup empty and is
deciding whether to stash it back or re-add it to the rbtree.

The bailout relies on the assumption that a task being enqueued is
already visible to try_pick_next_cgroup()'s emptiness test. That
doesn't hold: inserts from ops.enqueue() are deferred till after
ops.enqueue() returns, so try_pick_next_cgroup() can see an empty DSQ,
clear ->queued and stash the node while ->queued stays at 1 from this
enqueue, leaving the cgroup off the rbtree with every subsequent
enqueue skipped; the whole group strands until it is destroyed or the
scheduler is reloaded, and the kernel watchdog eventually kills the
scheduler with SCX_EXIT_ERROR_STALL.

Instead of bailing out, wait for the picker to resolve and retry:
grabbing the node when it's stashed back, or bailing out when the
picker has re-added the cgroup to the rbtree. Exhausted retries mean
the cgroup is in the common cases either going away with its node
dropped or already back on the rbtree; a narrow window with the picker
still holding the node in flight can strand the cgroup the same way
the unpatched code does, at a rate orders of magnitude below stock.

Verified in qemu: driving ops.enqueue() races under CPU saturation strands
cgroups into scheduler-killing stalls 6/10 rounds on stock, 0/10 with the
change.

Fixes: a4103eacc2ab ("sched_ext: Add a cgroup scheduler which uses flattened hierarchy")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 tools/sched_ext/scx_flatcg.bpf.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/sched_ext/scx_flatcg.bpf.c b/tools/sched_ext/scx_flatcg.bpf.c
index 1d168d492203..5f2b9d0b867a 100644
--- a/tools/sched_ext/scx_flatcg.bpf.c
+++ b/tools/sched_ext/scx_flatcg.bpf.c
@@ -285,11 +285,24 @@ static void cgrp_enqueued(struct cgroup *cgrp, struct fcg_cgrp_ctx *cgc)
 		return;
 	}
 
-	/* NULL if the node is already on the rbtree */
+	/* NULL if the node is on the rbtree or in the picker's hands */
 	cgv_node = bpf_kptr_xchg(&stash->node, NULL);
 	if (!cgv_node) {
+		/*
+		 * The node is either back on the rbtree or in the
+		 * picker's hands; bailing out strands the cgroup. Wait
+		 * for the picker to resolve and retry.
+		 */
 		stat_inc(FCG_STAT_ENQ_RACE);
-		return;
+		bpf_repeat(CGROUP_MAX_RETRIES) {
+			cgv_node = bpf_kptr_xchg(&stash->node, NULL);
+			if (cgv_node)
+				break;
+			if (scx_bpf_dsq_nr_queued(cgid) > 0)
+				break;
+		}
+		if (!cgv_node)
+			return;
 	}
 
 	bpf_spin_lock(&cgv_tree_lock);
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
