Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699161E8332
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706941; cv=none; b=qKcJztUxTOv4wkGQlS/mTV7nLNdy9o21e1lLGc7F0TBnivPcJkS4QjrgEoPzrNrKPYBmlCdcfHWIJHfVltcV+omz9DA5Ior8ndVpZ5XVVCuJU9AdPcCuwedivKGzxN5kuOQZuq3u97pe5SxgEp6i3YuDygGROYFjosukGoqnxME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706941; c=relaxed/simple;
	bh=rXxkaAmqoVAdqzpZdFFroPbeux7Dv2/a70RL4sPJMxs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FhoufZyuGn0Z98Uxd7CMPzAlCO1B96dNzMBCf4dQGyZzREnWQMiKVXfwEfCy3vXFtuo/mmh8rIoqMJ24gWHZ8uJLh4FWZMMfZeD4Py98QLQcWlZgDKg4Al8LJte0WIH9j3Yv+/f67Lr4wTWPzhk1FAzAI5dNuan+pt0Be4pTHKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bn/JfKSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bn/JfKSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118E51F0089B;
	Sun, 11 Oct 2026 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791706940;
	bh=ewDa2KKVQpoPXmSjwalr9rby+7aQ7PsrEer3c4ZUAWQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Bn/JfKSPKXJvKnws//PUqGzPM/41d+Y9jN40uRJRNwSKmd6e39lW2lP99jGUt1gE5
	 VUK7ujdn9LcJF2I2cyHtCzaJROZ0fR1pHKY1KuKq47mmPn9G3dibJmgz7jb8+dNW0j
	 PxUKWVfgAo3w9RPIyrpa3mw6jsci6/nadbMBxtWxH5Q5Ufn733u6Ja9uhB5+SyFqLp
	 F99NqwOvTxoUilR69Arwimo+uu1sYYKNwaIdBc3P201zOJglaGL5TIcYon1lEGxJCV
	 Z1ZlmJuai3TWeBiFGFBcXIrRdmI2j7MCthhJhlWIksR8NTu91ZSX559Ofe+lIzOQiX
	 wsn9fBnylN9WA==
Message-ID: <dabc2517-6915-4df6-b638-9a7ec14efe70@kernel.org>
Date: Sun, 11 Oct 2026 16:22:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: cache: wake up the writeback thread
 while checkpoint is disabled
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261007193131.1785199-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261007193131.1785199-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 03:31, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Dirty node and meta caches are written back by the cache writeback
> thread and by checkpoint. The thread wakes up every cache_wb_interval
> (5 seconds by default) and writes at most 512 node caches and one
> contiguous run of meta caches. Checkpoint, which f2fs_balance_fs_bg()
> triggers when there are too many dirty caches, writes the rest.
> 
> While checkpoint is disabled, checkpoint does not run: f2fs_sync_fs()
> returns early and f2fs_balance_fs() returns before doing anything. So
> dirty node caches pile up without a limit. They are kmalloc'd, and the
> shrinker skips dirty entries, so this memory cannot be reclaimed. When
> node and meta blocks were in the page cache, the dirty pages were
> counted as dirty page cache, and the flusher threads wrote them back in
> the background.
> 
> A checkpoint=disable test that remounts the filesystem with
> checkpoint=disable and runs fsstress -p 32 for 300 seconds left about
> 160K dirty node caches (2.7GB of kmalloc-16k) with 16KB blocks and
> about 226K with 4KB blocks in QEMU, and drop_caches freed none of them.
> 
> While checkpoint is disabled, wake up the thread from
> f2fs_mark_cache_dirty() once there are as many dirty node or meta
> caches as f2fs_write_node_caches() and f2fs_write_meta_caches() collect
> before writing, and let the thread go on without waiting while that is
> still true and each round writes some of them. Each round writes the
> same number of caches as before. Split nr_caches_to_collect() out of
> nr_caches_to_skip() to share these numbers without the dirty_exceeded
> check.
> 
> With this, the same test keeps about 4K dirty node caches with both
> 4KB and 16KB blocks. Nothing changes while checkpoint is enabled.

I've sent a patch to wake up f2fs_writeback to flush dirty data according
to configurable sysfs value, I guess it can fix your checkpoint disable
case, please take a look.

[PATCH 3/5] f2fs: cache: wake up f2fs_writeback when exceeding threshold

Thanks,

> 
> Fixes: 7a1cf2a76b71 ("f2fs: cache: use meta cache")
> Fixes: 493b9dc8b52c ("f2fs: cache: use node cache")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/cache.c   | 59 +++++++++++++++++++++++++++++++++++++++++++++--
>   fs/f2fs/cache.h   |  1 +
>   fs/f2fs/segment.h | 13 +++++++----
>   3 files changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 04b5408cbc5..6b6f49fae25 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -61,6 +61,42 @@ void f2fs_cache_update_tag(struct f2fs_cached_block *entry,
>   	spin_unlock_irqrestore(&cache->tree_lock, flags);
>   }
>   
> +/*
> + * While checkpoint is disabled, checkpoint does not write back dirty node and
> + * meta caches, and the writeback thread is the only one that writes them. Tell
> + * whether there are as many dirty caches as f2fs_write_node_caches() and
> + * f2fs_write_meta_caches() collect before writing, so that the thread should
> + * write them now instead of every cache_wb_interval.
> + */
> +static bool f2fs_cache_wb_needed(struct f2fs_sb_info *sbi)
> +{
> +	if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> +		return false;
> +
> +	return get_nr_caches(sbi, F2FS_DIRTY_NODES) >=
> +				nr_caches_to_collect(sbi, NODE) ||
> +		get_nr_caches(sbi, F2FS_DIRTY_META) >=
> +				nr_caches_to_collect(sbi, META);
> +}
> +
> +static void f2fs_wake_cache_wb_thread(struct f2fs_sb_info *sbi)
> +{
> +	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
> +
> +	if (!f2fs_cache_wb_needed(sbi))
> +		return;
> +
> +	/* pairs with smp_store_release() in f2fs_start_cache_wb_thread() */
> +	if (!smp_load_acquire(&cache_thread->cache_wb_task))
> +		return;
> +
> +	if (READ_ONCE(cache_thread->cache_wb_urgent))
> +		return;
> +
> +	WRITE_ONCE(cache_thread->cache_wb_urgent, true);
> +	wake_up(&cache_thread->cache_wb_wq);
> +}
> +
>   bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
>   {
>   	struct f2fs_cached_block_list *cache = entry->cache;
> @@ -81,6 +117,7 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
>   		f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
>   						F2FS_CACHE_TAG_DIRTY);
>   		inc_cache_count(cache->sbi, type);
> +		f2fs_wake_cache_wb_thread(cache->sbi);
>   		return true;
>   	}
>   
> @@ -679,10 +716,13 @@ static int f2fs_cache_writeback_kthread(void *data)
>   
>   	while (!kthread_should_stop()) {
>   		unsigned int interval = cache_thread->cache_wb_interval;
> +		s64 nr_dirty;
>   
>   		wait_event_freezable_timeout(*wq,
> -				kthread_should_stop(),
> +				kthread_should_stop() ||
> +				READ_ONCE(cache_thread->cache_wb_urgent),
>   				msecs_to_jiffies(interval));
> +		WRITE_ONCE(cache_thread->cache_wb_urgent, false);
>   
>   		if (kthread_should_stop())
>   			break;
> @@ -699,10 +739,23 @@ static int f2fs_cache_writeback_kthread(void *data)
>   		if (!sb_start_write_trylock(sbi->sb))
>   			continue;
>   
> +		nr_dirty = get_nr_caches(sbi, F2FS_DIRTY_NODES) +
> +				get_nr_caches(sbi, F2FS_DIRTY_META);
> +
>   		f2fs_write_meta_caches(sbi);
>   		f2fs_write_node_caches(sbi);
>   
>   		sb_end_write(sbi->sb);
> +
> +		/*
> +		 * Each round writes a limited number of caches. Go on without
> +		 * waiting while there are still many dirty caches, as long as
> +		 * this round wrote some of them.
> +		 */
> +		if (f2fs_cache_wb_needed(sbi) &&
> +			get_nr_caches(sbi, F2FS_DIRTY_NODES) +
> +			get_nr_caches(sbi, F2FS_DIRTY_META) < nr_dirty)
> +			WRITE_ONCE(cache_thread->cache_wb_urgent, true);
>   	}
>   	return 0;
>   }
> @@ -719,6 +772,7 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
>   
>   	init_waitqueue_head(&cache_thread->cache_wb_wq);
>   	cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
> +	cache_thread->cache_wb_urgent = false;
>   	snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
>   			MAJOR(dev), MINOR(dev));
>   
> @@ -726,7 +780,8 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
>   	if (IS_ERR(task))
>   		return PTR_ERR(task);
>   
> -	cache_thread->cache_wb_task = task;
> +	/* pairs with smp_load_acquire() in f2fs_wake_cache_wb_thread() */
> +	smp_store_release(&cache_thread->cache_wb_task, task);
>   	return 0;
>   }
>   
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index 6c4db910d76..1d0216d2128 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -232,6 +232,7 @@ struct f2fs_cache_kthread {
>   	struct task_struct *cache_wb_task;
>   	wait_queue_head_t cache_wb_wq;
>   	unsigned int cache_wb_interval;
> +	bool cache_wb_urgent;		/* write back without waiting */
>   };
>   
>   int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 526764ba31a..58804e9cc29 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -983,11 +983,8 @@ static inline bool sec_usage_check(struct f2fs_sb_info *sbi, unsigned int secno)
>    * 512 blocks (2MB) * 8 for nodes, and
>    * 256 blocks * 8 for meta are set.
>    */
> -static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type)
> +static inline int nr_caches_to_collect(struct f2fs_sb_info *sbi, int type)
>   {
> -	if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
> -		return 0;
> -
>   	if (type == DATA)
>   		return BLKS_PER_SEG(sbi);
>   	else if (type == NODE)
> @@ -998,6 +995,14 @@ static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type)
>   		return 0;
>   }
>   
> +static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type)
> +{
> +	if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
> +		return 0;
> +
> +	return nr_caches_to_collect(sbi, type);
> +}
> +
>   /*
>    * When writing cache asynchronously, align nr_to_write to BIO_MAX_VECS.
>    */

