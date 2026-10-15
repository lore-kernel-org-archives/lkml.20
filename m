Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D764272E6D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036004; cv=none; b=EYeqv3CCRuezT9ZhPZvNEVRcsTJaanGhx62k2wrRsszoycHFkbtx4hrqGUD/wI7LnKRFQwBXi7DMTXa1n3KVvRokiyxL7W0FSPpf/gawvgxx5+U/Ud2TFlV/aDVp15LP/TRC465vizThWf3igAfAHoSL/X44hfkD3KoQFPn6YFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036004; c=relaxed/simple;
	bh=3qwHCwYKq/jPl7Qo6zlzIWmkqZRb6qJ9PQlZt9nc8v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaYDfaaj8nB60RuAnptJ/D7r8VcxQ2D4TVY0VtHlDk6Ajn7baRVujoHEBzUV1Bxstyi/THjBgXOeDgDqJq7sQRQ8ilf4edS/cgxvyH9I6r3skniXiv9ptw0/JRVF8Q/sCeeLEsYY605PUrLYX3n3LUb94cv4lAIA6bCUvb6GfGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1A1jHmN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1A1jHmN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2df8c28a0b1so22560705ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036002; x=1792640802; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J47XPC5HC/CHotb9sS63tD8UTNkcaiKZyv19G97E6cM=;
        b=e1A1jHmNJNqZeHo7nsC8JshLIdg8iGGPJkfUsLkuGmQZtjJ6JSh+/tKPSFeHnHbcCN
         ZYe4UImveWoDj7xAdcUZOZAUTLG8Ykutkl7MKYDXlm4OTN2t8uS9C47rF0CDlfFq8n+J
         99WFStN4+8o/4GNQUk+IXNa9ypGhaeVoFWhXOX/v0AWI+yEZO9TxD6/1KdlM+laeQTNu
         6Tr1f+7Krum/OTrlHG8fb91a/vf+cjNRWside0V6ux79Sk6R5KaMkwRtICmY4Jx5fajs
         16DZZnRuWlgk7Lu2LWq7Du9hN+x2m27h2/9n3zDg4WkFDeAVRdDiWPZW2BQ7y+q8ZCBI
         bsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036002; x=1792640802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J47XPC5HC/CHotb9sS63tD8UTNkcaiKZyv19G97E6cM=;
        b=JYachGrEDrv/dOdPsT0X9RVwJd9h0/q/xt9H4t/QeHohElnd2mYBwQyYZIjmmVGLbM
         RjcldjyoBZCJPsNcD4SXHoQ5m92WmL/k7+O+0CiiioMbGEfjr3oboXTXtpHl6zeQ0Mjo
         HsccLVdK2t3GwpaxepEIoXL9Yfwfj8It0lrz7hc0USQLYEpn8tNVkXVZq/IVn4Jst7uj
         2zXQW/bKOKUJKVOhi5QbG5WxRTdZf7H/wVwJVytchH87AbFmXez9nlPyOISy76impjCU
         1MdHZA7XKG7swdEGQ6sKJldDB0EjvA4bJ/v+aU30vQ4S32u1F2EsDcFc3U6zvofg9+US
         mIlA==
X-Forwarded-Encrypted: i=1; AKwUvBzSDLUpFaHk6btKvYrYn22R9ntemwi7E7z+jPpBE9jCWlmiIALgl8ZTQ3GwnZQ6NgY+dqAZIkkgAyxHSdU=@vger.kernel.org
X-Gm-Message-State: AFq9FYISsTEIRDc1QE6GJnJTk3LfQpgRpzIzvkq+HtfTtWzrdfUrjn83
	D/PoQny9Qsc6l4irXQvQ30ZNraJCuHScOT1y/ycbDTOfZBxgLj571k/b
X-Gm-Gg: AYBFou3n2ROIAHNboE/EXqHgVwMq9a8/9nDat1kAa8wSqL5XpVBn6T4pV+CiEDMfbmN
	gJcSE/jQ9qefQnm5CVfa/6mCxM3k0Td+lYrNOlDtDSetDQnTVMq+mpI30iJChPNCXaL5VYiskuC
	f19nLhgvqoc7i9iaS9wkBulVmtLjxjQ8QS+rl7uFZyOmkGasFFp3c3OoJqcwox8JoXjBVlj4vQe
	up3PFEZHjwCSsIKo9HsrP7HDKkkHxKi0P0QtrVqSAqznEiVgO+oaV3ubT5IkJsyYg3y88hhSmiQ
	cVsgmddMkuM+48wd6Ie+GIr0/5a9Ogsti33sl+nnUIwZ9knclYBC0cIC6cv69UOt/vX4SYJGswE
	Q3KhMCJGdO9MpN/TwiOSbjHd1PlRl4iSLJznyn4A2m3/e/qsHjZElpiJN4eLdOKQYz9P4iYeVpp
	8ULa3oFvya8ipDu4HcLEir0uqSHmzYHF2ZPfKLR0Rhm54UtUxTp9Vw98x0MDa6qkF/tjIHb33q7
	8c5/f/yuCoQ3qe11685FRYU2mhA1O8I6x4D9inWmtvyVQ==
X-Received: by 2002:a17:903:94c:b0:2e9:5c51:19dc with SMTP id d9443c01a7336-2e95c511e8fmr7973295ad.41.1792036001505;
        Wed, 14 Oct 2026 20:46:41 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm72934235ad.15.2026.10.14.20.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:46:39 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:46:28 +0800
From: Kairui Song <ryncsn@gmail.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SeongJae Park <sj@kernel.org>, 
	David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH RFC v3 13/17] mm/mglru: make folio_inc_lru_refs lruvec
 lockless
Message-ID: <atBL2inthrJH_ng4@KASONG-MC4>
References: <20261003-mglru-fg-v3-0-cbd4546a5bd9@tencent.com>
 <20261003-mglru-fg-v3-13-cbd4546a5bd9@tencent.com>
 <CAN_Opa-GVYVg1mUc=PJFfE8ZLCoAWjzDoWoxA8FEfsPAYGdijA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN_Opa-GVYVg1mUc=PJFfE8ZLCoAWjzDoWoxA8FEfsPAYGdijA@mail.gmail.com>

On Mon, Oct 05, 2026 at 01:29:00AM +0800, KunWu Chan wrote:
> On Sat, Oct 3, 2026 at 8:55 PM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > The lruvec spinlock in folio_inc_lru_refs was only taken to keep
> > concurrent aging from corrupting the size counters.  This is no
> > longer needed: the per-generation counters are atomic, and the
> > active/inactive ABI counters are updated per folio and linearized by
> > the CAS on the folio flags, so concurrent aging can no longer corrupt
> > them.  The same argument already allowed folio_reset_lru_refs() to
> > drop the lock.
> >
> > Use folio_lruvec_live_get()/folio_lruvec_live_put() to hold the RCU
> > read lock around the lruvec lookup, and drop the spinlock entirely.
> >
> > Without the lock, aging can advance max_seq while a promotion is in
> > flight.  Generations are indexed by seq % MAX_NR_GENS, so the folio
> > flags can return to the value read earlier and the cmpxchg succeeds
> > with a target gen computed from a stale max_seq.  Recheck max_seq after
> > a gen-changing cmpxchg: if it moved, account the committed update and
> > retry with LRU_REF_FORCE, which promotes the folio to the newest gen.
> > The retry may count the access twice, which is acceptable and avoids
> > folio_activate(), whose LRU lock causes latency jitter.  smp_rmb()
> > orders the flags read, including the one returned by a failed
> > cmpxchg(), before the max_seq read.
> >
> > Also simplify the post-CAS accounting guards: gen is only assigned
> > non-negative values after the old_gen < 0 early exit, so gen != old_gen
> > implies gen >= 0, and lru_gen_update_size() needs no explicit guard.
> > The active/inactive ABI update keeps its gen >= 0 check because an
> > off-LRU folio has no lruvec to update.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  include/linux/mm_inline.h | 10 +++++-----
> >  include/linux/mmzone.h    |  3 ++-
> >  mm/vmscan.c               | 47 ++++++++++++++++++++++++++++-------------------
> >  3 files changed, 35 insertions(+), 25 deletions(-)
> >
> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index ee7fcbe2366b..b68d68101248 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -293,10 +293,9 @@ static inline int folio_lru_gen(const struct folio *folio)
> >         return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, 0)));
> >  }
> >
> > -static inline void lru_gen_update_size(struct lruvec *lruvec, struct folio *folio,
> > -                                      int old_gen, int new_gen)
> > +static inline void lru_gen_update_size(struct lruvec *lruvec, int type,
> > +               struct folio *folio, int old_gen, int new_gen)
> >  {
> > -       int type = folio_is_file_lru(folio);
> >         int zone = folio_zonenum(folio);
> >         int delta = folio_nr_pages(folio);
> >         struct lru_gen_folio *lrugen = &lruvec->lrugen;
> > @@ -371,7 +370,7 @@ static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio,
> >         /* use the refs from the atomic snapshot to avoid raced update */
> >         refs = lru_get_refs_flags(flags);
> >
> > -       lru_gen_update_size(lruvec, folio, -1, gen);
> > +       lru_gen_update_size(lruvec, type, folio, -1, gen);
> >         if (lru_refs_is_active(refs))
> >                 lru += LRU_ACTIVE;
> >         __update_lru_size(lruvec, lru, zone, delta);
> > @@ -389,6 +388,7 @@ static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio,
> >  {
> >         unsigned long flags;
> >         int gen, refs;
> > +       int type = folio_is_file_lru(folio);
> >         int zone = folio_zonenum(folio);
> >         int delta = folio_nr_pages(folio);
> >         enum lru_list lru = folio_is_file_lru(folio) * LRU_INACTIVE_FILE;
> > @@ -411,7 +411,7 @@ static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio,
> >         if (!reclaiming && ((max_seq - gen) % MAX_NR_GENS) < MIN_NR_GENS)
> >                 folio_set_active(folio);
> >
> > -       lru_gen_update_size(lruvec, folio, gen, -1);
> > +       lru_gen_update_size(lruvec, type, folio, gen, -1);
> >         if (lru_refs_is_active(refs))
> >                 lru += LRU_ACTIVE;
> >         __update_lru_size(lruvec, lru, zone, -delta);
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index e096fd0a5047..d78e3f97423e 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -558,9 +558,10 @@ enum lruvec_flags {
> >  #define LRU_TIER_MIN           0U
> >  #define LRU_TIER_MAX           (MAX_NR_TIERS - 1)
> >
> > -/* Access source flags for folio_inc_lru_refs() */
> > +/* Flags for folio_inc_lru_refs() */
> >  #define LRU_REF_MAPPED         0x1U
> >  #define LRU_REF_EXEC           0x2U
> > +#define LRU_REF_FORCE          0x4U
> >
> >  #define LRU_REFS_REFERENCED    0x1
> >  #define LRU_REFS_WORKINGSET    0x2
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index ae4a0522a8d5..9cc06a95d931 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -982,38 +982,33 @@ void folio_inc_lru_refs(struct folio *folio, unsigned int flags)
> >         long nr_pages = folio_nr_pages(folio);
> >         struct lru_gen_folio *lrugen;
> >         struct lruvec *lruvec = NULL;
> > +       bool aged = false;
> >
> > +retry:
> >         old_flags = READ_ONCE(*folio_flags(folio, 0));
> >         do {
> >                 new_flags = old_flags;
> >                 old_gen = lru_get_gen_flags(old_flags);
> >                 old_refs = lru_get_refs_flags(old_flags);
> > -               file = folio_flags_is_file_lru(&old_flags);
> >                 refs = old_refs + 1;
> >                 gen = old_gen;
> > +               file = folio_flags_is_file_lru(&old_flags);
> >                 if (old_gen < 0)
> >                         goto out;
> > -               /*
> > -                * Lock the lruvec if the folio is on-list. We are already
> > -                * doing lazy promotion so in theory we don't need this,
> > -                * but for now, concurrent aging would still corrupt the
> > -                * size counters.  This is a temporary limitation and
> > -                * will be lifted very soon, so the lock here is not a
> > -                * performance concern.
> > -                */
> >                 if (!lruvec) {
> > -                       lruvec = lruvec_live_lock_irq(folio_lruvec(folio));
> > +                       lruvec = folio_lruvec_live_get(folio);
> >                         lrugen = &lruvec->lrugen;
> >                 }
> > +               /* Failed cmpxchg() does not order old_flags before max_seq. */
> > +               smp_rmb();
> >                 max_seq = READ_ONCE(lrugen->max_seq);
> >                 max_gen = lru_gen_from_seq(max_seq);
> >                 min_gen = lru_gen_from_seq(READ_ONCE(lrugen->min_seq[file]));
> >                 if (old_gen == max_gen)
> >                         goto out;
> > -
> > -               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC)) {
> > -                       /* Promote second page table access or executable */
> > -                       if (refs > LRU_REFS_REFERENCED || flags & LRU_REF_EXEC)
> > +               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC | LRU_REF_FORCE)) {
> > +                       if (refs > LRU_REFS_REFERENCED ||
> > +                           flags & (LRU_REF_EXEC | LRU_REF_FORCE))
> >                                 gen = max_gen;
> >                         /* First access only defers eviction from the oldest gen */
> >                         else if (old_gen == min_gen)
> > @@ -1037,9 +1032,19 @@ void folio_inc_lru_refs(struct folio *folio, unsigned int flags)
> >                         break;
> >         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
> >
> > -       if (gen != old_gen)
> > -               lru_gen_update_size(lruvec, folio, old_gen, gen);
> > -       if (lru_refs_is_active(old_refs) != lru_refs_is_active(refs) && old_gen >= 0) {
> > +       if (gen != old_gen) {
> > +               /*
> > +                * Gen-index reuse can fool cmpxchg(). Retry locklessly, accepting
> > +                * an extra reference to avoid folio_activate() latency.
> > +                */
> > +               if (unlikely(READ_ONCE(lrugen->max_seq) != max_seq)) {
> > +                       flags = LRU_REF_FORCE;
> > +                       aged = true;
> > +               }
> > +               lru_gen_update_size(lruvec, file, folio, old_gen, gen);
> > +       }
> > +
> > +       if (lru_refs_is_active(old_refs) != lru_refs_is_active(refs) && gen >= 0) {
> >                 enum lru_list lru = file * LRU_INACTIVE_FILE;
> >
> 
> Hi Kairui,
> 
> One question about the retry path.
> 
> When `max_seq` changes after a gen-changing cmpxchg, the retry uses
> `LRU_REF_FORCE` and promotes the folio directly to `max_gen`. In the
> normal first `LRU_REF_MAPPED` access path, the same folio is only moved
> to the next generation when it is in the oldest generation.
> 
> Is the stronger promotion on the retry intentional? In other words,
> does detecting that `max_seq` advanced during the update justify
> promoting the folio all the way to the newest generation, rather than
> re-evaluating the original promotion policy with the new `max_seq`?

I think we are fine, that window is very very rare already, and the
problem is we may cause hotness inversion if the gen number lapped
with each other. To making things easier, if the max_seq changed,
just force promote it so we won't lose any hotness info. It may
over protect but the chance is like once in a million so I think
it's fine.
