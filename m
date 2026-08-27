Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA441FB1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793564; cv=none; b=Z2wFoLo4Lr3b9QDYzbhKSB9IshtCj1rmFZkik2hMJxQD3tzSwdBEVVuLQlwtckLVZBWI1s+IuAlBUaEF4eNBPg9pLmZrDc83UC/THXIuDlRyZkVrkNCwBIHf3XJ9JtFR8ccmROIEEszXo3UNpY4TlRF2++4JKHraYwB5FEmGRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793564; c=relaxed/simple;
	bh=y/ZiTDzXr5A0pUSZzwOkw9mDpSERL3yT+EYir6nL4Bc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=usuObbzrPnrJd2qYarSyowKIKTu99Y6RdefIDeUPHjsadx17R1u5roY8m8EM5r353i1mvxJ8iXrRtj1VGKnlS4MUuf2E/H5Cf3tznC2ZfWrjZhnMAZLqnqZQmot/E5pchbZ6a6+93duDNkYhwuUOYNdelfYWMFjx249u/KkXP+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUgA6wmr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUgA6wmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894F41F000E9;
	Thu, 27 Aug 2026 01:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787793562;
	bh=7a5U70eVfMS1stmxf9KVAvYn+g33/0c/WUy7xdXAJ10=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=bUgA6wmrXF6Zp7Oq0H7R3EALOuJAJJUmI/GCF0bupQMtG/a+4cQAxZfsCjlsAzIdc
	 JWwWSejhQRVBdjWXQpVR2l2ShjOgkHxR2Qz3M4ocvN1cJMCfYKsqHGwazvZg4Noazc
	 uVyJxYpJM2+4iVh3YM3ITmArZUDYBwzM5eNST7xeWo5a5bNWNVT4XDYdnRL9SQvQOV
	 ICedMvlRftCi7izYNRBTo0AtEU6vXjkG75HPdZCvzCJrcSEpjHysc8cNJXlUxnoECU
	 eXxgazeCvSUfO1Vt37pkxS4rphJ4Ij/0F1L60fjLkbbO49r+lyosuE9NS0DTvOQUN3
	 OsSsWoPcLr8oQ==
Message-ID: <4880a9a6-4036-4fec-8507-552f1bfc9fbb@kernel.org>
Date: Thu, 27 Aug 2026 09:19:19 +0800
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
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_whg1SO2479NL7d=ScRVrqvwHbPWg1pB2T4nWHdGe+w7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/27/26 03:19, Daeho Jeong wrote:
> On Tue, Aug 25, 2026 at 6:03 AM Chao Yu via Linux-f2fs-devel
> <linux-f2fs-devel@lists.sourceforge.net> wrote:
>>
>> This patch integrates the metadata cache into the F2FS memory shrinker
>> subsystem to reclaim clean, unreferenced cached blocks under memory
>> pressure.
>>
>> It implements f2fs_shrink_cache() using a 3-phase cache reclamin method:
>> 1. isolate clean entries from lru list
>> 2. truncate from radix tree under lock
>> 3. splice un-reclaimed entries back
>>
>> And hooks the new interface into f2fs_shrink_count() and f2fs_shrink_scan().
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/cache.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++++
>>  fs/f2fs/cache.h    |  3 ++
>>  fs/f2fs/shrinker.c | 12 +++++++
>>  3 files changed, 96 insertions(+)
>>
>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
>> index 8f09492c402f..3cee33c69880 100644
>> --- a/fs/f2fs/cache.c
>> +++ b/fs/f2fs/cache.c
>> @@ -534,3 +534,84 @@ void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
>>         f2fs_put_cache(entry, true);
>>         goto next;
>>  }
>> +
>> +static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
>> +                                               unsigned long nr_to_scan)
>> +{
>> +       struct f2fs_cached_block *entry, *next;
>> +       LIST_HEAD(dispose_list);
>> +       LIST_HEAD(keep_list);
>> +       unsigned long freed = 0;
>> +       unsigned long isolated = 0;
>> +
>> +       /* Phase 1: Isolate candidate entries from LRU list into dispose_list */
>> +       spin_lock(&cache->list_lock);
>> +       list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
>> +               if (isolated++ >= nr_to_scan)
> 
> scanned?

Okay, will clean.

> 
>> +                       break;
>> +
>> +               if (f2fs_cache_test_dirty(entry) ||
>> +                   f2fs_cache_test_writeback(entry) ||
>> +                   f2fs_cache_test_locked(entry))
>> +                       continue;
>> +
>> +               if (f2fs_cache_refcount(entry) != 1)
>> +                       continue;
>> +
>> +               list_move_tail(&entry->list, &dispose_list);
>> +       }
>> +       spin_unlock(&cache->list_lock);
>> +
>> +       /* Phase 2: Process isolated candidates one by one */
>> +       while (1) {
>> +               spin_lock(&cache->list_lock);
> 
> Why do we need this lock to protect local lists?

I think we need to protect the entry from being relocated in f2fs_find_cache()?

Thanks,

> 
> Thanks,
> 
>> +               entry = list_first_entry_or_null(&dispose_list,
>> +                                               struct f2fs_cached_block, list);
>> +               if (!entry) {
>> +                       spin_unlock(&cache->list_lock);
>> +                       break;
>> +               }
>> +               f2fs_cache_get(entry);
>> +               list_move_tail(&entry->list, &keep_list);
>> +               spin_unlock(&cache->list_lock);
>> +
>> +               if (!f2fs_trylock_cache(entry)) {
>> +                       f2fs_put_cache(entry, false);
>> +                       continue;
>> +               }
>> +
>> +               /* the entry has been truncated */
>> +               if (!entry->cache) {
>> +                       f2fs_put_cache(entry, true);
>> +                       continue;
>> +               }
>> +               /*
>> +                * at least there are shrinker, radix tree and another user
>> +                * has referenced the entry.
>> +                */
>> +               if (f2fs_cache_refcount(entry) >= 3) {
>> +                       f2fs_put_cache(entry, true);
>> +                       continue;
>> +               }
>> +
>> +               f2fs_do_truncate_cache(entry, false);
>> +
>> +               if (f2fs_put_cache(entry, true))
>> +                       freed++;
>> +       }
>> +
>> +       /* Phase 3: Splice un-reclaimed entries back onto cache->lru_list */
>> +       if (!list_empty(&keep_list)) {
>> +               spin_lock(&cache->list_lock);
>> +               list_splice_tail(&keep_list, &cache->lru_list);
>> +               spin_unlock(&cache->list_lock);
>> +       }
>> +
>> +       return freed;
>> +}
>> +
>> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>> +                                       unsigned long nr_to_scan)
>> +{
>> +       return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
>> +}
>> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
>> index 7ee98d276938..618b377590da 100644
>> --- a/fs/f2fs/cache.h
>> +++ b/fs/f2fs/cache.h
>> @@ -184,4 +184,7 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
>>  #define f2fs_truncate_meta_caches(sbi, start, len)     \
>>         f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
>>
>> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>> +                               unsigned long nr_to_scan);
>> +
>>  #endif /* _LINUX_F2FS_CACHE_H */
>> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
>> index 4f6bf5926de4..1755c85849e4 100644
>> --- a/fs/f2fs/shrinker.c
>> +++ b/fs/f2fs/shrinker.c
>> @@ -37,6 +37,11 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
>>                                 atomic_read(&eti->total_ext_node);
>>  }
>>
>> +static unsigned long __count_cache(struct f2fs_sb_info *sbi)
>> +{
>> +       return sbi->meta_blocks.num_entries;
>> +}
>> +
>>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
>>                                 struct shrink_control *sc)
>>  {
>> @@ -68,6 +73,9 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
>>                 /* count free nids cache entries */
>>                 count += __count_free_nids(sbi);
>>
>> +               /* count generic cache entries */
>> +               count += __count_cache(sbi);
>> +
>>                 spin_lock(&f2fs_list_lock);
>>                 p = p->next;
>>                 mutex_unlock(&sbi->umount_mutex);
>> @@ -120,6 +128,10 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
>>                 if (freed < nr)
>>                         freed += f2fs_try_to_free_nids(sbi, nr - freed);
>>
>> +               /* shrink generic cache entries */
>> +               if (freed < nr)
>> +                       freed += f2fs_shrink_cache(sbi, nr - freed);
>> +
>>                 spin_lock(&f2fs_list_lock);
>>                 p = p->next;
>>                 list_move_tail(&sbi->s_list, &f2fs_list);
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

