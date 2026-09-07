Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4EF46E019
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790350; cv=none; b=fs5kUmc5wvZK/pc3QyMLtKkNrfL2CSyg362VweH77A0BLLbR6qJi47+RT7adj46rnZq48/EN47QzDQwsRPw4EvI1aNzTT0Qp5YWdGVeX6dt/cfQ1+3VJKdSYrM3yfhmHimoyli6AEBXzwQOMUEpeAj3jEVC7a+vMEFmfFshzmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790350; c=relaxed/simple;
	bh=CPG+Nl1FjLiJ91vtK09JG+tyqgPwabdg+bCzl4R7GoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hviIHcdy/aigr9dt0dS0gkcL1Gz3GcmuXs76i7mhF6MvyuO7gt9Cu4ncAWFqsqU/tZ4sKIBIomg95H5USpJAkraoofrh8wUMtzZhemJvbAiQsJryU9Ad0WL0pslmtm8Ebys6fMCNvh9CHPEb7XmXh1RpvVw7geU+ZdCLeZCwtF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=aSJ9bwQm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ndD01nXT; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="aSJ9bwQm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ndD01nXT"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 297EA14001AE;
	Mon,  7 Sep 2026 10:12:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 07 Sep 2026 10:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788790346; x=
	1788876746; bh=umeAJ+zJcQvKDZlRTgQ3GHuC/ov3xHfi3/+4coId5nk=; b=a
	SJ9bwQmgeeXzCh+rpvi6NWAt8C0hvIhJum2+soViebhRo6m1VPmiRfXP0KKnYLnZ
	zt89JmR0Biq/0iXIgZBL04O/oukjPQGrgOLb85zu9XDZANUFDqdRlGid1j+Hpk1C
	bErT9d42T2mYILgIbcJqDuzwAe6kI0cCvLoDfZm7rA2esFk2+nxcSyl1k70qqB+p
	xaNxGCcTic46YgoVhMeS6sJlx2Pt+NZ23rTsf2aFt1B/E2VW9x5/y+vzjQZNYI3H
	Ur81z2247HuY0kDtKbHhxFIOPsdT1RSGewN+M3NNPsYVd+JMvnM0QhpCrGO8+yGP
	jd/hePvWAF7z3PP4Da2Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788790346; x=1788876746; bh=umeAJ+zJcQvKDZlRTgQ3GHuC/ov3xHfi3/+
	4coId5nk=; b=ndD01nXTGRUV2sHHjJwAPiONfchcAnfjXYUIMb9lep4GhVlQGB9
	rXLeS6+Msxq3mzxEJVvMnzvyMasJNLS5pIHDoNqBhI9h7CUgyQFr8dnDYiJOCEH+
	8FymkyGlvYAi3YdD7q4e5H2xWdLe9qWUa/s8+ej3fp0dxhLmtHZDdKrHboizavGQ
	4H5+Qy5Xnxcwy7Hicy+6Jhse+YapElI82yuHjRJsoCvPpuAhtTkU380VqP+f12XT
	O6IvDkEzCKi4/r1maZ0MtJNQNa2VXss4i3ZN7ejgyqDEyKiKAc1aZCqUwF0D30K9
	c0R0lS/Au0i8JHaO+V5OWEAetbGfVd82lUQ==
X-ME-Sender: <xms:R8aeaiRaeJvMbr9Rr4CPkjz2Q3k0yfJEHoO2bi0g0p30uFjqkwSYHA>
    <xme:R8aeaukei0h6ZkdKALZVxwAM679YQNQ2-p2CxNW2llRZ8-DYJHk0lBIrWiWFLIH2N
    TqCWHezjYXY3ppGFBfEZLceyzskHotHFyUx3ltY4RLlyNePZ78vJWw>
X-ME-Received: <xmr:R8aeaowVW0v5jg7BYP2neHE6BAZuGPTkeamZ42LDjc61EZqe8doPtnZjpWE>
X-ME-Proxy-Cause: dmFkZTGoFCFY9lnCBAPkrzJuFdKFm5LgvA7vP2oOkhQ51damXXSrFR8r0fW/T/fEZZCcBS
    cBr66M7WugjCfFCs3yKrXSMBJR0a4lDmZmFFz8Q37pMl3EQtfEnkIjRP7VcLGbiOhAOv8U
    wKll2j8iFpfDXVDN6ZSFUQVgyjIt8i4vrTEo/XZHT9rYzaRSdwqbEKLk368Bdf42v+aX6d
    KDRxz5XSieQJRfWSBQ9w8eLUqCFB7pTB9OFBoZNbHqAP/mirV8lJfQCIGC8yC1mmEx+4HI
    91fxW/JgKt9pXSjBmKJK17bvBRjajPqOce+gw2NdBH0lA4jh8lkZiYgaWT6ccDpGm1hjnX
    sSkiJ58Y3/H58ZvxBdG4tD5bgjmmcWKJAOXnJ9qYu3znkyJbWuSM2PWFWb6zKD3lU48ZYT
    QqsCGndowo9+mKhFjsMTWxQE7n1FAPgdArsKnl5A4vPEpQWMxY4X3tAloBkybQIxXtL3mh
    4PooriQ2tRULx7DoPg1KZnZqKjiBo6Fo0lqtCySrmDkaMlI7H+tYTTbOiQO/iL+lE9d0fJ
    Qdf5RA24R9XGGvXS1W+7ayqZl3vWMF1C6u0vka2phaEfvdCYz10YmPB5mlerXeNt+oIZuf
    DzmMdEVQKf7GAjFnddTTn09jfxA0fc2OX2xjeNAxLr99HmMt87nxd0ybhPdg
X-ME-Proxy: <xmx:R8aeag3ANUhcpofUaDgDUrAFj8kBr4in5ewUjqU1PXhtzqdR5Jz3QA>
    <xmx:R8aeavz2GnundL7MefdCZ7scxQM5oFyO0ggGwowZHiK8z1pNVEwSVw>
    <xmx:R8aeapL5nz9as05vT_tZFHAiORdCT0sBqmARlnW5DTeOxF6eVQ2YiQ>
    <xmx:R8aeat-rrorQQanmUrJGIbipGEDt_WPuccT0HoZL32mzuHbZzvhXGA>
    <xmx:SsaeavvT4IEjEFkBUbui4eNOrDkE6EMxJpfw8kM0MWO22RWLFWrvB_V4>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 10:12:23 -0400 (EDT)
Date: Mon, 7 Sep 2026 15:12:21 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, hannes@cmpxchg.org, 
	usama.arif@linux.dev, lance.yang@linux.dev, ziy@nvidia.com, kasong@tencent.com, 
	hughd@google.com, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
	liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, ryan.roberts@arm.com, 
	balbirs@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm/huge_memory: dequeue the deferred split after
 the split freeze
Message-ID: <ap7Fs9DCP3PVOxwY@thinkstation>
References: <20260831091514.1879786-1-kirill@shutemov.name>
 <20260831091514.1879786-3-kirill@shutemov.name>
 <f44181bb-ff82-4537-b2eb-fcbde304d7eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f44181bb-ff82-4537-b2eb-fcbde304d7eb@kernel.org>

On Mon, Sep 07, 2026 at 03:55:53PM +0200, David Hildenbrand (Arm) wrote:
> On 8/31/26 11:15, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > __folio_freeze_and_split_unmapped() takes the deferred split list_lru lock
> > across the freeze. It is only there to stop deferred_split_scan() from
> > touching the folio under split.
> > 
> > With deferred_split_isolate() fixed, the workaround can be dropped.
> > 
> > Unqueue the folio after folio_ref_freeze(), the way
> > __folio_migrate_mapping() does: folio_unqueue_deferred_split() needs a
> > zero refcount and a memcg still set, and both hold there.
> > 
> > If the split is called from deferred_split_scan(), the unqueue is a
> > no-op -- the folio is already removed from the list. But
> > PG_partially_mapped is still set, so it has to be cleared here or
> > MTHP_STAT_NR_ANON_PARTIALLY_MAPPED never comes back down.
> > 
> > Assisted-by: Claude-Code:claude-opus-5
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > ---
> >  mm/huge_memory.c | 44 +++++++++++++-------------------------------
> >  1 file changed, 13 insertions(+), 31 deletions(-)
> > 
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 6281ed993243..c84e8cbc986d 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -3931,41 +3931,27 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
> >  	struct folio *end_folio = folio_next(folio);
> >  	struct folio *new_folio, *next;
> >  	int old_order = folio_order(folio);
> > -	struct list_lru_one *lru;
> > -	bool dequeue_deferred;
> >  	int ret = 0;
> >  
> >  	VM_WARN_ON_ONCE(!mapping && end);
> > -	/*
> > -	 * If this folio can be on the deferred split queue, lock out
> > -	 * the shrinker before freezing the ref. If the shrinker sees
> > -	 * a 0-ref folio, it assumes it beat folio_put() to the list
> > -	 * lock and must clean up the LRU state - the same dequeue we
> > -	 * will do below as part of the split.
> > -	 */
> > -	dequeue_deferred = folio_test_anon(folio) && old_order > 1;
> > -	if (dequeue_deferred) {
> > -		struct mem_cgroup *memcg;
> >  
> > -		rcu_read_lock();
> > -		memcg = folio_memcg(folio);
> > -		lru = list_lru_lock(&deferred_split_lru,
> > -				    folio_nid(folio), &memcg);
> > -	}
> 
> Nice cleanup.
> 
> >  	if (folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1)) {
> >  		struct swap_cluster_info *ci = NULL;
> >  		struct lruvec *lruvec;
> >  
> > -		if (dequeue_deferred) {
> > -			__list_lru_del(&deferred_split_lru, lru,
> > -				       &folio->_deferred_list, folio_nid(folio));
> > -			if (folio_test_partially_mapped(folio)) {
> > -				folio_clear_partially_mapped(folio);
> > -				mod_mthp_stat(old_order,
> > -					MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> > -			}
> > -			list_lru_unlock(lru);
> > -			rcu_read_unlock();
> > +		/* Take off the deferred split queue while frozen and memcg set */
> > +		folio_unqueue_deferred_split(folio);
> > +
> > +		/*
> > +		 * deferred_split_scan() takes the folio off the queue before it
> > +		 * splits it, so the unqueue above finds an empty list and
> > +		 * leaves PG_partially_mapped set.
> > +		 * Clear it here: the flag does not survive the split.
> > +		 */
> > +		if (folio_test_partially_mapped(folio)) {
> > +			folio_clear_partially_mapped(folio);
> > +			mod_mthp_stat(old_order,
> > +				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> >  		}
> 
> In general,
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> But I do wonder whether this sequence (that also
> __folio_unqueue_deferred_split()) performs would deserve a small local helper in
> mm/huge_memory.c
> 
> Could be done as a separate cleanup.

Just to be sure, do you want a helper like this:

static void folio_clear_partially_mapped_stat(struct folio *folio)
{
      if (!folio_test_partially_mapped(folio))
              return;

      folio_clear_partially_mapped(folio);
      mod_mthp_stat(folio_order(folio),
                    MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
}

?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
