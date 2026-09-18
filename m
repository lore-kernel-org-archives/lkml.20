Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173E838F932
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723091; cv=none; b=h0/9pEjvoj3bRccgbPq4vdbaeDuwNt77XJYzR5bZ1PTRAskRRX+fniyMkphOW+VfY543uhU/SK1E0Dc8TlQVUeO9q1OP55dpvfU7ia/BXOrKGtYTIC+rFE0xZj9ASt3j6het/aAgiRJxKfcLX0/5Lc5S2a7T/4D/oQyHhMJx8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723091; c=relaxed/simple;
	bh=lLSocB/o0Mfi1nkh/fg/RQiPEdC/OuLODNMXaP8hV3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7uGPE64jXSE/6vECFyJMvFNaavIoCUSmn296dEZYR/OiFO3V51ddiQ0ErUMMNCzVqPMu/y7ddrC87wd9mXHoIFiGbbPLEKqy4W5mMltJ4g1R48E78EYR78mv11SqxNO3+ajF/qReNh3TWNsdUlxRgtbDwdTPVB87r8fLcFRPhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hp78yatW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hp78yatW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C1E1F000FF;
	Fri, 18 Sep 2026 09:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723089;
	bh=o5oefEc5Fyvm8A9WuNGwURuxRIXHGDSjj8rGrU+vrUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hp78yatWIjcbKp8NE3mqr8C8ITGShaALagMql9HAQYlj5aoz04s2WpE3Fyqk/ySYb
	 9YvBd/a5XSjn1YkwOdRTR5bjTpZW9YTUPkzKU5HsgfJV1dvfQW6gTAf7r6zaXwexJY
	 0zGVyeoa/3bGAI4F9cF629tfx/oE0cw8cMj/CGHFwRoMRXhjpb+rU7zybnVYpPk2wp
	 GSywhdmLFE1sW6PrqbmNQuOm9exwT+kt6a54FrPilluc/LHqHs0EG8h0g0OU/6Fyau
	 izmCKjLXgxbZLqlXSS5NsNP2SWnsSJkH7Uui3Dz5zc72rslJowxf0cydtWH0Ce+7g8
	 M7F7/fiikopoQ==
From: Barry Song <baohua@kernel.org>
To: ridong.chen@linux.dev
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com
Subject: Re: [PATCH mm-new v9] mm: vmscan: retry folios written back while isolated for traditional LRU
Date: Fri, 18 Sep 2026 17:18:04 +0800
Message-Id: <20260918091804.69981-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <188835d7-64c1-422a-8a64-6b5e0e960ee1@linux.dev>
References: <188835d7-64c1-422a-8a64-6b5e0e960ee1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Sep 18, 2026 at 10:12 AM Ridong Chen <ridong.chen@linux.dev> wrote:
[...]
> >
> > I wouldn't necessarily call it a fix, as keeping the swap cache for
> > those folios can sometimes help with future hits. For example, we may
> > hit those folios again before they are reclaimed. So it's a
> > double-edged sword.
> >
> > That said, the cold/hot inversion is a real problem that we should
> > fix. Ideally, we should find a way to restore the missed
> > `folio_rotate_reclaimable()` behavior, conceptually something like:
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index fde28d0a647d..5ee296474b48 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -891,7 +891,10 @@ long remove_mapping(struct address_space
> > *mapping, struct folio *folio)
> >    */
> >   void folio_putback_lru(struct folio *folio)
> >   {
> > -       folio_add_lru(folio);
> > +       if (folio_has_been_writtenback_due_reclaim(folio))
> > +               folio_add_lru_tail(folio);
> > +       else
> > +               folio_add_lru(folio);
> >          folio_put(folio);               /* drop ref from isolate */
> >   }
> >
>
> That is a good idea. But I am not sure I can find the correct way to do it. I
> will give it a try and get back to you.
>

Maybe something like the below?  I haven't tested it.

diff --git a/mm/vmscan.c b/mm/vmscan.c
index fde28d0a647d..906db7d8c043 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1942,7 +1942,7 @@ static bool too_many_isolated(struct pglist_data *pgdat, int file,
  *
  * Note: The caller must not hold any lruvec lock.
  */
-static unsigned int move_folios_to_lru(struct list_head *list)
+static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
 {
 	int nr_pages, nr_moved = 0;
 	struct lruvec *lruvec = NULL;
@@ -1989,7 +1989,16 @@ static unsigned int move_folios_to_lru(struct list_head *list)
 			continue;
 		}
 
-		lruvec_add_folio(lruvec, folio);
+		/*
+		 * Put folios that may have missed folio_rotate_reclaimable() at the tail
+		 * to avoid cold/hot inversion
+		 */
+		if (do_rotate && !folio_test_active(folio) && !folio_mapped(folio) &&
+		    !folio_test_dirty(folio) && !folio_test_writeback(folio))
+			lruvec_add_folio_tail(lruvec, folio);
+		else
+			lruvec_add_folio(lruvec, folio);
+
 		nr_pages = folio_nr_pages(folio);
 		nr_moved += nr_pages;
 		if (folio_test_active(folio))
@@ -2106,7 +2115,7 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
 	nr_reclaimed = shrink_folio_list(&folio_list, pgdat, sc, &stat, false,
 					 lruvec_memcg(lruvec));
 
-	move_folios_to_lru(&folio_list);
+	move_folios_to_lru(&folio_list, true);
 
 	mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
 					stat.nr_demoted);
@@ -2217,8 +2226,8 @@ static void shrink_active_list(unsigned long nr_to_scan,
 	/*
 	 * Move folios back to the lru list.
 	 */
-	nr_activate = move_folios_to_lru(&l_active);
-	nr_deactivate = move_folios_to_lru(&l_inactive);
+	nr_activate = move_folios_to_lru(&l_active, false);
+	nr_deactivate = move_folios_to_lru(&l_inactive, false);
 
 	count_vm_events(PGDEACTIVATE, nr_deactivate);
 	count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE, nr_deactivate);
@@ -5083,7 +5092,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			folio_set_active(folio);
 	}
 
-	move_folios_to_lru(&list);
+	move_folios_to_lru(&list, true);
 
 	walk = current->reclaim_state->mm_walk;
 	if (walk && walk->batched) {
