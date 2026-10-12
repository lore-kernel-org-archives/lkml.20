Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873FB443C0D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789819; cv=none; b=uMrxMB0LCiGmbJXdmwsS+g8cWWNKMVSYE/qZLgsQVxPNLlFIIwIw8m+1AgNe49K9Fw0Q6rC7l2XnBjq0xG5hsTKM0YhHGE2FG/BbCVpV+SgGUd5zJtF1Aovs2k02S6aEZ91b+Bjo2yw4iv1q+TNhMpWFooddR9HLSziplCZI3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789819; c=relaxed/simple;
	bh=UM8adxA/R87Nyq3hvBLH5yR3nIt2GNtot7r6xMKw9+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeqmRVp5ePT+wkpjdZ7558/A1jZS+fk2JjYh8E7reK3NhzdsPwyWmLr3tpsC50S5/FGEH/IooIjmPQyzSb4kr3I0rjylwQ57jQ2M5oUkSEth52kEAAoQ+AMbtrac8RqsmNN0HGeWhQxxtrWHxtpBgfi6RZmMYrM3egjtsEH5TdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fVbeXI5V; arc=none smtp.client-ip=91.218.175.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fVbeXI5V"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UM8adxA/R87Nyq3hvBLH5yR3nIt2GNtot7r6xMKw9+Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791789814; v=1; x=1792394614;
 b=fVbeXI5VtBN7ZbNmd3WiRvFhkaCYz6yIRB1CjT4P+aoXCFmVVNTa4QZmgUj5InjIFQGt8khc
 nWhQocbTTmZuckJajQMFibrhVDtjf5wHPoCCPgC+39fVx6x+709EPkdwDbELHYdfv+pR1xFL4o9
 u7ohHB4b4wdKmXOzAzv3LNP8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 3fb08dc45f88c86f;
	Mon, 12 Oct 2026 07:23:34 +0000
X-Mizu-Trace-ID: 3fb08dc45f88c86f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 15:23:22 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org,
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, klarasmodin@gmail.com
Subject: Re: [PATCH v4 08/14] mm, swap: defer xswap shrink to workqueue to
 avoid lock recursion
Message-ID: <asyK6t1POEW5c533@fedora>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <20261003003136.750633-9-hebaoquan@kylinos.cn>
 <CAN_Opa_JCCd-+o5y9JXbzypPtYjTGvyvnOy7KmSUKHYtVab85w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN_Opa_JCCd-+o5y9JXbzypPtYjTGvyvnOy7KmSUKHYtVab85w@mail.gmail.com>

On 10/08/26 at 05:10pm, KunWu Chan wrote:
> On Sat, Oct 3, 2026 at 8:32 AM Baoquan He <hebaoquan@kylinos.cn> wrote:
...snip...
> >  /*
> >   * Try to shrink the cluster_info tail: unmap contiguous free clusters
> >   * at the end of the mapped range.
> > @@ -4164,14 +4187,20 @@ static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
> >  static void xswap_try_shrink(struct swap_info_struct *si)
> >  {
> >         struct swap_cluster_info *ci;
> > -       unsigned long nr_mapped, last, keep, idx;
> > +       unsigned long nr_mapped, nr_tail, keep, nr_unmap, start_idx, i;
> >
> >         if (!(si->flags & SWP_XSWAP))
> >                 return;
> >
> > +       mutex_lock(&si->xswap_lock);
> > +
> > +       /* A swapoff raced us and is about to walk this mapping. */
> > +       if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
> > +               goto out_unlock;
> > +
> >         nr_mapped = READ_ONCE(si->nr_clusters_mapped);
> > -       if (nr_mapped <= 1) /* keep cluster 0 */
> > -               return;
> > +       if (nr_mapped <= 1)     /* keep cluster 0 */
> > +               goto out_unlock;
> >
> >         /*
> >          * Reclaim on our own, but only once the mapped range is at most
> > @@ -4181,40 +4210,73 @@ static void xswap_try_shrink(struct swap_info_struct *si)
> >          */
> >         if (swap_usage_in_pages(si) * 100 >
> >             nr_mapped * SWAPFILE_CLUSTER * XSWAP_SHRINK_WHEN)
> > -               return;
> > +               goto out_unlock;
> >
> > -       /* Find the last non-free cluster from the tail */
> > -       last = nr_mapped;
> > -       while (last > 1) {
> > -               idx = last - 1;
> > -               ci = &si->cluster_info[idx];
> > -               if (ci->count || ci->flags != CLUSTER_FLAG_FREE)
> > +       /*
> > +        * Count the free clusters at the tail of the mapped range.  Scanned,
> > +        * not tracked: the count must be exact to size the unmap, and an
> > +        * incremental count falls behind on out-of-order frees.
> > +        */
> > +       nr_tail = 0;
> > +       while (nr_mapped - nr_tail > 1) {
> > +               ci = &si->cluster_info[nr_mapped - nr_tail - 1];
> > +               if (READ_ONCE(ci->count) ||
> > +                   READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
> >                         break;
> > -               last = idx;
> > +               nr_tail++;
> >         }
> > -
> > -       if (last == nr_mapped)
> > -               return; /* nothing to shrink */
> > -
> > -       /* Below `last` has to stay mapped: the free ones in between are
> > -        * not part of the tail, and unmapping them orphans what is above.
> > -        */
> > -       if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> > -               return;
> > +       if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> > +               goto out_unlock;
> >
> >         /*
> >          * Stop at SHRINK_UNTIL rather than at the end of the tail, or the
> > -        * range comes out full enough for the grow to be woken.
> > +        * range comes out full enough for the grow to be woken.  Below the
> > +        * tail everything stays mapped, and one chunk of tail with it.
> >          */
> >         keep = DIV_ROUND_UP(swap_usage_in_pages(si) * 100,
> >                             XSWAP_SHRINK_UNTIL * SWAPFILE_CLUSTER);
> > -       if (keep < last + XSWAP_SHRINK_SLACK)
> > -               keep = last + XSWAP_SHRINK_SLACK;
> > +       if (keep < nr_mapped - nr_tail + XSWAP_SHRINK_SLACK)
> > +               keep = nr_mapped - nr_tail + XSWAP_SHRINK_SLACK;
> >
> >         if (nr_mapped < keep + XSWAP_SHRINK_MIN)
> > -               return;
> > +               goto out_unlock;
> > +
> > +       nr_unmap = rounddown(nr_mapped - keep, XSWAP_GROW_CLUSTERS);
> > +       if (!nr_unmap)
> > +               goto out_unlock;
> > +       start_idx = nr_mapped - nr_unmap;
> > +
> > +       /*
> > +        * Only shrink a run that reaches the mapped end; otherwise
> > +        * truncating nr_clusters_mapped would orphan the active tail.
> > +        */
> > +       spin_lock(&si->lock);
> > +       for (i = start_idx; i < nr_mapped; i++) {
> > +               ci = &si->cluster_info[i];
> > +               if (READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
> > +                       break;
> > +               if (!spin_trylock(&ci->lock)) {
> > +                       spin_unlock(&si->lock);
> > +                       goto out_unlock;
> > +               }
> > +               spin_unlock(&ci->lock);
> > +       }
> > +       if (i != nr_mapped) {
> > +               spin_unlock(&si->lock);
> > +               goto out_unlock;
> > +       }
> > +
> > +       for (i = start_idx; i < nr_mapped; i++) {
> > +               ci = &si->cluster_info[i];
> > +               list_del_init(&ci->list);
> > +               WRITE_ONCE(ci->flags, CLUSTER_FLAG_NONE);
> > +       }
> > +       spin_unlock(&si->lock);
> >
> > -       xswap_unmap_clusters(si, keep, nr_mapped - keep);
> > +       xswap_unmap_clusters_locked(si, start_idx, nr_unmap);
> > +
> > +out_unlock:
> > +       mutex_unlock(&si->xswap_lock);
> >  }
> >  #endif /* CONFIG_XSWAP */
> >
> > @@ -4278,6 +4340,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
> >                         }
> >                 }
> >
> > +               INIT_WORK(&si->xswap_shrink_work, xswap_shrink_work_fn);
> >                 return 0;
> >
> >  err_unmap:
> > --
> > 2.54.0
> >
> 
> Hi Baoquan,
> 
> While following the shrink path across these patches, I wanted to
> clarify the lifetime guarantee for the `cluster_info` backing pages.
> 
> P07 flushes the per-CPU swap cluster cache and calls
> `synchronize_rcu()` before unmapping the tail. P09 clears
> `SWP_WRITEOK` and cancels the shrink work before proceeding with
> `wait_for_allocation()` and `try_to_unuse()`.
> 
> Could you clarify how the shrink path ensures that, before the tail
> is unmapped, no allocation-side reader can still access the tail or
> republish a stale per-CPU cache entry that points into it, and no
> swapoff-side walker can still access the unmapped range?

Hi Kunwu,

Thanks a lot for your careful review, and for following the shrink path
across patches. Assume P07 in your saying means patch 07, and P09 means
patch 09. For the questions,


1. Allocation-side readers of the tail

xswap_try_shrink() removes the clusters to unmap from their lists while
holding si->lock, and only proceeds if spin_trylock(&ci->lock) succeeds for
each of them. After that no allocator can get these clusters from a list.

The flag check alone is not enough. move_cluster() writes ci->flags after it
drops si->lock, so spin_trylock() is what actually blocks an allocator that
just took the cluster.

Then, before the pages are unmapped, xswap_unmap_clusters_locked() does
flush_percpu_swap_cluster() and synchronize_rcu(). That drains the four
readers that use cluster_info[] under rcu_read_lock():
alloc_swap_scan_cluster(), swap_reclaim_full_clusters(), swap_alloc_fast(),
and swap_alloc_hibernation_slot().

2. Republishing a stale per-CPU cache entry

The per-CPU cache is written in only one place: the end of
alloc_swap_scan_cluster(), and the value is an offset inside the cluster that
just got the allocation. That cluster cannot be one the shrink unmaps,
because the shrink only unmaps CLUSTER_FLAG_FREE clusters and a cluster that
just took an allocation is not free. So a racing cache write can only point
to a cluster that stays mapped. The flush plus synchronize_rcu() handles the
entries written before it.

3. Swapoff-side walkers

The swapoff walkers are not RCU readers. swapoff first stops the shrink:
cancel_work_sync(&p->xswap_shrink_work), then waits on p->xswap_lock (which
grow and shrink also hold). SWP_WRITEOK is cleared, so xswap_try_shrink() bails
out too. Then wait_for_allocation() drains any in-flight allocation, and
try_to_unuse() runs. Only after percpu_ref_kill(), synchronize_rcu(), and
flush_work() of the discard and reclaim works, flush_percpu_swap_cluster()
run and the mapping get freed.

Not sure if I answer your questions clearly.

Thanks,
Baoquan
