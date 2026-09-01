Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862C47208F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788300278; cv=none; b=QAbBisFZyeBILB8DZlgatIfL0njhIdUTcBVU26g5oyCw/8K87kvlGzIttHbt9hQPESJ0lVJWpP3ubFjQVQdRTQwdZzsKmF9aL3YZp7qtyKUGSpG7mMlgJQUXMzBSokTznRcyvjrHrX8JqwWZnGIbliMiWbDp0TVetn8x+ToXMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788300278; c=relaxed/simple;
	bh=P4m0ZBNeU9VLXcvAtpE/vfabDepzn/1eCD+Sjghk7rU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFNXqAT2N0VPdSTZ9Nt96CgxKmB6eoO+QrLjm/OvI5H9MN6G8PiMMdVrpy8J0QTlIbROidyhUGc/3GTtoUIf5q+gvshXr4SsIitMQBO49oEBZty5V1A48L4y1Ye9lYPVB6fS4sfznQ9jfWIkS+/5XMGU3W2+w2Bt/LQKvzen8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3gy1o3/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3gy1o3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0F71F000E9;
	Tue,  1 Sep 2026 22:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788300275;
	bh=Dg7/of7miGca+ll6oxzY618HVXmMqM3sY+D0h0edBJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F3gy1o3/cFWrfD+9K/D7IPHj3VpxhwGJXIV8zmLNSnFFRu3RUUSdzcMPTrA2fy0My
	 TjZer9gWanz8wijtc4uEikcLLucirkmpF15DfN9MxEFd6uEtoPnw47KlJDOVEpP538
	 vVOlyhH0xUqWDzTAPHAOcGTMrFFwQ427xkhCn398v8F2BC4MNoIyGeiQt+dv4xAF3x
	 X7DLkSt9DFOIPJm+YNs+pPgdf20xASR150o13Nfl8BEcPXXfPiWIB1JxsFQuuBXa31
	 aywyTM3Wi7I/Jt5OL1/XWXO80FesDtUM6qdSm4/20T43CEZB6q1C8BEM97/wgw0i1C
	 6EjKQ53zHBY3Q==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: ryncsn@gmail.com,
	ehab.ababneh@intel.com
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	kasong@tencent.com,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	yuzhao@google.com
Subject: Re: [RFC PATCH] mm/mglru: dynamically protect readahead fault folios under refault pressure
Date: Wed,  2 Sep 2026 06:04:30 +0800
Message-Id: <20260901220430.79810-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <apcVhWzEwkwHYjB1@KASONG-MC4>
References: <apcVhWzEwkwHYjB1@KASONG-MC4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Sep 2, 2026 at 2:21 AM Kairui Song <ryncsn@gmail.com> wrote:
>
> On Tue, Sep 01, 2026 at 11:06:43AM +0800, Ehab Ababneh wrote:
> > Commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to replace
> > folio_set_active") introduced a regression for workloads that rely on
> > readahead to keep sequential file access efficient.
> >
> > The problem is that MGLRU can place fault-path file folios in older
> > generations, so memory pressure can reclaim readahead folios before the
> > workload touches them. In our Cassandra read benchmark, this raised p99
> > latency to about 9.2-9.5 ms and cut throughput to roughly 41.8k-43.6k
> > op/s; the revert restored the workload to about 5.5-5.6 ms and
> > 51.9k-53.1k op/s.
> >
> > Readahead is important for sequential I/O and mmap scans, but it should
> > not be retained when the workload does not benefit from it. The goal is
> > to keep the optimization without keeping readahead pages alive forever.
> >
> > This patch provides a middle ground: keep the original behavior by
> > default, but temporarily protect fault-path file folios when repeated
> > file refaults show that readahead is actually helping.
> >
> > The mechanism is dynamic and self-tuning:
> >
> > - add a per-lruvec readahead/refault credit
> > - accumulate credit on file refaults in the MGLRU refault path
> > - consume credit in folio_add_lru() for fault-path file folios
> > - keep the folio active while credit is available, and otherwise let the
> >   original behavior stand
> > - decay/reset the credit as generations advance and when an lruvec is
> >   initialized
> >
> > This means we only protect fault-path file folios when refault pressure
> > shows that the workload is actively benefiting from readahead. If the
> > workload does not need that protection, the original optimization
> > remains intact and we do not keep readahead pages around unnecessarily.
> >
> > Benchmark results for the Cassandra read workload
> > (4 nodes, 720s, 100 readers):
> >
> > - with commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to
> >   replace folio_set_active"):
> >   p99 ~9.2-9.5 ms, throughput ~41.8k-43.6k op/s
> > - with revert of commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to
> >   replace folio_set_active"):
> >   p99 ~5.5-5.6 ms, throughput ~51.9k-53.1k op/s
> > - with this fix: p99 ~5.8 ms, throughput ~51.9k-52.7k op/s
>
[...]
>
> Just an idea. For an short term and easy fix, what if we simply revert
> than, then only protect in_fault && folio_test_swapbacked folios with
> PG_active?

Hi Ehab and Kairui,

Thanks very much for your reports and discussion.

I'm not quite sure we want to revert it entirely, as that would
immediately regress the workloads improved by the commit, such as the
kernel build.
Also, for example, Kairui's cover letter mentioned the LevelDB benchmark:
 "I also retested the LevelDB benchmark from the cache_ext paper [5].
Interestingly, mainline MGLRU already beats CLRU on this one after a
recent change in lru_gen_folio_seq that bumps new folios with refs == 1
to the second-oldest generation."

I guess we could instead try to mitigate the cases where some workloads
are negatively affected while preserving the original intention. Does the
fix below address both of your cases, or is Ehab's case actually different
from Kairui's?
(The kernel-build test on my machine looks quite positive. It not only
preserves the original optimization, but even provides further gains.)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 621c8653d8f7..91396c796a34 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -239,7 +239,8 @@ static inline unsigned long lru_gen_folio_seq(const struct lruvec *lruvec,
 	 * |<---------------------------- MAX_NR_GENS ---------------------------->|
 	 */
 	if (folio_test_active(folio))
-		gen = MIN_NR_GENS - folio_test_workingset(folio);
+		gen = MIN_NR_GENS - folio_test_workingset(folio) +
+		      (type ? !folio_test_workingset(folio) : 0);
 	else if (reclaiming)
 		gen = MAX_NR_GENS;
 	else if ((!folio_is_file_lru(folio) && !folio_test_swapcache(folio)) ||
@@ -247,7 +248,7 @@ static inline unsigned long lru_gen_folio_seq(const struct lruvec *lruvec,
 		  (folio_test_dirty(folio) || folio_test_writeback(folio))))
 		gen = MIN_NR_GENS;
 	else
-		gen = MAX_NR_GENS - (folio_test_workingset(folio) || folio_test_referenced(folio));
+		gen = MAX_NR_GENS - folio_test_workingset(folio);
 
 	return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen->min_seq[type]));
 }
diff --git a/mm/folio.c b/mm/folio.c
index c02dcea9c03c..2fd835b3b50c 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -470,20 +470,10 @@ void folio_add_lru(struct folio *folio)
 			folio_test_unevictable(folio), folio);
 	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
 
-	/*
-	 * For refaulted workingset folios, set PG_active so they
-	 * can be added to active generations.
-	 * For prefaulted file folios, folio_mark_accessed() sets
-	 * PG_referenced so lru_gen_folio_seq() places them into
-	 * the second oldest generation.
-	 */
+	/* see the comment in lru_gen_folio_seq() */
 	if (lru_gen_enabled() && !folio_test_unevictable(folio) &&
-	    lru_gen_in_fault() && !(current->flags & PF_MEMALLOC)) {
-		if (folio_test_workingset(folio))
-			folio_set_active(folio);
-		else if (!folio_test_referenced(folio))
-			folio_mark_accessed(folio);
-	}
+	    lru_gen_in_fault() && !(current->flags & PF_MEMALLOC))
+		folio_set_active(folio);
 
 	folio_batch_add_and_move(folio, lru_add);
 }
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..aa500ae9371a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -851,11 +851,7 @@ static bool lru_gen_set_refs(struct folio *folio, const vma_flags_t *vma_flags)
 		return false;
 	}
 
-	/* Promote on second access */
-	if (folio_lru_refs(folio) > 1)
-		set_mask_bits(&folio->flags.f, LRU_REFS_FLAGS, BIT(PG_workingset));
-	else
-		folio_mark_accessed(folio);
+	set_mask_bits(&folio->flags.f, LRU_REFS_FLAGS, BIT(PG_workingset));
 	return true;
 }
 #else
diff --git a/mm/workingset.c b/mm/workingset.c
index 7ac2b88c80ae..a79b73ee9762 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -319,13 +319,11 @@ static void lru_gen_refault(struct folio *folio, void *shadow)
 
 	atomic_long_add(delta, &lrugen->refaulted[hist][type][tier]);
 
+	/* see folio_add_lru() where folio_set_active() will be called */
+	if (lru_gen_in_fault())
+		mod_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + type, delta);
+
 	if (workingset) {
-		/*
-		 * see folio_add_lru(), where folio_set_active() is
-		 * called for workingset folios
-		 */
-		if (lru_gen_in_fault())
-			mod_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + type, delta);
 		folio_set_workingset(folio);
 		mod_lruvec_state(lruvec, WORKINGSET_RESTORE_BASE + type, delta);
 	} else
-- 
2.34.1
