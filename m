Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256117B425
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885813; cv=none; b=XsZCkfZ0kGGLIGgfxox6hFVaXw9Mk1nfHOzaZ7J9xspRErMDLycJz2jQl7z2R1PQb6w7EJONVM81kQpKUI0bh38bhkmmclfx0I9tBZF+497YoMCP+j0h9UihPtCvJMIJMeMEOn5sHRrC+4eRBsaloG6CU17HkxC3R1GLzavuBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885813; c=relaxed/simple;
	bh=0YcLhUMWvb6Zj/ZpgdPUfkjq9J5HmNMlQtt2LicZalc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AoJ0Flj8FYBirySu9+zYNlgHJdfnQCzyXNO8dmUrwFKcjSbnNO0ooR2jkCEY7k3TcH771HBrCvhLAXg+Cu2ctR9XWuh7dZ/l4aE3kGlpk09stYM3bv3zxVN4O2N5pulq4fp2mYcG2wY71zVh1g2WwWWHtD6tF6/9d9u2Asy4V/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMyaIx2j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMyaIx2j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093F01F000E9;
	Fri, 28 Aug 2026 02:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787885811;
	bh=pIGvC5iJ2dqgORmx7U0lGak3iWCkTcgAUL6rZqz+iNU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=aMyaIx2j5V/one3W7QqJoK5TnrPnWecesPwOstopRAVV62jX2ek18jwx8QVw7951e
	 04q9C6IWGMtgeWUpCp2O3eVsDbMD68qjV+RD6aM0fPix1iAtLZhkZrgI3QYKUWt+OI
	 NKoqImm/GiYawLrfPO8Zbz0GqHYDt2FU1JlXaTELjpbGkwprZO82F+yaKHUXgLzqmn
	 X5sFsu/0jidWSgIT2XjPo/1phM2t84CKNxyKR5CliJLThKKNjS5IsJCuEe0YsXjifR
	 WWuS7lNYg/gZuxrGOfBRy61v9+myhlhc7RW9VCpIZ+XwIIx5fFJZUIASGrGZ1cLBnK
	 iSC786gyRUI3A==
Message-ID: <a2dacbb1-4bc9-4616-b14f-85ef3a061697@kernel.org>
Date: Fri, 28 Aug 2026 10:56:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 03/12] f2fs: cache: introduce shrinker
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-4-chao@kernel.org>
 <CACOAw_whg1SO2479NL7d=ScRVrqvwHbPWg1pB2T4nWHdGe+w7g@mail.gmail.com>
 <4880a9a6-4036-4fec-8507-552f1bfc9fbb@kernel.org>
 <CACOAw_zTh8FSqcaQNYcPib+vjoMMi4imS5TTzJBOgxtZN90aBA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_zTh8FSqcaQNYcPib+vjoMMi4imS5TTzJBOgxtZN90aBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/28/26 01:00, Daeho Jeong wrote:
> On Wed, Aug 26, 2026 at 6:19 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 8/27/26 03:19, Daeho Jeong wrote:
>>> On Tue, Aug 25, 2026 at 6:03 AM Chao Yu via Linux-f2fs-devel
>>> <linux-f2fs-devel@lists.sourceforge.net> wrote:
>>>>
>>>> This patch integrates the metadata cache into the F2FS memory shrinker
>>>> subsystem to reclaim clean, unreferenced cached blocks under memory
>>>> pressure.
>>>>
>>>> It implements f2fs_shrink_cache() using a 3-phase cache reclamin method:
>>>> 1. isolate clean entries from lru list
>>>> 2. truncate from radix tree under lock
>>>> 3. splice un-reclaimed entries back
>>>>
>>>> And hooks the new interface into f2fs_shrink_count() and f2fs_shrink_scan().
>>>>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>  fs/f2fs/cache.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>  fs/f2fs/cache.h    |  3 ++
>>>>  fs/f2fs/shrinker.c | 12 +++++++
>>>>  3 files changed, 96 insertions(+)
>>>>
>>>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
>>>> index 8f09492c402f..3cee33c69880 100644
>>>> --- a/fs/f2fs/cache.c
>>>> +++ b/fs/f2fs/cache.c
>>>> @@ -534,3 +534,84 @@ void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
>>>>         f2fs_put_cache(entry, true);
>>>>         goto next;
>>>>  }
>>>> +
>>>> +static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
>>>> +                                               unsigned long nr_to_scan)
>>>> +{
>>>> +       struct f2fs_cached_block *entry, *next;
>>>> +       LIST_HEAD(dispose_list);
>>>> +       LIST_HEAD(keep_list);
>>>> +       unsigned long freed = 0;
>>>> +       unsigned long isolated = 0;
>>>> +
>>>> +       /* Phase 1: Isolate candidate entries from LRU list into dispose_list */
>>>> +       spin_lock(&cache->list_lock);
>>>> +       list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
>>>> +               if (isolated++ >= nr_to_scan)
>>>
>>> scanned?
>>
>> Okay, will clean.
>>
>>>
>>>> +                       break;
>>>> +
>>>> +               if (f2fs_cache_test_dirty(entry) ||
>>>> +                   f2fs_cache_test_writeback(entry) ||
>>>> +                   f2fs_cache_test_locked(entry))
>>>> +                       continue;
>>>> +
>>>> +               if (f2fs_cache_refcount(entry) != 1)
>>>> +                       continue;
>>>> +
>>>> +               list_move_tail(&entry->list, &dispose_list);
>>>> +       }
>>>> +       spin_unlock(&cache->list_lock);
>>>> +
>>>> +       /* Phase 2: Process isolated candidates one by one */
>>>> +       while (1) {
>>>> +               spin_lock(&cache->list_lock);
>>>
>>> Why do we need this lock to protect local lists?
>>
>> I think we need to protect the entry from being relocated in f2fs_find_cache()?
> 
> Ah, I see your point. In the current implementation, concurrent
> f2fs_find_cache() can indeed touch entry->list while it is on
> dispose_list.
> 
> However, if we adopt the referenced bit approach we discussed in Patch 01:
> - f2fs_find_cache() will only set the referenced bit and will NOT call
> list_move_tail() at all.
> - As a result, entry->list will never be touched or relocated during
> lookup, and this list_lock in Phase 2 can be safely eliminated as
> well.
> 
> So moving to the referenced bit design neatly solves both problems at once.

Hmm, however, f2fs_truncate_cache() will race w/ shrinker,

- f2fs_truncate_cache				- f2fs_do_shrink_cache
 - f2fs_do_truncate_cache
  - list_del_init(&entry->list) w/ lock		 - list_move_tail w/o lock

So we can not simply drop the list_lock in phase 2.

Or we can relocate list_del_init(&entry->list) from f2fs_truncate_cache()
to f2fs_free_cache(), but it will cause the butterfly effect:

At that time entry->cache will be set to NULL in f2fs_truncate_cache() because
now we treat entry->cache == NULL as the entry was truncated (something like
folio->mapping = NULL), so it can not access entry->cache->list_lock before
deleting item from list, then we need to update the truncation definition from
entry->cache == NULL to another state e.g. F2FS_CACHE_TRUNCATED.

I suffer a lots of bugs caused by shrinker and truncation, needs to handle it
carefully here.

I think we can set it as a base and improve it once it get merged, how do you
think?

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>> +               entry = list_first_entry_or_null(&dispose_list,
>>>> +                                               struct f2fs_cached_block, list);
>>>> +               if (!entry) {
>>>> +                       spin_unlock(&cache->list_lock);
>>>> +                       break;
>>>> +               }
>>>> +               f2fs_cache_get(entry);
>>>> +               list_move_tail(&entry->list, &keep_list);
>>>> +               spin_unlock(&cache->list_lock);
>>>> +
>>>> +               if (!f2fs_trylock_cache(entry)) {
>>>> +                       f2fs_put_cache(entry, false);
>>>> +                       continue;
>>>> +               }
>>>> +
>>>> +               /* the entry has been truncated */
>>>> +               if (!entry->cache) {
>>>> +                       f2fs_put_cache(entry, true);
>>>> +                       continue;
>>>> +               }
>>>> +               /*
>>>> +                * at least there are shrinker, radix tree and another user
>>>> +                * has referenced the entry.
>>>> +                */
>>>> +               if (f2fs_cache_refcount(entry) >= 3) {
>>>> +                       f2fs_put_cache(entry, true);
>>>> +                       continue;
>>>> +               }
>>>> +
>>>> +               f2fs_do_truncate_cache(entry, false);
>>>> +
>>>> +               if (f2fs_put_cache(entry, true))
>>>> +                       freed++;
>>>> +       }
>>>> +
>>>> +       /* Phase 3: Splice un-reclaimed entries back onto cache->lru_list */
>>>> +       if (!list_empty(&keep_list)) {
>>>> +               spin_lock(&cache->list_lock);
>>>> +               list_splice_tail(&keep_list, &cache->lru_list);
>>>> +               spin_unlock(&cache->list_lock);
>>>> +       }
>>>> +
>>>> +       return freed;
>>>> +}
>>>> +
>>>> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>>>> +                                       unsigned long nr_to_scan)
>>>> +{
>>>> +       return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
>>>> +}
>>>> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
>>>> index 7ee98d276938..618b377590da 100644
>>>> --- a/fs/f2fs/cache.h
>>>> +++ b/fs/f2fs/cache.h
>>>> @@ -184,4 +184,7 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
>>>>  #define f2fs_truncate_meta_caches(sbi, start, len)     \
>>>>         f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
>>>>
>>>> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>>>> +                               unsigned long nr_to_scan);
>>>> +
>>>>  #endif /* _LINUX_F2FS_CACHE_H */
>>>> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
>>>> index 4f6bf5926de4..1755c85849e4 100644
>>>> --- a/fs/f2fs/shrinker.c
>>>> +++ b/fs/f2fs/shrinker.c
>>>> @@ -37,6 +37,11 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
>>>>                                 atomic_read(&eti->total_ext_node);
>>>>  }
>>>>
>>>> +static unsigned long __count_cache(struct f2fs_sb_info *sbi)
>>>> +{
>>>> +       return sbi->meta_blocks.num_entries;
>>>> +}
>>>> +
>>>>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
>>>>                                 struct shrink_control *sc)
>>>>  {
>>>> @@ -68,6 +73,9 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
>>>>                 /* count free nids cache entries */
>>>>                 count += __count_free_nids(sbi);
>>>>
>>>> +               /* count generic cache entries */
>>>> +               count += __count_cache(sbi);
>>>> +
>>>>                 spin_lock(&f2fs_list_lock);
>>>>                 p = p->next;
>>>>                 mutex_unlock(&sbi->umount_mutex);
>>>> @@ -120,6 +128,10 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
>>>>                 if (freed < nr)
>>>>                         freed += f2fs_try_to_free_nids(sbi, nr - freed);
>>>>
>>>> +               /* shrink generic cache entries */
>>>> +               if (freed < nr)
>>>> +                       freed += f2fs_shrink_cache(sbi, nr - freed);
>>>> +
>>>>                 spin_lock(&f2fs_list_lock);
>>>>                 p = p->next;
>>>>                 list_move_tail(&sbi->s_list, &f2fs_list);
>>>> --
>>>> 2.49.0
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-f2fs-devel mailing list
>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>

