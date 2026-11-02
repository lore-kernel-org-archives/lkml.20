Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638645;
	b=K6Bcwi0BxJpdMYEumwT9Ht7UciwFpmwOe1cfzyrDqxr+gAnYymhYQPDGzh92K+rBpFIl
	 Hdu7UAODtNbmx2fWCoZ8A2hSGNw0YzdCeNvSo9qu8TiawUia1uWOPhywgoCwMfLj1gxHy
	 H3iTwLXGTQWZTsqRL/DySbCNUCV8rPzDJXQeO/k9hppVdrm2XIuEOKLctPOeDArejF7NW
	 bOMpOiTopjog1P5Of7D+TgnPXQDdz1do94OwUYxlKszm9pzvpjM8hLHbFjBAChYwdi2vi
	 Tao9gjUnHzW5m5aUzSy7lYgJ2ySya7pWozQiH2tdawQCTRF182HeqzxaqYRN0oIbc1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Od7mWefqtV3mjxyxY9z/4vRU5fSlhS8dN/ywhpTdKVc=;
	b=N+2wi8jHFcN+we5Z2wC3rAkBwQhqf9QvbRjIay2U6CKqdrXzfRDU1CzWA5S9qGe12+aW
	 J/AVcIajVXDAOa2c4hLZX7B+OldJvqjYCkt+TyBDagS+mRrbXyl/Bj93egKvxqYt1Kd72
	 dBeF+Un9JtOz4Hj8F9JmBuSdp3HzLeKJ+Xsvx//zoLGog7WQ5zOHggntlJ75xL9J183Qg
	 PS70cBfh9UQZNxC7v2CUrPq0dgz6hrPSnw5ev9/OVNGV3d64Gcr54qb3B9y3LPS7nQYoi
	 ALIuhYgkEE7xmDrcpOWKpHnodYk92hxoNAOGe0NkJu4mec+GzzkS29Wm/2yVVky0NVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=ckIy2oQ4;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65067607B432
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65067607B432
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=ckIy2oQ4
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8acda240937so25476197b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793638643; x=1794243443; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Od7mWefqtV3mjxyxY9z/4vRU5fSlhS8dN/ywhpTdKVc=;
        b=ckIy2oQ4IZmLWDHuWvLUZs9rumrqJyiB/gg+OjTzvyDrr6YMF7OMn2PFSba5VHOsQw
         OkAOJP7veu9sh0jrohToIpcGGIXeZU8wd90Opi68sN6OFjY8K7/iYiowZ7VUhNRBBmcs
         pZtS9Agipp7Q0UGC8x+r1shml5GRA6bciRpwazS+I7Na6huUIgFxWtJj54EH/aRae05N
         u4Ac3bBwQIkPAHO/BTIbb21l0kxjvRqXOeZA7iujPZm5C7xNOVREsF6orXSyCtwNXQ9S
         aPsS6pEUfvmB4iPBvLVgD887AaQJXVLgtT0+dmxZHagM2MH2Miemz8UdEOtZF+w456R2
         lHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638643; x=1794243443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Od7mWefqtV3mjxyxY9z/4vRU5fSlhS8dN/ywhpTdKVc=;
        b=QZv/QvW3GBo7Ade7ziqlgpdtoWILJ/nHJlzsVUFQa6HU2VC3lAyghQVJtGTH0iYOi1
         wX0W5l43eWwovHeQWzSlNs7htdtjc34ooyaPwsEkdBpNmkUczOGVrAI8mo6QNzIytHM9
         jlP/hiKGg9ucO7FUqQuX7ZJJhVzvzxEPiiIl2/7xt5xMKeDZBwkpm4NE9FTbX/9Ey06f
         lfD5ecp3Xx0GcxXGR99wvoSr+yUa9QdwMeAAubICaXr6mSLK+Ly/HXy+QHq9TPceCE9O
         CTgV8ALF2q3/5gCOhxUjHBYSEb7SIe5x5cs7DN6iAmvx7sOfu1zGiJnkQevqMzyX01Ph
         96ig==
X-Forwarded-Encrypted: i=1; AKwUvBwiQH99V1Pg1uzERLUO9IM92gpiSxZ+yF4RfAYb/pnxLjSiD5k/oQXCNcqAro3V9lDN83snfxoVIxLpGxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tiE93FK4QAIVKkZSCrRiR8Xz6qNYdkhJQYaZmxlUp2Ee8VJbI
	cRwukzB+XVTHuD73qW6nxOR2UcaiFu+nZOk0N/DMSrN2um4eAjVO8ns8petHTF4I6Wk=
X-Gm-Gg: AYBFou0997Hbxt5A0XthIgs4exDrMVIX6FhRI+hqjnPvd83Euk8cSWb7MQb2fYII27Q
	JjcRScJIad3W0SB5WerwyTc79byzL3IrkRp7chbKrUOHRLmthz+E1ZIH40UywvH8v/PebbhJwEG
	hQd6qAM+BZyH9chzPbbJ6D5Va2l1fcNnRrjIlm2iCpx1ha3nTxKPxSs0iepVJOL/Ikf003TZ4Eq
	1N9tOtdgRT2qXLGowQXC1g3N6WkI/5xt8TtbbwO7RzOBUQ57O7j+dTXW8LH+LrZR6/eAF+OlI1R
	kVNiZX8gjMTTf/NFlAcga3OtEK2/1Rkjn/flNVo5cdcFMukzZ0inhXfVGDSdOlFyXy2xFG2D/sM
	dCVgPH4R8QsWd5IHiy0189GxLUm62/QEnHdM2vKytJjEwEwZIvNyctAa2nHDPtA6Tb0kqWuxTWz
	KP3Cn12T/3xA3o7oMybFPD0L2oH31XKRvRxampgSM9oGUt76zAKXUwHZl4vsiDpOJg6W/8bC2te
	p0TrNX/3lwrMxnw5wh0VOlxQ53V7BK7HDpCQoc5RexlkvW4Ipzafl3WCZtRb7/sb3799JudZhPE
	kDto/twuqNkcHJ+9zIyxKsAVmx9prP2yuCF/oCjPDPOjTi8i
X-Received: by 2002:a05:690c:397:b0:8b0:c673:993c with SMTP id 00721157ae682-8b2b66ce40fmr59394677b3.21.1793638643157;
        Mon, 02 Nov 2026 08:57:23 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b719b19bsm56552457b3.38.2026.11.02.08.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:57:21 -0800 (PST)
Date: Mon, 2 Nov 2026 11:57:17 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>,
	Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH 2/3] mm/swap: account synchronous swap reads as memory
 stall
Message-ID: <aujA7X0IPvtRTmFG@cmpxchg.org>
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
 <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com>
 <auOz00OGB_8dgniC@cmpxchg.org>
 <CAMgjq7BYgXLheXDyc=p2mNgxdP3+92v2WHGiXiweDrsiYQ0u2g@mail.gmail.com>
 <auSWtJzFQ7KdElKL@cmpxchg.org>
 <CAMgjq7AJ0uajpVM+Kva5=_EXtmaawYR8TJQ6RdhrP7+NUZDx=w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7AJ0uajpVM+Kva5=_EXtmaawYR8TJQ6RdhrP7+NUZDx=w@mail.gmail.com>

On Sat, Oct 31, 2026 at 04:00:22AM +0800, Kairui Song wrote:
> On Fri, Oct 30, 2026 at 9:08 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Fri, Oct 30, 2026 at 07:16:51PM +0800, Kairui Song wrote:
> > > On Fri, Oct 30, 2026 at 5:00 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > >
> > > > On Fri, Oct 30, 2026 at 02:31:42AM +0800, Kairui Song via B4 Relay wrote:
> > > > > From: Josef Bacik <josef@toxicpanda.com>
> > > > >
> > > > > Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
> > > > > counted in PSI memory pressure or in the swapin and thrashing delays of
> > > > > delay accounting.  Refaults of the workingset from zram, the main input
> > > > > to userspace OOM handlers like lmkd and systemd-oomd on zram systems,
> > > > > become invisible in /proc/pressure/memory.
> > > > >
> > > > > swap_read_folio() opens the accounting window with
> > > > > psi_memstall_enter() and delayacct_swapin_start() and, per its comment,
> > > > > means to count the submission time.  For synchronous devices the
> > > > > submission is the entire read: swap_bdev_submit_read() does
> > > > > submit_bio_wait() and completes the folio.  Since reads are batched in
> > > > > a swap_iocb, swap_read_folio() only queues the folio with
> > > > > swap_add_folio(), and the bio is submitted later by swap_read_submit()
> > > > > in the caller, e.g. swapin_sync(), after the window has been closed.
> > > > > By then the folio is uptodate and unlocked, so the fault does not wait
> > > > > on the folio lock either and the read time is not counted anywhere.
> > > > >
> > > > > Found by code inspection; not reproduced.
> > > > >
> > > > > Fix by submitting synchronous reads from within swap_read_folio(), as
> > > > > was done before the batching, rather than from the caller.  This gives
> > > > > up batching of readahead for synchronous devices, which do their I/O
> > > > > inline anyway, in exchange for keeping the accounting simple and in one
> > > > > place.
> > > > >
> > > > > Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
> > > > > Assisted-by: LLM
> > > > > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > > > > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> > > > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > >
> > > > Hm, this isn't a complete fix to the problem described. IO throttling
> > > > happens at submission time, so there can be significant delays on
> > > > async devices too that are no longer tracked since the culprit change.
> > >
> > > Yeah you are right! Thanks for the heads up, not only a sync isssue
> > > indeed, async devices are affected too :(, throttled swap fault also
> > > went unaccounted.
> > >
> > > > How about keeping the accounting window open across the batch? Opens
> > > > on first read, closes on submission. A batch with at least one
> > > > workingset folio is "contaminated" and the whole sequence and
> > > > submission becomes a stall. Would need to pull the !can_merge flush
> > > > out of the batch-add function to get the accounting window right but
> > > > that seems reasonable.
> > >
> > > Won't this cause an amplified PSI reading if only one folio in a batch
> > > is workingset? Maybe not a big issue though.
> >
> > Hm, I think the only option to avoid this would be to split the batch
> > and flush more frequently, which I'm not sure is worth it. The batch
> > size is only 32 folios...
> >
> > diff --git a/mm/page_io.c b/mm/page_io.c
> > index 22e5ac1d298f..806cfe633a95 100644
> > --- a/mm/page_io.c
> > +++ b/mm/page_io.c
> > @@ -207,6 +207,8 @@ static bool swap_can_merge(struct swap_io_ctx *ctx, struct folio *folio,
> >
> >         if (ctx->sis != sis)
> >                 return false;
> > +       if (rw == READ && ctx->workingset != folio_test_workingset(folio))
> > +               return false;
> >         return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw);
> >  }
> 
> We are in a dilemma with this change: if it fires frequently it breaks
> batching but improves PSI accuracy.  If it doesn't fire frequently, it
> has no negative effect on batching and performance, and it isn't helping
> with PSI accuracy either :/
> 
> But after a second thought, maybe we can live with it by having both this
> posted patch merged as it is and appending your suggested fix: the two
> kinds of devices end up differently.
> 
> For sync devices the batch is now always one folio, so there is nothing
> fancy, everything is accurate.  Readahead batching for them only happens
> on the MADV and swapoff walks, so the cost is limited.
> 
> For async, the window covers submission.  That cost grows only mildly
> with the folios in the bio, block layer and dispatch work, unlike a
> synchronous read.  And the previous per folio accounting was not
> exact either: in a single threaded task, the throttle or cost of
> a non-workingset readahead folio pays is also holding up the workingset
> folio's refault, since the task cannot start the next submission until
> that one returns.  Same story for delayacct.

That sounds reasonable to me. Zero benefit to batching on these
devices, so no point in taking the fuzz factor that comes with it.

> And we are missing the completion wait either way: if a fault finds the
> folio in the swap cache with its read still in flight, it blocks in
> folio_lock_or_retry() in do_swap_page(), which no window covers.

It's there, if you drill down to folio_wait_bit_common():

	if (bit_nr == PG_locked &&
	    !folio_test_uptodate(folio) && folio_test_workingset(folio)) {
		delayacct_thrashing_start(&in_thrashing);
		psi_memstall_enter(&pflags);
		thrashing = true;
	}

> So perhaps we can live with it for now by having your suggested fix
> on top of this posted patch? Some comments could be helpful here and
> maybe some further improvement is needed.

Yes, I think that plan works.

Want me to send a proper patch with changelog on top of Josef's?
