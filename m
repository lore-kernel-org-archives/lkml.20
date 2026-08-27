Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F033446CB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811258; cv=none; b=TpN4CnuyvVbUuezm1AZP/CyvrVmhkrHLiH92O1I85TkErUbEsHitrNqyoWv4ZZezjExgHTumUZl5LzwScL5g0yeaeJ2dzNCIlGecuOkoODsWyojFR/a/OiYuRsXZgf8HoP2hjPx/OWpTHJrzTWXtOi0AQEm9eCwIsH0UOA0J31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811258; c=relaxed/simple;
	bh=faw8/dnfmpbaj8fTupjGI2ULYE/JNU+cOt0zt+zua4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A77exvZYH//r6GCO/KA0MQYp40n8LBzT7eAn1a4TgOX4MKf26vNUrzYQl5jYr0GoZoxDyidW9dlWnqdcqeN7jRI9HzmLvM9QEnWhL9/6tK6oVuDh2661GUBOUdcCPd52kHeEDfkcmw6GcfcS3aNQe3FzrpsgC+1E41g2610ffq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IlyJ+mDg; arc=none smtp.client-ip=91.218.175.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IlyJ+mDg"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=faw8/dnfmpbaj8fTupjGI2ULYE/JNU+cOt0zt+zua4Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787811253; v=1; x=1788416052;
 b=IlyJ+mDgZyxsjJ7alptizi63kNQdr/WTpmKHALmxb4ECTdlWb4GlXeTXvQUN9QuE1A450L0S
 jR3ZPf3fdk0F6/nlyoUnvpFWHMr1I9nVbvIHqQVqYNFNm7PTKucn2556VW38UYeWfrO2i4sNCer
 ZgMahvvYBRWP9zfOaOMuE1YM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (223.70.159.239)
	by mta10.migadu.com with ESMTPS id 7489c2729e336ee7;
	Thu, 27 Aug 2026 06:14:02 +0000
X-Mizu-Trace-ID: 7489c2729e336ee7
X-Migadu-Flow: FLOW_OUT
Date: Thu, 27 Aug 2026 14:13:51 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Kairui Song <ryncsn@gmail.com>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org,
	linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com,
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com,
	yuanchu@google.com, zhangbo56@xiaomi.com
Subject: Re: [PATCH 3/6] mm/mglru: enhance cold/hot inversion handling in
 inc_min_seq()
Message-ID: <ao_Vn9GIEROHlhVK@MiWiFi-R3L-srv>
References: <20260821102538.22642-1-baohua@kernel.org>
 <20260821102538.22642-4-baohua@kernel.org>
 <ao6qTTtk2xkkeKob@fedora>
 <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>
 <ao-I8rYv_G5j4wz4@MiWiFi-R3L-srv>
 <CAGsJ_4zoXvyXG6-qAH+=nv6V92w_U_tk78YAPKMihRniqvTe8A@mail.gmail.com>
 <ao-dewgE9XAfP0rU@MiWiFi-R3L-srv>
 <CAMgjq7CgT9yCz9bhfNtrsjNHh8=1F4zV7BKG4FRB5xWaLh+NNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7CgT9yCz9bhfNtrsjNHh8=1F4zV7BKG4FRB5xWaLh+NNw@mail.gmail.com>

On 08/27/26 at 12:30pm, Kairui Song wrote:
> On Thu, Aug 27, 2026 at 10:14 AM Baoquan He <baoquan.he@linux.dev> wrote:
> >
> > On 08/27/26 at 09:24am, Barry Song wrote:
> > > On Thu, Aug 27, 2026 at 8:46 AM Baoquan He <baoquan.he@linux.dev> wrote:
> > > >
> > > > On 08/27/26 at 05:43am, Barry Song wrote:
> > > > > On Wed, Aug 26, 2026 at 4:56 PM Baoquan He <baoquan.he@linux.dev> wrote:
> > > > > >
> > > > > > On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > > > > > > During aging, a folio's generation may already have been updated by
> > > > > > > folio_update_gen(), even though it has not yet been moved to the
> > > > > > > corresponding generation list. Such folios are hotter than those
> > > > > > > already in that generation.
> > > > > > >
> > > > > > > It makes sense for inc_min_seq() to increment the generation of
> > > > > > > folios that were never promoted during aging and move them to the
> > > > > > > tail of the new oldest generation. However, folios that were already
> > > > > > > promoted should instead be moved to the head of their updated
> > > > > > > generation, just as sort_folio() does in scan_folios().
> > > > > >
> > > > > > While sort_folio() move protected folio to the head of next gen too.
> > > > > > It only moves ineligible folios to the tail of next gen.
> > > > > >
> > > > >
> > > > > Hi Baoquan,
> > > > >
> > > > > Thanks for the review! I’m not quite sure I understand what you mean :-)
> > > > > Could you please clarify what you’re suggesting?
> > > >
> > > > Sorry for the confusion, Barry. I meant this is a good one, and
> > > > sort_folio() has the similar issue in which the protected folios are
> > > > moved to the head, wondering if that need be adjusted too. One consistent
> > > > rule for both is better.
> > >
> > > I think it might be fine for sort_folio() to move protected folios to the
> > > head, since those folios have either been accessed multiple times or have
> > > reached a tier higher than tier_idx. They are sort of hot in theory, right?
> > >
> > > if (tier > tier_idx || refs + workingset == BIT(LRU_REFS_WIDTH) + 1)
> > >
> > > But for inc_min_seq(), it is just catching up to make sure the newest
> > > generation doesn't overlap with the oldest generation. Those non-promoted
> > > folios themselves aren't hot , so I feel these are actually different?
> >
> > I got your point, sort_folio() considers the hottness, inc_min_seq()
> > doesn't. I agree with you now. Thanks for the explanation.
> >
> > BUT no matter what it is, protected folios, lazily promoted folios,
> > and no matter where it is, put in head of next gen or tail of next gen,
> > their refs are cleared by folio_inc_gen(). Then in sort_folio(), they
> > are all tier 0 of the oldest gen and must be reclaimed.
> 
> Hi all,
> 
> I think this part is not true? a folio's PG_workingset will never
> be gone after set, that pinns the folio to tier 3 through folio_inc_gen.

You are right, I missed the PG_workingset part. 

But then folios of refs 0 will get the same treatment as folios of
refs 4, even though later the tier_idx == 1 or 2 in sort_folio(). This
sounds not reasonable.

> 
> In fact, I consider this a pitfall rather than a gain; many workloads
> have seen regression due to the over protection of such folios.
> Especially with that "refs + workingset == BIT(LRU_REFS_WIDTH) + 1"
> 
> Resetting the tier to a lower position is better if the folio is
> promoted by one gen due to protection, to avoid over protection IMO.

Yeah, I got your point and agree. I am thinking of this too, agree we
should respect more on gen than tier for protected folio moving, while
it's not easy to implement.

> .
> Changing that semantic will require many other adjustments; I suggest
> we just ignore that here.

Hmm, my thinking is if we should differentiate folios w/ refs with
folios w/o refs or folios w/ a certain lower refs. Moving them all to
the head of next gen, this at least giving them more time to live and
update refs because eviction pick folios from the tail; or moving them
to tail of next gen, retain limited refs.

> 
> >
> > So here, I think differentiating them and moving them into head or tail
> > doesn't make sense, the thing is whether if we need do something to
> > retain refs of folios when gen_increased. At least, for lazily promoted
> > folios, it should not be put in the tail of next gen and refs cleared.
> > What do you think?
> 
> Actually, retaining refs has a very limited effect on the current
> MGLRU implementation.
> 
> Basically I agree we should keep the refs if the folios are not lazy
> promoted or protected, e.g. in inc_min_seq. But somehow we need a way
> to "soft reset" the refs to a slight lower value so the higher tier in
> lower gen won't looks hotter than lower tiers in higher gen.
> 
> This is not very doable right now, the closest thing we can archive is
> just reset the refs field and not touch the PG_workingset bit, which
> already done right now. (BTW there is a LRU_REFS_WORKIGNSET reset in
> the FG series for this :-)

Yeah. I rechecked your patchset and saw the changing, as I said
privately, the big patch better be split into smaller ones like Barry
has done in this patchset according to logic unit, then reviewing and
discussing will be much easier.

